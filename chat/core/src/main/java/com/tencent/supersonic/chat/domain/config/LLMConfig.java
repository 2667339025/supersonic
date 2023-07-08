package com.tencent.supersonic.chat.domain.config;


import lombok.Data;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Configuration;

@Configuration
@Data
public class LLMConfig {


    @Value("${llm.url:}")
    private String url;

    @Value("${query2sql.path:query2sql}")
    private String queryToSqlPath;


    @Value("${query2sql.endpoint:}")
    private String endpoint;

}
