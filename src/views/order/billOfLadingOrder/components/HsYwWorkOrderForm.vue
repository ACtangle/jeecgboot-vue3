<template>
  <a-spin :spinning="confirmLoading">
    <a-form ref="formRef" class="antd-modal-form" :labelCol="labelCol" :wrapperCol="wrapperCol">
      <a-row>
        <a-col :span="24">
          <a-form-item label="工单编码" v-bind="validateInfos.number">
            <a-input v-model:value="formData.number" placeholder="请输入工单编码" :disabled="disabled"></a-input>
          </a-form-item>
        </a-col>
        <a-col :span="24">
          <a-form-item label="工单状态" v-bind="validateInfos.status">
	          <j-dict-select-tag v-model:value="formData.status" dictCode="work_order_statu" placeholder="请选择工单状态" :disabled="disabled"/>
          </a-form-item>
        </a-col>
        <a-col :span="24">
          <a-form-item label="受理人" v-bind="validateInfos.assignee">
	          <j-select-user-by-dept v-model:value="formData.assignee" :disabled="disabled"/>
          </a-form-item>
        </a-col>
        <a-col :span="24">
          <a-form-item label="问题描述" v-bind="validateInfos.description">
	          <a-textarea v-model:value="formData.description" rows="4" placeholder="请输入问题描述" :disabled="disabled"/>
          </a-form-item>
        </a-col>
        <a-col :span="24">
          <a-form-item label="处理意见" v-bind="validateInfos.dealSuggestion">
	          <j-editor v-model:value="formData.dealSuggestion" :disabled="disabled"/>
          </a-form-item>
        </a-col>
        <a-col :span="24">
          <a-form-item label="处理附件" v-bind="validateInfos.dealFile">
	          <j-upload v-model:value="formData.dealFile"  :disabled="disabled" ></j-upload>
          </a-form-item>
        </a-col>
        <a-col :span="24">
          <a-form-item label="处理完成时间" v-bind="validateInfos.dealCompleteTime">
		        <a-date-picker placeholder="请选择处理完成时间" v-model:value="formData.dealCompleteTime" value-format="YYYY-MM-DD"  style="width: 100%" :disabled="disabled"/>
          </a-form-item>
        </a-col>
        <a-col :span="24">
          <a-form-item label="附件" v-bind="validateInfos.file">
	          <j-upload v-model:value="formData.file"  :disabled="disabled" ></j-upload>
          </a-form-item>
        </a-col>
        <a-col :span="24">
          <a-form-item label="附件模板(事项类别专用)" v-bind="validateInfos.modelFile">
	          <j-upload v-model:value="formData.modelFile"  :disabled="disabled" ></j-upload>
          </a-form-item>
        </a-col>
        <a-col :span="24">
          <a-form-item label="是否存案例库" v-bind="validateInfos.isknowledge">
	          <j-switch v-model:value="formData.isknowledge"  :disabled="disabled"></j-switch>
          </a-form-item>
        </a-col>
        <a-col :span="24">
          <a-form-item label="案例补充附件" v-bind="validateInfos.knowledgeFile">
	          <j-upload v-model:value="formData.knowledgeFile"  :disabled="disabled" ></j-upload>
          </a-form-item>
        </a-col>
        <a-col :span="24">
          <a-form-item label="案例补充意见" v-bind="validateInfos.knowledgeSuggestion">
	          <a-textarea v-model:value="formData.knowledgeSuggestion" rows="4" placeholder="请输入案例补充意见" :disabled="disabled"/>
          </a-form-item>
        </a-col>
        <a-col :span="24">
          <a-form-item label="事项类别ID" v-bind="validateInfos.ywItemType">
	          <j-category-select v-model:value="formData.ywItemType" pcode="B03" placeholder="请选择事项类别ID"  :disabled="disabled" @change="(value) => handleFormChange('ywItemType', value)" />
          </a-form-item>
        </a-col>
      </a-row>
    </a-form>
  </a-spin>
