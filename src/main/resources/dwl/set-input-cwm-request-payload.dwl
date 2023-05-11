%dw 2.0
import * from dw::core::Strings
output application/json skipNullOn="everywhere"
---
{
  "doNumber": payload."deliveryOrderNumber",
  "doStatus": if(payload."deliveryOrderStatus"=="INTRANSIT") "InTransit" else capitalize(payload."deliveryOrderStatus"),
  "doType": if(payload."deliveryOrderType" == "EMPTYRETURN") "EmptyReturn" else capitalize(payload."deliveryOrderType"),
  "billOfLading": payload."billOfLading",
  "booking": payload."bookingNumber",
  "originPort": payload."originUnlocode",
  "destinationPort": payload."destinationUnlocode",
  "invoiceReferenceNumber": payload."invoiceReferenceNumber",
  "customerCode": payload."customerCode",
  "customerName": payload."customerName",
  "bcoName": payload."bcoName",
  "oceanCarrier": payload."oceanCarrier",
  "voyage": payload."voyageNumber",
  "vessel": payload."vesselName",
  "standardCarrierAlphaCode": payload."standardCarrierAlphaCode",
  "shipments": [
  	{
  		"shipmentNumber": payload."deliveryOrderNumber"
  	}
  ],
  "cargo": {
    "quantity": payload.cargo."quantity",
    "quantityUOM": payload.cargo."quantityUOM",
    "commodityGoodsNumber": payload.cargo."commodityGoodsNumber",
    "freightDescription": payload.cargo."freightDescription",
    "commodityClass": payload.cargo."commodityClass",
    "commodityComments": payload.cargo."commodityComments",
    "isHazmat": payload.cargo."isHazmat",
    "grossWeight": payload.cargo."grossWeight",
    "grossWeightUOM": payload.cargo."grossWeightUOM",
    "netWeight": payload.cargo."netWeight",
    "netWeightUOM": payload.cargo."netWeightUOM",
    "grossVolume": payload.cargo."grossVolume",
    "grossVolumeUOM": payload.cargo."grossVolumeUOM",
    "isShipmentOverweight": payload.cargo."isShipmentOverweight",
    "packageType": payload.cargo."packageType"
  },
  "container": {
    "number": payload.container."number",
    "equipmentSizeType": payload.container."equipmentSizeType",
    "seal": payload.container."seal",
    "isStackable": payload.container."isStackable",
    "isLoaded": payload.container."isLoaded"
  },
  "stops":payload.stops map{
      "stopType": $."stopType",
      "stopNumber": $."stopNumber",
      "locationName": $."locationName",
      "locationType": $."locationType",
      "locationAddress1": $."locationAddress1",
      "locationAddress2": $."locationAddress2",
      "city": $."city",
      "state": $."state",
      "country": $."country",
      "postalCode": $."postalCode"
    },
  "deliverySchedule": {
    "cutOffDate": payload.deliverySchedule."cutOffDate",
    "documentationCutOffDate": payload.deliverySchedule."documentationCutOffDate",
    "lastFreeDate": payload.deliverySchedule."lastFreeDate",
    "plannedPickup": payload.deliverySchedule."plannedPickup",
    "plannedVesselDeparture": payload.deliverySchedule."plannedVesselDeparture",
    "scheduledDeliveryDate": payload.deliverySchedule."scheduledDeliveryDate",
    "returnDeliveryOrder": payload.deliverySchedule."returnDeliveryOrder",
    "bondedMove": payload.deliverySchedule."bondedMove",
    "fumigationRequestedAt": payload.deliverySchedule."fumigationRequestedAt"
  }
  }  