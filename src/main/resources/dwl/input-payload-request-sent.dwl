%dw 2.0
output application/json
---
{
    correlationId : vars.correlationId,
    businessProcessName: Mule::p('logger.businessProcessName'),
    flowName: flow.name,  
    source: Mule::p('application.name'),
    target: Mule::p('logger.target'),
    httpMethod: vars.inputPayload.httpMethod,
    message: "Sending delivery order request to CWM api",
    businessObject: []
}
