%dw 2.0
output application/json
---
{
    correlationId : vars.correlationId,
    businessProcessName: Mule::p('logger.businessProcessName'),
    flowName: flow.name,  
    source: Mule::p('logger.target'),
    target: Mule::p('logger.source'),
    httpMethod: vars.inputPayload.httpMethod,
    message: "Sending success response to " ++ Mule::p('logger.source'),
    businessObject: []
}