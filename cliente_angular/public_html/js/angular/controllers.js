angular.module('myApp.controllers', []).
        controller('ideController', function ($scope, websocketService, validateJsonService, $controller, $filter, ngNotify) {
            $scope.accion_ide = 0;
            $scope.accion_id = 0;
            $scope.oneAtATime = false;
            $scope.ingresoDetalleOpen = false;
            $scope.hide_failed = true;
            $scope.hide_success = true;
            $scope.status = {
                isIngresoDetalleOpen: false,
                isIngresoDetalleExamenOpen: false
            };
            websocketService.start("ws://localhost:8080/webSocketHome_v1/clinica", function (evt) {
                var respuesta = evt.data;
                respuesta = validateJsonService.validate(respuesta);
                var obj = JSON.parse(respuesta);
                if (obj.status === "true") {
                    if (obj.request === "create_ide") {
                        $scope.get_ide_list();
                        $scope.add_btn = false;
                        ngNotify.set('Se ha agregado con éxito', 'success');
                    }
                    if (obj.request === "remove_ide") {
                        $scope.get_ide_list();
                        ngNotify.set('Se ha eliminado con éxito', 'error');
                        $scope.$apply();
                    }
                    if (obj.request === "edit_ide") {
                        $scope.get_ide_list();
                        ngNotify.set('Se ha editado con éxito');
                    }
                    if (obj.request === "get_id_list" && obj.data.length) {
                        $scope.add_btn = true;
                        $scope.id_list = obj.data;
                        $scope.open_id();
                    }
                    if (obj.request === "get_ide_list") {
                        $scope.ide_btn = true;
                        $scope.ide_list = obj.data;
                        console.log("Tamanio: "+obj.data.length);
                        if (obj.data.length) {
                            $scope.open_ide();
                        }
                    }
                    if (obj.request === "get_ex_list" && obj.data.length) {
                        $scope.ex_list = obj.data;
                    }
                } else {
                    ngNotify.set('Ha ocurrido un error', 'error');
                    if (obj.request === "edit_ide") {
                        $scope.get_ide_list();
                    }
                }
            });
            $scope.modal_add = function () {
                console.log("ID seleccionado: " + this.selectedID);
                console.log("Exámen seleccionado: " + this.selectedEx);
                this.clean_modal_add();
                this.get_ex_list();
                $('#add_ide').modal('show');
            };
            $scope.set_selected_id = function (selectedID) {
                $scope.add_btn = false;
                $scope.selectedID = selectedID;
                this.clear_ide_list();
                this.get_ide_list();
            };
            $scope.get_ide_list = function () {
                $scope.ide_btn = false;
                var pks = {
                    idAsignacionPersonalCentroArea: $scope.selectedID.ingresoDetallePK.idAsignacionPersonalCentroArea,
                    idAreaCentroEspacio: $scope.selectedID.ingresoDetallePK.idAreaCentroEspacio,
                    idTurno: $scope.selectedID.ingresoDetallePK.idTurno,
                    idIngreso: $scope.selectedID.ingreso.idIngreso
                };
                var request = {
                    topic: "ingreso_detalle_examen_topic",
                    data: JSON.stringify(pks),
                    request: "get_ide_list"
                };
                websocketService.send(request);
            };
            $scope.open_id = (function () {
                $scope.ingresoDetalleOpen = true;
                $scope.accion_id = 1;
                $scope.paciente = $scope.id_list[0].ingreso.idPaciente.nombres + " "
                        + $scope.id_list[0].ingreso.idPaciente.apellidos;
                $scope.idPaciente = $scope.id_list[0].ingreso.idPaciente.idPaciente;
                $scope.$apply();
            });
            $scope.open_ide = (function () {
                $scope.ingresoDetalleExamenOpen = true;
                $scope.accion_ide = 1;
                $scope.$apply();
            });
            $scope.close_id = (function () {
                $scope.ingresoDetalleOpen = false;
                $scope.ingresoDetalleExamenOpen = false;
                $scope.accion_id = 0;
                $scope.$apply();
            });
            $scope.close_ide = (function () {
                $scope.ingresoDetalleExamenOpen = false;
                $scope.accion_ide = 0;
                $scope.$apply();
            });
            $scope.clean_modal_add = function () {
                $scope.selectedEx = null;
                $scope.hide_failed = true;
            };
            $scope.remove_ide = function () {
                console.log("IDE seleccionado: " + this.selectedIDE.idIngresoDetalleExamen);
                var request = {
                    topic: "ingreso_detalle_examen_topic",
                    data: this.selectedIDE.idIngresoDetalleExamen,
                    request: "remove_ide"
                };
                websocketService.send(request);
            };
            $scope.modal_remove = function () {
                $('#remove_ide').modal('show');
            };
            $scope.create_ide = function () {
                var pks = {
                    ingresoDetalle: {
                        ingresoDetallePK: {
                            idAsignacionPersonalCentroArea: $scope.selectedID.ingresoDetallePK.idAsignacionPersonalCentroArea,
                            idAreaCentroEspacio: $scope.selectedID.ingresoDetallePK.idAreaCentroEspacio,
                            idTurno: $scope.selectedID.ingresoDetallePK.idTurno,
                            idIngreso: $scope.selectedID.ingreso.idIngreso
                        }
                    },
                    idExamen: {
                        idExamen: $scope.selectedEx.idExamen
                    },
                    fechaOrden: new Date()
                };
                var request = {
                    topic: "ingreso_detalle_examen_topic",
                    data: JSON.stringify(pks),
                    request: "create_ide"
                };
                websocketService.send(request);
            };
            $scope.edit_ide = function () {
                this.selectedIDE.fechaRealizacion = this.dt;
                console.log("Fecha a enviar: " + this.selectedIDE.fechaRealizacion);
                this.selectedIDE.horaRealizacion = this.time;
                console.log("Hora a enviar: " + this.selectedIDE.horaRealizacion);
                var request = {
                    topic: "ingreso_detalle_examen_topic",
                    data: JSON.stringify(this.selectedIDE),
                    request: "edit_ide"
                };
                websocketService.send(request);
                console.log("IDE editado: " + JSON.stringify(request));
            };
            $scope.clean_modal_edit = function () {
                $scope.hide_failed_edit = true;
                $scope.hide_success_edit = true;
                $scope.dt = null;
            };
            $scope.set_selected_ide = function (selectedIDE) {
                $scope.ide_btn = false;
                $scope.selectedIDE = selectedIDE;
                $scope.dt_fecha_orden = $filter('date')(new Date(this.selectedIDE.fechaOrden), 'yyyy-MM-dd');

                if (!angular.isUndefined(this.selectedIDE.horaRealizacion)) {
                    $scope.time = new Date(this.selectedIDE.horaRealizacion);
                } else {
                    $scope.time = NaN;
                }

                if (!angular.isUndefined(this.selectedIDE.fechaRealizacion)) {
                    $scope.dt = new Date(this.selectedIDE.fechaRealizacion);
                } else {
                    $scope.dt = null;
                }
            };
            $scope.modal_edit = function () {
                this.clean_modal_edit();
                $('#edit_ide').modal('show');
            };

            ngNotify.config({
                theme: 'pure',
                position: 'bottom',
                duration: 2000,
                sticky: false,
                button: true,
                html: false
            });
            $scope.get_id_list = function () {
                this.clear_id_list();
                this.clear_ide_list();
                if ($scope.idIngreso !== null) {
                    var request = {
                        topic: "ingreso_detalle_topic",
                        data: $scope.idIngreso,
                        request: "get_id_list"
                    };
                    websocketService.send(request);
                }
            };
            $scope.get_ex_list = function () {
                var request = {
                    topic: "examen_topic",
                    data: "",
                    request: "get_ex_list"
                };
                websocketService.send(request);
            };
            $scope.clear_id_list = function () {
                $scope.accion_id = 0;
                $scope.accion_ide = 0;
                $scope.ingresoDetalleOpen = false;
                $scope.id_list = [];
                $scope.paciente = "";
                $scope.idPaciente = "";
            };
            $scope.clear_ide_list = function () {
                $scope.accion_ide = 0;
                $scope.ingresoDetalleExamenOpen = false;
                $scope.ide_list = [];
            };
            $scope.validate = function () {
                console.log("Exámen seleccionado: " + this.selectedEx);
                if (typeof this.selectedEx !== 'undefined' && this.selectedEx !== null) {
                    this.create_ide();
                } else {
                    $scope.hide_failed = false;
                }
            };
            //LO DE FECHAS Y HORAS
            $scope.hstep = 1;
            $scope.mstep = 1;
            $scope.date_orden = $filter('date')(new Date(), 'yyyy-MM-dd');
            $scope.ismeridian = true;
            $scope.toggleMode = function () {
                $scope.ismeridian = !$scope.ismeridian;
            };
            $scope.date_realizacion = function () {
                $scope.date_realizacion_popup.opened = true;
            };
            $scope.date_realizacion_popup = {
                opened: false
            };
            $scope.date_options = {
                formatYear: 'yy',
                // maxDate: new Date(2020, 5, 22),
                minDate: new Date(), //Aquí se podría poner como mínimo la fecha de orden
                startingDay: 1
            };
            function disabled(data) {
                var date = data.date,
                        mode = data.mode;
                return mode === 'day' && (date.getDay() === 0 || date.getDay() === 6);
            }
        });