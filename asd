var program = "life";
var eur = 26.7;
var usd = 25.1;

angular.module('tadApp.service.calculation', [])

    .service('$calculation', function ($file, $http, localStorageService, $q) {

        this.open = function () {
            //ga('send', 'pageview', 'family');
           // ga('send', 'event', 'category', 'action', 'bububub', 2);
            //var res = this.func();
            /*
            , function() {
                this.adaptCosts(localStorageService.get("costs"), id);
                this.adaptGoals(localStorageService.get("goals"), id);
            });
*/
            /*var id = this.adaptLinks(localStorageService.get("family"))
                .then(function(id) {
                    this.adaptCosts(localStorageService.get("costs"), id);
                    this.adaptGoals(localStorageService.get("goals"), id);
                });*/
            /*var id = this.adaptLinks(localStorageService.get("family"), this, function(id, thisObj) {
                    thisObj.adaptCosts(localStorageService.get("costs"), id);
                    thisObj.adaptGoals(localStorageService.get("goals"), id);
                });*/
            //this.adapter();
            this.sendPresentationData(327, "content presentation. Very long JSON...");
        };

        this.adapter = function(_family, _costs, _goals) {
            this.adaptLinks(_family, this, function(id, thisObj) {
                thisObj.adaptCosts(_costs, id);
                thisObj.adaptGoals(_goals, id);
            });
        }

        this.func = function () {

            // set inner parameters (in futures comes like arguments in this method)
            var id = "0,14",
                term = "10",
                age = 30,
                period = "3",
                gender = "m",
                program = "protection",
                type = "1",
                summ = 120000,
                sz = false,
                ageS = 50,
                faresArray = [
                    "survival",
                    "death_2",
                    // "hosp_2",
                    // "surgary_2"
                    /*"accident",
                    "road_accident",
                    "wop"*/
                ];
            // set inner summ (in futures comes like arguments in this method)
            var summs = {
                survival:120000,
                survival_2:120000,
                death:120000,
                accident:120000,
                road_accident:120000,
                wop:0,
                // ci:120000,
                disability:60000,
                inv_1:10000,
                inv_1_2:10000,
                inv_1_3:10000,
                surgary_1:30000,
                hosp_1:60000,
                ambulance_1:2000,
                rehabilitation_1:60000,
                injuries:60000,
                surgary_2:30000,
                hosp_2:60000,
                ambulance_2:2000,
                rehabilitation_2:60000,
            };
            /*console.log("10000 - " + this.checkSumm("ci", 10000, summs, "uah"));
            console.log("100000 - " + this.checkSumm("ci", 100000, summs, "uah"));
            console.log("1000000 - " + this.checkSumm("ci", 1000000, summs, "uah"));
            console.log("10000000 - " + this.checkSumm("ci", 10000000, summs, "uah"));
            */
            console.log(this.checkCompatibility(faresArray, "hosp_2"));

            console.log(this.getDefaultSumm("ci", summs, "uah"));


            var eur = 28,
                usd = 22;
            if (!summs.survival_2) summs.survival_2 = summs.survival;
            var array = [];
            var path = "programs/" + program + "/summ/" + age + gender + "/" + age + gender;
            var data = [];
            console.time("b");
            // calculate summ
            /*
            $file.get(path)
                .then(function(array) { // calculate summ
                    array.forEach (function(item, i) {
                        if (item.i == id && item.term == term && item.period == period) {
                            data = item;
                        }
                    });
                    var result = {
                        GVS : [],
                        GRSS : [],
                        SSB : []
                    };
                    {
                        var newArr = [];
                        newArr[term] = summ;
                        for (var i = term-1; i >= 1; i--) {
                            newArr[i] = Math.round((parseInt(data["GVS" + i]) * newArr[i+1])/
                                parseInt(data["GVS" + (i + 1)]));
                        }
                        result["GVS"] = newArr;
                    }
                    {
                        var newArr = [];
                        newArr[term] = summ;
                        for (var i = term-1; i >= 1; i--) {
                            newArr[i] = Math.round((parseInt(data["GRSS" + i]) * newArr[i+1])/
                                parseInt(data["GRSS" + (i + 1)]));
                        }
                        result["GRSS"] = newArr;
                    }
                    var lastSSB;
                    {
                        var newArr = [];
                        newArr[0] = summ;
                        for (var i = 1; i <= term; i++) {
                            if (i <= 1) {
                                data["SSB" + (i - 1)] = 100000;
                            }
                            newArr[i] = Math.round((parseInt(data["SSB" + i]) * newArr[i-1])/
                                    parseInt(data["SSB"+(i - 1)]));
                        }
                        lastSSB = newArr[term];
                        result["SSB"] = newArr;
                    }
                    {
                        var newArr = [];
                        newArr[term] = lastSSB;
                        for (var i = term-1; i >- 1; i--) {
                            newArr[i] = Math.round((parseInt(data["VSB" + i]) * newArr[i+1])/
                                parseInt(data["VSB" + (i + 1)]));
                        }
                        result["VSB"] = newArr;
                    }
                    console.timeEnd("b");
                });
            */
            path = "programs/" + program + "/tariff/" + age + gender + "/" + age + gender;
            var fares = {
                survival:0,
                rehabilitation_2:0,
                inv_1_2:0,
                death:0,
                accident:0,
                road_accident:0,
                wop:0,
                ci:0,
                inv_1:0,
                disability:0,
                surgary_1:0,
                hosp_1:0,
                ambulance_1:0,
                rehabilitation_1:0,
                injuries:0,
                surgary_2:0,
                hosp_2:0,
                ambulance_2:0,
                inv_1_3:0,
                survival_2:0
            }
            //calculate fares
            return $file.get(path)
                .then(function(array) {  // calculate fares
                    var koef;
                    array.forEach (function(item, i) {
                        if (item.term == term && item.period == period) {
                            data.push(item);
                        }
                    });
                    data.forEach(function(item){
                        //fares[item.fares.name] = Math.round(summ * item.value);
                        if (period == "3") koef = 2;
                        if (period == "1") koef = 1;
                        if (period == "2") koef = 1;
                        if (period == "4") koef = 4;
                        fares[item.fares.name] = Math.round(summ * item.value / koef, 2);
                    });
                    //console.log(data);
                    var myFares = [];
                    /*if (type == "2") { // перевіряємо обмеження по вибору ризиків
                        if (faresArray.indexOf("ci") >= 0 ||
                            faresArray.indexOf("inv_1") >= 0 ||
                            faresArray.indexOf("inv_1_2") >= 0) {
                            console.log("error");
                        return;
                        }
                    }
                    faresArray.forEach(function(item) {
                        myFares[item] = fares[item];
                    });*/
                    /*if (type == "2") { // перевіряємо обмеження по вибору ризиків
                        if (faresArray['ci'] ||
                            faresArray["inv_1"] ||
                            faresArray["inv_1_2"]) {
                            console.log("error");
                        return;
                        }
                    }*/

                    faresArray.forEach(function(item) {
                        myFares[item] = fares[item];
                    });
                    // якщо страхова особа не дорівнює ззастрахованому,
                    // то змінюється тариф по wop (в програмі ТАС Максимум)
                    if (program == "maximum" && sz == false) {
                        if (ageS <= 40) {
                            myFares["wop"] = 0.035522;
                        }
                        if (ageS >= 41 && age <= 45) {
                            myFares["wop"] = 0.035522;
                        }
                        if (ageS >= 46 && age <= 50) {
                            myFares["wop"] = 0.035522;
                        }
                        if (ageS >= 51 && age <= 55) {
                            myFares["wop"] = 0.035522;
                        }
                        if (ageS >= 56 && age <= 60) {
                            myFares["wop"] = 0.035522;
                        }
                        myFares["wop"] = Math.round(summ * myFares["wop"] / koef, 2);
                    }
                    if (program == "life") {
                        var loading = 0.3;
                        if (sz == false) {
                            var sisz  =
                                [
                                    [0.026666, 0.026666, 0.026666, 0.026666, 0.026666, 0.026666, 0.026666, 0.026666, 0.026666, 0.026666, 0.026666, 0.026666, 0.026666, 0.026666, 0.026666, 0.026666, 0.026666, 0.026666, 0.026666, 0.026666, 0.026666, 0.026666, 0.026666, 0.026666, 0.027421, 0.029112, 0.030817, 0.033006, 0.037609, 0.040039, 0.042695, 0.044601, 0.04758, 0.055256, 0.058214, 0.062202, 0.065031, 0.068976, 0.08456, 0.08845, 0.092791, 0.097792, 0.1029, ],
                                    [0.026666, 0.026666, 0.026666, 0.026666, 0.026666, 0.026666, 0.026666, 0.026666, 0.026666, 0.026666, 0.026666, 0.026666, 0.026666, 0.026666, 0.026666, 0.026666, 0.026666, 0.026666, 0.026666, 0.026666, 0.026666, 0.027998, 0.02977, 0.031368, 0.033555, 0.035694, 0.038002, 0.043345, 0.045926, 0.048949, 0.052122, 0.054819, 0.063812, 0.066985, 0.070808, 0.075698, 0.079382, 0.096322, 0.101096, 0.106067, 0.111692, 0.117938, 0.127206, ],
                                    [0.026666, 0.026666, 0.026666, 0.026666, 0.026666, 0.026666, 0.026666, 0.026666, 0.026666, 0.026666, 0.026666, 0.026666, 0.026666, 0.026666, 0.026666, 0.026666, 0.026666, 0.026666, 0.026666, 0.029055, 0.031105, 0.033106, 0.035299, 0.037306, 0.039938, 0.042651, 0.048102, 0.051406, 0.054563, 0.058113, 0.062057, 0.070737, 0.075215, 0.079221, 0.08391, 0.089689, 0.106315, 0.112412, 0.118266, 0.124465, 0.131321, 0.144078, 0.152242, ],
                                    [0.026666, 0.026666, 0.026666, 0.026666, 0.026666, 0.026666, 0.026666, 0.026666, 0.026666, 0.026666, 0.026666, 0.026666, 0.026666, 0.026666, 0.026666, 0.026666, 0.028165, 0.029767, 0.031536, 0.033661, 0.036051, 0.038458, 0.041052, 0.043484, 0.046667, 0.052519, 0.055902, 0.059777, 0.063456, 0.067746, 0.077678, 0.081798, 0.087097, 0.091942, 0.097489, 0.116227, 0.121942, 0.129102, 0.136163, 0.143546, 0.157921, 0.168081, 0.177098, ],
                                    [0.026666, 0.026666, 0.026666, 0.026666, 0.026666, 0.026666, 0.026666, 0.026666, 0.026666, 0.026666, 0.026666, 0.026666, 0.026666, 0.026666, 0.028327, 0.030136, 0.031989, 0.033889, 0.035987, 0.038445, 0.041231, 0.044026, 0.047034, 0.049989, 0.056305, 0.060068, 0.064002, 0.068401, 0.072788, 0.083052, 0.088413, 0.093312, 0.09944, 0.10512, 0.123585, 0.131408, 0.138137, 0.14647, 0.154702, 0.168368, 0.180876, 0.191872, 0.201988, ],
                                    [0.026666, 0.026666, 0.026666, 0.026666, 0.026666, 0.026666, 0.026666, 0.026666, 0.026666, 0.026666, 0.026666, 0.026666, 0.028188, 0.029871, 0.031782, 0.033837, 0.035977, 0.038193, 0.040613, 0.043452, 0.046618, 0.049815, 0.053326, 0.059396, 0.063605, 0.067907, 0.072351, 0.077436, 0.08778, 0.093449, 0.099575, 0.105265, 0.112216, 0.130787, 0.138281, 0.147124, 0.154964, 0.164438, 0.177273, 0.190267, 0.203607, 0.215635, 0.227298, ],
                                    [0.026666, 0.026666, 0.026666, 0.026666, 0.026666, 0.026666, 0.026666, 0.026666, 0.026666, 0.026666, 0.027790, 0.029456, 0.031264, 0.033210, 0.035361, 0.037694, 0.040139, 0.042666, 0.045451, 0.048658, 0.052218, 0.055896, 0.062512, 0.06645, 0.071184, 0.075989, 0.081088, 0.092119, 0.09784, 0.104249, 0.111154, 0.11763, 0.137454, 0.145015, 0.153481, 0.163428, 0.17235, 0.184222, 0.198138, 0.211942, 0.226269, 0.239744, , ],
                                    [0.026666, 0.026666, 0.026666, 0.026666, 0.026666, 0.026666, 0.026666, 0.026666, 0.026666, 0.028834, 0.030553, 0.032432, 0.034492, 0.036671, 0.039091, 0.041719, 0.044465, 0.047341, 0.050482, 0.05407, 0.058093, 0.064864, 0.069329, 0.073771, 0.078999, 0.084437, 0.09546, 0.101849, 0.108282, 0.115443, 0.123122, 0.142428, 0.151214, 0.159718, 0.16923, 0.180253, 0.190258, 0.20408, 0.218782, 0.233522, 0.249214, , , ],
                                    [0.026666, 0.026666, 0.026666, 0.026666, 0.026666, 0.026666, 0.026666, 0.028113, 0.029758, 0.031508, 0.033431, 0.035554, 0.037839, 0.040278, 0.042982, 0.045901, 0.048984, 0.052202, 0.055711, 0.059745, 0.066849, 0.071448, 0.076402, 0.081322, 0.087161, 0.098507, 0.104858, 0.11194, 0.119098, 0.127007, 0.147499, 0.155718, 0.165422, 0.174933, 0.185463, 0.194805, 0.209148, 0.223725, 0.239314, 0.255337, , , , ],
                                    [0.026666, 0.026666, 0.026666, 0.026666, 0.026666, 0.027426, 0.028850, 0.030519, 0.032346, 0.034293, 0.036449, 0.038790, 0.041326, 0.044038, 0.047023, 0.050268, 0.053682, 0.057254, 0.061189, 0.068291, 0.073206, 0.078278, 0.083698, 0.089201, 0.100932, 0.107585, 0.114599, 0.122386, 0.130265, 0.150956, 0.160334, 0.169425, 0.180106, 0.190599, 0.197408, 0.21277, 0.227833, 0.243246, 0.260043, , , , , ],
                                    [0.026666, 0.026666, 0.026666, 0.026666, 0.028202, 0.029606, 0.031179, 0.033024, 0.035039, 0.037210, 0.039578, 0.042160, 0.044960, 0.047943, 0.051242, 0.054806, 0.058562, 0.062544, 0.069533, 0.074428, 0.0798, 0.085322, 0.091303, 0.102678, 0.109694, 0.116989, 0.124677, 0.133163, 0.153794, 0.163334, 0.173563, 0.183578, 0.19521, 0.200174, 0.214484, 0.230537, 0.246387, 0.262931, , , , , , ],
                                    [0.026666, 0.026666, 0.027438, 0.028842, 0.030313, 0.031862, 0.033602, 0.035630, 0.037860, 0.040235, 0.042835, 0.045671, 0.048734, 0.052018, 0.055626, 0.059521, 0.063669, 0.07069, 0.075454, 0.08079, 0.086601, 0.092661, 0.104496, 0.111129, 0.118765, 0.126711, 0.135068, 0.156282, 0.165725, 0.176081, 0.187206, 0.19812, 0.201329, 0.216408, 0.23137, 0.248169, 0.265078, , , , , , , ],
                                    [0.026666, 0.027569, 0.029350, 0.030887, 0.032497, 0.034208, 0.036124, 0.038358, 0.040785, 0.043383, 0.046229, 0.049318, 0.052670, 0.056253, 0.060179, 0.064451, 0.071626, 0.076404, 0.081592, 0.087352, 0.093681, 0.105575, 0.112647, 0.119873, 0.128137, 0.13673, 0.157781, 0.167778, 0.178002, 0.189214, 0.201212, 0.202372, 0.216759, 0.232459, 0.248118, 0.265914, , , , , , , , ],
                                    [0.027605, 0.029421, 0.031331, 0.033002, 0.034768, 0.036648, 0.038762, 0.041186, 0.043829, 0.046662, 0.049752, 0.053120, 0.056759, 0.060649, 0.064937, 0.072224, 0.077139, 0.082326, 0.087922, 0.094179, 0.106325, 0.113433, 0.121076, 0.128903, 0.137791, 0.159054, 0.168848, 0.179599, 0.190639, 0.202684, 0.20305, 0.217042, 0.232014, 0.248371, 0.26496, , , , , , , , , ],
                                    [0.029396, 0.031337, 0.033379, 0.035201, 0.037129, 0.039199, 0.041496, 0.044128, 0.046998, 0.050066, 0.053424, 0.057069, 0.061004, 0.065241, 0.072532, 0.077544, 0.082851, 0.088431, 0.094503, 0.106561, 0.1139, 0.121554, 0.129777, 0.1382, 0.159731, 0.169709, 0.180219, 0.191757, 0.20359, 0.202345, 0.217001, 0.231543, 0.24713, 0.264358, , , , , , , , , , ],
                                    [0.031250, 0.033319, 0.035507, 0.037486, 0.039597, 0.041844, 0.044341, 0.047191, 0.050287, 0.053614, 0.057238, 0.061167, 0.065436, 0.072663, 0.077663, 0.083053, 0.08874, 0.094777, 0.10663, 0.11386, 0.121725, 0.129934, 0.13873, 0.159767, 0.169985, 0.18065, 0.191906, 0.204205, 0.201195, 0.215612, 0.230789, 0.245905, 0.262306, , , , , , , , , , , ]
                                ];
                            myFares["wop"] = sisz[term-5][ageS-18];
                            myFares["wop"] = Math.round((myFares["survival"] + myFares["death"] + myFares["accident"] + myFares["road_accident"] ) * (myFares["wop"]/(1-loading)), 2);
                        }
                        else {
                            var sisz  =
                                [
                                    [0.013334, 0.013334, 0.013334, 0.013334, 0.013334, 0.013334, 0.013334, 0.013334, 0.013334, 0.013334, 0.013334, 0.013334, 0.013334, 0.013334, 0.013334, 0.013334, 0.013334, 0.013334, 0.013334, 0.013334, 0.013334, 0.013334, 0.013334, 0.013334, 0.013334, 0.013334, 0.013334, 0.013334, 0.013334, 0.013334, 0.013334, 0.013334, 0.013334, 0.016, 0.016, 0.016, 0.016, 0.016, 0.025334, 0.025334, 0.025334, 0.025334, 0.025334 ],
                                    [0.013334, 0.013334, 0.013334, 0.013334, 0.013334, 0.013334, 0.013334, 0.013334, 0.013334, 0.013334, 0.013334, 0.013334, 0.013334, 0.013334, 0.013334, 0.013334, 0.013334, 0.013334, 0.013334, 0.013334, 0.013334, 0.013334, 0.013334, 0.013334, 0.013334, 0.013334, 0.013334, 0.013334, 0.013334, 0.013334, 0.013334, 0.013334, 0.016, 0.016, 0.016, 0.016, 0.016, 0.025334, 0.025334, 0.025334, 0.025334, 0.025334, 0.04 ],
                                    [0.013334, 0.013334, 0.013334, 0.013334, 0.013334, 0.013334, 0.013334, 0.013334, 0.013334, 0.013334, 0.013334, 0.013334, 0.013334, 0.013334, 0.013334, 0.013334, 0.013334, 0.013334, 0.013334, 0.013334, 0.013334, 0.013334, 0.013334, 0.013334, 0.013334, 0.013334, 0.013334, 0.013334, 0.013334, 0.013334, 0.013334, 0.016, 0.016, 0.016, 0.016, 0.016, 0.025334, 0.025334, 0.025334, 0.025334, 0.025334, 0.04, 0.04 ],
                                    [0.013334, 0.013334, 0.013334, 0.013334, 0.013334, 0.013334, 0.013334, 0.013334, 0.013334, 0.013334, 0.013334, 0.013334, 0.013334, 0.013334, 0.013334, 0.013334, 0.013334, 0.013334, 0.013334, 0.013334, 0.013334, 0.013334, 0.013334, 0.013334, 0.013334, 0.013334, 0.013334, 0.013334, 0.013334, 0.013334, 0.016, 0.016, 0.016, 0.016, 0.016, 0.025334, 0.025334, 0.025334, 0.025334, 0.025334, 0.04, 0.04, 0.04 ],
                                    [0.013334, 0.013334, 0.013334, 0.013334, 0.013334, 0.013334, 0.013334, 0.013334, 0.013334, 0.013334, 0.013334, 0.013334, 0.013334, 0.013334, 0.013334, 0.013334, 0.013334, 0.013334, 0.013334, 0.013334, 0.013334, 0.013334, 0.013334, 0.013334, 0.013334, 0.013334, 0.013334, 0.013334, 0.013334, 0.016, 0.016, 0.016, 0.016, 0.016, 0.025334, 0.025334, 0.025334, 0.025334, 0.025334, 0.04, 0.04, 0.04, 0.04 ],
                                    [0.013334, 0.013334, 0.013334, 0.013334, 0.013334, 0.013334, 0.013334, 0.013334, 0.013334, 0.013334, 0.013334, 0.013334, 0.013334, 0.013334, 0.013334, 0.013334, 0.013334, 0.013334, 0.013334, 0.013334, 0.013334, 0.013334, 0.013334, 0.013334, 0.013334, 0.013334, 0.013334, 0.013334, 0.016, 0.016, 0.016, 0.016, 0.016, 0.025334, 0.025334, 0.025334, 0.025334, 0.025334, 0.04, 0.04, 0.04, 0.04, 0.04 ],
                                    [0.013334, 0.013334, 0.013334, 0.013334, 0.013334, 0.013334, 0.013334, 0.013334, 0.013334, 0.013334, 0.013334, 0.013334, 0.013334, 0.013334, 0.013334, 0.013334, 0.013334, 0.013334, 0.013334, 0.013334, 0.013334, 0.013334, 0.013334, 0.013334, 0.013334, 0.013334, 0.013334, 0.016, 0.016, 0.016, 0.016, 0.016, 0.025334, 0.025334, 0.025334, 0.025334, 0.025334, 0.04, 0.04, 0.04, 0.04, 0.04,  ],
                                    [0.013334, 0.013334, 0.013334, 0.013334, 0.013334, 0.013334, 0.013334, 0.013334, 0.013334, 0.013334, 0.013334, 0.013334, 0.013334, 0.013334, 0.013334, 0.013334, 0.013334, 0.013334, 0.013334, 0.013334, 0.013334, 0.013334, 0.013334, 0.013334, 0.013334, 0.013334, 0.016, 0.016, 0.016, 0.016, 0.016, 0.025334, 0.025334, 0.025334, 0.025334, 0.025334, 0.04, 0.04, 0.04, 0.04, 0.04, ,  ],
                                    [0.013334, 0.013334, 0.013334, 0.013334, 0.013334, 0.013334, 0.013334, 0.013334, 0.013334, 0.013334, 0.013334, 0.013334, 0.013334, 0.013334, 0.013334, 0.013334, 0.013334, 0.013334, 0.013334, 0.013334, 0.013334, 0.013334, 0.013334, 0.013334, 0.013334, 0.016, 0.016, 0.016, 0.016, 0.016, 0.025334, 0.025334, 0.025334, 0.025334, 0.025334, 0.04, 0.04, 0.04, 0.04, 0.04, , ,  ],
                                    [0.013334, 0.013334, 0.013334, 0.013334, 0.013334, 0.013334, 0.013334, 0.013334, 0.013334, 0.013334, 0.013334, 0.013334, 0.013334, 0.013334, 0.013334, 0.013334, 0.013334, 0.013334, 0.013334, 0.013334, 0.013334, 0.013334, 0.013334, 0.013334, 0.016, 0.016, 0.016, 0.016, 0.016, 0.025334, 0.025334, 0.025334, 0.025334, 0.025334, 0.04, 0.04, 0.04, 0.04, 0.04, , , ,  ],
                                    [0.013334, 0.013334, 0.013334, 0.013334, 0.013334, 0.013334, 0.013334, 0.013334, 0.013334, 0.013334, 0.013334, 0.013334, 0.013334, 0.013334, 0.013334, 0.013334, 0.013334, 0.013334, 0.013334, 0.013334, 0.013334, 0.013334, 0.013334, 0.016, 0.016, 0.016, 0.016, 0.016, 0.025334, 0.025334, 0.025334, 0.025334, 0.025334, 0.04, 0.04, 0.04, 0.04, 0.04, , , , ,  ],
                                    [0.013334, 0.013334, 0.013334, 0.013334, 0.013334, 0.013334, 0.013334, 0.013334, 0.013334, 0.013334, 0.013334, 0.013334, 0.013334, 0.013334, 0.013334, 0.013334, 0.013334, 0.013334, 0.013334, 0.013334, 0.013334, 0.013334, 0.016, 0.016, 0.016, 0.016, 0.016, 0.025334, 0.025334, 0.025334, 0.025334, 0.025334, 0.04, 0.04, 0.04, 0.04, 0.04, , , , , ,  ],
                                    [0.013334, 0.013334, 0.013334, 0.013334, 0.013334, 0.013334, 0.013334, 0.013334, 0.013334, 0.013334, 0.013334, 0.013334, 0.013334, 0.013334, 0.013334, 0.013334, 0.013334, 0.013334, 0.013334, 0.013334, 0.013334, 0.016, 0.016, 0.016, 0.016, 0.016, 0.025334, 0.025334, 0.025334, 0.025334, 0.025334, 0.04, 0.04, 0.04, 0.04, 0.04, , , , , , ,  ],
                                    [0.013334, 0.013334, 0.013334, 0.013334, 0.013334, 0.013334, 0.013334, 0.013334, 0.013334, 0.013334, 0.013334, 0.013334, 0.013334, 0.013334, 0.013334, 0.013334, 0.013334, 0.013334, 0.013334, 0.013334, 0.016, 0.016, 0.016, 0.016, 0.016, 0.025334, 0.025334, 0.025334, 0.025334, 0.025334, 0.04, 0.04, 0.04, 0.04, 0.04, , , , , , , ,  ],
                                    [0.013334, 0.013334, 0.013334, 0.013334, 0.013334, 0.013334, 0.013334, 0.013334, 0.013334, 0.013334, 0.013334, 0.013334, 0.013334, 0.013334, 0.013334, 0.013334, 0.013334, 0.013334, 0.013334, 0.016, 0.016, 0.016, 0.016, 0.016, 0.025334, 0.025334, 0.025334, 0.025334, 0.025334, 0.04, 0.04, 0.04, 0.04, 0.04, , , , , , , , ,  ],
                                    [0.013334, 0.013334, 0.013334, 0.013334, 0.013334, 0.013334, 0.013334, 0.013334, 0.013334, 0.013334, 0.013334, 0.013334, 0.013334, 0.013334, 0.013334, 0.013334, 0.013334, 0.013334, 0.016, 0.016, 0.016, 0.016, 0.016, 0.025334, 0.025334, 0.025334, 0.025334, 0.025334, 0.04, 0.04, 0.04, 0.04, 0.04, , , , , , , , , ,  ],
                               ];
                            myFares["wop"] = sisz[term-5][age-18];
                            myFares["wop"] = Math.round((myFares["survival"] + myFares["death"] + myFares["accident"] + myFares["road_accident"] ) * (myFares["wop"]/(1-loading)), 2);
                        }
                    }
                    //console.log(fares);
                    console.log(myFares);
                    return myFares;
                });
        };

        var Person = function() {
            this.name = "";
            this.gender = "";
            this.birthdate = "";
            this.firstName = "";
            this.lastName = "";
            this.middleName = "";
            this.contactsInfo = [];
            this.marketingInfo = [];
            /*this.personContactInfo = function() {
                this.type = "";
                this.value = ""
            },
            this.personMarketingInfo = function() {
                this.type = "";
                this.value = ""
            }*/
        };
        var IPerson;
        var linkType = {};
        var contactType = {};
        var marketingType = {};
        var linkLists = [];
        // function for adapt famely tree befor sending to the server..
        this.adaptLinks = function (data, thisObj, callBack) {
            //var deferred = $q.defer();
            var personList = [];



            $file.get('db/linkTypes')
               .then(function (links) {
                    for (var k = 0; k < links.length; k++) {
                        if (links[k].nameLinkType == "Я") {
                            myId = links[k].idLinkType;
                        }
                        else {
                            linkType[links[k].nameLinkType] = links[k];
                        }
                    }
                    $file.get('db/contactInfoType')
                       .then(function (contactInfo) {
                            for (var k = 0; k < contactInfo.length; k++) {
                                contactType[contactInfo[k].code] = contactInfo[k];
                            }
                            $file.get('db/marketingInfoType')
                               .then(function (marketingInfo) {
                                    for (var k = 0; k < marketingInfo.length; k++) {
                                        marketingType[marketingInfo[k].code] = marketingInfo[k];
                                    }
                                    adaptLinksObject(data);
                            });
                    });
            });
            function adaptLinksObject(data) {
                var myPerson = new Person;
                //$file.get('localStorage')
                //       .then(function (data) {
                            for (var i = 0; i < data.length; i++) {
                                for (var j = 0; j < data[i].chose.length; j++) {
                                    var obj = data[i].chose[j].info;
                                    if (obj != undefined) {
                                        var keys = Object.keys(obj);
                                        var p = new Person;
                                        p.name = obj.name;
                                        p.gender = obj.icon == "m" ? "1" : "2";
                                        keys.forEach(function(item) {
                                            if (contactType[item] != undefined) {
                                                p.contactsInfo.push({
                                                    type:contactType[item],
                                                    value:obj[item]
                                                });
                                            }
                                            if (marketingType[item] != undefined) {
                                                p.marketingInfo.push({
                                                    type:marketingType[item],
                                                    value:obj[item]
                                                })
                                            }
                                        });
                                        personList.push(p);
                                        if (data[i].chose[j].name != "Я") {
                                            linkLists.push({
                                                person:p,
                                                parentPerson:myPerson,
                                                linkType:linkType[data[i].chose[j].name]
                                            });
                                        }
                                        else {
                                            myPerson = p;
                                        }
                                    }
                                }
                            }
                            var obj = {list : linkLists, person : myPerson};
                            return $http.post("http://tadapi.taslife.com.ua/saver/family", obj).success(function(data) {
                                console.log(data);
                                callBack(data, thisObj);
                                //deferred.resolve(success);
                                return data;
                            });
                //    });
            }
            //return deferred.promise;
        };

        this.adaptCosts = function(data, idPerson) {
            var personCosts = [];
            var costTypes = {};
            var personCost = function() {
                this.idPerson = "",
                this.cost = {},
                this.value = "",
                this.valuePercent = ""
            };
            var dataForSending = {
                "costs" : [],
                "idPerson" : {}
            }
            $file.get('db/costTypes')
                .then(function (costsTypeList) {
                    costsTypeList.forEach(function(item, i) {
                        costTypes[item.name] = item;
                    });
                    adaptCostsObject(data);
                });
            function adaptCostsObject(data) {
                //$file.get('localStorage')
                //    .then(function(data) {
                        data.expensesRequired.forEach(function(item, i) {
                            var cost = new personCost;
                            cost.idPerson = idPerson;
                            cost.cost = costTypes[item.type];
                            cost.value = item.price;
                            cost.valuePercent = item.percent;
                            personCosts.push(cost);
                        });
                        data.expensesNotRequired.forEach(function(item, i) {
                            var cost = new personCost;
                            cost.idPerson = idPerson;
                            cost.cost = costTypes[item.type];
                            cost.value = item.price;
                            cost.valuePercent = item.percent;
                            personCosts.push(cost);
                        });
                        console.log(personCosts);
                        dataForSending.costs = personCosts;
                        dataForSending.idPerson = idPerson;
                        $http.post("http://tadapi.taslife.com.ua/saver/costs", dataForSending).success(function(data) {
                            console.log(data);
                        });
                //    });
            }
        }

        this.adaptGoals = function(data, idPerson) {
            //var personGoals = [];
            //var goalTypes = {};
            //
            //var personGoal = function() {
            //    this.idPerson = 0,
            //    this.goalType = null,
            //    this.importance = "23",
            //    this.age = "32",
            //    this.price = 111111,
            //    this.dateSuccess = 12
            //};
            //var dataForSending = {
            //    "goals" : [personGoal],
            //    "idPerson" : 0
            //}
            //
            //
            //
            //
            //$http.post("http://localhost:53214/saver/goals", dataForSending).success(function(data) {
            //        console.log(data);
            //    });
            //
            //
            //    return;

            var personGoal = function() {
                this.idPerson = 0,
                this.goalType = {},
                this.importance = "",
                this.age = "",
                this.price = 0,
                this.dateSuccess = 0
            };
            var dataForSending = {
                "goals" : [],
                "idPerson" : 0
            }
            $file.get('db/goalTypes')
                .then(function (goalsTypeList) {
                    goalsTypeList.forEach(function(item, i) {
                        goalTypes[item.nameType] = item;
                    });
                    adaptGoalsObject(data);
                });
            function adaptGoalsObject(data) {
                //$file.get('localStorage')
                //    .then(function(data) {
                        data.choseGoals.forEach(function(item, i) {
                            var goal = new personGoal;
                            goal.goalType = goalTypes[item.name];
                            goal.importance = Math.round(item.opt.importance);
                            goal.age = Math.round(item.opt.age);
                            goal.price = parseInt(item.price);
                            goal.dateSuccess = parseInt(item.dateSuccess);
                            personGoals.push(goal);
                        });
                        data.choseCosts.forEach(function(item, i) {
                            var goal = new personGoal;
                            goal.goalType = goalTypes[item.name];
                            goal.importance = Math.round(item.opt.importance);
                            goal.age = Math.round(item.opt.age);
                            goal.price = parseInt(item.price);
                            goal.dateSuccess = parseInt(item.dateSuccess);
                            personGoals.push(goal);
                        });
                        dataForSending.goals = personGoals;
                        dataForSending.idPerson = idPerson;
                        console.log(personGoals);
                        $http.post("http://tadapi.taslife.com.ua/saver/goals", dataForSending).success(function(data) {
                                console.log(data);
                            });
                 //   });

                /*$file.get('localStorage')
                    .then(function(data) {
                        data.expensesRequired.forEach(function(item, i) {
                            var cost = new personCost;
                            cost.idPerson = 239;
                            cost.cost = costTypes[item.type];
                            cost.value = item.price;
                            cost.valuePercent = item.percent;
                            personCosts.push(cost);
                        });
                        data.expensesNotRequired.forEach(function(item, i) {
                            var cost = new personCost;
                            cost.idPerson = 239;
                            cost.cost = costTypes[item.type];
                            cost.value = item.price;
                            cost.valuePercent = item.percent;
                            personCosts.push(cost);
                        });
                        console.log(personCosts);
                        $http.post("http://localhost:53214/saver/costs", personCosts).success(function(data) {
                                console.log(data);
                            });
                    });*/
            }
        }

        this.checkCompatibility = function(risksList, risk) {
            console.log("Checking compatibility..");
            fares = {};
            risksList.forEach(function(item) {
                fares[item] = true;
            });
            var errorList = [];
            var path = "programs/" + program + "/compatibility";
            return $file.get(path)
                .then(function(compatibility) {
                    if (risk in compatibility) {
                        if (eval(compatibility[risk].required) != true || eval(compatibility[risk].incompatibility) == true) {
                            console.log("Compatibility not ok");
                            return false;
                        }
                        else {
                            console.log("Compatibility ok");
                            return true;
                        }
                    }
                    else {
                        console.log("Undefined risk");
                        return false;
                    }
                }
            );
        }

        this.checkSumm = function(risk, s, summ, currency) {
            var path = "programs/" + program + "/limits";
            return $file.get(path)
                .then(function(limits) {
                    if (risk in limits) {
                        var obj = limits[risk];
                        var min = eval(obj.min),
                            max = eval(obj.max),
                            def = eval(obj.def);
                        var index = 0;
                        switch (currency) {
                            case "uah":
                                index = 0;
                                break;
                            case "usd":
                                index = 1;
                                break;
                            case "eur":
                                index = 2;
                                break;
                        }
                        if (max[index] < s) {
                            console.log("Limits bigger");
                            return -3;
                        }
                        if (min[index] > s) {
                            console.log("Limits smaller");
                            return -4;
                        }
                        console.log("Limits ok");
                        return true;
                    }
                    else {
                        console.log("undefined risk");
                    }
                }
            );
        }

        this.getDefaultSumm = function(risk, summ, currency) {
            var path = "programs/" + program + "/limits";
            return $file.get(path)
                .then(function(limits) {
                    if (risk in limits) {
                        var obj = limits[risk];
                        var min = eval(obj.min),
                            max = eval(obj.max),
                            def = eval(obj.def);
                        var index = 0;
                        switch (currency) {
                            case "uah":
                                index = 0;
                                break;
                            case "usd":
                                index = 1;
                                break;
                            case "eur":
                                index = 2;
                                break;
                        }
                        console.log(def)
                        if (def < max[index]) {
                            console.log("Limits ok");
                            return def;
                        }
                        else {
                            console.log("Limits not ok.");
                            return max[index];
                        }
                        return true;
                    }
                    else {
                        console.log("undefined risk");
                    }
                }
            );
        }

        this.sendPresentationData = function(idUser, presentationData) {
            var result = {
                "idUser" : idUser,
                "content" : presentationData
            }
            $http.post("http://tadapi.taslife.com.ua/users/savePresentation", result).success(
                function(data) {
                    console.log(data);
            });
        }

    });