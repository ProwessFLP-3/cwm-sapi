%dw 2.0
output application/json
---
{
    correlationId : vars.correlationId,
    businessProcessName: Mule::p('logger.businessProcessName'),
    flowName: flow.name,  
    source: Mule::p('logger.source'),
    target: Mule::p('logger.target'),
    httpMethod: attributes.method,
    message: "Request for Delivery Order received.",
    businessObject: []
}