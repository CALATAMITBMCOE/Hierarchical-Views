<!DOCTYPE html> 
<%@ page import="com.niku.union.persistence.connection.ConnectionContext" %>
<%@ page import="com.niku.union.interfaces.ICommonConstants" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.*" %>
<%

String param_id = request.getParameter("id");
String param_hv = request.getParameter("hv");

String vNAME="";
String vMAX_DEPTH="";
String vFONT_FAMILY="";
String vFONT_SIZE="";
String vTITLE_FONT_SIZE="";
String vMIN_COLOR="";
String vMID_COLOR="";
String vMAX_COLOR="";
String vNO_COLOR="";
String vHEADER_HEIGHT="";
String vFONT_COLOR="";
String vTITLE_FONT_COLOR="";
String vMAX_POST_DEPTH="";
String vSHOW_SCALE="";
String vWEIGHTED_AVERAGE="";
String vHEADER_COLOR="";
String vHINT_OPACITY="";
String vMAX_HIGH_COLOR="";
String vMIN_HIGH_COLOR="";
String vMID_HIGH_COLOR="";
String vNO_HIGH_COLOR="";
String vHEADER_HIGH_COLOR="";
String vMIN_COLOR_VALUE="";
String vMAX_COLOR_VALUE="";
String vCHART_NODE_SIZE="";
String vWORD_TREE_TYPE="";
String vLABEL_PADDING="";
String vNODE_PADDING="";
String vNODE_WIDTH="";
String vSANKEY_ITERATIONS="";
String vLINK_FILL_COLOR="";
String vLINK_FILL_OPACITY="";
String vLINK_STROKE_COLOR="";
String vLINK_STROKE_WIDTH="";
String vNODE_COLOR="";
String vDRILL="";
String vHIER_TYPE="";
String vLINK_URL="";
String vSQL_TEXT="";
String vSQL_SELECT="";
String vSQL_PART1="";
String vSQL_PART2="";
String vSQL_PART3="";
String vSQL_PART4="";
String vSQL_ORDER="";
String vNull=null;


ArrayList<String> nodeNameList = new ArrayList<String>();
ArrayList<String> nodeIdList = new ArrayList<String>();
ArrayList<String> nodeParentNameList = new ArrayList<String>();
ArrayList<String> nodeParentIdList = new ArrayList<String>();
ArrayList<String> nodeLevelList = new ArrayList<String>();
ArrayList<Double> nodeSizeList = new ArrayList<Double>();  
ArrayList<Double> nodeColorList = new ArrayList<Double>(); 
ArrayList<String> nodeColorNameList = new ArrayList<String>();
ArrayList<String> nodeLinkList = new ArrayList<String>();
ArrayList<String> nodeAddlList = new ArrayList<String>();
  
