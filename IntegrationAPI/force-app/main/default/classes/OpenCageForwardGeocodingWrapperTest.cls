@isTest
public with sharing class OpenCageForwardGeocodingWrapperTest {
    public OpenCageForwardGeocodingWrapperTest() {

    }
    
	static testMethod void testParse() {
		String json=		'{'+
		'  "results": ['+
		'    {'+
		'      "annotations": {'+/*
		'        "DMS": {'+
		'          "lat": "50° 58' 39.03816'' N",'+
		'          "lng": "11° 19' 42.75264'' E"'+
		'        },'+*/
		'        "MGRS": "32UPB6346249905",'+
		'        "Maidenhead": "JO50px94ko",'+
		'        "Mercator": {'+
		'          "x": 1261087.577,'+
		'          "y": 6584100.003'+
		'        },'+
		'        "NUTS": {'+
		'          "NUTS0": {'+
		'            "code": "DE"'+
		'          },'+
		'          "NUTS1": {'+
		'            "code": "DEG"'+
		'          },'+
		'          "NUTS2": {'+
		'            "code": "DEG0"'+
		'          },'+
		'          "NUTS3": {'+
		'            "code": "DEG05"'+
		'          }'+
		'        },'+
		'        "OSM": {'+
		'          "edit_url": "https://www.openstreetmap.org/edit?relation=3145143#map=17/50.97751/11.32854",'+
		'          "note_url": "https://www.openstreetmap.org/note/new#map=17/50.97751/11.32854&layers=N",'+
		'          "url": "https://www.openstreetmap.org/?mlat=50.97751&mlon=11.32854#map=17/50.97751/11.32854"'+
		'        },'+
		'        "UN_M49": {'+
		'          "regions": {'+
		'            "DE": "276",'+
		'            "EUROPE": "150",'+
		'            "WESTERN_EUROPE": "155",'+
		'            "WORLD": "001"'+
		'          },'+
		'          "statistical_groupings": ['+
		'            "MEDC"'+
		'          ]'+
		'        },'+
		'        "callingcode": 49,'+
		'        "currency": {'+
		'          "alternate_symbols": [],'+
		'          "decimal_mark": ",",'+
		'          "html_entity": "€",'+
		'          "iso_code": "EUR",'+
		'          "iso_numeric": "978",'+
		'          "name": "Euro",'+
		'          "smallest_denomination": 1,'+
		'          "subunit": "Cent",'+
		'          "subunit_to_unit": 100,'+
		'          "symbol": "€",'+
		'          "symbol_first": 0,'+
		'          "thousands_separator": "."'+
		'        },'+
		'        "flag": "🇩🇪",'+
		'        "geohash": "u3041b1jw0trrfc4svjg",'+
		'        "qibla": 132.4,'+
		'        "roadinfo": {'+
		'          "drive_on": "right",'+
		'          "road": "Frauenplan",'+
		'          "speed_in": "km/h"'+
		'        },'+
		'        "sun": {'+
		'          "rise": {'+
		'            "apparent": 1722570240,'+
		'            "astronomical": 1722560520,'+
		'            "civil": 1722567840,'+
		'            "nautical": 1722564720'+
		'          },'+
		'          "set": {'+
		'            "apparent": 1722625020,'+
		'            "astronomical": 1722634620,'+
		'            "civil": 1722627360,'+
		'            "nautical": 1722630480'+
		'          }'+
		'        },'+
		'        "timezone": {'+
		'          "name": "Europe/Berlin",'+
		'          "now_in_dst": 1,'+
		'          "offset_sec": 7200,'+
		'          "offset_string": "+0200",'+
		'          "short_name": "CEST"'+
		'        },'+
		'        "what3words": {'+
		'          "words": "rock.broker.partied"'+
		'        },'+
		'        "wikidata": "Q882721"'+
		'      },'+
		'      "bounds": {'+
		'        "northeast": {'+
		'          "lat": 50.9776496,'+
		'          "lng": 11.328959'+
		'        },'+
		'        "southwest": {'+
		'          "lat": 50.9773708,'+
		'          "lng": 11.3284125'+
		'        }'+
		'      },'+
		'      "components": {'+
		'        "ISO_3166-1_alpha-2": "DE",'+
		'        "ISO_3166-1_alpha-3": "DEU",'+
		'        "ISO_3166-2": ['+
		'          "DE-TH"'+
		'        ],'+
		'        "_category": "outdoors/recreation",'+
		'        "_normalized_city": "Weimar",'+
		'        "_type": "museum",'+
		'        "continent": "Europe",'+
		'        "country": "Germany",'+
		'        "country_code": "de",'+
		'        "house_number": "1",'+
		'        "museum": "Goethe-Nationalmuseum",'+
		'        "political_union": "European Union",'+
		'        "postcode": "99423",'+
		'        "road": "Frauenplan",'+
		'        "state": "Thuringia",'+
		'        "state_code": "TH",'+
		'        "suburb": "Altstadt",'+
		'        "town": "Weimar"'+
		'      },'+
		'      "confidence": 9,'+
		'      "formatted": "Goethe-Nationalmuseum, Frauenplan 1, 99423 Weimar, Germany",'+
		'      "geometry": {'+
		'        "lat": 50.9775106,'+
		'        "lng": 11.3285424'+
		'      }'+
		'    },'+
		'    {'+
		'      "annotations": {'+/*
		'        "DMS": {'+
		'          "lat": "50° 58' 49.44000'' N",'+
		'          "lng": "11° 19' 34.68000'' E"'+
		'        },'+*/
		'        "MGRS": "32UPB6329550221",'+
		'        "Maidenhead": "JO50px95dh",'+
		'        "Mercator": {'+
		'          "x": 1260837.949,'+
		'          "y": 6584609.52'+
		'        },'+
		'        "NUTS": {'+
		'          "NUTS0": {'+
		'            "code": "DE"'+
		'          },'+
		'          "NUTS1": {'+
		'            "code": "DEG"'+
		'          },'+
		'          "NUTS2": {'+
		'            "code": "DEG0"'+
		'          },'+
		'          "NUTS3": {'+
		'            "code": "DEG05"'+
		'          }'+
		'        },'+
		'        "OSM": {'+
		'          "note_url": "https://www.openstreetmap.org/note/new#map=17/50.98040/11.32630&layers=N",'+
		'          "url": "https://www.openstreetmap.org/?mlat=50.98040&mlon=11.32630#map=17/50.98040/11.32630"'+
		'        },'+
		'        "UN_M49": {'+
		'          "regions": {'+
		'            "DE": "276",'+
		'            "EUROPE": "150",'+
		'            "WESTERN_EUROPE": "155",'+
		'            "WORLD": "001"'+
		'          },'+
		'          "statistical_groupings": ['+
		'            "MEDC"'+
		'          ]'+
		'        },'+
		'        "callingcode": 49,'+
		'        "currency": {'+
		'          "alternate_symbols": [],'+
		'          "decimal_mark": ",",'+
		'          "html_entity": "€",'+
		'          "iso_code": "EUR",'+
		'          "iso_numeric": "978",'+
		'          "name": "Euro",'+
		'          "smallest_denomination": 1,'+
		'          "subunit": "Cent",'+
		'          "subunit_to_unit": 100,'+
		'          "symbol": "€",'+
		'          "symbol_first": 0,'+
		'          "thousands_separator": "."'+
		'        },'+
		'        "flag": "🇩🇪",'+
		'        "geohash": "u30418xw3gm7sft30f5c",'+
		'        "qibla": 132.4,'+
		'        "roadinfo": {'+
		'          "drive_on": "right",'+
		'          "speed_in": "km/h"'+
		'        },'+
		'        "sun": {'+
		'          "rise": {'+
		'            "apparent": 1722570240,'+
		'            "astronomical": 1722560460,'+
		'            "civil": 1722567840,'+
		'            "nautical": 1722564720'+
		'          },'+
		'          "set": {'+
		'            "apparent": 1722625020,'+
		'            "astronomical": 1722634620,'+
		'            "civil": 1722627420,'+
		'            "nautical": 1722630480'+
		'          }'+
		'        },'+
		'        "timezone": {'+
		'          "name": "Europe/Berlin",'+
		'          "now_in_dst": 1,'+
		'          "offset_sec": 7200,'+
		'          "offset_string": "+0200",'+
		'          "short_name": "CEST"'+
		'        },'+
		'        "what3words": {'+
		'          "words": "divisions.crass.slicing"'+
		'        }'+
		'      },'+
		'      "components": {'+
		'        "ISO_3166-1_alpha-2": "DE",'+
		'        "ISO_3166-1_alpha-3": "DEU",'+
		'        "_category": "postcode",'+
		'        "_type": "postcode",'+
		'        "continent": "Europe",'+
		'        "country": "Germany",'+
		'        "country_code": "de",'+
		'        "political_union": "European Union",'+
		'        "postcode": "99423"'+
		'      },'+
		'      "confidence": 7,'+
		'      "formatted": "99423, Germany",'+
		'      "geometry": {'+
		'        "lat": 50.9804,'+
		'        "lng": 11.3263'+
		'      }'+
		'    }'+
		'  ],'+
		'  "status": {'+
		'    "code": 200,'+
		'    "message": "OK"'+
		'  },'+
		'  "total_results": 2'+
		'}';
		OpenCageForwardGeocodingWrapper obj = OpenCageForwardGeocodingWrapper.parse(json);
		System.assert(obj != null);
	}

}