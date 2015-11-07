Select 
@SELECT:DIM:USER_DEF:IMPLIED:NODE:X.NodeID:NODEID@
,@SELECT:DIM_PROP:USER_DEF:IMPLIED:NODE:X.NodeName:NodeName@
,@SELECT:DIM_PROP:USER_DEF:IMPLIED:NODE:X.NodeParentName:NodeParentName@
,@SELECT:DIM_PROP:USER_DEF:IMPLIED:NODE:X.NodeParentID:NodeParentID@
,@SELECT:DIM_PROP:USER_DEF:IMPLIED:NODE:X.NodeLevel:NodeLevel@
,@SELECT:DIM_PROP:USER_DEF:IMPLIED:NODE:X.NodeSize:NodeSize@
,@SELECT:DIM_PROP:USER_DEF:IMPLIED:NODE:X.NodeColor:NodeColor@
,@SELECT:DIM_PROP:USER_DEF:IMPLIED:NODE:X.NodeColorName:NodeColorName@
,@SELECT:DIM_PROP:USER_DEF:IMPLIED:NODE:X.NodeLinkURL:NodeLinkURL@
,@SELECT:DIM_PROP:USER_DEF:IMPLIED:NODE:X.NodeAdditionalInfo:NodeAdditionalInfo@
from (
select I.Name NodeName, I.ID NodeId, null NodeParentName, 0 NodeParentId, I.Item_Level NodeLevel, I.weight NodeSize, I.itemstatus NodeColor, I.itemstatus NodeColorName, '/niku/nu#action:strategic_item_dashboard' || chr(38) || 'ui.page.space=odf.strategic_itemList' || chr(38) || 'ui.page.template=union.appPage' || chr(38) || 'id='||I.ID NodeLinkURL, 'Item Status: <b>'||L1.NAME||'</b><br>Level: <b>'||I.Item_Level||'</b><br>' NodeAdditionalInfo from ODF_CA_STRATEGIC_ITEM I INNER JOIN CMN_LOOKUPS_V L1 ON L1.LOOKUP_TYPE = 'STRAT_ITEM_STATUS' AND L1.LOOKUP_CODE = I.ITEMSTATUS and L1.LANGUAGE_CODE = 'en' where I.ID = @WHERE:PARAM:USER_DEF:INTEGER:INTLID@
UNION
select I.Name NodeName, I.ID NodeId, P.Name NodeParentName, P.ID NodeParentId, I.Item_Level NodeLevel, I.weight NodeSize, I.itemstatus NodeColor, I.itemstatus NodeColorName, '/niku/nu#action:strategic_item_dashboard' || chr(38) || 'ui.page.space=odf.strategic_itemList' || chr(38) || 'ui.page.template=union.appPage' || chr(38) || 'id='||I.ID NodeLinkURL, 'Item Status: <b>'||L1.NAME||'</b><br>Level: <b>'||I.Item_Level||'</b><br>' NodeAdditionalInfo from ODF_CA_STRAT_TREE_FLAT T INNER JOIN ODF_CA_STRATEGIC_ITEM I ON I.ID = T.CHILD_ITEM INNER JOIN ODF_CA_STRATEGIC_ITEM P on P.ID = I.PARENTITEM INNER JOIN CMN_LOOKUPS_V L1 ON L1.LOOKUP_TYPE = 'STRAT_ITEM_STATUS' AND L1.LOOKUP_CODE = I.ITEMSTATUS and L1.LANGUAGE_CODE = 'en' where (T.parent_item =  @WHERE:PARAM:USER_DEF:INTEGER:INTLID@) and (T.child_item !=  @WHERE:PARAM:USER_DEF:INTEGER:INTLID@)
) X 
WHERE @FILTER@
ORDER BY X.NodeLevel