try
{
	ConnectionContext context = ConnectionContext.getContext( ICommonConstants.NIKU_DATABASE_ID );
	if( context == null )
	{
		throw new ServletException( "Database is not available or not installed correctly." );
	}

	Connection connection = context.getConnection( ConnectionContext.AUTOCOMMIT_MODE );
    try
    {
		PreparedStatement ps1;
		
		StringBuffer buf1 = new StringBuffer("  select NAME, MAX_DEPTH, FONT_FAMILY, FONT_SIZE, TITLE_FONT_SIZE, MIN_COLOR, MID_COLOR, MAX_COLOR, NO_COLOR, HEADER_HEIGHT,   ");
			buf1.append("  FONT_COLOR, TITLE_FONT_COLOR, MAX_POST_DEPTH, SHOW_SCALE, WEIGHTED_AVERAGE, HEADER_COLOR, TO_CHAR(10000*HINT_OPACITY) HINT_OPACITY,   ");
			buf1.append("  MIN_HIGH_COLOR, MID_HIGH_COLOR, MAX_HIGH_COLOR, NO_HIGH_COLOR, HEADER_HIGH_COLOR, MIN_COLOR_VALUE, MAX_COLOR_VALUE, HIEV_CHART_NODE_SIZE,  ");
			buf1.append("  WORD_TREE_TYPE, LABEL_PADDING, NODE_PADDING, NODE_WIDTH, SANKEY_ITERATIONS, LINK_FILL_COLOR, LINK_FILL_OPACITY, LINK_STROKE_COLOR, LINK_STROKE_WIDTH,  ");
			buf1.append("  NODE_COLOR, DRILL_NEW_PAGE, HIERARCHY_TYPE, SQL_SELECT, SQL_PART1, SQL_PART2, SQL_PART3, SQL_PART4, SQL_ORDER from odf_ca_hiev_views ");
			buf1.append("  where code = '");
			buf1.append(param_hv);
			buf1.append("'");
		
		ps1 = connection.prepareStatement( buf1.toString() );
        try
        {
			ResultSet rs1 = ps1.executeQuery();
			try
			{
            
				while( rs1.next() )
				{
					vNAME = rs1.getString ( 1 );
					vMAX_DEPTH = rs1.getString ( 2 );
					vFONT_FAMILY = rs1.getString ( 3 );
					vFONT_SIZE = rs1.getString ( 4 );
					vTITLE_FONT_SIZE = rs1.getString ( 5 );
					vMIN_COLOR = rs1.getString ( 6 );
					vMID_COLOR = rs1.getString ( 7 );
					vMAX_COLOR = rs1.getString ( 8 );
					vNO_COLOR = rs1.getString ( 9 );
					vHEADER_HEIGHT = rs1.getString ( 10 );
					vFONT_COLOR = rs1.getString ( 11 );
					vTITLE_FONT_COLOR = rs1.getString ( 12 );
					vMAX_POST_DEPTH = rs1.getString ( 13 );
					vSHOW_SCALE = rs1.getString ( 14 );
					vWEIGHTED_AVERAGE = rs1.getString ( 15 );
					vHEADER_COLOR = rs1.getString ( 16 );
					vHINT_OPACITY = rs1.getString ( 17 );
					vMIN_HIGH_COLOR = rs1.getString ( 18 ) ;
					vMID_HIGH_COLOR = rs1.getString ( 19 ) ;
					vMAX_HIGH_COLOR = rs1.getString ( 20 ) ;
					vNO_HIGH_COLOR = rs1.getString ( 21 );
					vHEADER_HIGH_COLOR = rs1.getString ( 22 );
					vMIN_COLOR_VALUE = rs1.getString ( 23 );
					vMAX_COLOR_VALUE = rs1.getString ( 24 );
					vCHART_NODE_SIZE = rs1.getString ( 25 );
					vWORD_TREE_TYPE = rs1.getString ( 26 );
					vLABEL_PADDING = rs1.getString ( 27 );
					vNODE_PADDING = rs1.getString ( 28 );
					vNODE_WIDTH = rs1.getString ( 29 );
					vSANKEY_ITERATIONS = rs1.getString ( 30 );
					vLINK_FILL_COLOR = rs1.getString ( 31 );
					vLINK_FILL_OPACITY = rs1.getString ( 32 );
					vLINK_STROKE_COLOR = rs1.getString ( 33 );
					vLINK_STROKE_WIDTH = rs1.getString ( 34 );
					vNODE_COLOR = rs1.getString ( 35 );
					vDRILL = rs1.getString( 36 );
					vHIER_TYPE = rs1.getString( 37 );
					vHIER_TYPE = vHIER_TYPE.substring(0,7);
					vSQL_SELECT = rs1.getString ( 38 );
					vSQL_PART1 = rs1.getString ( 39 );
					vSQL_PART2 = rs1.getString ( 40 );
					vSQL_PART3 = rs1.getString ( 41 );
					vSQL_PART4 = rs1.getString ( 42 );
					vSQL_ORDER = rs1.getString ( 43 );
					 
					if ( vNAME != null && vSQL_PART1 != null)
					{
						vSQL_TEXT = vSQL_SELECT + vSQL_PART1;
						if (vSQL_PART2 != null)
							vSQL_TEXT = vSQL_TEXT + " UNION " + vSQL_PART2;
						if (vSQL_PART3 != null)
							vSQL_TEXT = vSQL_TEXT + " UNION " + vSQL_PART3;
						if (vSQL_PART4 != null)
							vSQL_TEXT = vSQL_TEXT + " UNION " + vSQL_PART4;							
						
						vSQL_TEXT = vSQL_TEXT + "  " + vSQL_ORDER;
						vSQL_TEXT = vSQL_TEXT.replace("%internal_id%", param_id);
						
						PreparedStatement ps2 = connection.prepareStatement( vSQL_TEXT );
						try
						{
							ResultSet rs2 = ps2.executeQuery();
							try
							{
								String vNodeName;
								String vNodeId;
								String vNodeParentName;
								String vNodeParentId;
								String vNodeLevel;
								String vNodeSizeStr;
								String vNodeColorStr;
								String vNodeColorName;
								String vNodeLinkUrl;
								String vNodeAdditionalInfo;
								Double vNodeSize;
								Double vNodeColor;

								while( rs2.next() )
								{
									vNodeName = rs2.getString( 1 );
									vNodeId = rs2.getString( 2 );
									vNodeParentName = rs2.getString( 3 );
									vNodeParentId = rs2.getString( 4 );
									vNodeLevel = rs2.getString( 5 );
									vNodeSizeStr = rs2.getString( 6 );
									vNodeColorStr = rs2.getString( 7 );
									vNodeColorName = rs2.getString( 8 );
									vNodeLinkUrl =  rs2.getString( 9 );
									vNodeAdditionalInfo = rs2.getString( 10 );
									
									if( vNodeName != null )
									{
										if ( vNodeSizeStr != null && vNodeColorStr != null )
										{
											try
											{
												vNodeSize = Double.parseDouble( vNodeSizeStr );
												vNodeColor = Double.parseDouble( vNodeColorStr );
											}
											catch(NumberFormatException nfe)
											{
												throw new ServletException( "Could not parse Size:" + vNodeSizeStr + " or Color:" + vNodeColorStr, nfe );
											}
										}
										else
										{
											vNodeSize = 0.00;
											vNodeColor = 0.00;
										}
										nodeNameList.add(vNodeName);
										nodeIdList.add(vNodeId);
										nodeParentNameList.add(vNodeParentName);
										nodeParentIdList.add(vNodeParentId);
										nodeLevelList.add(vNodeLevel);
										nodeSizeList.add(vNodeSize);
										nodeColorList.add(vNodeColor);
										nodeColorNameList.add(vNodeColorName);
										nodeLinkList.add(vNodeLinkUrl);
										nodeAddlList.add(vNodeAdditionalInfo);
									}
								}
							}
							finally
							{
								rs2.close();
							}
						}
						finally
						{
							ps2.close();
						}
					}
				}
			}
			finally
			{
				rs1.close();
			}
        }
		finally
        {
			ps1.close();
        }
    }
    finally
    {
		connection.close();
    }
}
catch( Exception e )
{
	throw new ServletException( "Could not read from database", e );
}
%>

