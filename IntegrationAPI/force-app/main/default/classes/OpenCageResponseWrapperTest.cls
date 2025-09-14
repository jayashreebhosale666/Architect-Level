@isTest
public with sharing class OpenCageResponseWrapperTest {
    static testMethod void testParse() {
		String json=		'{'+
		'  "results": ['+
		'    {'+
		'      "components": {'+
		'        "ISO_3166-1_alpha-2": "DE",'+
		'        "ISO_3166-1_alpha-3": "DEU",'+
		'        "ISO_3166-2": ['+
		'          "DE-NI"'+
		'        ],'+
		'        "_category": "building",'+
		'        "_normalized_city": "Hanover",'+
		'        "_type": "building",'+
		'        "city": "Hanover",'+
		'        "city_district": "Vahrenwald-List",'+
		'        "continent": "Europe",'+
		'        "country": "Germany",'+
		'        "country_code": "de",'+
		'        "county": "Region Hannover",'+
		'        "house_number": "2",'+
		'        "office": "Design Offices",'+
		'        "political_union": "European Union",'+
		'        "postcode": "30165",'+
		'        "road": "Philipsbornstraße",'+
		'        "state": "Lower Saxony",'+
		'        "state_code": "NI",'+
		'        "suburb": "Vahrenwald"'+
		'      },'+
		'      "confidence": 10,'+
		'      "distance_from_q": {'+
		'        "meters": 0'+
		'      },'+
		'      "formatted": "Design Offices, Philipsbornstraße 2, 30165 Hanover, Germany",'+
		'      "geometry": {'+
		'        "lat": 52.387783,'+
		'        "lng": 9.7334394'+
		'      }'+
		'    }'+
		'  ],'+
		'  "status": {'+
		'    "code": 200,'+
		'    "message": "OK"'+
		'  }'+
		'}';
		OpenCageResponseWrapper obj = OpenCageResponseWrapper.parse(json);
		System.assert(obj != null);
	}
}