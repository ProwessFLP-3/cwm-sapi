%dw 2.0
output application/json
---
{
    correlationId : vars.correlationId,
    businessProcessName: Mule::p('logger.businessProcessName'),
    flowName: flow.name,  
    source: Mule::p('logger.target'),
    target: Mule::p('application.name'),
    httpMethod: vars.inputPayload.httpMethod,
    message: "Success Response received from valor victoria CWM api",
    businessObject: []
}