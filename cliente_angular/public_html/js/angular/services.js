angular.module('myApp.services', []).
        factory('websocketService', ["$log", function ($log) {
                var service = {};
                service.start = function (url, callback) {
                    if (service.ws) {
                        return;
                    }
                    var ws = new WebSocket(url);
                    ws.onopen = function () {
                        $log.log("Se ha abierto la conexión con el servidor");
                    };
                    ws.onclose = function () {
                        $log.log("Se ha cerrado la conexión con el servidor");
                        alert("Se ha cerrado la conexión con el servidor");
                    };
                    ws.onerror = function () {
                        $log.log("No se ha podido establecer conexión con el servidor");
                        alert("No se ha podido establecer conexión con el servidor");
                    };
                    ws.onmessage = function (message) {
                        $log.log("Ha recibido mensaje", message);
                        callback(message);
                    };
                    service.ws = ws;
                };
                service.send = function (message) {
                    if (service.ws.readyState !== 3) {
                        service.ws.send(JSON.stringify(message));
                    } else {
                        alert("El servidor no está disponible");
                    }
                };
                service.state = function (message) {
                    console.log(service.ws.readyState);
                    return service.ws.readyState;
                };
                return service;
            }])
        .factory('validateJsonService', function () {
            var msg = {};
            msg.validate = function (message) {
                if (message.indexOf("[") >= 0) {
                    message = message.replace('"[', "[");
                }
                if (message.indexOf('\\') >= 0) {
                    message = message.replace(/\\/g, "");
                }
                if (message.indexOf("]") >= 0) {
                    message = message.replace(']"', "]");
                }
                if (message.indexOf("}") >= 0) {
                    message = message.replace('}"', "}");
                }
                if (message.indexOf("{") >= 0) {
                    message = message.replace('"{', "{");
                }
                return message;
            };
            return msg;
        });
        