</template>

<script lang="ts" setup>
  import { ref, reactive, defineExpose, nextTick, defineProps, computed, onMounted } from 'vue';
  import { defHttp } from '/@/utils/http/axios';
  import { useMessage } from '/@/hooks/web/useMessage';
  import JDictSelectTag from '/@/components/Form/src/jeecg/components/JDictSelectTag.vue';
  import JSwitch from '/@/components/Form/src/jeecg/components/JSwitch.vue';
  import JCategorySelect from '/@/components/Form/src/jeecg/components/JCategorySelect.vue';
  import JSelectUserByDept from '/@/components/Form/src/jeecg/components/JSelectUserByDept.vue';
  import JUpload from '/@/components/Form/src/jeecg/components/JUpload/JUpload.vue';
  import JEditor from '/@/components/Form/src/jeecg/components/JEditor.vue';
  import { getValueType } from '/@/utils';
  import { saveOrUpdate } from '../HsYwWorkOrder.api';
  import { Form } from 'ant-design-vue';
  
  const props = defineProps({
    formDisabled: { type: Boolean, default: false },
    formData: { type: Object, default: ()=>{} },
    formBpm: { type: Boolean, default: true }
  });
  const formRef = ref();
  const useForm = Form.useForm;
  const emit = defineEmits(['register', 'ok']);
  const formData = reactive<Record<string, any>>({
    id: '',
    number: '',   
    status: '',   
    assignee: '',   
    description: '',   
    dealSuggestion: '',   
    dealFile: '',   
    dealCompleteTime: '',   
    file: '',   
    modelFile: '',   
    isknowledge: undefined,
    knowledgeFile: '',   
    knowledgeSuggestion: '',   
    ywItemType: '',   
  });
  const { createMessage } = useMessage();
  const labelCol = ref<any>({ xs: { span: 24 }, sm: { span: 5 } });
  const wrapperCol = ref<any>({ xs: { span: 24 }, sm: { span: 16 } });
  const confirmLoading = ref<boolean>(false);
  //表单验证
  const validatorRules = {
  };
  const { resetFields, validate, validateInfos } = useForm(formData, validatorRules, { immediate: true });

  // 表单禁用
  const disabled = computed(()=>{
    if(props.formBpm === true){
      if(props.formData.disabled === false){
        return false;
      }else{
        return true;
      }
    }
    return props.formDisabled;
  });

  
  /**
   * 新增
   */
  function add() {
    edit({});
  }

  /**
   * 编辑
   */
  function edit(record) {
    nextTick(() => {
      resetFields();
      //赋值
      Object.assign(formData, record);
    });
  }

  /**
   * 提交数据
   */
  async function submitForm() {
    // 触发表单验证
    await validate();
    confirmLoading.value = true;
    const isUpdate = ref<boolean>(false);
    //时间格式化
    let model = formData;
    if (model.id) {
      isUpdate.value = true;
    }
    //循环数据
    for (let data in model) {
      //如果该数据是数组并且是字符串类型
      if (model[data] instanceof Array) {
        let valueType = getValueType(formRef.value.getProps, data);
        //如果是字符串类型的需要变成以逗号分割的字符串
        if (valueType === 'string') {
          model[data] = model[data].join(',');
        }
      }
    }
    await saveOrUpdate(model, isUpdate.value)
      .then((res) => {
        if (res.success) {
          createMessage.success(res.message);
          emit('ok');
        } else {
          createMessage.warning(res.message);
        }
      })
      .finally(() => {
        confirmLoading.value = false;
      });
  }


  /**
   * 值改变事件触发
   * @param key
   * @param value
   */
  function handleFormChange(key, value) {
    formData[key] = value;
  }
  defineExpose({
    add,
    edit,
    submitForm,
  });
</script>

<style lang="less" scoped>
  .antd-modal-form {
    height: 500px !important;
    overflow-y: auto;
    padding: 24px 24px 24px 24px;
  }
</style>
