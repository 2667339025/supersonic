insert into s2_user (id, `name`, password, display_name, email) values (1, 'admin','admin','admin','admin@xx.com');
insert into s2_user (id, `name`, password, display_name, email) values (2, 'jack','123456','jack','jack@xx.com');
insert into s2_user (id, `name`, password, display_name, email) values (3, 'tom','123456','tom','tom@xx.com');
insert into s2_user (id, `name`, password, display_name, email) values (4, 'lucy','123456','lucy','lucy@xx.com');

insert into s2_chat_config (`id` ,`domain_id` ,`default_metrics`,`visibility`,`entity_info` ,`dictionary_info`,`created_at`,`updated_at`,`created_by`,`updated_by`,`status` ) values (1,1,'[{"metricId":1,"unit":7,"period":"DAY"}]','{"blackDimIdList":[],"blackMetricIdList":[]}','{"entityIds":[2],"names":["用户","用户姓名"],"detailData":{"dimensionIds":[1,2],"metricIds":[2]}}','[{"itemId":1,"type":"DIMENSION","blackList":[],"isDictInfo":true},{"itemId":2,"type":"DIMENSION","blackList":[],"isDictInfo":true},{"itemId":3,"type":"DIMENSION","blackList":[],"isDictInfo":true}]','2023-05-24 18:00:00','2023-05-25 11:00:00','admin','admin',1);

insert into s2_chat (chat_id, `chat_name`, create_time, last_time, creator,last_question,is_delete,is_top) values (1, '超音数访问统计','2023-06-10 10:00:52.495','2023-06-10 10:00:52','admin','您好，欢迎使用内容智能小Q','0','0');
insert into s2_chat (chat_id, `chat_name`, create_time, last_time, creator,last_question,is_delete,is_top) values (2, '用户访问统计','2023-06-10 10:01:04.528','2023-06-10 10:01:04','admin','您好，欢迎使用内容智能小Q','0','0');

insert into s2_chat_context (chat_id, modified_at , `user`, `query_text`, `semantic_parse` ,ext_data) VALUES(1, '2023-06-10 10:40:49.877', 'admin', '访问', '{"queryMode":"METRIC_ORDERBY","aggType":"NONE","domainId":1,"domainName":"超音数","entity":0,"metrics":[{"id":3,"name":"访问人数","bizName":"uv","status":1,"sensitiveLevel":0},{"id":2,"name":"访问次数","bizName":"pv","status":1,"sensitiveLevel":0}],"dimensions":[{"id":3,"name":"页面","bizName":"page","status":1,"sensitiveLevel":0},{"bizName":"sys_imp_date","status":1,"sensitiveLevel":0}],"dimensionFilters":[],"metricFilters":[],"orders":[],"dateInfo":{"dateMode":"RECENT_UNITS","startDate":"2023-06-03","endDate":"2023-06-09","dateList":[],"unit":7,"period":"DAY"},"nativeQuery":false}', 'admin');
insert into s2_chat_context (chat_id, modified_at , `user`, `query_text`, `semantic_parse` ,ext_data) VALUES(2, '2023-06-10 10:42:02.184', 'null', '访问', '{"queryMode":"METRIC_ORDERBY","aggType":"NONE","domainId":1,"domainName":"超音数","entity":0,"metrics":[{"id":3,"name":"访问人数","bizName":"uv","status":1,"sensitiveLevel":0},{"id":2,"name":"访问次数","bizName":"pv","status":1,"sensitiveLevel":0}],"dimensions":[{"id":3,"name":"页面","bizName":"page","status":1,"sensitiveLevel":0},{"bizName":"sys_imp_date","status":1,"sensitiveLevel":0}],"dimensionFilters":[],"metricFilters":[],"orders":[],"dateInfo":{"dateMode":"RECENT_UNITS","startDate":"2023-06-03","endDate":"2023-06-09","dateList":[],"unit":7,"period":"DAY"},"nativeQuery":false}', 'null');

