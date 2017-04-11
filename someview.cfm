<cfoutput>
<span id="homepage">
 <!--- This will render a search box inline on google search results pages. it only needs to be on the home page. --->
 <cfif structKeyExists(variables.homepageData, "svrStatus") and variables.homepageData.svrStatus eq "-1">
  <p class="alert alert-danger">#request.content.renderError(variables.homepageData.svrCtrlName, 'productDetails-')# (#variables.homepageData.svrCtrlCode#)</p>
 <cfelse>
  <cfinclude template="homeHero.cfm"/>
  <cfloop from="2" to="#variables.homepageData.moduleCnt#" index="i">
   <cfswitch expression="#structKeyList(variables.homepageData.homePageModules[i])#">
    <cfcase value="products">
     <cfswitch expression="#variables.homepageData.homePageModules[i].products.moduleType#">
      <cfcase value="175Multi">
       <cfinclude template="home175Multi.cfm"/>
      </cfcase>
      <cfcase value="175">
       <cfinclude template="home175.cfm"/>
      </cfcase>
      <cfcase value="80Image">
       <cfinclude template="home80Image.cfm"/>
      </cfcase>
      <cfcase value="80">
       <cfinclude template="home80.cfm"/>
      </cfcase>
     </cfswitch>
    </cfcase>
    <cfcase value="image">
     <cfinclude template="homeImage.cfm"/>
    </cfcase>
   </cfswitch>
  </cfloop>
 </cfif>
</span>
</cfoutput>
