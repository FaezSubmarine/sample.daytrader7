<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%@ page
		import="java.util.Collection, 
                java.util.Iterator, 
                java.util.HashMap, 
                java.math.BigDecimal,com.ibm.websphere.samples.daytrader.entities.HoldingDataBean,
                com.ibm.websphere.samples.daytrader.entities.OrderDataBean,com.ibm.websphere.samples.daytrader.util.Log,com.ibm.websphere.samples.daytrader.util.FinancialUtils"
		session="true" isThreadSafe="true" isErrorPage="false"%>
	<jsp:useBean id="orderDataBeans" type="java.util.Collection<?>"
		scope="request" />
	<TABLE width="100%">
		<TBODY>
			<TR>
				<TD bgcolor="#c93333" align="left" width="640" height="10" colspan=6><B><FONT
						color="#ffffff">DayTrader Home</FONT></B></TD>
				<TD align="center" bgcolor="#000000" width="100" height="10"><FONT
					color="#ffffff"><B>DayTrader</B></FONT></TD>
			</TR>
			<TR align="left">
				<TD><B><A href="app?action=home">Home</A></B></TD>
				<TD><B><A href="app?action=account">Account</A></B></TD>
				<TD><B><A href="app?action=mksummary">Market Summary</A></B></TD>
				<TD><B><A href="app?action=portfolio">Portfolio</A></B></TD>
				<TD><B><A
						href="app?action=quotes&amp;symbols=s:0,s:1,s:2,s:3,s:4">Quotes/Trade</A></B></TD>
				<TD><B><A href="app?action=report">Report</A></B></TD>
				<TD><B><A href="app?action=logout">Logoff</A></B></TD>
				<TD></TD>
			</TR>
			<TR>
				<TD align="right" colspan="7">
					<HR> <FONT color="#ff0000" size="-2"><%=new java.util.Date()%></FONT>
				</TD>
			</TR>
			<TR>
				<TD colspan="5" bgcolor="#cccccc"><B>Total Orders: </B><%=orderDataBeans.size()%></TD>
			</TR>
			<TR align="center">
				<TD colspan="6">
					<TABLE border="1" style="font-size: smaller">
						<CAPTION align="bottom">
							<B>Recent Orders</B>
						</CAPTION>
						<TBODY>
							<TR align="center">
								<TD><A href="docs/glossary.html">order ID</A></TD>
								<TD><A href="docs/glossary.html">order Status</A></TD>
								<TD><A href="docs/glossary.html">creation date</A></TD>
								<TD><A href="docs/glossary.html">completion date</A></TD>
								<TD><A href="docs/glossary.html">txn fee</A></TD>
								<TD><A href="docs/glossary.html">type</A></TD>
								<TD><A href="docs/glossary.html">symbol</A></TD>
								<TD><A href="docs/glossary.html">quantity</A></TD>
								<TD><A href="docs/glossary.html">price</A></TD>
								<TD><A href="docs/glossary.html">total</A></TD>
							</TR>
							<%
                                                Iterator<?> it = orderDataBeans.iterator();
                                                int count = 0;
                                                while (it.hasNext()) {
                                                    OrderDataBean orderData = (OrderDataBean) it.next();
                                            %>
							<TR bgcolor="#fafcb6" align="center">
								<TD><%=orderData.getOrderID()%></TD>
								<TD><%=orderData.getOrderStatus()%></TD>
								<TD><%=orderData.getOpenDate()%></TD>
								<TD><%=orderData.getCompletionDate()%></TD>
								<TD><%=orderData.getOrderFee()%></TD>
								<TD><%=orderData.getOrderType()%></TD>
								<TD><%=FinancialUtils.printQuoteLink(orderData.getSymbol())%></TD>
								<TD><%=orderData.getQuantity()%></TD>
								<TD><%=orderData.getPrice()%></TD>
								<TD><%=orderData.getPrice().multiply(new BigDecimal(orderData.getQuantity()))%></TD>
							</TR>
							<%
								}
                                                %>
						</TBODY>

					</TABLE>
				</TD>
			</TR>
			<TR>
				<TD colspan="6"></TD>
			</TR>
			
		</TBODY>
	</TABLE>
	<form action="app" method="get">
		<input type="hidden" name="action" value="report">

		<p>Choose your time period:</p>
		  <input type="radio" id="monthly" name="timing" value="monthly"
			<%if(request.getAttribute("checked_timing")==null || request.getAttribute("checked_timing").toString().equals("false")){ %>
			checked
			<%} %>
			>  <label for="monthly">monthly</label>   <input
			type="radio" id="yearly" name="timing" value="yearly"
			<%if(request.getAttribute("checked_timing")!=null && request.getAttribute("checked_timing").toString().equals("true")){ %>
			checked
			<%} %>
			>   <label
			for="yearly">yearly</label> <INPUT type="submit"
			value="time">
	</form>
	<form action="app" method="post">
	<!-- <form> -->
	<input type="hidden" name="action" value="download_report">
	<input type="hidden" name="current_date" value="<%=request.getAttribute("current_date").toString() %>">
	
	<INPUT type="submit" value="Download Report">
	</form>
</body>
</html>