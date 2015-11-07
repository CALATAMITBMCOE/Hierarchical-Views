
			function eventFire(el, etype){
				if (el.fireEvent) {
					el.fireEvent('on' + etype);
				} else {
					var evObj = document.createEvent('Events');
					evObj.initEvent(etype, true, false);
					el.dispatchEvent(evObj);
				}
			}

			function fetchInternalId() {
				if(debugMode==1) console.log("IN: fetchInternalId");				
				/* Fetching ServerName and Item ID */
				var vModal=0;
				var url = window.document.URL;
				
				var vDialogs = document.getElementsByClassName("ppm_dialog");
				if (vDialogs.length > 0) vModal=1;
				
				if (vModal==1) {
					/* Popup */
					var innerUrl = document.getElementById('ppm_mnp').innerHTML; /* This is the Div that contains the Modal page */
					idLocation = innerUrl.indexOf('instance_id')+12;
					var end = idLocation + 7;
					var internalID = innerUrl.substring(idLocation,end);
				}
				else
				{
					/* Not a Popup */
					var idLocation = url.indexOf('id=')+3;
					var end = idLocation + 7;
					var internalID = url.substring(idLocation, end);
				}
				var ServerName = url.substring(7,url.indexOf("niku/")-1);
				if(debugMode==1) console.log("URL: "+url+" Servername: "+ServerName);
				if(debugMode==1) console.log("OUT: fetchInternalId");				
				return [internalID, ServerName];
			}

			function getNodeValue(docNode) {
				if (debugMode==3) console.log("IN: getNodeValue "+docNode.nodeName);
				if (docNode.hasChildNodes()) {
					var returnValue = docNode.firstChild.nodeValue;
				} else {
					var returnValue = 0;
				}

				if (debugMode==3) console.log("OUT: getNodeValue");
				return returnValue;
			}
			
			function loadViewData(Result, viewAttributes) {

				if(debugMode==3) console.log("IN: loadViewData");				
				var xmlobject = crossBrowserXMLLoad(Result.responseText);
				var items = xmlobject.getElementsByTagName("Record");
				if(debugMode==3) console.log("loadViewData: #items " + items.length);				
				var item = items[0];
				
				viewAttributes[0] = getNodeValue(item.getElementsByTagName("id")[0]);
				viewAttributes[1] = getNodeValue(item.getElementsByTagName("code")[0]);
				viewAttributes[2] = getNodeValue(item.getElementsByTagName("name")[0]);
				viewAttributes[3] = getNodeValue(item.getElementsByTagName("max_depth")[0]);
				viewAttributes[4] = getNodeValue(item.getElementsByTagName("font_family")[0]);
				viewAttributes[5] = getNodeValue(item.getElementsByTagName("font_size")[0]);
				viewAttributes[6] = getNodeValue(item.getElementsByTagName("title_font_size")[0]);
				viewAttributes[7] = getNodeValue(item.getElementsByTagName("min_color")[0]);
				viewAttributes[8] = getNodeValue(item.getElementsByTagName("mid_color")[0]);
				viewAttributes[9] = getNodeValue(item.getElementsByTagName("max_color")[0]);
				viewAttributes[10] = getNodeValue(item.getElementsByTagName("no_color")[0]);
				viewAttributes[11] = getNodeValue(item.getElementsByTagName("header_height")[0]);
				viewAttributes[12] = getNodeValue(item.getElementsByTagName("font_color")[0]);
				viewAttributes[13] = getNodeValue(item.getElementsByTagName("title_font_color")[0]);
				viewAttributes[14] = getNodeValue(item.getElementsByTagName("max_post_depth")[0]);
				viewAttributes[15] = getNodeValue(item.getElementsByTagName("show_scale")[0]);
				viewAttributes[16] = getNodeValue(item.getElementsByTagName("weighted_average")[0]);
				viewAttributes[17] = getNodeValue(item.getElementsByTagName("header_color")[0]);
				viewAttributes[18] = getNodeValue(item.getElementsByTagName("hint_opacity")[0]);
				viewAttributes[19] = getNodeValue(item.getElementsByTagName("min_high_color")[0]);
				viewAttributes[20] = getNodeValue(item.getElementsByTagName("mid_high_color")[0]);
				viewAttributes[21] = getNodeValue(item.getElementsByTagName("max_high_color")[0]);
				viewAttributes[22] = getNodeValue(item.getElementsByTagName("no_high_color")[0]);
				viewAttributes[23] = getNodeValue(item.getElementsByTagName("header_high_color")[0]);
				viewAttributes[24] = getNodeValue(item.getElementsByTagName("min_color_value")[0]);
				viewAttributes[25] = getNodeValue(item.getElementsByTagName("max_color_value")[0]);
				viewAttributes[26] = getNodeValue(item.getElementsByTagName("hiev_chart_node_size")[0]);
				viewAttributes[27] = getNodeValue(item.getElementsByTagName("word_tree_type")[0]);
				viewAttributes[28] = getNodeValue(item.getElementsByTagName("label_padding")[0]);
				viewAttributes[29] = getNodeValue(item.getElementsByTagName("node_padding")[0]);
				viewAttributes[30] = getNodeValue(item.getElementsByTagName("node_width")[0]);
				viewAttributes[31] = getNodeValue(item.getElementsByTagName("sankey_iterations")[0]);
				viewAttributes[32] = getNodeValue(item.getElementsByTagName("link_fill_color")[0]);
				viewAttributes[33] = getNodeValue(item.getElementsByTagName("link_fill_opacity")[0]);
				viewAttributes[34] = getNodeValue(item.getElementsByTagName("link_stroke_color")[0]);
				viewAttributes[35] = getNodeValue(item.getElementsByTagName("link_stroke_width")[0]);
				viewAttributes[36] = getNodeValue(item.getElementsByTagName("node_color")[0]);
				viewAttributes[37] = getNodeValue(item.getElementsByTagName("hierarchy_type")[0]).substring(0,7); 
				viewAttributes[38] = getNodeValue(item.getElementsByTagName("studio_query_id")[0]); 
				drill_new_page = getNodeValue(item.getElementsByTagName("drill_new_page")[0]); 
				if ( drill_new_page == 1 ) {
					viewAttributes[39] = "_blank";
				} else {
					viewAttributes[39] = "_parent";
				}
				
				if(debugMode==3) console.log("loadViewData: id " + viewAttributes[0] + " code " + viewAttributes[1] + " name " + viewAttributes[2] + " query " + viewAttributes[38]);				
				if(debugMode==3) console.log("OUT: loadViewData");				

				return viewAttributes[0];
			}

			function loadNodeData(Result, nodeId, nodeName, nodeParentId, nodeParentName, nodeLevel, nodeSize, nodeColor, nodeColorName, nodeLinkUrl, nodeAdditionalInfo) {
				if(debugMode==4) console.log("IN: loadNodeData");	
				var xmlobject = crossBrowserXMLLoad(Result.responseText);
				var items = xmlobject.getElementsByTagName("Record");
				if(debugMode==4) console.log("loadNodeData: #items " + items.length);				
				for (var i = 0 ; i < items.length ; i++) {
					var item = items[i];
					nodeId[i] = getNodeValue(item.getElementsByTagName("nodeid")[0]);
					nodeName[i] = getNodeValue(item.getElementsByTagName("nodename")[0]);
					nodeParentName[i] = getNodeValue(item.getElementsByTagName("nodeparentid")[0]);
					nodeParentId[i] = getNodeValue(item.getElementsByTagName("nodeparentname")[0]);
					nodeLevel[i] = getNodeValue(item.getElementsByTagName("nodelevel")[0]);
					nodeSizeStr = getNodeValue(item.getElementsByTagName("nodesize")[0]);
					nodeColorStr = getNodeValue(item.getElementsByTagName("nodecolor")[0]);
					nodeColorName[i] = getNodeValue(item.getElementsByTagName("nodecolorname")[0]);
					nodeLinkUrl[i] = getNodeValue(item.getElementsByTagName("nodelinkurl")[0]);
					nodeAdditionalInfo[i] = getNodeValue(item.getElementsByTagName("nodeadditionalinfo")[0]);
					
					if (typeof nodeName[i] !== 'undefined') {
						if ( typeof NodeSizeStr !== 'undefined' && typeof NodeColorStr !== 'undefined' ) {
								nodeSize[i] = Number( NodeSizeStr );
								nodeColor[i] = Number( NodeColorStr );
								if (typeof nodeSize[i] == 'undefined') {
									if(debugMode==4) console.log("loadNodeData: i " + i + " nodeId " + nodeId[i] + " nodeName " + nodeName[i] + " bad Number in Size " + NodeSizeStr);
									nodeSize[i] = 0.00;	
								}
								if (typeof nodeColor[i] == 'undefined') {
									if(debugMode==4) console.log("loadNodeData: i " + i + " nodeId " + nodeId[i] + " nodeName " + nodeName[i] + " bad Number in Color " + NodeColorStr);
									nodeColor[i] = 0;
								}
						} else {
							if(debugMode==4) console.log("loadNodeData: i " + i + " nodeId " + nodeId[i] + " nodeName " + nodeName[i] + " undefined StrSize or StrColor ");
							nodeSize[i] = 0.00;
							nodeColor[i] = 0.00;
						}
						
						if(debugMode==4) console.log("loadNodeData: i "+ i + " nodeId " + nodeId[i] + " nodeName " + nodeName[i] + " nodeParentName " + nodeParentName[i]+ " nodeParentId " + nodeParentId[i]);
						if(debugMode==4) console.log("loadNodeData: i "+ i + " --nodeLevel " + nodeLevel[i] + " nodeSizeStr " + nodeSizeStr + " nodeSize " + nodeSize[i]+ " nodeColorStr " + nodeColorStr+ " nodeColor " + nodeColor[i]);
						if(debugMode==4) console.log("loadNodeData: i "+ i + " --nodeColorName " + nodeColorName[i] + " nodeLinkUrl " + nodeLinkUrl + " nodeAdditionalInfo " + nodeAdditionalInfo[i]);
					} else {
						if(debugMode==4) console.log("loadNodeData: i " + i + " nodeId " + nodeId[i] + " nodeName undefined");
					}
				}
				
				if(debugMode==4) console.log("OUT: loadNodeData");				
				return items.length;
			}
