<html>
	<head>
		<title>Hierarchical View</title>
		<script src="/niku/app?action=dms.viewFile&RhXm0r7tSeUqEr=true&fileId=5075906&fileName=wsdl_wrapper.js"/>
		<script src="/niku/app?action=dms.viewFile&RhXm0r7tSeUqEr=true&fileId=5075912&fileName=hierView.js"/>
		<script src="/niku/app?action=dms.viewFile&RhXm0r7tSeUqEr=true&fileId=5075909&fileName=google_jsapi.js"/>
		
		<script language="javascript">
			function drawChart() {
				if(debugMode==1) console.log("IN: drawChart");
				var vDrillTarget = "";
				var Server=fetchInternalId();
				var internalID=Server[0];
				var ServerName=Server[1];
				if(debugMode==1) console.log("drawChart: ServerName: "+ServerName);
				var nodeName = [];
				var nodeId = [];
				var nodeParentName = [];
				var nodeParentId = [];
				var nodeLevel = [];
				var nodeSize = [];  
				var nodeColor = []; 
				var nodeColorName = [];
				var nodeLinkUrl = [];
				var nodeAdditionalInfo = [];
				var viewAttributes = [];
				var Result;
				var viewId;
				var totalitems;
				var QueryFilterField;
				var QueryFilterValue;
				var QueryCallback;
				var QueryCode;
				var itemNameLong="";
				var linkClass="";

				/* Execute Query to list Hierarchical Views
					use this statement to test running the query as admin (remember to set the password accordingly)
					var Result=ExecuteClarityQueryAsAdmin(debugMode, ServerName, QueryCode, QueryFilterField, QueryFilterValue, "admin", "iluvca", QueryCallback);
				*/
				QueryFilterField = "code";
				QueryFilterValue = viewCode;
				QueryCallback="";
				QueryCode="hiev_list_wsdl";
				if(debugMode==3) console.log("drawChart: View List --Server Name: "+ServerName+"--Query Code: "+QueryCode+"--Filter Field: "+QueryFilterField+"--Filter Value: "+QueryFilterValue+"--Call Back: "+QueryCallback);
				Result=ExecuteClarityQueryAsUser(debugMode, ServerName, QueryCode, QueryFilterField, QueryFilterValue, QueryCallback);
				
				if(debugMode==3) console.log("drawChart: Back from View List:"+Result.responseText);
				viewId=loadViewData(Result, viewAttributes);
				if(debugMode==3) console.log("drawChart: Back from View Data: "+viewId);

				var id = viewAttributes[0];
				var code = viewAttributes[1]; 	
				var name = viewAttributes[2]; 
				var max_depth = viewAttributes[3]; 
				var font_family = viewAttributes[4]; 
				var font_size = viewAttributes[5]; 
				var title_font_size = viewAttributes[6]; 
				var min_color = viewAttributes[7]; 
				var mid_color = viewAttributes[8]; 
				var max_color = viewAttributes[9]; 
				var no_color = viewAttributes[10]; 
				var header_height = viewAttributes[11]; 
				var font_color = viewAttributes[12]; 
				var title_font_color = viewAttributes[13]; 
				var max_post_depth = viewAttributes[14]; 
				var show_scale = viewAttributes[15]; 
				var weighted_average = viewAttributes[16]; 
				var header_color = viewAttributes[17]; 
				var hint_opacity = viewAttributes[18]; 
				var min_high_color = viewAttributes[19]; 
				var mid_high_color = viewAttributes[20]; 
				var max_high_color = viewAttributes[21]; 
				var no_high_color = viewAttributes[22]; 
				var header_high_color = viewAttributes[23]; 
				var min_color_value = viewAttributes[24]; 
				var max_color_value = viewAttributes[25]; 
				var chart_node_size = viewAttributes[26]; 
				var word_tree_type = viewAttributes[27]; 
				var label_padding = viewAttributes[28]; 
				var node_padding = viewAttributes[29]; 
				var node_width = viewAttributes[30]; 
				var sankey_iterations = viewAttributes[31]; 
				var link_fill_color = viewAttributes[32]; 
				var link_fill_opacity = viewAttributes[33]; 
				var link_stroke_color = viewAttributes[34]; 
				var link_stroke_width = viewAttributes[35]; 
				var node_color = viewAttributes[36]; 
				var hier_type = viewAttributes[37]; 
				var studio_query_id = viewAttributes[38];
				var drillPage = viewAttributes[39]; 

				if(debugMode==3) console.log("drawChart: Reading Attributes hier_type "+hier_type + " and drill page "+drillPage);
				
				/* Execute Query to list Nodes
					use this statement to test running the query as admin (remember to set the password accordingly)
					var Result=ExecuteClarityQueryAsAdmin(debugMode, ServerName, QueryCode, QueryFilterField, QueryFilterValue, "admin", "iluvca", QueryCallback);
				*/
				QueryFilterField = "param_internal_id";
				QueryFilterValue = internalID;
				QueryCallback="";
				QueryCode="strat_hiev_item_hm";
				if(debugMode==4) console.log("drawChart: Node List --Server Name: "+ServerName+"--Query Code: "+QueryCode+"--Filter Field: "+QueryFilterField+"--Filter Value: "+QueryFilterValue+"--Call Back: "+QueryCallback);
				Result=ExecuteClarityQueryAsUser(debugMode, ServerName, QueryCode, QueryFilterField, QueryFilterValue, QueryCallback);
				
				if(debugMode==4) console.log("drawChart: Back from Node List:"+Result.responseText);
				totalitems=loadNodeData(Result, nodeId, nodeName, nodeParentId, nodeParentName, nodeLevel, nodeSize, nodeColor, nodeColorName, nodeLinkUrl, nodeAdditionalInfo);
				if(debugMode==4) console.log("drawChart: Back from Node Data: "+totalitems + " node0 " + nodeId[0] + " lastNode " + nodeId[totalitems-1]);
				
				switch (hier_type) {
					case "TreeMap":
						if (debugMode > 1) console.log("Creating Tree Map DataTable");
						var data = new google.visualization.DataTable();
						data.addColumn('string', 'nodeName');
						data.addColumn('string', 'nodeParent');
						data.addColumn('number', 'nodeSize');
						data.addColumn('number', 'nodeColor');

						for (var i = 0 ; i < totalitems ; i++) {
							data.addRow([nodeName[i], nodeParentName[i], nodeSize[i], nodeColor[i]]);
						}
					
						if (debugLevel > 1) console.log("dataTable is Ready");
					
						tree = new google.visualization.TreeMap(document.getElementById('map_canvas'));
						if (debugLevel > 1) console.log("drawTreeHeatMap");
						tree.draw(data, 
						{
							height: 570,
							maxDepth: max_depth,
							fontFamily: font_family,
							fontSize: font_size,
							fontColor: font_color,
							minColor: min_color,
							midColor: mid_color,
							maxColor: max_color,
							noColor:  no_color,
							headerHeight: header_height,
							showScale: show_scale,
							maxPostDepth: max_post_depth,
							useWeightedAverageForAggregation: weighted_average,
							headerColor: header_color, 
							hintOpacity: hint_opacity,
							headerHighlightColor: header_high_color,
							minHighlightColor: min_high_color,
							midHighlightColor: mid_high_color,
							maxHighlightColor: max_high_color,
							noHighlightColor: no_high_color,
							minColorValue: min_colorValue,
							maxColorValue: max_colorValue,
							generateTooltip: showTreeMapTooltip,
							title: name,
							titleTextStyle: 
										{
											color: title_font_color,
											fontName: font_family,
											fontSize: title_font_size,
											bold: true,
											italic: false
										}
						});
						break;
					case "WordTre":
						if (debugMode > 1) console.log("Create WordTree DataTable");
						var data = new google.visualization.DataTable();
						break;
					case "OrgChar":
						if (debugMode > 1) console.log("Creating Org Chart DataTable");
						var data = new google.visualization.DataTable();
						break;
					case "SankeyD":
						if (debugMode > 1) console.log("Create Sankey Diagram DataTable");
						var data = new google.visualization.DataTable();
						break;
				}
					
			if(debugMode==1) console.log("OUT: drawChart");
				
				return true;
			}
		</script>
	</head>
	<body>
		<script language="javascript">
			/* 	debugMode=1 -> Init
				debugMode=2 -> SoapClient
				debugMode=3 -> View Query
				debugMode=4 -> Node Query
				debugMode=5 -> L3 Query Result 
				debugMode=6 -> DD Query Result */
			
			var debugMode=3;
			var viewCode="hiev_strat_item_hm";
			google.load('visualization', '1.1', {'packages':['sankey','wordtree','treemap','orgchart']});
			google.setOnLoadCallback(drawChart);
		</script>
		<div style="position:absolute; top:10px; right:10px">
			<a href="JavaScript:print()">
				<img id="print" src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAMgAAADICAYAAACtWK6eAAAABmJLR0QA/wD/AP+gvaeTAAAMi0lEQVR4nO3de8wdRRnH8e/7tqCUWuibUqVcKgEhKIJBjEoEyq1F5CpgTBQKiUVEuRMMigakYJAIURAViRdUNAKJIKLc2lMu1agIFm8BQQoItBQstqVAb/4x7ylv3+485+zuzM7uOb9PMpCcs+eZgbPPO7NzZmdBREREREREREREREREREREREREyhpI3YBAtge+CuwDjE/cln63DLgPOB94OnFbSuuFBJkILAC2Td0Q2cDTwO7A0tQNKWMwdQMCOBYlRx1tBxyTuhFl9UKCbJ+6AeL19tQNKKsXEkQkGiWIiGFs6gZEdB1uZkviOx/4VOpGxNDLCbIUeCJ1I/pEo2eqLBpiiRiUICIGJYiIQQkiYlCCiBiUICIGJYiIQQkiYlCCiBiUICIGJYiIQQkiYlCCiBiUICIGJYiIQQkiYlCCiBiUICIGJYiIQQkiYlCCiBiUICIGJYiIQQkiYlCCiBiUICIGJYiIQQkiYlCCiBiUICIGJYiIQQkiYlCCiBiUICIGJYiIQQkiYlCCiBiUICIGJYiIQQkiYhhbUT1jgGnA9sAmgWPvGTiehLMncHLgmKuAhcA8YE3g2BupIkHGA3cBH6igLqmXQ4dLDPOBGcDySPGBaoZY30LJIeHtDVwVu5LYCXIUcELkOqR/nQgcGbOCmAkyBFwTMb4IuHNsYqzgMRPkSmDriPFFAKYAV8QKHusifQZwvOe9/wJ3B6xrN2DXgPEknL8DfwsY72Bgy4zXZwI34CaDam8IeBZY5ynHBa5vtqeeywPXI36Xk/0dfCVwPR/31LMOd84FH2rFGGJZQ6sbh4tIET8HbvK8tzURhlqhE+Ro/LNWi4BTA9cn/eczwGLPeyfiZk6DCZkgQ7jfPHxOA5YErE/60xLgDOP9oLNaIRNEQyupSmVDrVCzWNas1YvA6QVibg3sBby5w3G+GaxdCD8hINl28bz+Tjp/ByuBB4HnctZ5BnAg2b3FTOBnwJ05Y0axBfAU/tmFTxSIeSluIZovpkpvldXAReR3ghFzITChQMzgrsPfyF8WiHeUEU+lt8th5HerEe/aAvGCOgRYS3bjlgBvKxDzak88ld4v3yC/KcBLnnhrgekFYq5X5iJ9C1yGDnjePwN4vkDcFwq3SJrON31reRY40/PeAPA9Eg21Qg+t2rbBXdin/mumUm1ZTLm1e78yYhceavn++ndyCHC75/Mv4tZHFek92nYAzh/+t/S+J3ATMwtLxJgC/JXsWa11uHO2klmtqtdaiXSr01qtoSoacb3RiF9U0QARw434z88fxq78aKPy54FJsRsg0sEk3Lo/33kadK3WSBpaSVMkGWr92KhUQyupG2uo9aPQlWloJU1T2VBLQytpqkqGWt8xKinzg6BIFawfEK37l7oyDf9aKw2tpAmsodYa4INFA2+C+2VSQytpOmuotYCC90WdagS9pXSTRap1G/7zeVbeYG/BrarNCvYSxZaxi6S0HbCM7HP6OWDzPMEu8ARaB5wSrMki1ToX/3n9+W6DTMC/3Pxh3LM+RJpoU+BRss/tF3CP6ujIyrJYz3oQqcpx+M9vazshwPUOT3o+PD9Kc0WqNQD8iexz/DE63GV7mOeD64DDozVZpFofxX+eb3AP++g7Am8BjsgI+DiwM+5HwzLGE/4ZhSO9ittnScQyBndOT81472bg2KwPDQGvk51VRTZ+G2kWrvvyZW2oshr4A24FgIjlHLLPoVdxG5JsZKbnAyvJfiZDtw73xI1ZlpP910GkbRLwGtnnz/rNDkdekHzME+g3wNISDSmys2JZmwPHJKhXmmMJ/gfurM+FdoKMw+1zmuWGkg1J9Rg2Pf5NOvmp5/WDgDfBGwmyd/uFUVbiehCRXnQbbpg12jiGH13eThDf9oz3ASvCt0ukFpYBD3jeOxjeSJB9PQfNCd2iEY7ATTOXLbML1P0O4A7ctVXVEwidypPAZbhlERJfy/P6vuASZAzwbs9BMRMklc1ww8bpeKbzEpsKnAdcmLgd/eIez+t7AAODuB8Ax2Uc8BpucWKvOQDYMXUjunAyxbeGle49hPv9bLQJwE6DuEzJ8g9gVaxWJdSU1cgxnkAsG1uJ+xE7yx7tHiTLgjjtSe5eim2zX7WbcNckEt8jntd3HgS29bzpy6qmWwocCfyZep6AK3Ebm52buiF95FHP69uOxd2KmOXpSI1pu4EwQ7jNCnzm98B7cb+41222aDm9ObSts6c8r283FvfAmiz/idSYtq7u3opsBfqdR+AZz+vbDOJ/6HqZB+CINInvXJ84SPYUL8ArgSpfEihOXnrWoXTLN4oYN4h/DB/qxqMU25O+jltnI9IN37k+Dtz2i1lLHnxDryIuGG5EFUs1FuF2oxfp1iSyz6VVA/inOrcEXg7YiE3xTymHsgY3+1b21mDpLxNxGyKOtq7QnqQFvY57mqlIY2g5g4hBCSJiUIKIGJQgIgYliIhBCSJiUIKIGJQgIgYliIhBCSJiUIKIGJQgIgYliIhBCSJiUIKIGJQgIoaqbpiaAnwOeA9xH+IpvW8Vbj/dq6hg550qbrmdinsu9aQAsUTaXsBt/hdig0PvLbdVDLHOQ8kh4W2FO7eiqiJBdq2gDulP74pdQRUJ0pTHDUjzRD+3NIslYqhy25/RLgMe7OK4T+N/RPW5+HfmlnqYClzuee9u4NouYuxFBdcbPr4dCkM9v2+eJ/7hXXx2Mu5xAFmf9z1bTupnDtnf4XLcd9zJEZ7PzwvUvome+GvrPsQ6B/cMjyxfrrIhUsqXPK9vDpxVZUPyqnOCTAY+63lvLv7nW0v9PID/ccun4aZsa6nOCXI2/t7D9xdJ6usiz+u17kXqmiCTcUtTsqj3aKYW/l7kdGrai6ScxbKE7D0OBfbHPfdawnkZd/H92xyfuQiYlvF6uxf5QvlmhVe3WSxr5mpOzrq/74mjEq50M0070lxPnOX4exHNYo0QqvfYBzipfHOkg1nA3jmOb9S1SN0SJOS1R/R1OrLebjmObdGga5G6JchZhLv2+EvJtkj3Hsp5vNWLnFmyLUHVKUEm4+bEsxSZufodcF2pFkk3vgv8MednWjSkF6nTLJbVe/j+4nQyC7gZNwTQquKw1gCPAHcU/LxvRms8rhf5YsG4wdVhFsuauZobqB1SPy2yv/NlbNiL9P0sVozeQ+rP9922e5Hk6pAg1rVHC/9YVZpvLv5eoBbXInVIEPUe/a3WvUjqBNkK9R79rta9SMpZrGOAE/H3HpfkjLcH8CHcXx5JZxlwP7Agx2cuAfbLeH088G3cBE4yqWaxrJJ35uqaAnWoxC1Xm9/YxloF6og+i4VRecoEmZYj/v4F4qtUU/Y1vrfRinyPPTHNuybn8dbdZ1nelzO+VOf9OY6dC8zPGX91zuNzqyJBHsl5fN6Zq8dzHi/V+VfO4/N+93mucwrzdV+hhljbAIuNekaW+wvEHzP8udTDCZUNy70UW97zQJfxF+E2RQ/BO8SqYvNqcHvzngTshNvjakfPcdOBuwrE3wQ4HreZcZ3Wl/Wj1bjNyn+C24k9r+n413c9jtvu6THgB8CLRRqYwbt5dfsfWSVUDzLSVrhpwKz6WhHqk2ZqkX2OjF6jFUrSWayRLjHq2z9CfdJMB+A/T2ZHqK8WCaLeQ/JokX2uvAwMBa6rFgky26hLvYeMZvUiFweuK3mCqPeQIlpU04t4E8Sa8TkKeCVQA2bgXyOVd83VZNyPg+NKtUiqtgI3u7U4x2cuJXuN1gTgaxS/m3E033pAoLs551illfM/5GLc1GHKNqsUL6uAC0d/qR0UWaoUqphDrCrKATn+Rx2YuK0q4cp+dC/l9752kOEsSWA++XZKzJNMUm++ByJluQe3Q00KaweBRxNVnnfdzbNRWiEp5P0uU91Z+k+AmVTfdRXZnX0L4JkEbVUJWxZSbCPx+Qna+smB4coPwa1l6uZxWN3a3Yg3A7izQMy34p46tTva56pp1gAPA1eQbyarbQb+neQXE3Zl7yLgeoqdo10Zws1VZ2VlK1al0vN8M1oxfl2P6mL83ZYutqUoa0arMTvgWL1HqFskpX81vhexeo8803siWQ6iwb2Ieg+pQmW9SOi7707DP4X3a9wdfyJl3U72jikTcI8OD7bad6DzIV0bAv6NHpYpaf0P2IHsW2hzC7mrySkoOSS9CcDJoYKFTJCPBIwlUsaHQwUKmSDLAsYSKWNFqEAhE+SbuJkEkZTW4s7FIEJepIO7C/Fs3GZxIlV7Bvg6cGvqhoiIiIiIiIiIiIiIiIiIiIiIiMgb/g+41kJYNI+zogAAAABJRU5ErkJggg==" alt="Print" width="20" height="20" align="right">
			</a>
		</div>
		<div id="map_canvas" style="position:absolute; top:10px; right:10px width:96%; height:97%"/>				
	</body>
</html>