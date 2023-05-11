%dw 2.0
output application/json
---
{
	"username": Mule::p('secure::backendBearerToken.username'),
	"password": Mule::p('secure::backendBearerToken.password'),
	"grant_type": Mule::p('secure::backendBearerToken.grant_type')
}