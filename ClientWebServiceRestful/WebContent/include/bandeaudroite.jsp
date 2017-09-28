<%@page import="java.util.Date,java.text.*"%>
<div id="bandeauDroite">
	<div id="contenuBandeauDroite">
		<img src="images/date.png" alt="Nouveautes de Lyon" /><br />
		<div id="texteDate">
			<br /> Nous sommes le
			<%=DateFormat.getDateTimeInstance(DateFormat.FULL, DateFormat.FULL).format(new Date())%>
			<br />
			<br />
			<br />
			<br />
			<br />
			<br />
			<br />
			<br />
			<br />
			<br />
			<p>
				<a href="http://validator.w3.org/#validate_by_input"><img
					src="http://www.w3.org/Icons/valid-xhtml10"
					alt="Valid XHTML 1.0 Strict" height="31" width="88" /></a>
			</p>
		</div>
	</div>
</div>