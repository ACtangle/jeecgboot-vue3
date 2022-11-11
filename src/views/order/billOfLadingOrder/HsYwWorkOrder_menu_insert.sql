-- 注意：该页面对应的前台目录为views/order/billLadingOrder文件夹下
-- 如果你想更改到其他目录，请修改sql中component字段对应的值


INSERT INTO sys_permission(id, parent_id, name, url, component, component_name, redirect, menu_type, perms, perms_type, sort_no, always_show, icon, is_route, is_leaf, keep_alive, hidden, hide_tab, description, status, del_flag, rule_flag, create_by, create_time, update_by, update_time, internal_or_external) 
VALUES ('2022111102157470160', NULL, '提单主页', '/order/billLadingOrder', 'order/billOfLadingOrder/HsYwWorkOrderList', NULL, NULL, 0, NULL, '1', 0.00, 0, NULL, 1, 1, 0, 0, 0, NULL, '1', 0, 0, 'admin', '2022-11-11 14:15:16', NULL, NULL, 0);

-- 权限控制sql
-- 新增
INSERT INTO sys_permission(id, parent_id, name, url, component, is_route, component_name, redirect, menu_type, perms, perms_type, sort_no, always_show, icon, is_leaf, keep_alive, hidden, hide_tab, description, create_by, create_time, update_by, update_time, del_flag, rule_flag, status, internal_or_external)
VALUES ('2022111102157470161', '2022111102157470160', '添加工单主表', NULL, NULL, 0, NULL, NULL, 2, 'org.jeecg.modules.demo:hs_yw_work_order:add', '1', NULL, 0, NULL, 1, 0, 0, 0, NULL, 'admin', '2022-11-11 14:15:16', NULL, NULL, 0, 0, '1', 0);
-- 编辑
INSERT INTO sys_permission(id, parent_id, name, url, component, is_route, component_name, redirect, menu_type, perms, perms_type, sort_no, always_show, icon, is_leaf, keep_alive, hidden, hide_tab, description, create_by, create_time, update_by, update_time, del_flag, rule_flag, status, internal_or_external)
VALUES ('2022111102157470162', '2022111102157470160', '编辑工单主表', NULL, NULL, 0, NULL, NULL, 2, 'org.jeecg.modules.demo:hs_yw_work_order:edit', '1', NULL, 0, NULL, 1, 0, 0, 0, NULL, 'admin', '2022-11-11 14:15:16', NULL, NULL, 0, 0, '1', 0);
-- 删除
INSERT INTO sys_permission(id, parent_id, name, url, component, is_route, component_name, redirect, menu_type, perms, perms_type, sort_no, always_show, icon, is_leaf, keep_alive, hidden, hide_tab, description, create_by, create_time, update_by, update_time, del_flag, rule_flag, status, internal_or_external)
VALUES ('2022111102157470163', '2022111102157470160', '删除工单主表', NULL, NULL, 0, NULL, NULL, 2, 'org.jeecg.modules.demo:hs_yw_work_order:delete', '1', NULL, 0, NULL, 1, 0, 0, 0, NULL, 'admin', '2022-11-11 14:15:16', NULL, NULL, 0, 0, '1', 0);
-- 批量删除
INSERT INTO sys_permission(id, parent_id, name, url, component, is_route, component_name, redirect, menu_type, perms, perms_type, sort_no, always_show, icon, is_leaf, keep_alive, hidden, hide_tab, description, create_by, create_time, update_by, update_time, del_flag, rule_flag, status, internal_or_external)
VALUES ('2022111102157470164', '2022111102157470160', '批量删除工单主表', NULL, NULL, 0, NULL, NULL, 2, 'org.jeecg.modules.demo:hs_yw_work_order:deleteBatch', '1', NULL, 0, NULL, 1, 0, 0, 0, NULL, 'admin', '2022-11-11 14:15:16', NULL, NULL, 0, 0, '1', 0);
-- 导出excel
INSERT INTO sys_permission(id, parent_id, name, url, component, is_route, component_name, redirect, menu_type, perms, perms_type, sort_no, always_show, icon, is_leaf, keep_alive, hidden, hide_tab, description, create_by, create_time, update_by, update_time, del_flag, rule_flag, status, internal_or_external)
VALUES ('2022111102157470165', '2022111102157470160', '导出excel_工单主表', NULL, NULL, 0, NULL, NULL, 2, 'org.jeecg.modules.demo:hs_yw_work_order:exportXls', '1', NULL, 0, NULL, 1, 0, 0, 0, NULL, 'admin', '2022-11-11 14:15:16', NULL, NULL, 0, 0, '1', 0);
-- 导入excel
INSERT INTO sys_permission(id, parent_id, name, url, component, is_route, component_name, redirect, menu_type, perms, perms_type, sort_no, always_show, icon, is_leaf, keep_alive, hidden, hide_tab, description, create_by, create_time, update_by, update_time, del_flag, rule_flag, status, internal_or_external)
VALUES ('2022111102157470166', '2022111102157470160', '导入excel_工单主表', NULL, NULL, 0, NULL, NULL, 2, 'org.jeecg.modules.demo:hs_yw_work_order:importExcel', '1', NULL, 0, NULL, 1, 0, 0, 0, NULL, 'admin', '2022-11-11 14:15:16', NULL, NULL, 0, 0, '1', 0);