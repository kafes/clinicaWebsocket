Public Class IngresoDetallePK
    Property idIngreso As String
    Property idAsignacionPersonalCentroArea As String
    Property idAreaCentroEspacio As String
    Property idTurno As String

    Public Sub New(_idIngreso As String, _idAPCA As String, _idAsignacion As String, _idTurno As String)
        idIngreso = _idIngreso
        idAsignacionPersonalCentroArea = _idAPCA
        idAreaCentroEspacio = _idAsignacion
        idTurno = _idTurno
    End Sub

End Class
