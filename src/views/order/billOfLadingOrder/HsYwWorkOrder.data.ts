import {BasicColumn} from '/@/components/Table';
import {FormSchema} from '/@/components/Table';
import { rules} from '/@/utils/helper/validator';
import { render } from '/@/utils/common/renderUtils';
//列表数据
export const columns: BasicColumn[] = [
  {
    title: '创建人',
    align: "center",
    dataIndex: 'createBy'
  },
  {
    title: '创建日期',
    align: "center",
    dataIndex: 'createTime'
  },
  {
    title: '更新人',
    align: "center",
    dataIndex: 'updateBy'
  },
  {
    title: '更新日期',
    align: "center",
    dataIndex: 'updateTime'
  },
  {
    title: '工单编码',
    align: "center",
    dataIndex: 'number'
  },
  {
    title: '工单状态',
    align: "center",
    dataIndex: 'status_dictText'
  },
  {
    title: '受理人',
    align: "center",
    dataIndex: 'assignee_dictText'
  },
  {
    title: '问题描述',
    align: "center",
    dataIndex: 'description'
  },
  {
    title: '处理意见',
    align: "center",
    dataIndex: 'dealSuggestion',
    slots: { customRender: 'htmlSlot' },
  },
  {
    title: '处理附件',
    align: "center",
    dataIndex: 'dealFile',
    slots: { customRender: 'fileSlot' },
  },
  {
    title: '处理完成时间',
    align: "center",
    dataIndex: 'dealCompleteTime',
    customRender:({text}) =>{
      return !text?"":(text.length>10?text.substr(0,10):text);
    },
  },
  {
    title: '附件',
    align: "center",
    dataIndex: 'file',
    slots: { customRender: 'fileSlot' },
  },
  {
    title: '附件模板(事项类别专用)',
    align: "center",
    dataIndex: 'modelFile',
    slots: { customRender: 'fileSlot' },
  },
  {
    title: '是否存案例库',
    align: "center",
    dataIndex: 'isknowledge',
    customRender:({text}) => {
       return  render.renderSwitch(text, [{text:'是',value:'Y'},{text:'否',value:'N'}]);
     },
  },
  {
    title: '案例补充附件',
    align: "center",
    dataIndex: 'knowledgeFile',
    slots: { customRender: 'fileSlot' },
  },
  {
    title: '案例补充意见',
    align: "center",
    dataIndex: 'knowledgeSuggestion'
  },
  {
    title: '事项类别ID',
    align: "center",
    dataIndex: 'ywItemType',
    customRender:({text}) => {
       return render.renderCategoryTree(text,'B03');
   },
  },
];

//查询数据
export const searchFormSchema: FormSchema[] = [
  {
    label: "工单编码",
    field: 'number',
    component: 'Input',
    colProps: {span: 6},
  },
  {
    label: "工单状态",
    field: 'status',
    component: 'JDictSelectTag',
    componentProps:{
      dictCode: "work_order_statu"
    },
    colProps: {span: 6},
  },
  {
    label: "是否存案例库",
    field: 'isknowledge',
    component: 'JSwitch',
    componentProps:{
    },
    colProps: {span: 6},
  },
];

//表单数据
export const formSchema: FormSchema[] = [
  {
    label: '工单编码',
    field: 'number',
    component: 'Input',
  },
  {
    label: '工单状态',
    field: 'status',
    component: 'JDictSelectTag',
    componentProps:{
      dictCode: "work_order_statu"
    },
  },
  {
    label: '受理人',
    field: 'assignee',
    component: 'JSelectUserByDept',
    componentProps:{
      labelKey: 'realname',
    },
  },
  {
    label: '问题描述',
    field: 'description',
    component: 'InputTextArea',
  },
  {
    label: '处理意见',
    field: 'dealSuggestion',
    component: 'JEditor',
  },
  {
    label: '处理附件',
    field: 'dealFile',
    component: 'JUpload',
    componentProps:{
     },
  },
  {
    label: '处理完成时间',
    field: 'dealCompleteTime',
    component: 'DatePicker',
  },
  {
    label: '附件',
    field: 'file',
    component: 'JUpload',
    componentProps:{
     },
  },
  {
    label: '附件模板(事项类别专用)',
    field: 'modelFile',
    component: 'JUpload',
    componentProps:{
     },
  },
  {
    label: '是否存案例库',
    field: 'isknowledge',
    component: 'JSwitch',
    componentProps:{
    },
  },
  {
    label: '案例补充附件',
    field: 'knowledgeFile',
    component: 'JUpload',
    componentProps:{
     },
  },
  {
    label: '案例补充意见',
    field: 'knowledgeSuggestion',
    component: 'InputTextArea',
  },
  {
    label: '事项类别ID',
    field: 'ywItemType',
    component: 'JCategorySelect',
    componentProps:{
      pcode: "B03", //TODO back和事件未添加，暂时有问题
    },
  },
	// TODO 主键隐藏字段，目前写死为ID
  {
    label: '',
    field: 'id',
    component: 'Input',
    show: false,
  },
];