insert into s2_chat_query (`question_id`,`create_time`,`query_text`,`user_name`,`query_state`,`chat_id`,`query_response`,`score`,`feedback`) VALUES(1, '2023-06-10 10:39:55.178', '超音数 访问次数', 'admin',0,1,'{"queryMode":"METRIC_DOMAIN","querySql":"SELECT `sys_imp_date` , `pv` FROM ( SELECT `sys_imp_date` , `s2_pv_uv_statis_pv` AS `pv` FROM ( SELECT SUM ( `s2_pv_uv_statis_pv` ) AS `s2_pv_uv_statis_pv` , `sys_imp_date` FROM ( SELECT `pv` AS `s2_pv_uv_statis_pv` , `imp_date` AS `sys_imp_date` FROM ( SELECT `imp_date` , `user_name` , `page` , 1 AS `pv` , `user_name` AS `uv` FROM `s2_pv_uv_statis` ) AS `s2_pv_uv_statis` ) AS `src00_s2_pv_uv_statis_f370` WHERE ( `sys_imp_date` >= ''2023-06-03'' AND `sys_imp_date` <= ''2023-06-09'' ) GROUP BY `sys_imp_date` ) AS `s2_pv_uv_statis_0` ) AS `s2_pv_uv_statis_1` LIMIT 10","queryState":0,"queryColumns":[{"name":"date","type":"VARCHAR","nameEn":"sys_imp_date","showType":"DATE","authorized":true},{"name":"访问次数","type":"BIGINT","nameEn":"pv","showType":"NUMBER","authorized":true}],"entityInfo":{"domainInfo":{"itemId":1,"name":"超音数","bizName":"supersonic","words":["用户","用户姓名"],"primaryEntityBizName":"user_name"}},"chatContext":{"queryMode":"METRIC_DOMAIN","domainId":1,"domainName":"超音数","entity":0,"metrics":[{"id":2,"name":"访问次数","bizName":"pv","status":1,"sensitiveLevel":0}],"dimensions":[{"bizName":"sys_imp_date","status":1,"sensitiveLevel":0}],"dimensionFilters":[],"metricFilters":[],"orders":[],"dateInfo":{"dateMode":"RECENT_UNITS","startDate":"2023-06-03","endDate":"2023-06-09","dateList":[],"unit":7,"period":"DAY"},"limit":10,"nativeQuery":false},"queryResults":[{"sys_imp_date":"2023-06-03","pv":11},{"sys_imp_date":"2023-06-04","pv":14},{"sys_imp_date":"2023-06-05","pv":1},{"sys_imp_date":"2023-06-06","pv":19},{"sys_imp_date":"2023-06-07","pv":18},{"sys_imp_date":"2023-06-08","pv":24},{"sys_imp_date":"2023-06-09","pv":23}]}',0,'');
insert into s2_chat_query (`question_id`,`create_time`,`query_text`,`user_name`,`query_state`,`chat_id`,`query_response`,`score`,`feedback`) VALUES(2, '2023-06-10 10:40:12.259', '按页面', 'admin',0,1,'{"queryMode":"METRIC_ORDERBY","querySql":"SELECT `sys_imp_date` , `page` , `pv` FROM ( SELECT `sys_imp_date` , `page` , `s2_pv_uv_statis_pv` AS `pv` FROM ( SELECT SUM ( `s2_pv_uv_statis_pv` ) AS `s2_pv_uv_statis_pv` , `sys_imp_date` , `page` FROM ( SELECT `pv` AS `s2_pv_uv_statis_pv` , `imp_date` AS `sys_imp_date` , `page` AS `page` FROM ( SELECT `imp_date` , `user_name` , `page` , 1 AS `pv` , `user_name` AS `uv` FROM `s2_pv_uv_statis` ) AS `s2_pv_uv_statis` ) AS `src00_s2_pv_uv_statis_ecf5` WHERE ( `sys_imp_date` >= ''2023-06-03'' AND `sys_imp_date` <= ''2023-06-09'' ) GROUP BY `sys_imp_date` , `page` ) AS `s2_pv_uv_statis_0` ) AS `s2_pv_uv_statis_1` LIMIT 10","queryState":0,"queryColumns":[{"name":"date","type":"VARCHAR","nameEn":"sys_imp_date","showType":"DATE","authorized":true},{"name":"页面","type":"VARCHAR","nameEn":"page","showType":"CATEGORY","authorized":true},{"name":"访问次数","type":"BIGINT","nameEn":"pv","showType":"NUMBER","authorized":true}],"entityInfo":{"domainInfo":{"itemId":1,"name":"超音数","bizName":"supersonic","words":["用户","用户姓名"],"primaryEntityBizName":"user_name"}},"chatContext":{"queryMode":"METRIC_ORDERBY","domainId":1,"domainName":"超音数","entity":0,"metrics":[{"id":2,"name":"访问次数","bizName":"pv","status":1,"sensitiveLevel":0}],"dimensions":[{"id":3,"name":"页面","bizName":"page","status":1,"sensitiveLevel":0},{"bizName":"sys_imp_date","status":1,"sensitiveLevel":0}],"dimensionFilters":[],"metricFilters":[],"orders":[],"dateInfo":{"dateMode":"RECENT_UNITS","startDate":"2023-06-03","endDate":"2023-06-09","dateList":[],"unit":7,"period":"DAY"},"limit":10,"nativeQuery":false},"queryResults":[{"sys_imp_date":"2023-06-03","page":"p1","pv":2},{"sys_imp_date":"2023-06-03","page":"p2","pv":3},{"sys_imp_date":"2023-06-03","page":"p3","pv":2},{"sys_imp_date":"2023-06-03","page":"p4","pv":1},{"sys_imp_date":"2023-06-03","page":"p5","pv":3},{"sys_imp_date":"2023-06-04","page":"p1","pv":3},{"sys_imp_date":"2023-06-04","page":"p2","pv":1},{"sys_imp_date":"2023-06-04","page":"p3","pv":2},{"sys_imp_date":"2023-06-04","page":"p4","pv":4},{"sys_imp_date":"2023-06-04","page":"p5","pv":4}]}',0,'');
insert into s2_chat_query (`question_id`,`create_time`,`query_text`,`user_name`,`query_state`,`chat_id`,`query_response`,`score`,`feedback`) VALUES(3, '2023-06-10 10:40:49.877', '访问', 'admin',0,1,'{"queryMode":"METRIC_ORDERBY","querySql":"SELECT `sys_imp_date` , `page` , `uv` , `pv` FROM ( SELECT `sys_imp_date` , `page` , `s2_pv_uv_statis_uv` AS `uv` , `s2_pv_uv_statis_pv` AS `pv` FROM ( SELECT COUNT ( DISTINCT `s2_pv_uv_statis_uv` ) AS `s2_pv_uv_statis_uv` , SUM ( `s2_pv_uv_statis_pv` ) AS `s2_pv_uv_statis_pv` , `sys_imp_date` , `page` FROM ( SELECT `uv` AS `s2_pv_uv_statis_uv` , `pv` AS `s2_pv_uv_statis_pv` , `imp_date` AS `sys_imp_date` , `page` AS `page` FROM ( SELECT `imp_date` , `user_name` , `page` , 1 AS `pv` , `user_name` AS `uv` FROM `s2_pv_uv_statis` ) AS `s2_pv_uv_statis` ) AS `src00_s2_pv_uv_statis_022c` WHERE ( `sys_imp_date` >= ''2023-06-03'' AND `sys_imp_date` <= ''2023-06-09'' ) GROUP BY `sys_imp_date` , `page` ) AS `s2_pv_uv_statis_0` ) AS `s2_pv_uv_statis_1` LIMIT 10","queryState":0,"queryColumns":[{"name":"date","type":"VARCHAR","nameEn":"sys_imp_date","showType":"DATE","authorized":true},{"name":"页面","type":"VARCHAR","nameEn":"page","showType":"CATEGORY","authorized":true},{"name":"访问人数","type":"BIGINT","nameEn":"uv","showType":"NUMBER","authorized":true},{"name":"访问次数","type":"BIGINT","nameEn":"pv","showType":"NUMBER","authorized":true}],"entityInfo":{"domainInfo":{"itemId":1,"name":"超音数","bizName":"supersonic","words":["用户","用户姓名"],"primaryEntityBizName":"user_name"}},"chatContext":{"queryMode":"METRIC_ORDERBY","domainId":1,"domainName":"超音数","entity":0,"metrics":[{"id":3,"name":"访问人数","bizName":"uv","status":1,"sensitiveLevel":0},{"id":2,"name":"访问次数","bizName":"pv","status":1,"sensitiveLevel":0}],"dimensions":[{"id":3,"name":"页面","bizName":"page","status":1,"sensitiveLevel":0},{"bizName":"sys_imp_date","status":1,"sensitiveLevel":0}],"dimensionFilters":[],"metricFilters":[],"orders":[],"dateInfo":{"dateMode":"RECENT_UNITS","startDate":"2023-06-03","endDate":"2023-06-09","dateList":[],"unit":7,"period":"DAY"},"limit":10,"nativeQuery":false},"queryResults":[{"sys_imp_date":"2023-06-03","page":"p1","uv":2,"pv":2},{"sys_imp_date":"2023-06-03","page":"p2","uv":3,"pv":3},{"sys_imp_date":"2023-06-03","page":"p3","uv":2,"pv":2},{"sys_imp_date":"2023-06-03","page":"p4","uv":1,"pv":1},{"sys_imp_date":"2023-06-03","page":"p5","uv":3,"pv":3},{"sys_imp_date":"2023-06-04","page":"p1","uv":2,"pv":3},{"sys_imp_date":"2023-06-04","page":"p2","uv":1,"pv":1},{"sys_imp_date":"2023-06-04","page":"p3","uv":2,"pv":2},{"sys_imp_date":"2023-06-04","page":"p4","uv":3,"pv":4},{"sys_imp_date":"2023-06-04","page":"p5","uv":3,"pv":4}]}',0,'');
insert into s2_chat_query (`question_id`,`create_time`,`query_text`,`user_name`,`query_state`,`chat_id`,`query_response`,`score`,`feedback`) VALUES(4, '2023-06-10 10:41:18.589','alice 访问次数','admin',0,2,'{"queryMode":"METRIC_FILTER","querySql":"SELECT `sys_imp_date` , `pv` FROM ( SELECT `sys_imp_date` , `s2_pv_uv_statis_pv` AS `pv` FROM ( SELECT SUM ( `s2_pv_uv_statis_pv` ) AS `s2_pv_uv_statis_pv` , `sys_imp_date` FROM ( SELECT `user_name` , `pv` AS `s2_pv_uv_statis_pv` , `imp_date` AS `sys_imp_date` FROM ( SELECT `imp_date` , `user_name` , `page` , 1 AS `pv` , `user_name` AS `uv` FROM `s2_pv_uv_statis` ) AS `s2_pv_uv_statis` ) AS `src00_s2_pv_uv_statis_b825` WHERE ( `sys_imp_date` >= ''2023-06-03'' AND `sys_imp_date` <= ''2023-06-09'' AND `user_name` = ''alice'' ) GROUP BY `sys_imp_date` ) AS `s2_pv_uv_statis_0` ) AS `s2_pv_uv_statis_1` LIMIT 10","queryState":0,"queryColumns":[{"name":"date","type":"VARCHAR","nameEn":"sys_imp_date","showType":"DATE","authorized":true},{"name":"访问次数","type":"BIGINT","nameEn":"pv","showType":"NUMBER","authorized":true}],"entityInfo":{"domainInfo":{"itemId":1,"name":"超音数","bizName":"supersonic","words":["用户","用户姓名"],"primaryEntityBizName":"user_name"},"dimensions":[{"itemId":1,"name":"部门","bizName":"department","value":"sales"},{"itemId":2,"name":"用户名","bizName":"user_name","value":"alice"}],"metrics":[{"itemId":2,"name":"访问次数","bizName":"pv","value":"2"}],"entityId":"alice"},"chatContext":{"queryMode":"METRIC_FILTER","domainId":1,"domainName":"超音数","entity":0,"metrics":[{"id":2,"name":"访问次数","bizName":"pv","status":1,"sensitiveLevel":0}],"dimensions":[{"bizName":"sys_imp_date","status":1,"sensitiveLevel":0}],"dimensionFilters":[{"bizName":"user_name","name":"用户名","operator":"=","value":"alice","elementID":2}],"metricFilters":[],"orders":[],"dateInfo":{"dateMode":"RECENT_UNITS","startDate":"2023-06-03","endDate":"2023-06-09","dateList":[],"unit":7,"period":"DAY"},"limit":10,"nativeQuery":false},"queryResults":[{"sys_imp_date":"2023-06-03","pv":2},{"sys_imp_date":"2023-06-04","pv":2},{"sys_imp_date":"2023-06-06","pv":2},{"sys_imp_date":"2023-06-07","pv":2},{"sys_imp_date":"2023-06-08","pv":5},{"sys_imp_date":"2023-06-09","pv":2}]}',0,'');
insert into s2_chat_query (`question_id`,`create_time`,`query_text`,`user_name`,`query_state`,`chat_id`,`query_response`,`score`,`feedback`) VALUES(5, '2023-06-10 10:41:48.211','停留时长','admin',0,2,'{"queryMode":"METRIC_FILTER","querySql":"SELECT `sys_imp_date` , `stay_hours` FROM ( SELECT `sys_imp_date` , `s2_stay_time_statis_stay_hours` AS `stay_hours` FROM ( SELECT SUM ( `s2_stay_time_statis_stay_hours` ) AS `s2_stay_time_statis_stay_hours` , `sys_imp_date` FROM ( SELECT `user_name` , `stay_hours` AS `s2_stay_time_statis_stay_hours` , `imp_date` AS `sys_imp_date` FROM ( SELECT `imp_date` , `page` , `user_name` , `stay_hours` FROM `s2_stay_time_statis` ) AS `s2_stay_time_statis` ) AS `src00_s2_stay_time_statis_df18` WHERE ( `sys_imp_date` >= ''2023-06-03'' AND `sys_imp_date` <= ''2023-06-09'' AND `user_name` = ''alice'' ) GROUP BY `sys_imp_date` ) AS `s2_stay_time_statis_0` ) AS `s2_stay_time_statis_1` LIMIT 10","queryState":0,"queryColumns":[{"name":"date","type":"VARCHAR","nameEn":"sys_imp_date","showType":"DATE","authorized":true},{"name":"停留时长","type":"DOUBLE","nameEn":"stay_hours","showType":"NUMBER","authorized":true}],"entityInfo":{"domainInfo":{"itemId":1,"name":"超音数","bizName":"supersonic","words":["用户","用户姓名"],"primaryEntityBizName":"user_name"},"dimensions":[{"itemId":1,"name":"部门","bizName":"department","value":"sales"},{"itemId":2,"name":"用户名","bizName":"user_name","value":"alice"}],"metrics":[{"itemId":2,"name":"访问次数","bizName":"pv","value":"2"}],"entityId":"alice"},"chatContext":{"queryMode":"METRIC_FILTER","domainId":1,"domainName":"超音数","entity":0,"metrics":[{"id":1,"name":"停留时长","bizName":"stay_hours","status":1,"sensitiveLevel":0}],"dimensions":[{"bizName":"sys_imp_date","status":1,"sensitiveLevel":0}],"dimensionFilters":[{"bizName":"user_name","name":"用户名","operator":"=","value":"alice","elementID":2}],"metricFilters":[],"orders":[],"dateInfo":{"dateMode":"RECENT_UNITS","startDate":"2023-06-03","endDate":"2023-06-09","dateList":[],"unit":7,"period":"DAY"},"limit":10,"nativeQuery":false},"queryResults":[{"sys_imp_date":"2023-06-03","stay_hours":0.5963801306980994},{"sys_imp_date":"2023-06-04","stay_hours":1.5120376931855422},{"sys_imp_date":"2023-06-06","stay_hours":3.7790223355266317},{"sys_imp_date":"2023-06-07","stay_hours":0.8654528466186735},{"sys_imp_date":"2023-06-08","stay_hours":0.9796159603778489},{"sys_imp_date":"2023-06-09","stay_hours":0.6705580511822682}]}',0,'');
insert into s2_chat_query (`question_id`,`create_time`,`query_text`,`user_name`,`query_state`,`chat_id`,`query_response`,`score`,`feedback`) VALUES(6, '2023-06-10 10:42:02.184','访问','admin',0,2,'{"queryMode":"METRIC_FILTER","querySql":"SELECT `sys_imp_date` , `stay_hours` FROM ( SELECT `sys_imp_date` , `s2_stay_time_statis_stay_hours` AS `stay_hours` FROM ( SELECT SUM ( `s2_stay_time_statis_stay_hours` ) AS `s2_stay_time_statis_stay_hours` , `sys_imp_date` FROM ( SELECT `user_name` , `stay_hours` AS `s2_stay_time_statis_stay_hours` , `imp_date` AS `sys_imp_date` FROM ( SELECT `imp_date` , `page` , `user_name` , `stay_hours` FROM `s2_stay_time_statis` ) AS `s2_stay_time_statis` ) AS `src00_s2_stay_time_statis_df18` WHERE ( `sys_imp_date` >= ''2023-06-03'' AND `sys_imp_date` <= ''2023-06-09'' AND `user_name` = ''alice'' ) GROUP BY `sys_imp_date` ) AS `s2_stay_time_statis_0` ) AS `s2_stay_time_statis_1` LIMIT 10","queryState":0,"queryColumns":[{"name":"date","type":"VARCHAR","nameEn":"sys_imp_date","showType":"DATE","authorized":true},{"name":"停留时长","type":"DOUBLE","nameEn":"stay_hours","showType":"NUMBER","authorized":true}],"entityInfo":{"domainInfo":{"itemId":1,"name":"超音数","bizName":"supersonic","words":["用户","用户姓名"],"primaryEntityBizName":"user_name"},"dimensions":[{"itemId":1,"name":"部门","bizName":"department","value":"sales"},{"itemId":2,"name":"用户名","bizName":"user_name","value":"alice"}],"metrics":[{"itemId":2,"name":"访问次数","bizName":"pv","value":"2"}],"entityId":"alice"},"chatContext":{"queryMode":"METRIC_FILTER","domainId":1,"domainName":"超音数","entity":0,"metrics":[{"id":1,"name":"停留时长","bizName":"stay_hours","status":1,"sensitiveLevel":0}],"dimensions":[{"bizName":"sys_imp_date","status":1,"sensitiveLevel":0}],"dimensionFilters":[{"bizName":"user_name","name":"用户名","operator":"=","value":"alice","elementID":2}],"metricFilters":[],"orders":[],"dateInfo":{"dateMode":"RECENT_UNITS","startDate":"2023-06-03","endDate":"2023-06-09","dateList":[],"unit":7,"period":"DAY"},"limit":10,"nativeQuery":false},"queryResults":[{"sys_imp_date":"2023-06-03","stay_hours":0.5963801306980994},{"sys_imp_date":"2023-06-04","stay_hours":1.5120376931855422},{"sys_imp_date":"2023-06-06","stay_hours":3.7790223355266317},{"sys_imp_date":"2023-06-07","stay_hours":0.8654528466186735},{"sys_imp_date":"2023-06-08","stay_hours":0.9796159603778489},{"sys_imp_date":"2023-06-09","stay_hours":0.6705580511822682}]}',0,'');