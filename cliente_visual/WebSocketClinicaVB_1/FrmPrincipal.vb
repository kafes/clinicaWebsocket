Imports System.Net.WebSockets
Imports System.Reflection
Imports Newtonsoft.Json

Public Class FrmPrincipal

    Public webSocket As New Socket
    Private pestania As Integer
    Private nextPestania As Integer
    Private listaEx As New List(Of Examen)
    Private examenRes As New IngresoDetalleExamen

    Private Sub FrmPrincipal_Load(sender As Object, e As EventArgs) Handles MyBase.Load
        lblLoading.Visible = False

        pestania = 0
        nextPestania = -1
        tabs.Controls.Remove(tabAdd)
        tabs.Controls.Remove(tabEdit)

        dtpFechaOrdenAdd.MinDate = Now
        dtpFechaOrdenAdd.MaxDate = Now

        inicializar()
    End Sub

    Public Sub inicializar()
        webSocket = New Socket
        Try
            If webSocket.conectar() Then
                cargarExamenes()
                recibir()
            End If
        Catch ex As Exception
            MessageBox.Show("Error en la conexión al servidor...", "Error", MessageBoxButtons.YesNoCancel, MessageBoxIcon.Warning)
        End Try
    End Sub

    Private Async Sub recibir()
        Await webSocket.recibir()
    End Sub

    Private Sub tblIngresoDetalle_SelectionChanged(sender As Object, e As EventArgs) Handles tblIngresoDetalle.SelectionChanged
        If checkConnection() Then
            If pestania = 0 And nextPestania = -1 Then
                cargarIDE()
            End If
        End If
    End Sub

    Public Sub cambiarPestania(ByVal opcion As Integer)
        If (opcion <> pestania) Then
            tabs.Controls.RemoveAt(0)
            tabs.Focus()

            pestania = opcion
            If opcion = 0 Then
                tabs.Controls.Add(tabPrincipal)
                nextPestania = -1
            ElseIf opcion = 1 Then
                tabs.Controls.Add(tabAdd)
            ElseIf opcion = 2 Then
                tabs.Controls.Add(tabEdit)
            End If
        End If
    End Sub

    Private Sub tabs_KeyDown(sender As Object, e As KeyEventArgs) Handles tabs.KeyDown
        If Not tabPrincipal.Focused Then
            If e.KeyCode = 27 Then
                cambiarPestania(0)
            End If
        End If
    End Sub

    Private Sub btnAddExamen_Click(sender As Object, e As EventArgs) Handles btnAddExamen.Click, tblIngresoDetalle.CellDoubleClick
        If checkConnection() Then
            If tblIngresoDetalle.SelectedRows.Count > 0 Then
                SeleccionBindingSource.Clear()
                ExamenBindingSource.Clear()
                txtExamen.Clear()
                For Each examen As Examen In listaEx
                    ExamenBindingSource.Add(examen)
                Next
                nextPestania = 1
                cambiarPestania(1)
            Else
                MessageBox.Show("Seleccione detalle ingreso para agregar examen...", "Selecccione", MessageBoxButtons.OKCancel, MessageBoxIcon.Warning)
            End If
        End If
    End Sub

    Private Async Sub btnAgregar_Click(sender As Object, e As EventArgs) Handles btnAgregar.Click
        If checkConnection() Then
            If SeleccionBindingSource.Count > 0 Then
                Dim index As Integer = tblIngresoDetalle.SelectedRows(0).Index
                Dim lista As New List(Of Examen)
                Dim ide As New IngresoDetalleExamen
                ide.ingresoDetalle = IngresoDetalleBindingSource.Item(index)
                ide.fechaOrden = DateTime.Parse(dtpFechaOrdenAdd.Value)

                For Each examen As Examen In SeleccionBindingSource
                    lista.Add(examen)
                Next

                For Each examen As Examen In lista
                    ide.idExamen = examen
                    Dim data As String = JsonConvert.SerializeObject(ide)
                    Dim request As New Request("create_ide", data, "ingreso_detalle_examen_topic")
                    Await webSocket.enviar(request)
                Next

                nextPestania = 0
                cambiarPestania(0)
            Else
                MessageBox.Show("Seleccione examenes agregar...", "Seleccione", MessageBoxButtons.OKCancel, MessageBoxIcon.Question)
            End If
        End If
    End Sub

    Private Sub btnEditExamen_Click(sender As Object, e As EventArgs) Handles btnEditExamen.Click, tblDetalleExamen.CellDoubleClick
        If checkConnection() Then
            If tblDetalleExamen.SelectedRows.Count > 0 Then
                Dim index As Integer = tblDetalleExamen.SelectedRows(0).Index
                Dim ide As IngresoDetalleExamen = IngresoDetalleExamenBindingSource.Item(index)
                txtNombreExamen.Text = ide.idExamen.nombre
                dtpOrden.Value = ide.fechaOrden
                If ide.fechaRealizacion IsNot Nothing Then
                    dtpFecha.SelectionStart = ide.fechaRealizacion
                End If
                If ide.horaRealizacion IsNot Nothing Then
                    dtpHora.Value = ide.horaRealizacion
                End If
                'added
                examenRes = ide
                nextPestania = 2
                cambiarPestania(2)
            Else
                MessageBox.Show("Seleccione detalle examen a editar...", "Seleccione", MessageBoxButtons.OKCancel, MessageBoxIcon.Question)
            End If
        End If
    End Sub

    Private Async Sub btnGuardarCambios_Click(sender As Object, e As EventArgs) Handles btnGuardarCambios.Click
        If checkConnection() Then
            Dim index As Integer = tblDetalleExamen.SelectedRows(0).Index
            'Dim ide As IngresoDetalleExamen = IngresoDetalleExamenBindingSource.Item(index)
            Dim ide As IngresoDetalleExamen = examenRes
            ide.fechaRealizacion = DateTime.Parse(dtpFecha.SelectionRange.Start)
            ide.horaRealizacion = DateTime.Parse(dtpHora.Value)

            Dim data As String = JsonConvert.SerializeObject(ide)
            Dim request As New Request("edit_ide", data, "ingreso_detalle_examen_topic")
            Await webSocket.enviar(request)

            nextPestania = 0
            cambiarPestania(0)
        End If
    End Sub

    Private Async Sub btnRemoveExamen_Click(sender As Object, e As EventArgs) Handles btnRemoveExamen.Click
        If checkConnection() Then
            If tblDetalleExamen.SelectedRows.Count > 0 Then
                If MessageBox.Show("¿Desea eliminar permanentemente este registro?", "Eliminar", MessageBoxButtons.YesNoCancel, MessageBoxIcon.Warning) = vbYes Then
                    Dim index As Integer = tblDetalleExamen.SelectedRows(0).Index
                    Dim idIDE As IngresoDetalleExamen = IngresoDetalleExamenBindingSource.Item(index)
                    Dim request As New Request("remove_ide", idIDE.idIngresoDetalleExamen, "ingreso_detalle_examen_topic")
                    Await webSocket.enviar(request)
                End If
            Else
                MessageBox.Show("Seleccione detalle examen a eliminar...", "Seleccione", MessageBoxButtons.OKCancel, MessageBoxIcon.Warning)
            End If
        End If
    End Sub

    Private Sub btnsCancelar_Click(sender As Object, e As EventArgs) Handles btnCancelar.Click, btnCancelar2.Click
        nextPestania = 0
        cambiarPestania(0)
    End Sub

    Private Sub tbls_CellFormatting(sender As Object, e As DataGridViewCellFormattingEventArgs) Handles tblIngresoDetalle.CellFormatting, tblDetalleExamen.CellFormatting
        Dim grid As DataGridView = New DataGridView()
        grid = sender
        Dim row As DataGridViewRow = New DataGridViewRow()
        row = grid.Rows(e.RowIndex)
        Dim col As DataGridViewColumn = New DataGridViewColumn()
        col = grid.Columns(e.ColumnIndex)
        If (row.DataBoundItem IsNot Nothing And col.DataPropertyName.Contains(".")) Then
            Dim props() As String = col.DataPropertyName.Split(".")
            Dim propInfo As PropertyInfo = row.DataBoundItem.GetType().GetProperty(props(0))
            Dim Val As Object = propInfo.GetValue(row.DataBoundItem, Nothing)
            For i As Int16 = 1 To props.Length - 1
                propInfo = Val.GetType().GetProperty(props(i))
                Val = propInfo.GetValue(Val, Nothing)
                e.Value = Val
            Next
        End If
    End Sub

    'Friend 'Friend
    Friend Sub cargarID(ByVal list As List(Of IngresoDetalle))
        If checkConnection() Then
            IngresoDetalleBindingSource.Clear()
            IngresoDetalleExamenBindingSource.Clear()

            For Each id As IngresoDetalle In list
                IngresoDetalleBindingSource.Add(id)
            Next
        End If
    End Sub

    Friend Sub cargarIDE(ByVal list As List(Of IngresoDetalleExamen))
        If checkConnection() Then
            IngresoDetalleExamenBindingSource.Clear()

            For Each ide As IngresoDetalleExamen In list
                IngresoDetalleExamenBindingSource.Add(ide)
            Next
        End If
    End Sub

    Friend Async Sub cargarIDE()
        If checkConnection() Then
            If tblIngresoDetalle.SelectedRows.Count > 0 Then

                Dim index As Integer = tblIngresoDetalle.SelectedRows(0).Index
                Dim id As IngresoDetalle = IngresoDetalleBindingSource.Item(index)
                Dim IDPK As IngresoDetallePK = id.ingresoDetallePK
                Dim jsonIDPK As String = JsonConvert.SerializeObject(IDPK)

                txtPaciente.Text = id.ingreso.idPaciente.apellidos & ", " & id.ingreso.idPaciente.nombres
                txtIdPaciente.Text = id.ingreso.idPaciente.idPaciente

                Dim request As New Request("get_ide_list", jsonIDPK, "ingreso_detalle_examen_topic")
                Await webSocket.enviar(request)
            Else
                tblDetalleExamen.Rows.Clear()
            End If
        End If
    End Sub

    Friend Sub cargarExamenes(ByVal list As List(Of Examen))
        If checkConnection() Then
            ExamenBindingSource.Clear()

            For Each e As Examen In list
                ExamenBindingSource.Add(e)
                listaEx.Add(e)
            Next
        End If
    End Sub
    'End Friend 'End Friend

    Private Sub txtExamen_TextChanged(sender As Object, e As EventArgs) Handles txtExamen.TextChanged
        ExamenBindingSource.Clear()
        If Not String.IsNullOrEmpty(txtExamen.Text) Then
            ExamenBindingSource.Clear()
            Dim text As Object = txtExamen.Text.ToLower

            For Each examen As Examen In listaEx
                If examen.nombre.ToLower.Contains(text) Then
                    ExamenBindingSource.Add(examen)
                End If
            Next
        End If
    End Sub

    Private Async Sub spnIdIngreso_ValueChanged(sender As Object, e As EventArgs) Handles spnIdIngreso.ValueChanged
        If checkConnection() Then
            If spnIdIngreso.Value > 0 Then
                Dim idIngreso As Object = spnIdIngreso.Text
                Dim request As New Request("get_id_list", idIngreso.ToString, "ingreso_detalle_topic")
                Await webSocket.enviar(request)
            Else
                tblIngresoDetalle.Rows.Clear()
                tblDetalleExamen.Rows.Clear()
            End If
        End If
    End Sub

    Private Sub btnAdd_Click(sender As Object, e As EventArgs) Handles btnAdd.Click, tblExamen.CellDoubleClick
        If checkConnection() Then
            If tblExamen.SelectedRows.Count > 0 Then
                Dim index As Integer = tblExamen.SelectedRows(0).Index
                Dim examen As Examen = ExamenBindingSource.Item(index)
                If Not SeleccionBindingSource.Contains(examen) Then
                    SeleccionBindingSource.Add(examen)
                End If
            End If
        End If
    End Sub

    Private Sub btnRemove_Click(sender As Object, e As EventArgs) Handles btnRemove.Click, tblSeleccion.CellDoubleClick
        If checkConnection() Then
            If tblSeleccion.SelectedRows.Count > 0 Then
                Dim index As Integer = tblSeleccion.SelectedRows(0).Index
                Dim examen As Examen = SeleccionBindingSource.Item(index)
                SeleccionBindingSource.Remove(examen)
            End If
        End If
    End Sub

    Public Async Sub cargarExamenes()
        If checkConnection() Then
            Try
                Dim request As New Request("get_ex_list", " ", "examen_topic")
                Await webSocket.enviar(request)
            Catch ex As Exception
                MessageBox.Show("Error al obtener examenes: " & ex.Message)
            End Try
        End If
    End Sub

    Public Function checkConnection() As Boolean
        If webSocket.webSocket.State = WebSocketState.Open Then
            Return True
        Else
            Dim mensaje As String = "Error en la conexión al servidor..." & vbNewLine & vbNewLine & "¿Desea intentar establecer conexión con el servidor?"
            If MessageBox.Show(mensaje, "Error", MessageBoxButtons.YesNoCancel, MessageBoxIcon.Warning) = vbYes Then
                inicializar()
                'If webSocket.webSocket.State = WebSocketState.Open Then
                '    Return True
                'End If
            End If
            Return False
        End If
    End Function

    Private Sub FrmPrincipal_FormClosing(sender As Object, e As FormClosingEventArgs) Handles MyBase.FormClosing
        If pestania > 0 Then
            cambiarPestania(0)
            e.Cancel = True
        Else
            webSocket.cerrar()
        End If
    End Sub

    Private Sub tblIngresoDetalle_DataBindingComplete(sender As Object, e As DataGridViewBindingCompleteEventArgs) Handles tblIngresoDetalle.DataBindingComplete
        If tblIngresoDetalle.SelectedRows.Count > 0 Then
            Dim index As Integer = tblIngresoDetalle.SelectedRows(0).Index
            Dim id As IngresoDetalle = IngresoDetalleBindingSource.Item(index)
            txtPaciente.Text = id.ingreso.idPaciente.apellidos & ", " & id.ingreso.idPaciente.nombres
            txtIdPaciente.Text = id.ingreso.idPaciente.idPaciente
        Else
            txtPaciente.Text = ""
            txtIdPaciente.Text = ""
        End If
    End Sub

End Class
