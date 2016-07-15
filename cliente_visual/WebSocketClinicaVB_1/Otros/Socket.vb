Imports System.Net.WebSockets
Imports System.Text
Imports System.Threading
Imports Newtonsoft.Json

Public Class Socket

    Friend webSocket As New ClientWebSocket
    Private respuesta As New Respuesta

    'Private url As String = "ws://localhost:8080/webSocketHome_v1/clinica"
    Private url As String = "ws://192.168.1.18:8080/webSocketHome_v1/clinica"

    Public Function conectar() As Boolean
        Dim bool As Boolean = False
        Try
            FrmPrincipal.lblLoading.Visible = True
            'Await webSocket.ConnectAsync(New Uri(url), CancellationToken.None)
            webSocket.ConnectAsync(New Uri(url), CancellationToken.None).Wait()
            bool = True
            FrmPrincipal.lblLoading.Visible = False
            MessageBox.Show("Se ha establecido conexión con el servidor...", "Conectado", MessageBoxButtons.OKCancel, MessageBoxIcon.Information)
        Catch ex As Exception
            FrmPrincipal.lblLoading.Visible = False
            MessageBox.Show("No se pudo conectar con el servidor...", "No se pudo conectar", MessageBoxButtons.OKCancel, MessageBoxIcon.Warning)
        End Try

        Return bool
    End Function

    Public Async Function recibir() As Task
        While webSocket.State = WebSocketState.Open
            Try
                Dim b(100000000) As Byte
                Dim data As ArraySegment(Of Byte) = New ArraySegment(Of Byte)(b)

                Dim r As WebSocketReceiveResult = Await webSocket.ReceiveAsync(data, CancellationToken.None)
                Dim s As String = Encoding.UTF8.GetString(b).ToString

                respuesta.evaluar(s)
            Catch ex As Exception
                MessageBox.Show("Se ha perdido la conexión con el servidor...", "No hay conexión", MessageBoxButtons.OKCancel, MessageBoxIcon.Warning)
            End Try
        End While
    End Function

    Public Async Function enviar(ByVal request As Request) As Task
        Try
            Dim s As String = JsonConvert.SerializeObject(request)
            'MessageBox.Show("Enviando..." & vbNewLine & s)

            Dim b As Byte() = Encoding.UTF8.GetBytes(s)
            Dim data As ArraySegment(Of Byte) = New ArraySegment(Of Byte)(b)

            Await webSocket.SendAsync(data, WebSocketMessageType.Text, True, CancellationToken.None)
            FrmPrincipal.lblLoading.Visible = True

        Catch ex As Exception
            MessageBox.Show("Error on enviar: " & ex.StackTrace)
        End Try

    End Function

    Public Async Sub cerrar()
        If webSocket.State = WebSocketState.Open Then
            Await webSocket.CloseAsync(WebSocketCloseStatus.Empty, "", CancellationToken.None)
        End If
    End Sub

End Class
