<cfcomponent displayname="Account Class" hint="">
<!---
 Path:    system.model.profile.cust.Account
 Purpose: Allows a PC to manage their account information
--->

<!--- Author: xxxxxxx, Date: 02/06/2013, Purpose: added userManager and userData --->
<cffunction name="init" access="public" returntype="struct" output="false">
 <cfscript>
  variables['componentName'] = getMetaData(this).name & ".";
  variables['instance'] = structNew();
 </cfscript>
 <cfreturn this/>
</cffunction>

<!--- Author: xxxxxxx, Date: 10/22/2015, Purpose: Get address data for resident country drop down change --->
<cffunction name="getAddressData" access="public" returntype="struct" output="false">
 <cfargument name="req" type="struct" required="true"/>
 <cfargument name="frm" type="struct" required="true"/>
 <cfargument name="url" type="struct" required="true"/>
 <cfscript>
  var data = {
   'svrCtrlName' = "errDirectInvoke",
   'svrStatus' = "-1",
   'svrCtrlCode' = "CF-1"
  };
  var addressUtil = "";
  if(structKeyExists(arguments.url, "countryCode")){
   addressUtil = new system.model.utils.Address();
   data = {
    'svrCtrlName' = "",
    'svrStatus' = "0",
    'svrCtrlCode' = "",
    'addressFields' = addressUtil.getAddressFieldsForCountry({'countryCode' = arguments.url.countryCode, 'langCode' = instance.langCode})
   };
  }
  return data;
 </cfscript>
</cffunction>

<!--- Author: xxxxxxx, Date: 07/06/2016, Purpose: Registration source lookup from the site type --->
<cffunction name="getRegSourceFromSite" access="private" returntype="string" output="false">
 <cfargument name="site" type="string" required="true"/>
 <cfscript>
  var lookup = {
   'U' = "D",
   'UG' = "D",
   'APN' = "APN",
   'N' = "NM"
  };
  var regSource = structKeyExists(lookup, arguments.site) ? lookup[arguments.site] : "";
  return regSource;
 </cfscript>
</cffunction>

</cfcomponent>