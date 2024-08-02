//
//Generated by AdminBooster
//

public with sharing class OpenCageResponseWrapper{
	public results[] results;
	public status status;
	public class results {
		public components components;
		public Integer confidence;	//10
		public distance_from_q distance_from_q;
		public String formatted;	//Design Offices, Philipsbornstraße 2, 30165 Hanover, Germany
		public geometry geometry;
	}
	public class components {
		public String category;	//building
		public String normalized_city;	//Hanover
		public String type;	//building
		public String city;	//Hanover
		public String city_district;	//Vahrenwald-List
		public String continent;	//Europe
		public String country;	//Germany
		public String country_code;	//de
		public String county;	//Region Hannover
		public String house_number;	//2
		public String office;	//Design Offices
		public String political_union;	//European Union
		public String postcode;	//30165
		public String road;	//Philipsbornstraße
		public String state;	//Lower Saxony
		public String state_code;	//NI
		public String suburb;	//Vahrenwald
	}
	public class distance_from_q {
		public Integer meters;	//0
	}
	public class geometry {
		public Double lat;	//52.387783
		public Double lng;	//9.7334394
	}
	public class status {
		public Integer code;	//200
		public String message;	//OK
	}
	public static OpenCageResponseWrapper parse(String json){
		return (OpenCageResponseWrapper) System.JSON.deserialize(json, OpenCageResponseWrapper.class);
	}
/*
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
		OpenCageResponseWrapper obj = parse(json);
		System.assert(obj != null);
	}*/
}