<html xmlns="http://www.w3.org/1999/xhtml" xmlns:v="urn:schemas-microsoft-com:vml">
	<head>
		<style>
			a.orgLightLink:link {color:#ffffff;text-decoration:none;}
			a.orgLightLink:visited {color:#ffffff;text-decoration:none;}
			a.orgLightLink:hover {color:#ffffff;text-decoration:underline;}
			a.orgDarkLink:link {color:#000000;text-decoration:none;}
			a.orgDarkLink:visited {color:#000000;text-decoration:none;}
			a.orgDarkLink:hover {color:#000000;text-decoration:underline;}
		</style>
		<title>Hierarchical View</title>
		<script type="text/javascript" src='https://www.google.com/jsapi?autoload={"modules":[{"name":"visualization","version":"1.1","packages":["sankey","wordtree","treemap","orgchart"]}]}'></script>
		<script type="text/javascript">		
			var addlArray = [];
			var dataArray = [];
			var sequentialChildArray = [];
			var sequentialParentArray = [];
			var vDrillTarget = "";
			var debugLevel = 0;

			function showTreeMapTooltip(row, size, value)
			{
				var addlInfo = addlArray[row+1][9];
				var itemLink = addlArray[row+1][8]

			  return '<div style="background:#ccffff; padding:10px; border-style:solid">' +
						'<span style="font-family:Calibri">' + addlInfo +
						'<br>' + '<b><a target="' + vDrillTarget + '" href="' + itemLink + '">' + dataArray[row+1][0] + '</a></b><br></span></div>';
			}

			function addSequentialId(childId, parentId)
			{
				var idFound = false;
				for (x=0; x<sequentialChildArray.length; x++) {
					if ((sequentialChildArray[x] == childId) 
						&& (sequentialParentArray[x] == parentId)) {
						if (debugLevel > 2) window.alert("Node " + childId + " for parent " + parentId + " found at position " + x + ". Not ADDED");
						idFound = true;
					}
				}
				if (idFound == false) {
					if (debugLevel > 2) window.alert("Node " + childId + " for parent " + parentId + " not found. Adding at position " + x);
					sequentialChildArray.push([childId]);
					sequentialParentArray.push([parentId]);
				}
			}

			function findId(childId, parentId)
            		{
				for (x = 0; x<sequentialChildArray.length; x++)
		                {
					if (((sequentialChildArray[x] == childId) && (sequentialParentArray[x] == parentId)) ||
					    ((sequentialChildArray[x] == childId) && (parentId == -1)))
                    			{
						return x;
                    			}
                		}
                		return -1;
			}

			function drawChart() 
			{

				if (debugLevel > 1) window.alert("IN: drawChart");
				
				var vMaxDepth = <%= vMAX_DEPTH %>;
				var vFontSize = <%= vFONT_SIZE %>;
				var vTitleFontSize = <%= vTITLE_FONT_SIZE %>;
				var vMinColor = "<%= vMIN_COLOR %>";
				var vMidColor = "<%= vMID_COLOR %>";
				var vMaxColor = "<%= vMAX_COLOR %>";
				var vNoColor = "<%= vNO_COLOR %>";
				var vHeaderHeight = <%= vHEADER_HEIGHT %>;
				var vFontColor = "<%= vFONT_COLOR %>";
				var vTitleFontColor = "<%= vTITLE_FONT_COLOR %>";
				var vMaxPostDepth = <%= vMAX_POST_DEPTH %>;
				var vShowScale = <%= vSHOW_SCALE %>;
				if ( vShowScale == 0 )
					var vShowScaleBoolean = false;
				else
					var vShowScaleBoolean = true;
				var vWeightedAverage = <%= vWEIGHTED_AVERAGE %>;
				if ( vWeightedAverage == 0 )
					var vWeightedAverageBoolean = false;
				else
					var vWeightedAverageBoolean = true;
				var vHeaderColor = "<%= vHEADER_COLOR %>";
				var vHintOpacity = <%= vHINT_OPACITY %>;
				vHintOpacity = vHintOpacity / 10000;
				var vMinHighColor = "<%= vMIN_HIGH_COLOR %>";
				var vMidHighColor = "<%= vMID_HIGH_COLOR %>";
				var vMaxHighColor = "<%= vMAX_HIGH_COLOR %>";
				var vNoHighColor = "<%= vNO_HIGH_COLOR %>";
				var vHeaderHighColor = "<%= vHEADER_HIGH_COLOR %>";
				var vMinColorValue = <%= vMIN_COLOR_VALUE %>;
				var vMaxColorValue = <%= vMAX_COLOR_VALUE  %>;
				var vTitle = "<%= vNAME %>";
				var vFontFamily = "'<%= vFONT_FAMILY %>'";
				var vHierType = "<%= vHIER_TYPE %>";
				var vDrillPage = <%= vDRILL %>;
				if ( vDrillPage == 1 )
					vDrillTarget = "_blank";
				else
					vDrillTarget = "_parent";
				var vChartNodeSize = "<%= vCHART_NODE_SIZE %>";
				var vWordTreeType = "<%= vWORD_TREE_TYPE %>";
				var vLabelPadding = "<%= vLABEL_PADDING %>";
				var vNodePadding = "<%= vNODE_PADDING %>";
				var vNodeWidth = "<%= vNODE_WIDTH %>";
				var vSankeyIterations = "<%= vSANKEY_ITERATIONS %>";
				var vLinkFillColor = "<%= vLINK_FILL_COLOR %>";
				var vLinkFillOpacity = "<%= vLINK_FILL_OPACITY %>";
				var vLinkStrokeColor = "<%= vLINK_STROKE_COLOR %>";
				var vLinkStrokeWidth = "<%= vLINK_STROKE_WIDTH %>";
				var vNodeColor = "<%= vNODE_COLOR %>";
				
				addlArray.push(['NodeId', 'NodeName', 'NodeParentId', 'NodeParent', 'NodeLevel', 'NodeSize', 'NodeColor', 'NodeColorName', 'NodeLink', 'NodeInfo']);

				switch (vHierType) 
				{
					case "TreeMap":
						dataArray.push(['NodeName', 'NodeParent', 'NodeSize', 'NodeColor']);
						break;
					case "WordTre":
						dataArray.push(['NodeId', 'NodeName', 'NodeParentId', 'NodeSize', 'NodeColor']);
						break;
					case "OrgChar":
						dataArray.push(['NodeName', 'NodeParent', 'NodeInfo']);
						break;
					case "SankeyD":
						dataArray.push(['NodeParent', 'NodeName', 'NodeColor']);
						break;
				}
				
				var itemName="";
				var itemNameLong="";
				var itemIntl="";
				var itemLink="";
				var colorName="";
				var linkClass="";
				var linkInfo="";
				var addlInfo="";
				var itemColor=0;
				var itemSize=0.000000;
				
				<%	
					String parentId;
					String parentName;
					
					for (int ii=0; ii<nodeNameList.size(); ii++)
					{	
						if ( ii <= 0 ) {
							parentName = null;
						}
						else {
							parentName = "'";
							parentName += nodeParentNameList.get(ii);
							parentName += "'";
						}
						
					%>

						itemName = "<%= nodeNameList.get(ii)%>";
						itemIntl = "<%= nodeIdList.get(ii)%>";
						parentId = "<%= nodeParentIdList.get(ii)%>";
						itemLevel = "<%= nodeLevelList.get(ii)%>";
						itemSize = <%= nodeSizeList.get(ii)%>;
						itemColor = <%= nodeColorList.get(ii)%>;
						itemColorName = "<%= nodeColorNameList.get(ii)%>";
						addlInfo = "<%= nodeAddlList.get(ii)%>";
						itemLink = "<%= nodeLinkList.get(ii)%>";
						
						addlArray.push([itemIntl, itemName, parentId, <%= parentName %>, itemLevel, itemSize, itemColor, itemColorName, itemLink, addlInfo]);	
						
						if (debugLevel > 2) 
							window.alert("Additional Array: " + itemIntl + " " +  itemName + " " +  parentId + " " +  <%= parentName %> + " " +  itemLevel + " " +  itemSize + " " +  itemColor + " " +  itemColorName + " " +  itemLink + " " +  addlInfo);
						
						if (vHierType == 'TreeMap')
						{
							dataArray.push([itemName, <%= parentName %>, itemSize, itemColor ]);
						}
						
						if (vHierType == 'OrgChar')
						{
							if (itemColorName == 'white' || itemColorName == 'yellow' || itemColorName == 'lightblue')
								linkClass = 'orgDarkLink';
							else
								linkClass = 'orgLightLink';

								itemNameLong = '<div style="background-color: ';
							itemNameLong += itemColorName;
							itemNameLong += '; padding:10px; font-family:' + vFontFamily;
							itemNameLong += '"><a class="' + linkClass +'"';
							itemNameLong += ' target="' + vDrillTarget + '" href="' + itemLink + '">' + itemName + '</a></div>';
							
							linkInfo = '<b><a target="' + vDrillTarget + '" href="' + itemLink + '">' + itemName + '</a></b>';
							dataArray.push([{v:itemName, f:itemNameLong}, <%= parentName %>, addlInfo]);
						}

						if (vHierType == 'SankeyD')
						{
							if ( <%= ii %> > 0)
								dataArray.push([<%= parentName %>, itemName, itemSize]);
						}

						if (vHierType == 'WordTre')
						{
                            dataArray.push([itemIntl, itemName, parentId, itemSize, itemColorName]);
						}
						
					<% } %>				

				if (debugLevel > 2) 
				{
					window.alert("Data Array Elements will follow");
					for (i = 0; i < dataArray.length; i++) { 
										window.alert(dataArray[i]);
					}
				}

				if (debugLevel > 0) 
					window.alert("dataArray is Ready");

				switch (vHierType) 
				{
					case "TreeMap":
						if (debugLevel > 1) window.alert("Converting Data Array to Data Table");
						
						var data = google.visualization.arrayToDataTable(dataArray);
						if (debugLevel > 1) window.alert("dataTable is Ready");
						
						tree = new google.visualization.TreeMap(document.getElementById('map_canvas'));
						if (debugLevel > 1) window.alert("drawTreeHeatMap");
						tree.draw(data, 
						{
							height: 570,
							maxDepth: vMaxDepth,
							fontFamily: vFontFamily,
							fontSize: vFontSize,
							fontColor: vFontColor,
							minColor: vMinColor,
							midColor: vMidColor,
							maxColor: vMaxColor,
							noColor:  vNoColor,
							headerHeight: vHeaderHeight,
							showScale: vShowScaleBoolean,
							maxPostDepth: vMaxPostDepth,
							useWeightedAverageForAggregation: vWeightedAverageBoolean,
							headerColor: vHeaderColor, 
							hintOpacity: vHintOpacity,
							headerHighlightColor: vHeaderHighColor,
							minHighlightColor: vMinHighColor,
							midHighlightColor: vMidHighColor,
							maxHighlightColor: vMaxHighColor,
							noHighlightColor: vNoHighColor,
							minColorValue: vMinColorValue,
							maxColorValue: vMaxColorValue,
							generateTooltip: showTreeMapTooltip,
							title: vTitle,
							titleTextStyle: 
										{
											color: vTitleFontColor,
											fontName: vFontFamily,
											fontSize: vTitleFontSize,
											bold: true,
											italic: false
										}
						});
						break;
					case "WordTre":
						if (debugLevel > 1) window.alert("Create dataTable for WordTree");
						var data = new google.visualization.DataTable();
						data.addColumn('number', 'id');
						data.addColumn('string', 'childLabel');
						data.addColumn('number', 'parent');
						data.addColumn('number', 'weight');
						data.addColumn('string', 'color');
						var childId = -1;
						var childLabel = "";
						var sizeWord = 0;
						var colorWord = "";
						var parent = -1;
						if (debugLevel > 2) window.alert("Creating Sequential ID Array");
						for (ind = 1; ind < dataArray.length; ind++){
							if (debugLevel > 2) window.alert("Index: " + ind + " is Node " + dataArray[ind][0]);
							addSequentialId(dataArray[ind][0], dataArray[ind][2]);
						}

						for (ind = 1; ind < dataArray.length; ind++)
						{
							childId = findId(dataArray[ind][0], dataArray[ind][2]);
							if (debugLevel > 2) window.alert("Index: "+ ind + " - Child " + dataArray[ind][0] + " found Id " + childId);

							if (ind==1)
							{
								parent = -1;
							}
							else
							{
								parent = findId(dataArray[ind][2],-1);
							}
							if (debugLevel > 3) window.alert("Parent " + dataArray[ind][2] + " has Id " + parent);

							childLabel = dataArray[ind][1];
							sizeWord = dataArray[ind][3];
							colorWord = dataArray[ind][4];
							if (debugLevel > 2) window.alert("Will Add Row to Data Array: " + childId + ", " + childLabel + ", " + parent + ", " + colorWord);
							data.addRow([childId, childLabel, parent, 1, colorWord]);
						}
			
						if (debugLevel > 1) window.alert("dataTable is Ready");

						tree = new google.visualization.WordTree(document.getElementById('map_canvas'));
						if (debugLevel > 1) window.alert("drawWordTree "+vFontFamily+vFontSize);

						tree.draw(data, 
						{ 
							maxFontSize: vFontSize, 
							fontName: vFontFamily, 
							wordtree: 
							{ 
								format: 'explicit', 
								type: vWordTreeType
							}
						});
						break;
					case "OrgChar":
						if (debugLevel > 1) window.alert("Converting Data Array to Data Table");

						var data = google.visualization.arrayToDataTable(dataArray);
						if (debugLevel > 1) window.alert("dataTable is Ready");

						tree = new google.visualization.OrgChart(document.getElementById('map_canvas'));
						if (debugLevel > 1) window.alert("drawOrgChart");

						tree.draw(data, {allowHtml:true, allowCollapse:true, size:vChartNodeSize});
						break;
					case "SankeyD":
						if (debugLevel > 1) window.alert("Create dataTable for Sankey Diagram");

						var data = new google.visualization.DataTable();
						var parentLabel = "";
						var childLabel = "";
						var sizeNumber = 0;
						data.addColumn('string', 'From');
						data.addColumn('string', 'To');
						data.addColumn('number', 'Weight');
						for (i = 1; i < dataArray.length; i++)
						{
							childLabel = dataArray[i][0];
							parentLabel = dataArray[i][1];
							sizeNumber = dataArray[i][2];
							if (debugLevel > 1) window.alert(childLabel + " " + parentLabel + " " + sizeNumber);
							data.addRow([childLabel, parentLabel, sizeNumber]);
						}

						if (debugLevel > 1) window.alert("dataTable is Ready");

						tree = new google.visualization.Sankey(document.getElementById('map_canvas'));
						if (debugLevel > 1) window.alert("drawDiagram");

						tree.draw(data, {
										height: 600,
										sankey: { 
											node: { 
												interactivity: true,
												label: { fontName: vFontFamily,
													fontSize: vFontSize,
													color: vFontColor
													}, 
												labelPadding: vLabelPadding,
												nodePadding: vNodePadding,
												width: vNodeWidth
											},
											iterations: vSankeyIterations,
											link: {
												colorMode: 'gradient',
												color:	{
													fill: vLinkFillColor,
													fillOpacity: vLinkFillOpacity,
													stroke: vLinkStrokeColor,
													strokeWidth: vLinkStrokeWidth
												}
											}
										}
									});
						break;
				}
			  
				if (debugLevel > 1) window.alert("OUT: drawChart");	
			}
		</script>
	</head>
	<body onload="drawChart()">
		<form name="maps.page" method="post" action="hierView.jsp">
			<table border="0" cellspacing="1" cellpadding="0" class="tableGridList" width="100%">
				<tr height="30px"><th align="right" >
                    <a href="JavaScript:print()">
                        <img id="print" src="data:image/png;base64,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" alt="Print" width="20" height="20"></a>
				</th></tr>
			  <tr>
				<td align="left">
					<div style="width:100%; height:100%">				
						<div id="map_canvas" style="width:100%; height:100%"></div>
					<div>			
				  </td>
			  </tr>
			</table>	
		</form>
	</body>
</html>
