package com.tencent.supersonic.chat.application.query;

import com.tencent.supersonic.auth.api.authentication.pojo.User;
import com.tencent.supersonic.chat.api.component.SemanticLayer;
import com.tencent.supersonic.chat.api.component.SemanticQuery;
import com.tencent.supersonic.chat.api.pojo.EntityInfo;
import com.tencent.supersonic.chat.api.pojo.SemanticParseInfo;
import com.tencent.supersonic.chat.api.response.QueryResultResp;
import com.tencent.supersonic.chat.application.DomainEntityService;
import com.tencent.supersonic.chat.domain.utils.ComponentFactory;
import com.tencent.supersonic.chat.domain.utils.SchemaInfoConverter;
import com.tencent.supersonic.common.util.context.ContextUtils;
import com.tencent.supersonic.semantic.api.core.pojo.QueryColumn;
import com.tencent.supersonic.semantic.api.core.response.QueryResultWithSchemaResp;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.lang3.StringUtils;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

@Slf4j
public class LLMSemanticQuery implements SemanticQuery {

    public static String QUERY_MODE = "DSL";

    private SemanticParseInfo semanticParse = new SemanticParseInfo();
    private SemanticLayer semanticLayer = ComponentFactory.getSemanticLayer();

    @Override
    public String getQueryMode() {
        return QUERY_MODE;
    }

    @Override
    public QueryResultResp execute(User user) {
        String queryMode = semanticParse.getQueryMode();

        if (semanticParse.getDomainId() < 0 || StringUtils.isEmpty(queryMode)) {
            // reach here some error may happen
            log.error("not find QueryMode");
            throw new RuntimeException("not find QueryMode");
        }
        QueryResultResp queryResponse = new QueryResultResp();
        QueryResultWithSchemaResp queryResult = semanticLayer.queryBySql(
                SchemaInfoConverter.convertToQuerySqlReq(semanticParse), user);

        if (queryResult != null) {
            queryResponse.setQueryAuthorization(queryResult.getQueryAuthorization());
        }
        String sql = queryResult == null ? null : queryResult.getSql();
        List<Map<String, Object>> resultList = queryResult == null ? new ArrayList<>()
                : queryResult.getResultList();
        List<QueryColumn> columns = queryResult == null ? new ArrayList<>() : queryResult.getColumns();
        queryResponse.setQuerySql(sql);
        queryResponse.setQueryResults(resultList);
        queryResponse.setQueryColumns(columns);
        queryResponse.setQueryMode(queryMode);

        // add domain info
        EntityInfo entityInfo = ContextUtils.getBean(DomainEntityService.class)
                .getEntityInfo(semanticParse, user);
        queryResponse.setEntityInfo(entityInfo);
        return queryResponse;
    }

    @Override
    public SemanticParseInfo getParseInfo() {
        return semanticParse;
    }
}
