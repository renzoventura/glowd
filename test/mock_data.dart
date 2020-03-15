

import 'package:lyghts/models/group/group.dart';

Group mockGroup = Group.fromJson(mockGroupJson1);
dynamic mockGroupJson1 = {
  "name": "My room",
  "lights": ["232323", "1"],
  "sensors": [],
  "type": "Room",
  "state": {"all_on": false, "any_on": false},
  "recycle": false,
  "class": "Office",
  "action": {
    "on": false,
    "bri": 254,
    "hue": 7613,
    "sat": 203,
    "effect": "none",
    "xy": [0.5051, 0.4151],
    "ct": 454,
    "alert": "none",
    "colormode": "ct"
  }
};
dynamic mockEmptyListOfGroups = {};

dynamic mockListOfGroups5 = {
  "1": {
    "name": "My room",
    "lights": ["3", "1"],
    "sensors": [],
    "type": "Room",
    "state": {"all_on": true, "any_on": true},
    "recycle": false,
    "class": "Office",
    "action": {
      "on": true,
      "bri": 254,
      "hue": 7613,
      "sat": 203,
      "effect": "none",
      "xy": [0.5051, 0.4151],
      "ct": 454,
      "alert": "none",
      "colormode": "ct"
    }
  },
  "2": {
    "name": "Entertainment area 1",
    "lights": ["1", "3"],
    "sensors": [],
    "type": "Entertainment",
    "state": {"all_on": true, "any_on": true},
    "recycle": false,
    "class": "TV",
    "stream": {
      "proxymode": "auto",
      "proxynode": "/lights/1",
      "active": false,
      "owner": null
    },
    "locations": {
      "1": [-0.03, 1, 0],
      "3": [-0.98, -0.99, 0]
    },
    "action": {
      "on": true,
      "bri": 254,
      "hue": 7613,
      "sat": 203,
      "effect": "none",
      "xy": [0.5051, 0.4151],
      "ct": 454,
      "alert": "none",
      "colormode": "ct"
    }
  },
  "3": {
    "name": "Ralphs room",
    "lights": ["11", "6", "7"],
    "sensors": [],
    "type": "Room",
    "state": {"all_on": true, "any_on": true},
    "recycle": false,
    "class": "Living room",
    "action": {"on": true, "bri": 127, "alert": "select"}
  },
  "4": {
    "name": "Living room",
    "lights": ["5", "8", "9", "10"],
    "sensors": [],
    "type": "Room",
    "state": {"all_on": true, "any_on": true},
    "recycle": false,
    "class": "Living room",
    "action": {
      "on": true,
      "bri": 254,
      "hue": 8418,
      "sat": 140,
      "effect": "none",
      "xy": [0.4573, 0.41],
      "ct": 366,
      "alert": "select",
      "colormode": "hs"
    }
  },
  "5": {
    "name": "Parents room",
    "lights": ["12", "13"],
    "sensors": [],
    "type": "Room",
    "state": {"all_on": true, "any_on": true},
    "recycle": false,
    "class": "Living room",
    "action": {"on": true, "bri": 254, "alert": "select"}
  }
};


dynamic mockListOfGroups1 = {
  "1": {
    "name": "My room",
    "lights": ["3", "1"],
    "sensors": [],
    "type": "Room",
    "state": {"all_on": true, "any_on": true},
    "recycle": false,
    "class": "Office",
    "action": {
      "on": true,
      "bri": 254,
      "hue": 7613,
      "sat": 203,
      "effect": "none",
      "xy": [0.5051, 0.4151],
      "ct": 454,
      "alert": "none",
      "colormode": "ct"
    }
  }
};

dynamic mockListOfGroups2 = {
  "1": {
    "name": "My room",
    "lights": ["3", "1"],
    "sensors": [],
    "type": "Room",
    "state": {"all_on": true, "any_on": true},
    "recycle": false,
    "class": "Office",
    "action": {
      "on": true,
      "bri": 254,
      "hue": 7613,
      "sat": 203,
      "effect": "none",
      "xy": [0.5051, 0.4151],
      "ct": 454,
      "alert": "none",
      "colormode": "ct"
    }
  },
  "3": {
    "name": "Ralphs room",
    "lights": ["11", "6", "7"],
    "sensors": [],
    "type": "Room",
    "state": {"all_on": true, "any_on": true},
    "recycle": false,
    "class": "Living room",
    "action": {"on": true, "bri": 127, "alert": "select"}
  },
};