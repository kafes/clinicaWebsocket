Imports Newtonsoft.Json

Public Class Respuesta

    Public Sub evaluar(ByVal res As String)
        Dim data As String = ""

        Try
            'MessageBox.Show("Respuesta: Respuesta: " & res)
            Dim response As Response = JsonConvert.DeserializeObject(Of Response)(res)

            If res IsNot Nothing Then
                data = response.data
                data = data.Replace("\""", """")

                If response.status Then
                    Select Case response.request
                        Case "get_id_list"
                            cargarIngresosDetalles(data)
                        Case "create_ide"
                            MessageBox.Show("Se ha agregado un nuevo ingreso detalle examen...", "Registro Creado", MessageBoxButtons.OKCancel, MessageBoxIcon.Information)
                            FrmPrincipal.cargarIDE()
                        Case "edit_ide"
                            MessageBox.Show("Se ha editado un ingreso detalle examen...", "Registro Editado", MessageBoxButtons.OKCancel, MessageBoxIcon.Information)
                            FrmPrincipal.cargarIDE()
                        Case "remove_ide"
                            MessageBox.Show("Se ha eliminado un ingreso detalle examen...", "Registro Eliminado", MessageBoxButtons.OKCancel, MessageBoxIcon.Information)
                            FrmPrincipal.cargarIDE()
                        Case "get_ide_list"
                            cargarDetallesExamen(data)
                        Case "get_ex_list"
                            cargarExamenes(data)
                    End Select
                    FrmPrincipal.lblLoading.Visible = False
                Else
                    Select Case response.request
                        Case "create_ide"
                            MessageBox.Show("Error al crear el ingreso detalle examen...", "Error", MessageBoxButtons.OKCancel, MessageBoxIcon.Error)
                        Case "edit_ide"
                            MessageBox.Show("Error al crear el ingreso detalle examen...", "Error", MessageBoxButtons.OKCancel, MessageBoxIcon.Error)
                        Case "remove_ide"
                            MessageBox.Show("Error al eliminar el ingreso detalle examen...", "Error", MessageBoxButtons.OKCancel, MessageBoxIcon.Error)
                        Case Else
                            MessageBox.Show("Error al obtener datos...", "Error", MessageBoxButtons.OKCancel, MessageBoxIcon.Error)
                    End Select
                End If
            End If
        Catch ex As Exception
            MessageBox.Show("Error en el mensaje recibido del servidor...", "Error", MessageBoxButtons.OKCancel, MessageBoxIcon.Error)
        End Try

    End Sub

    Public Sub cargarIngresosDetalles(ByVal json As String)
        Dim list As New List(Of IngresoDetalle)
        list = JsonConvert.DeserializeObject(Of List(Of IngresoDetalle))(json)
        FrmPrincipal.cargarID(list)
    End Sub

    Public Sub cargarDetallesExamen(ByVal json As String)
        Dim list As New List(Of IngresoDetalleExamen)
        list = JsonConvert.DeserializeObject(Of List(Of IngresoDetalleExamen))(json)
        FrmPrincipal.cargarIDE(list)
    End Sub

    Public Sub cargarExamenes(ByVal json As String)
        Dim list As New List(Of Examen)
        list = JsonConvert.DeserializeObject(Of List(Of Examen))(json)
        FrmPrincipal.cargarExamenes(list)
    End Sub

End Class
