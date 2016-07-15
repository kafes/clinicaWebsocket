Public Class Request
    Property request As String
    Property data As String
    Property topic As String

    Public Sub New()
    End Sub

    Public Sub New(ByVal _request As String, ByVal _data As String, ByVal _topic As String)
        request = _request
        data = _data
        topic = _topic
    End Sub
End Class
