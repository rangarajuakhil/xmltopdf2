<?xml version="1.0"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:template match="/">
  <HTML>
   <HEAD>
   <TITLE>Summary View for <xsl:value-of select="//return/patient"/></TITLE>

   <style type="text/css">
     @page { margin-bottom: 25px; } 
	.PtHeading{font-family:Arial Black;font-size:10.0pt;color:#000000;}
	.PtData{font-family:Arial;font-size:10.0pt;color:#000000;}
	.PageHeader{font-family:Arial;font-size:10.0pt;font-weight:bold;color:#000000;}
	.rightPaneHeading{font-family:Arial Black;font-size:10.0pt;color:#000000;}
	.rightPaneData{font-family:Arial;font-size:10.0pt;font-weight:normal;color:#000000;}
	.tfoot{display:table-footer-group;}
	.TableFooter{font-family:Arial;font-size:10.0pt;font-weight:bold;color:#000000;}
	.eclinicalworks{font-family:Arial;font-style:italic;font-size:8.0pt;color:#000000;}
	.PNSig{font-family:Arial;font-size:10.0pt;font-weight:bold;color:#000000;}
	.Facility{font-family:Arial;font-size:9.0pt;font-weight:bold;color:#000000;}
	 TD.tableheading{font-family:Arial;font-size:8.0pt;color:#000000;font-weight: bold;}
     TD.tablecell{font-family:Arial;font-size:10.0pt;color:#000000;font-weight: normal;}
     TD.TitleColor{font-size:10pt;font-weight: normal;BACKGROUND-COLOR:#F5F5DC;}
	 .sectionHeading{font-family:Arial, Helvetica;font-size:10pt; text-decoration: underline; font-weight: bold}
	 .tableCP{font-family:Arial;font-size:10.0pt;color:#000000;font-weight: normal;}
	 .ptedloglink{cursor:pointer;font:9pt Verdana;color:green;text-decoration:underline;}
  </style>
	  <script type="text/javascript" src="/mobiledoc/jsp/dashboard/js/jquery1.7.js"></script>
	<script type="text/javascript" src="/mobiledoc/jsp/catalog/xml/scaleImage.js"></script>
	<link rel="stylesheet" href="/mobiledoc/jsp/catalog/xml/print_xsl.css" type="text/css" media="print" />
	<script language="javascript">
      var truserid = '<xsl:value-of select="//return/TrUserId"/>';
    </script>
   </HEAD>

  <BODY>
	<xsl:variable name="ThumbNailHeight" select='//return/ThumbNailHeight'/>
	<xsl:variable name="ShowThumbNailsInProgressNotes" select='//return/ShowThumbNailsInProgressNotes'/>
  	<xsl:variable name="EncounterId" select='//return/EncounterId'/>
  	<xsl:variable name="truserid" select='//return/TrUserId'/>
    <table cellpadding="0" cellspacing="0" border="0" width="100%">
      <tbody>
	<tr><td>

    <table cellspacing="0" cellpadding="0" width="100%" border="0">
      <tr class="PtHeading">
         <td align="center">
             <xsl:choose>
		<xsl:when test="//return/FacilityLogo!=''">
			<img id="logo" alt="" height="100" width="300" src="{//return/FacilityLogo}"></img>
		</xsl:when>
		<xsl:otherwise>
			 <img id="logo" alt="" height="100" width="300" src="/mobiledoc/jsp/catalog/xml/logo.JPG"></img>
		</xsl:otherwise>
	     </xsl:choose>
         </td>
      </tr>

      <tr height="50pt">
		<td></td>
      </tr>

      <tr class="PtHeading">
		<td align="center" width="100%">
			<xsl:if test="//return/NotesType!=''">
				<xsl:value-of select="//return/NotesType"/>&#160;
			</xsl:if>
		</td>
      </tr>

    </table>

    <table cellspacing="0" cellpadding="0" width="100%" border="0">

      <tr height="20pt">
	<td></td>
      </tr>

      <!-- CORRECTIONS DEMOGRAPHICS DATA -->
      <xsl:if test="//return/BookAndCaseNo!=''">
	      <TR class="PtData">
	        <TD ALIGN="LEFT">
	        	<xsl:if test="//return/NYSIDNo!=''">
	          		<xsl:choose>
	        			<xsl:when test="//return/SIDLabel != ''">
	        				<b><xsl:value-of select="//return/SIDLabel"/>:&#160;</b>
	        			</xsl:when>
	        			<xsl:otherwise>
	        				<b>NYSID No:&#160;</b>
	        			</xsl:otherwise>
	        		</xsl:choose>
	          		<xsl:value-of select="//return/NYSIDNo"/>&#160;
	          	</xsl:if>
	          	<xsl:choose>
        			<xsl:when test="//return/BCLabel != ''">
        				<b><xsl:value-of select="//return/BCLabel"/>:&#160;</b>
        			</xsl:when>
        			<xsl:otherwise>
        				<b>B&amp;C No:&#160;</b>
        			</xsl:otherwise>
        		</xsl:choose>
	          	<xsl:value-of select="//return/BookAndCaseNo"/>&#160;
	          	<xsl:if test="//return/FacilityCode!=''">
	          		<b>Facility Code:&#160;</b><xsl:value-of select="//return/FacilityCode"/>&#160;
	          	</xsl:if>
	          	<xsl:if test="//return/HousingArea!=''">
	          		<b>Housing Area:&#160;</b><xsl:value-of select="//return/HousingArea"/>
	          	</xsl:if>
	        </TD>
	       </TR>
	  </xsl:if>
		<tr>
			<td align="left">
				<xsl:if test="//return/enableCaseLabel!=''">
					<font color="black"><b>Case Label: </b></font>
					 <xsl:if test="//return/caseLabel!=''">   
					    <xsl:value-of select="//return/caseLabel"/>
					</xsl:if>
					<font color="black"><b>&#160;&#160;&#160;&#160;Date Of Injury: </b></font>
					 <xsl:if test="//return/dateOfInjury!=''">   
					    <xsl:value-of select="//return/dateOfInjury"/>
					</xsl:if>
				</xsl:if>
			</td>
		</tr>
      <tr class="PtData">
	<td align="left"><b>Patient: </b><xsl:value-of select="//return/patient"/></td>
	<xsl:if test="//return/Resident =''">
	<td align="right"><b>Provider: </b><xsl:value-of select="//return/provider"/></td>
        </xsl:if>

	<xsl:if test="//return/Resident !=''">
           <td align="right"><b>Appointment Provider: </b><xsl:value-of select="//return/provider"/></td>
        </xsl:if>
      </tr>

      <tr class="PtData">
        <td align="left">
		<b>DOB: </b><xsl:value-of select="//return/DOB"/>&#160;<b>Age: </b><xsl:value-of select="//return/age"/>&#160;<b>Sex: </b><xsl:value-of select="//return/sex"/>
        </td>

	<xsl:if test="//return/AttendingPr !=''">
		<td align="right"><b>Supervising Provider: </b><xsl:value-of select="//return/AttendingPr"/></td>
	</xsl:if>

	<xsl:if test="//return/AttendingPr ='' or //return/Resident =''">
	<td align="right"><b>Date: </b><xsl:value-of select="//return/encDate"/></td>
        </xsl:if>
      </tr>
	<xsl:if test="//return/IsOccVisit = '1'">
		<xsl:if test="//return/employerName!=''">
      	<TR class="PtData">
      	<td align="left">
		<b>Employer Name: </b><xsl:value-of select="//return/employerName"/>
        </td>
      	</TR>
      	</xsl:if>
      	<xsl:if test="//return/jobTitle!=''">
      	<TR class="PtData">
      	<td align="left">
		<b>Job Title: </b><xsl:value-of select="//return/jobTitle"/>
        </td>
      	</TR>
      	</xsl:if>
     </xsl:if>
      <tr class="PtData">
        <td align="left">
          <xsl:if test="//return/pcp!=''">
		<b>PCP:&#160;</b><xsl:value-of select="//return/pcp"/>&#160;&#160;&#160;
	  </xsl:if>
        </td>

        <td align="right">
          <xsl:if test="//return/AttendingPr !=''">
		<b>Date: </b><xsl:value-of select="//return/encDate"/>
	  </xsl:if>
        </td>
      </tr>

    </table>

    <hr/>

    <table cellspacing="0" cellpadding="0" width="100%">
         <tr height="5"><td></td></tr>
    </table>

   <!-- <xsl:for-each select="//subItems">-->

   <table cellspacing="0" cellpadding="0" width="100%">
     <tbody>
     <tr>
     <td width="100%">
     <table cellspacing="8" cellpadding="0" border="0" align="left" height="100%" width="100%">

     <xsl:if test="//subItems/item/CarePlanProblem!='' ">
     	<tr class="rightPaneHeading">
     	 <td valign="top">
     	    CarePlanProblems 
              </td>
            </tr>
            
     	<tr class="rightPaneData">
     	 <td valign="top">
     	   <xsl:apply-templates select="//subItems/item/CarePlanProblem"/>
              </td>
            </tr>
            
     </xsl:if>
     
       <xsl:if test="//subItems/cc!=''">
       <tr>
         <td valign="top">
	   <xsl:apply-templates select="//subItems/cc"/>
         </td>
       </tr>
       </xsl:if>

       <xsl:if test="//subItems/hpi!=''">
       <tr>
         <td valign="top">
	   <xsl:apply-templates select="//subItems/hpi"/>
         </td>
       </tr>
       </xsl:if>

       <xsl:if test="//subItems/CurrentMeds!=''">
       <tr>
         <td valign="top">
	   <xsl:apply-templates select="//subItems/CurrentMeds"/>
         </td>
	</tr>
	</xsl:if>

	<xsl:if test="//subItems/PastHistory!=''">
	<tr>
	 <td valign="top">
	   <xsl:apply-templates select="//subItems/PastHistory"/>
         </td>
       </tr>
       </xsl:if>

        <xsl:if test="//subItems/DentalHistory!=''">
	<tr>
	 <td valign="top">
	   <xsl:apply-templates select="//subItems/DentalHistory"/>
         </td>
       </tr>
       </xsl:if>
       
       <xsl:if test="//subItems/SurgicalHistory!=''">
	<tr>
         <td valign="top">
	   <xsl:apply-templates select="//subItems/SurgicalHistory"/>
         </td>
	</tr>
       </xsl:if>

       <xsl:if test="//subItems/FamilyHistory!=''">
       <tr>
         <td valign="top">
	   <xsl:apply-templates select="//subItems/FamilyHistory"/>
         </td>
	</tr>
	</xsl:if>

       <xsl:if test="//subItems/SocialHistory!=''">
       <tr>
         <td valign="top">
	   <xsl:apply-templates select="//subItems/SocialHistory"/>
         </td>
	</tr>
	</xsl:if>

	<xsl:if test="//subItems/gynHistory!=''">
	<tr>
         <td valign="top">
	   <xsl:apply-templates select="//subItems/gynHistory"/>
         </td>
	</tr>
	</xsl:if>

	<xsl:if test="//subItems/obHistory!=''">
	<tr>
         <td valign="top">
	   <xsl:apply-templates select="//subItems/obHistory"/>
         </td>
	</tr>
	</xsl:if>

	<xsl:if test="//subItems/allergies!=''">
	<tr>
         <td valign="top">
	   <xsl:apply-templates select="//subItems/allergies"/>
         </td>
	</tr>
	</xsl:if>

	<xsl:if test="//subItems/Hospitalization!=''">
	<tr>
         <td valign="top">
	   <xsl:apply-templates select="//subItems/Hospitalization"/>
         </td>
	</tr>
	</xsl:if>

	<xsl:if test="//subItems/ros!=''">
	<tr>
         <td valign="top">
	   <xsl:apply-templates select="//subItems/ros"/>
         </td>
	</tr>
	</xsl:if>
<xsl:if test="count(//return/ShowVitalHistory) = 0">
	 <xsl:if test="//subItems/vitals!=''">
       <tr>
         <td valign="top">
	   <xsl:apply-templates select="//subItems/vitals"/>
         </td>
       </tr>
       </xsl:if>

	 <xsl:if test="//subItems/vitals2!=''">
       <tr>
         <td valign="top">
	   <xsl:apply-templates select="//subItems/vitals2"/>
         </td>
       </tr>
       </xsl:if>

       <xsl:if test="//subItems/vitals2BR!=''">
       <tr>
         <td valign="top">
       <xsl:apply-templates select="//subItems/vitals2BR"/>
         </td>
       </tr>
       </xsl:if>
</xsl:if>
	<xsl:if test="count(//return/ShowVitalHistory) > 0">
       		<xsl:if test="//subItems/vitalHistory!=''">
	       <tr>
	         <td valign="top">
	       <xsl:apply-templates select="//subItems/vitalHistory"/>
	         </td>
	       </tr>
	       </xsl:if>
    </xsl:if>
      <xsl:if test="//subItems/PastOrders!=''">
       <tr>
         <td valign="top">
	   		<xsl:apply-templates select="//subItems/PastOrders"/>
         </td>
       </tr>
     </xsl:if>

      <xsl:if test="//subItems/VisionExamination!=''">
       <tr>
         <td valign="top">
	   		<xsl:apply-templates select="//subItems/VisionExamination"/>
         </td>
       </tr>
     </xsl:if>

	 <xsl:if test="//subItems/DentalExamination!=''">
       <tr>
         <td valign="top">
	   		<xsl:apply-templates select="//subItems/DentalExamination"/>
         </td>
       </tr>
     </xsl:if>


       <xsl:if test="//subItems/examination!=''">
       <tr>
         <td valign="top">
	   <xsl:apply-templates select="//subItems/examination"/>
	   <xsl:apply-templates select="//subItems/examination/category/MuscularExam"/>
         </td>
       </tr>
       </xsl:if>

       <xsl:if test="//subItems/PhysicalExamination!=''">
       <tr>
         <td valign="top">
	   <xsl:apply-templates select="//subItems/PhysicalExamination"/>
         </td>
       </tr>
       </xsl:if>

       <xsl:if test="//subItems/Therapeutic!=''">
       <tr>
         <td valign="top">
	   <xsl:apply-templates select="//subItems/Therapeutic"/>
         </td>
       </tr>
       </xsl:if>

       <xsl:if test="//subItems/TherapyAssessment!=''">
       <tr>
         <td valign="top">
	   <xsl:apply-templates select="//subItems/TherapyAssessment"/>
         </td>
       </tr>
       </xsl:if>

       <xsl:if test="//subItems/assessment!='' or //subItems/notes or //subItems/notesBR">
				 <xsl:if test="//subItems/assessment!=''">
					 <tr>
						 <td valign="top">
								<xsl:apply-templates select="//subItems/assessment"/>
						 </td>
					</tr>
				</xsl:if>
				<xsl:if test="//subItems/notes!=''">
					<tr>
						 <td valign="top">
								<xsl:if test="count(//subItems/assessment) = 0">
									<table cellspacing="0" cellpadding="0" width="100%">
										<tr class="rightPaneHeading"><td><xsl:value-of select="//return/ChartHeadings/Assessment"/></td></tr>
									</table>
								</xsl:if>
								 <xsl:apply-templates select="//subItems/notes"/>
						 </td>
					</tr>
				</xsl:if>
				<xsl:if test="//subItems/notesBR!=''">
                    <tr>
                         <td valign="top">
                                <xsl:if test="count(//subItems/assessment) = 0">
                                    <table cellspacing="0" cellpadding="0" width="100%">
                                        <tr class="rightPaneHeading"><td><xsl:value-of select="//return/ChartHeadings/Assessment"/></td></tr>
                                    </table>
                                </xsl:if>
                                 <xsl:apply-templates select="//subItems/notesBR"/>
                         </td>
                    </tr>
                </xsl:if>
				<xsl:if test="//subItems/axis4!=''">
					<tr>
						 <td valign="top">
									 <xsl:apply-templates select="//subItems/axis4"/>
						 </td>
					</tr>
				</xsl:if>
				<xsl:if test="//subItems/axis5!=''">
					<tr>
						 <td valign="top">
									 <xsl:apply-templates select="//subItems/axis5"/>
						 </td>
					</tr>
				</xsl:if>
      </xsl:if>

       <xsl:if test="//subItems/treatment!=''">
       <tr>
         <td valign="top">
	   <xsl:apply-templates select="//subItems/treatment"/>
	   <!--<xsl:apply-templates select="//subItems/assessment"/>-->
         </td>
       </tr>
       </xsl:if>
       <xsl:if test="//subItems/allergyskintest!=''">
       <tr>
         <td valign="top">
	   <xsl:apply-templates select="//subItems/allergyskintest"/>
	   <!--<xsl:apply-templates select="//subItems/assessment"/>-->
         </td>
       </tr>
       </xsl:if>

       <xsl:if test="//subItems/alerts!=''">
       <tr>
         <td valign="top">
	   <xsl:apply-templates select="//subItems/alerts"/>
         </td>
       </tr>
       </xsl:if>       

       <xsl:if test="//subItems/Procedure!=''">
       <tr>
         <td valign="top">
	   <xsl:apply-templates select="//subItems/Procedure"/>
         </td>
       </tr>
       </xsl:if>

       <xsl:if test="//subItems/Immunization!=''">
       <tr>
         <td valign="top">
       <xsl:apply-templates select="//subItems/Immunization"/>
         </td>
       </tr>
       </xsl:if>

       <xsl:if test="//subItems/Injection!=''">
       <tr>
         <td valign="top">
       <xsl:apply-templates select="//subItems/Injection"/>
         </td>
       </tr>
       </xsl:if>
       
       <xsl:if test="//subItems/xrays!=''">
       <tr>
         <td valign="top">
       		<xsl:apply-templates select="//subItems/xrays"/>
         </td>
       </tr>
       </xsl:if>

       <xsl:if test="//subItems/labs!=''">
       <tr>
         <td valign="top">
	   <xsl:apply-templates select="//subItems/labs"/>
         </td>
       </tr>
       </xsl:if>
       
       <xsl:if test="//subItems/ProcedureReport!=''">
       <tr>
         <td valign="top">
	   <xsl:apply-templates select="//subItems/ProcedureReport"/>
         </td>
       </tr>
       </xsl:if>
       
       

       <xsl:if test="//subItems/preventive!=''">
       <tr>
         <td valign="top">
	   <xsl:apply-templates select="//subItems/preventive"/>
         </td>
       </tr>
       </xsl:if>

       <xsl:if test="//subItems/procedures!=''">
       <tr>
         <td valign="top">
	   <xsl:apply-templates select="//subItems/procedures"/>
         </td>
       </tr>
       </xsl:if>

	 	 <!-- Aftercare module -->
	    <xsl:if test="//subItems/item/CallbackHistory!='' ">
	   		<tr>
				<td valign="top">
					<xsl:apply-templates select="//subItems/item/CallbackHistory"/>
				</td>
			</tr>
	    </xsl:if>

       <xsl:if test="//subItems/DispositionAndCommunication!=''">
       
       <tr>
         <td valign="top">
	   <xsl:apply-templates select="//subItems/DispositionAndCommunication"/>
         </td>
       </tr>
       </xsl:if>
		 <xsl:if test="//subItems/Drawing!=''">
       <tr>
         <td valign="top">
       <table  cellspacing="0" cellpadding="0" width="100%">
       		<xsl:if test="//return/SummeryView= 'true' or $ShowThumbNailsInProgressNotes != 'yes'">
    			<tr><td  class="rightPaneHeading"><b>Images:</b></td></tr>
   			</xsl:if>
   			<xsl:variable name="maindoc" select='//subItems/maindoc'/>
				<xsl:if test="$maindoc= 'true'">
			 		<xsl:choose>
							
			             <xsl:when test="//return/SummeryView='true'">
							<xsl:choose>
					             <xsl:when test="$ShowThumbNailsInProgressNotes = 'yes'">
						             <tr>
						           		<td> <iframe name="imageIframe" id="imageIframe_0_0" src= "/mobiledoc/jsp/catalog/xml/imageInPN.jsp?section=ProgressNotes&amp;encId=&#123;&#36;EncounterId&#125;&amp;catId=0&amp;itemId=0" scrolling="no" frameborder="0" style="border:21px; width:99%; height:{$ThumbNailHeight}px; overflow:hidden;" allowTransparency="true"></iframe></td>
						            </tr>
					            </xsl:when>
					            <xsl:otherwise>
							         <xsl:for-each select="//subItems/Drawing">
										<tr><td class="rightPaneData">Drawing:<xsl:value-of select="CustomName"/></td></tr>
									</xsl:for-each>
				             	</xsl:otherwise>
				            </xsl:choose>
			            </xsl:when>
					    <xsl:otherwise>
					       <xsl:if test="//return/ShowThumbNailsInProgressNotes != 'yes'">
		             			<xsl:for-each select="//subItems/Drawing">
									<tr><td class="rightPaneData">Drawing:<xsl:value-of select="CustomName"/></td></tr>
								</xsl:for-each>
		             		</xsl:if>
		                </xsl:otherwise>
		             </xsl:choose>
	             </xsl:if>
    		<tr height="5"><td></td></tr>
  		</table>
  		</td>
  		</tr>
		</xsl:if>
       <xsl:if test="//subItems/FollowUp!=''">
       <tr>
         <td valign="top">
	   <xsl:apply-templates select="//subItems/FollowUp"/>
         </td>
       </tr>
       </xsl:if>

       <xsl:if test="//subItems/disposition!=''">
       <tr>
         <td valign="top">
	   <xsl:apply-templates select="//subItems/disposition"/>
         </td>
       </tr>
       </xsl:if>

	<xsl:if test="$ShowThumbNailsInProgressNotes = 'yes' and (count(//return/SummeryView) = 0 or //return/SummeryView='false')">
		<xsl:if test="count(//return/Drawings/DrawingItem) != 0">
			<tr height="10">
			   <td/>
			</tr>
			<tr><td valign="top">
			<xsl:variable name="OnDemandLoadThumbnail" select='//return/OnDemandLoadThumbnail'/>
			<font class="rightPaneHeading"><b>Images</b></font><xsl:if test="$OnDemandLoadThumbnail = 'yes'"><img  class="noprint" height="16" width="16" src="/mobiledoc/jsp/catalog/xml/downarrow.jpg"  onclick="DownloadAllImage(this)"/></xsl:if><br/>
			<xsl:apply-templates select="//return/Drawings/DrawingItem"/>
			</td></tr>
		</xsl:if>
	</xsl:if>
	<xsl:if test="//subItems/CCMRHRALIST!=''">
		<tr>
			<td valign="top">
				<xsl:apply-templates select="//subItems/CCMRHRALIST"/>
			</td>
		</tr>
   	</xsl:if>
	<!-- Display Care Plan (if any) -->
    <xsl:if test="//subItems/CCMRCATLIST!=''">
		<tr>
			<td valign="top">
				<xsl:apply-templates select="//subItems/CCMRCATLIST"/>
			</td>
		</tr>
	</xsl:if>
	
	<xsl:if test="//return/Resident !=''">
		<xsl:if test="//return/ResidentInfo">
	       	<tr height="10">
		   <td/>
		</tr>
		<tr><td valign="top">
		   <xsl:variable name="image2" select="//return/ResidentInfo/RenderingPrUname"/>
		   <xsl:variable name="ProviderSignaturePostFix" select="//return/ProviderSignaturePostFix"/>		   		   					   		   
		   <img id="signature" width="175px" height="100px" src="/mobiledoc/jsp/catalog/xml/{$image2}.jpg?providerSignaturePostFix={$ProviderSignaturePostFix}"></img></td></tr>
		</xsl:if>
	</xsl:if>
	
	 
	<xsl:if test="//return/Resident !=''">
		<tr><td>&#160;</td></tr>
		<tr class="PNSig"><td><b>Appointment Provider:</b>&#160;<xsl:value-of select="//return/provider"/></td></tr>
        </xsl:if>

	<xsl:if test="//return/Resident !='' and //return/AttPrNotes !='' and //return/cosignFormate = 'false'">

		<tr class="PNSig"><td><br/><b>Confirmatory sign off:</b><br/></td></tr>
		<tr><td>&#160;&#160;&#160;<xsl:value-of select="//return/AttPrNotes"/></td></tr>
	</xsl:if>
	
	
	<!-- Neeraj Strat -->
	<xsl:if test="//return/cosignFormate = 'true'">
		<table>
			<xsl:if test="//return/ShowSignature='Yes' and //return/notShowApptSign=''">
		       	<tr height="10">
			   <td/>
			</tr>
		       <tr>
			 <td valign="top">
			   <xsl:variable name="image" select="//return/userName"/>
			   <xsl:variable name="ProviderSignaturePostFix" select="//return/ProviderSignaturePostFix"/>		   		   					   		   		   
			   <img id="signature" width="175px" height="100px" src="/mobiledoc/jsp/catalog/xml/{$image}.jpg?providerSignaturePostFix={$ProviderSignaturePostFix}"> </img>
			 </td>
			</tr>
			<tr height="10">
			   <td/>
			</tr>
		</xsl:if>
	
	    <xsl:if test="//return/TimeStamp!=''">
	       	<tr height="20">
				<td/>
			</tr>
			<tr class="PNSig">
		         <td valign="top">
			         <xsl:value-of select="//return/TimeStamp"/>
		         </td>
			</tr>
			<xsl:if test="//return/Resident !='' and //return/AttPrNotes !='' ">
				<tr class="PNSig"><td><br/><b>Confirmatory sign off:</b><br/></td></tr>
				<tr><td>&#160;&#160;&#160;<xsl:value-of select="//return/AttPrNotes"/></td></tr>
			</xsl:if>
			
			<xsl:if test="//return/EnableBatchCoSign!='' and //return/CoSignedBy!='' and //return/CoSignedUname!=''">
				<tr>
					<td>
						<xsl:variable name="image" select="//return/CoSignedUname"/>
						<xsl:variable name="ProviderSignaturePostFix" select="//return/ProviderSignaturePostFix"/>		   		   					
						<img id="signature" width="175px" height="100px" src="{$image}.jpg?providerSignaturePostFix={$ProviderSignaturePostFix}"> </img>					
					</td>
				</tr>
			</xsl:if>
			<xsl:if test="//return/CoSignedBy!=''">
				<tr class="PNSig">
		         <td valign="top">
			   		<xsl:value-of select="//return/CoSignedBy"/>
		         </td>
				</tr>
			</xsl:if>
	
			<tr class="PNSig">
		         <td valign="top">
			   <xsl:value-of select="//return/SignOffStatus"/>
		         </td>
			</tr>
	    </xsl:if>
	  </table>
	</xsl:if>

       <!--Signature goes here-->
	<xsl:if test="//return/ShowSignature='Yes' and //return/notShowApptSign='' and //return/cosignFormate = 'false'">
	       	<tr height="10">
		   <td/>
		</tr>
	       <tr>
		 <td valign="top">
		   <xsl:variable name="image" select="//return/userName"/>
		   <xsl:variable name="ProviderSignaturePostFix" select="//return/ProviderSignaturePostFix"/>		   		   					   		   		   
		   <img id="signature" width="175px" height="100px" src="/mobiledoc/jsp/catalog/xml/{$image}.jpg?providerSignaturePostFix={$ProviderSignaturePostFix}"> </img>
		 </td>
		</tr>
		<tr height="10">
		   <td/>
		</tr>
	</xsl:if>

    <xsl:if test="//return/TimeStamp!='' and //return/cosignFormate = 'false'">
       	<tr height="20">
			<td/>
		</tr>
		<tr class="PNSig">
	         <td valign="top">
		   <xsl:value-of select="//return/TimeStamp"/>
	         </td>
		</tr>
		
		<xsl:if test="//return/EnableBatchCoSign!='' and //return/CoSignedBy!='' and //return/CoSignedUname!=''">
			<tr>
				<td>
					<xsl:variable name="image" select="//return/CoSignedUname"/>
					<xsl:variable name="ProviderSignaturePostFix" select="//return/ProviderSignaturePostFix"/>		   		   					
					<img id="signature" width="175px" height="100px" src="{$image}.jpg?providerSignaturePostFix={$ProviderSignaturePostFix}"> </img>					
				</td>
			</tr>
		</xsl:if>
		<xsl:if test="//return/CoSignedBy!=''">
			<tr class="PNSig">
	         <td valign="top">
		   		<xsl:value-of select="//return/CoSignedBy"/>
	         </td>
			</tr>
		</xsl:if>

		<tr class="PNSig">
	         <td valign="top">
		   <xsl:value-of select="//return/SignOffStatus"/>
	         </td>
		</tr>
    </xsl:if>
	<xsl:if test="//return/showVisitStatusOnPN='yes'">
		<tr class="PNSig">
			<td valign="top">
				Visit Status:&#160;
			<xsl:value-of select="//return/encStatus"/>
	     </td>
		</tr>
	</xsl:if>

<!-- Anita -->
      <xsl:if test="//return/addendums!=''">
       <tr>
         <td valign="top">
	   <xsl:apply-templates select="//return/addendums"/>
         </td>
       </tr>
       </xsl:if>

	<tr height="10">
	   <td/>
	</tr>

	<!--<tr class="Facility">
	 <td width="100%" align="center"><hr/><br/>
	   <xsl:value-of select="//return/HospitalName"/><br/>
	   <xsl:value-of select="//return/HospitalAddress1"/><br/>
	   <xsl:value-of select="//return/HospitalAddress3"/><br/>
	   Tel:&#160;<xsl:value-of select="//return/HospitalPhone"/><br/>
	   Fax:&#160;<xsl:value-of select="//return/HospitalFax"/><br/>
         </td>
       </tr>-->
 
	
     
     </table>
     </td>
     </tr>
     </tbody>
     
    
     
   </table>

   </td></tr>
   </tbody>
   <tfoot style="display:table-footer-group">
            <tr>
              <td>
                <br/><hr/>
                <table cellspacing="0" cellpadding="0" border="0" width="100%">
                  <tr class="TableFooter">
		   <td align="left">Patient:&#160;<xsl:value-of select="//return/patient"/></td>
		   <td align="right">
			<xsl:if test="//return/Resident !=''">
			Appointment Provider:&#160;
			</xsl:if>
			<xsl:if test="//return/Resident =''">
			Provider:&#160;
			</xsl:if>
			<xsl:value-of select="//return/provider"/></td>
                  </tr>
		  <tr class="TableFooter">
		   <td align="left">DOB:&#160;<xsl:value-of select="//return/DOB"/></td>
		   <td align="right">Date:&#160;<xsl:value-of select="//return/encDate"/></td>
                  </tr>
		  <tr height="10">
			<td/>
		  </tr>
		 </table>
		 <table cellspacing="0" cellpadding="0" border="0" width="100%">
		  <tr class="eclinicalworks">
		    <td align="center">Note generated by eClinicalWorks EMR/PM Software (www.eClinicalWorks.com)</td>
                  </tr>
                </table>
              </td>
            </tr>
    </tfoot>
   </table>
      <!--
      <xsl:otherwise>
         <xsl:apply-templates select="item"/>
      </xsl:otherwise> -->

   <span name="chartLockedId" id="chartLockedId" style="display:none; color:white"><xsl:value-of select="//return/chartLocked"/></span>   
  </BODY>
  </HTML>
</xsl:template>

<xsl:template match="addendums">
  <p>&#160;</p>
  <table cellspacing="0" cellpadding="0" width="100%">
    <tr class="rightPaneHeading"><td COLSPAN="2">Addendum:</td></tr>
    <tr class="rightPaneData"><td>
	 <xsl:apply-templates select="addendum"/>
    </td></tr>
    <tr height="5"><td></td></tr>
  </table>
</xsl:template>

<xsl:template match="addendum">
	<tr class="rightPaneData"><td width="10"></td><td><xsl:value-of select="date"/>&#160;<xsl:value-of select="time"/>&#160;<xsl:value-of select="userName"/>&#160;&#62;&#160;<xsl:value-of select="notes"/></td></tr>
	<xsl:if test="showSignForAddendum = 'yes' and userType='1'">
		<tr class="rightPaneData">
			<td width="10"></td>
			<td>
			    <xsl:variable name="image" select="loginName"/>
				<xsl:variable name="ProviderSignaturePostFix" select="//return/ProviderSignaturePostFix"/>		   		   					   		   				
				<img id="addsignature" width="175px" height="100px" src="/mobiledoc/jsp/catalog/xml/{$image}.jpg?providerSignaturePostFix={$ProviderSignaturePostFix}"> </img>
			</td>
		</tr>
	</xsl:if>
</xsl:template>



<xsl:template match="ResidentInfo">
		   <xsl:variable name="image2" select="RenderingPrUname"/>
		   <img id="signature" width="175px" height="100px" src="/mobiledoc/jsp/catalog/xml/{$image2}.jpg"> </img>

</xsl:template>
<xsl:template match="DrawingItem">
<table class="table1" cellspacing="0" cellpadding="0" width="100%">
		<tr>
			<td>
				<table>
					<xsl:for-each select="item">
						
						<xsl:variable name="catname" select='catname'/>
						<xsl:variable name="itemname" select='itemname'/>
						<xsl:variable name="OnDemandLoadThumbnail" select='//return/OnDemandLoadThumbnail'/>
						<xsl:for-each select="file">
							<xsl:variable name="filename" select='filename'/>
							<xsl:variable name="ftppath" select='ftppath'/>
							<xsl:variable name="load" select='load'/>
							
							<tr height="10">
		   						<td/>
							</tr>
							<tr>
								<td id="td&#123;&#36;filename&#125;|&#123;&#36;ftppath&#125;" >
									<xsl:choose>
									<xsl:when test="$load != 'true'">
										<xsl:attribute name="class">noprint</xsl:attribute>
									</xsl:when>
									<xsl:otherwise>
										<xsl:attribute name="class"></xsl:attribute>
									</xsl:otherwise>
									</xsl:choose>
									<xsl:choose>
										<xsl:when test="$OnDemandLoadThumbnail != 'yes'">
												
												<b><font size="2"><xsl:value-of select="filepath"/></font></b><br/>
												<img class="imageClass toPrintImage" src="/mobiledoc/ecwimage?operation=download&amp;filename=&#123;&#36;filename&#125;&amp;filepath=&#123;&#36;ftppath&#125;" filename="&#123;&#36;filename&#125;" filepath="&#123;&#36;ftppath&#125;"></img><br/>
										</xsl:when>
										<xsl:otherwise>
											<b><font size="2"><xsl:value-of select="filepath"/></font></b>
											
												<xsl:choose>
													<xsl:when test="$load !='true'">
														&#160;<img  class="noprint" height="16" width="16" src="/mobiledoc/jsp/catalog/xml/downarrow.jpg" id="&#123;&#36;filename&#125;|&#123;&#36;ftppath&#125;" onclick="DownloadImage(this)"/>
														<br/>
														<div id="div&#123;&#36;filename&#125;|&#123;&#36;ftppath&#125;"/>
													</xsl:when>
													<xsl:otherwise>
																&#160;<img  class="noprint" height="16" width="16" src="/mobiledoc/jsp/catalog/xml/uparrow.jpg" id="&#123;&#36;filename&#125;|&#123;&#36;ftppath&#125;" onclick="DownloadImage(this)"/>
														<br/>
														<div id="div&#123;&#36;filename&#125;|&#123;&#36;ftppath&#125;" >
														<img class="imageClass toPrintImage" id="img|&#123;&#36;filename&#125;|&#123;&#36;ftppath&#125;" src="/mobiledoc/ecwimage?operation=download&amp;filename=&#123;&#36;filename&#125;&amp;filepath=&#123;&#36;ftppath&#125;" filename="&#123;&#36;filename&#125;" filepath="&#123;&#36;ftppath&#125;"></img><br/>
														</div>
													</xsl:otherwise>
												</xsl:choose>
												
											
										</xsl:otherwise>
									</xsl:choose>
								
								</td>
							</tr>
						</xsl:for-each>
					</xsl:for-each>	
				</table>
			</td>
		</tr>
		
		<tr height="10">
		   <td/>
		</tr>
 </table>
</xsl:template>

<xsl:template match="notes">
  <table cellspacing="0" cellpadding="0" width="100%" border="0">
	<tr class="rightPaneData"><td><xsl:value-of select="."/></td></tr>
  </table>
</xsl:template>

<xsl:template match="notesBR">
  <table cellspacing="0" cellpadding="0" width="100%" border="0">
    <tr class="rightPaneData"><td><xsl:value-of select="." disable-output-escaping="yes"/></td></tr>
  </table>
</xsl:template>
<xsl:template match="ptDiscussHtm">
  <table cellspacing="0" cellpadding="0" width="100%" border="0">
    <tr class="rightPaneData"><td><xsl:value-of select="." disable-output-escaping="yes"/></td></tr>
  </table>
</xsl:template>
<xsl:template match="axis4">
  <table cellspacing="0" cellpadding="0" width="100%" border="0">
	<tr class="rightPaneData"><td>Axis IV: <xsl:value-of select="."/></td></tr>
  </table>
</xsl:template>

<xsl:template match="axis5">
  <table cellspacing="0" cellpadding="0" width="100%" border="0">
	<tr class="rightPaneData"><td>Axis V: <xsl:value-of select="."/></td></tr>
  </table>
</xsl:template>

<!--<xsl:template match="subItemsName">
    <br/><span class="font1"><b><xsl:value-of select="."/></b></span><br/>
</xsl:template>

<xsl:template match="itemName">
    <span style='color:black;'><b><xsl:value-of select="."/></b></span>
</xsl:template>

<xsl:template match="itemValue">
  <xsl:value-of select="."/>
</xsl:template>

<xsl:template match="categoryName">
  &#160;&#160;&#160;&#160;
    <xsl:value-of select="."/><br/>
</xsl:template>

<xsl:template match="categoryValue">
    <xsl:value-of select="."/>
</xsl:template>

<xsl:template match="categoryNotes">
    <xsl:value-of select="."/>
</xsl:template>

<xsl:template match="itemRemNotes">
  &#160;&#160;&#160;&#160;&#160;
    <xsl:value-of select="."/><br/>
</xsl:template>

<xsl:template match="itemAdtlNotes">
  &#160;&#160;&#160;&#160;&#160;
    <xsl:value-of select="."/><br/>
</xsl:template>

<xsl:template match="itemNotes">
  &#160;&#160;&#160;&#160;&#160;
    <xsl:value-of select="."/><br/>
</xsl:template>-->
<xsl:template match="allergyskintest">
    <table class="table1" cellspacing="0" cellpadding="0" width="100%">
        <tr><td class="rightPaneHeading"><b>Allergy Skin Test:</b></td></tr>
        <tr class="rightPaneData">
            <td >
                <table class="rightPaneData">
                     <xsl:if test="poselements/allergen" >
                    <tr>
                        <td>
                            <xsl:value-of select="positivemsg" disable-output-escaping="yes"/> <xsl:text disable-output-escaping="yes"><![CDATA[&nbsp;]]></xsl:text> 
                            <xsl:for-each select="poselements/allergen">
                                <xsl:value-of select="." disable-output-escaping="yes"/>
                                <xsl:if test="position() != last()" >,</xsl:if>
                            </xsl:for-each>
                        </td>
                    </tr>
                    </xsl:if>
                    <xsl:if test="negelements/allergen" >
                    <tr>
                        <td>
                            <xsl:value-of select="negativemsg" disable-output-escaping="yes"/> <xsl:text disable-output-escaping="yes"><![CDATA[&nbsp;]]></xsl:text> 
                            <xsl:for-each select="negelements/allergen">
                                <xsl:value-of select="." disable-output-escaping="yes"/>
                                <xsl:if test="position() != last()" >,</xsl:if>
                            </xsl:for-each>
                        </td>
                    </tr>
                    </xsl:if>
                    <xsl:if test="notes!=''" >
                    <tr>
                        <td>
                            Analysis : <xsl:value-of select="notes" disable-output-escaping="yes"/><xsl:text disable-output-escaping="yes"><![CDATA[&nbsp;]]></xsl:text> 
                        </td>
                    </tr>
                    </xsl:if>
                    <tr>
                        <td><xsl:value-of select="revieweddtls" disable-output-escaping="yes"/></td>
                    </tr>
              </table>
            </td>
        </tr>
    </table>	
    <br/>	  
</xsl:template>
<xsl:template match="treatment">
<xsl:choose>
<xsl:when test="assessment != ''">
  <table cellspacing="0" cellpadding="0" width="100%">
    <tr class="rightPaneHeading"><td><xsl:value-of select="//return/ChartHeadings/Treatment"/></td></tr>
    <tr class="rightPaneData"><td>
      <table cellspacing="0" cellpadding="0" width="100%">
        <xsl:for-each select="assessment">
          <tr class="rightPaneData"><td>
	  <xsl:if test="(position()!=1)"><br/></xsl:if>
           <b><xsl:value-of select="position()"/>&#46;&#160;<xsl:value-of select="name"/></b>&#160;
           <xsl:for-each select="rx"><br/>
             <xsl:value-of select="."/>
             
           </xsl:for-each>
          
           	   <xsl:for-each select="Test">
           	   		<xsl:if test="position() = 1">
           	   			 <br/>
           	   		</xsl:if>
				   &#160;&#160;&#160;&#160;&#160;<u>LAB: <xsl:value-of select="TestName" /></u>
				    <xsl:if test="Result">
				        &#160;<span class="normaltext"><xsl:value-of select="Result" /></span>
				    </xsl:if>
				    <xsl:if test="TestValues">
				    	      <xsl:apply-templates select="TestValues"/>
				    </xsl:if>

				    <xsl:if test="Notes !=''">
				   		<xsl:apply-templates select="Notes"/>
				    </xsl:if>
				    
				   <xsl:if test="Collection !=''">
				    	<xsl:apply-templates select="Collection"/>
				    </xsl:if>
				    
				    <xsl:if test="Location !=''">
				    	<xsl:apply-templates select="Location"/>
				    </xsl:if>
				   
				    <xsl:if test="RuleOut !=''">
				    	<xsl:apply-templates select="RuleOut"/>
				    </xsl:if>	
				   
				    <xsl:if test="not(TestValues)">
			    		<xsl:if test="Notes ='' and position()!=last()">
			    	    	<br />
			    	  	</xsl:if>
    			   </xsl:if>
    			   <xsl:if test="CntLineValid ='1'">
				   		<span>Control Line Valid</span>
				    </xsl:if>
	           </xsl:for-each>
	           
	           <xsl:for-each select="Xrayname">
	           		<xsl:if test="position() = 1">
           	   			 <br/>
           	   		</xsl:if>
	          	 	&#160;&#160;&#160;&#160;&#160;<u>Imaging: <xsl:value-of select="TestName" /></u>
				    <xsl:if test="Result !=''">
				        &#160;<span class="normaltext"><xsl:value-of select="Result" /></span>
				    </xsl:if>
				    <xsl:if test="TestValues">
				        <xsl:apply-templates select="TestValues"/>
				    </xsl:if>
				    <xsl:if test="Notes !=''">
				   		<xsl:apply-templates select="Notes"/>
				    </xsl:if>
				    <xsl:if test="not(TestValues)">
			    		<xsl:if test="Notes ='' and position()!=last()">
			    	    	<br />
			    	  	</xsl:if>
    			   	   </xsl:if>
    			   	   <xsl:if test="xRaysElectronic">
				   	<xsl:apply-templates select="xRaysElectronic"/>
					</xsl:if>
			</xsl:for-each>
	     
	     <xsl:for-each select="Procedurename">
	     			<xsl:if test="position() = 1">
           	   			 <br/>
           	   		</xsl:if>
	          	   &#160;&#160;&#160;&#160;&#160;<u>Procedure: <xsl:value-of select="TestName" /></u>
				    <xsl:if test="Result !=''">
				        &#160;<span class="normaltext"><xsl:value-of select="Result" /></span>
				    </xsl:if>
				    <xsl:if test="TestValues">
				        <xsl:apply-templates select="TestValues"/>
				    </xsl:if>
				    <xsl:if test="Notes !=''">
				   		<xsl:apply-templates select="Notes"/>
				    </xsl:if>
				    <xsl:if test="not(TestValues)">
			    		<xsl:if test="Notes ='' and position()!=last()">
			    	    	<br />
			    	  	</xsl:if>
    			   </xsl:if>
    			   
		</xsl:for-each>
	           
           <xsl:for-each select="notes">
            <br/><xsl:value-of select="."/>&#160;&#160;
           </xsl:for-each>
             <xsl:for-each select="notesBR">
            <br/><xsl:value-of select="." disable-output-escaping="yes"/>&#160;&#160;
           </xsl:for-each>
           <xsl:for-each select="ptDiscussHtm">
            <br/><xsl:value-of select="." disable-output-escaping="yes"/>&#160;&#160;
           </xsl:for-each>
 <xsl:for-each select="Referral">
  &#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;
  <br/> Referral To:<xsl:value-of select="RefName" />
     <xsl:if test="RefTo !=''"><xsl:value-of select="RefTo" /></xsl:if>
      <xsl:if test="FacilityTo !=''">&#160;<xsl:value-of select="FacilityTo" />
    </xsl:if>
     <xsl:if test="Speciality !=''">
     &#160;&#160;
    <xsl:value-of select="Speciality" />
    </xsl:if>
    <br/>&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;Reason:<xsl:value-of select="Reason" /><br/>
    </xsl:for-each>
    <xsl:for-each select="Action">
    	&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;<br/>
    	<xsl:value-of select="ActionName" />
    	<xsl:if test="ActionDesc !=''">
    		<br/><xsl:value-of select="ActionDesc" />
    	</xsl:if>
    </xsl:for-each>
           <xsl:for-each select="PtedLog">
		<br/><xsl:value-of select="PtedLogHeader" />
		<xsl:if test="PtedLogTitles">
        <xsl:for-each select="PtedLogTitles">
			<xsl:value-of select="PtedSeparator" />
        	<span class="ptedloglink" ng-click="loadPtedPrint('{PtedUrl}','{PtedVersion}','{PtedContentId}','{PtedLanguage}');">  
			<xsl:attribute name="PtedUrl">
                	<xsl:value-of select="PtedUrl" />
            	</xsl:attribute>
            	<xsl:attribute name="PtedVersion">
                	<xsl:value-of select="PtedVersion" />
           	 </xsl:attribute>    
            	<xsl:attribute name="PtedContentId">
                	<xsl:value-of select="PtedContentId" />
            	</xsl:attribute>  
            	<xsl:attribute name="PtedLanguage">
                	<xsl:value-of select="PtedLanguage" />
            	</xsl:attribute>   
            	<xsl:value-of select="PtedTitle" />
        	</span>  
        </xsl:for-each>
		</xsl:if>
		<xsl:if test="PtedLogHeader!=''"> 
		<br /> 
		</xsl:if> 
    </xsl:for-each>
          </td></tr>

        </xsl:for-each>
      </table>
    </td></tr>
  </table>
  </xsl:when>
  </xsl:choose>
</xsl:template>


<xsl:template match="CurrentMeds">
  <table cellspacing="0" cellpadding="0" width="100%" border="0">
    <tr class="rightPaneHeading"><td><xsl:value-of select="//return/ChartHeadings/CurrentMedication"/></td></tr>
    <tr class="rightPaneData"><td>
     <xsl:for-each select="category">
         <span style="font:bold; padding:0px;">
             <xsl:value-of select="categoryName"/>
         </span>
         <xsl:for-each select="categoryValue">
 		<table class="rightPaneData" cellspacing="0" cellpadding="0">
		  <tr>
                    <td>
                       <li>
                       <xsl:value-of select="."/>
                       </li>
                     </td>
		  </tr>
                </table>
         </xsl:for-each>    
     </xsl:for-each>
    <xsl:variable name="hasMed">
        <xsl:value-of select="itemValue"/>
    </xsl:variable>
    <xsl:if test="$hasMed='None'">
           <table class="rightPaneData" cellspacing="0" cellpadding="0">
            <tr>
                  <td>
                        <xsl:value-of select="itemValue"/>
                   </td>
             </tr>
           </table>
    </xsl:if> 
     </td></tr>
  </table>
</xsl:template>

<xsl:template match="PastHistory">
  
  <table cellspacing="0" cellpadding="0" width="100%">
    <tr class="rightPaneHeading"><td><xsl:value-of select="//return/ChartHeadings/MedicalHistory"/></td></tr>
    <tr class="rightPaneData"><td>
     <xsl:for-each select="itemValue">
 		<table class="rightPaneData" cellspacing="0" cellpadding="0">
		  <tr>
			<td>
			   &#160;&#160;&#160;&#160;&#160;<xsl:value-of select="."/>.<br/>
			 </td>
		   </tr>
		 </table>
     </xsl:for-each>
     </td>
    </tr>
  </table>
<!--Start of structure data-->   
  <xsl:variable name="structDataDisplay" select='structDataDisplay'/>
  <table cellspacing="0" cellpadding="0" width="100%">
    <tr class="rightPaneData">
        <td width="10"></td>
        <td>
         <xsl:for-each select="category">
         <xsl:variable name="structFlag" select='structDataDisplay'/>         
                 <xsl:if test="count(StData) != 0">
                 		<xsl:if test="$structFlag = 0">
                 		&#160;
         			 		<xsl:for-each select="StData">
	                        	<xsl:value-of select="name"/>&#160;<i><xsl:value-of select="value"/>.&#160;</i>
	                        </xsl:for-each>
	         			</xsl:if>
	         			<xsl:if test="$structFlag = 1">
         			 		<xsl:for-each select="StData">
	                        	&#160;&#160;<xsl:value-of select="name"/>&#160;<i><xsl:value-of select="value"/>.&#160;</i><br/>
	                        </xsl:for-each>
	         			</xsl:if>
	         			<xsl:if test="$structFlag = 2">
                 		&#160;
         			 		<xsl:for-each select="StData">
	                        	<xsl:value-of select="name"/>&#160;<b><xsl:value-of select="value"/>.&#160;</b>
	                        </xsl:for-each>
	         			</xsl:if>
              </xsl:if>
              <xsl:if test="count(StData) = 0">
                 <xsl:value-of select="value"/>&#160;
             </xsl:if>
         </xsl:for-each>
    </td></tr>
   <tr height="5"><td></td></tr>
  </table>
  <!--End of structure data-->
</xsl:template>

<xsl:template match="DentalHistory">
<xsl:if test="//subItems/DentalHistory/category !=''">
  <table class="table1" cellspacing="0" cellpadding="0" width="100%">
  <!-- Do not change this 'Dental History :' string, because this value is used to handle click event on it-->
    <tr class="rightPaneHeading"><td>Dental History :&#160;<br></br>
      <xsl:for-each select="category">
	&#160;&#160;&#160;<xsl:value-of select="position()"/>&#46;&#160;<b><xsl:value-of select="categoryName"/></b>	
<xsl:for-each select="dentalDetail"> &#160;&#160;&#160;&#160;
 <table style="width:100%" cellspacing="0" cellpadding="0">
				<tr><td style="width:4%"></td>
					<td><li>
<span class="normaltext"><FONT COLOR="black" SIZE="2"><xsl:value-of select="dentalItemName" /><xsl:if test="value !=''">&#160;</xsl:if><xsl:value-of select="dentalItemValue" />&#160;&#160;<xsl:value-of select="dentalNotes" /></FONT>
</span>
</li></td>
	    		</tr>
	    	  </table>
 </xsl:for-each>
  </xsl:for-each>
    </td></tr>
   <tr height="5"><td></td></tr>
   </table>
   </xsl:if>
</xsl:template>

<xsl:template match="SurgicalHistory">
  <xsl:choose>
  <xsl:when test=". != ''">
  <table cellspacing="0" cellpadding="0" width="100%">
    <tr class="rightPaneHeading"><td><xsl:value-of select="//return/ChartHeadings/SurgicalHistory"/></td></tr>
    <tr class="rightPaneData"><td>
     <xsl:for-each select="itemValue">
 		<table class="rightPaneData" cellspacing="0" cellpadding="0">
		  <tr>
			<td>
			   <xsl:value-of select="."/>
			 </td>
		   </tr>
		 </table>
     </xsl:for-each>
     </td></tr>
  </table>
  </xsl:when>
  </xsl:choose>
</xsl:template>

<xsl:template match="FamilyHistory">
  <xsl:choose>
  <xsl:when test=". != ''">
  <table cellspacing="0" cellpadding="0" width="100%">
    <tr class="rightPaneHeading"><td><xsl:value-of select="//return/ChartHeadings/FamilyHistory"/></td></tr>
    <tr class="rightPaneData"><td>
     <xsl:for-each select="itemValue">
 		<table class="rightPaneData" cellspacing="0" cellpadding="0">
		  <tr>
			<td>
			   <xsl:value-of select="."/>
			 </td>
		   </tr>
		 </table>
     </xsl:for-each>
     <xsl:for-each select="itemValueBR">
        <table class="rightPaneData" cellspacing="0" cellpadding="0">
          <tr>
            <td>
               <xsl:value-of select="." disable-output-escaping="yes"/>
             </td>
           </tr>
         </table>
     </xsl:for-each>
     </td></tr>
  </table>
  </xsl:when>
  </xsl:choose>
</xsl:template>

<xsl:template match="SocialHistory">
<xsl:variable name="structDataDisplay" select='structDataDisplay'/>
  <xsl:choose>
  <xsl:when test=". != ''">
  <table cellspacing="0" cellpadding="0" width="100%">
    <tr class="rightPaneHeading"><td><xsl:value-of select="//return/ChartHeadings/SocialHistory"/></td></tr>
    <tr class="rightPaneData"><td>


      <xsl:for-each select="category">
      <xsl:variable name="treeview" select='count(categoryName)'/>
             <xsl:if test="not(position()=1)">
               <br/>
             </xsl:if>
             <xsl:if test="count(categoryName) != 0">
			   <u><xsl:value-of select="categoryName"/></u>&#160;
			   <br/>
			   </xsl:if>
			   <xsl:if test="$treeview != 0">
			   &#160;&#160;&#160;&#160;&#160;
			   </xsl:if>
			    <xsl:for-each select="socialDetail">
			    
           <xsl:variable name="structFlag" select='struct'/>
           <xsl:if test="($structFlag='0')">
                <xsl:value-of select="value"/>
                <xsl:if test="Confidential='yes'"><span style="color: red; font-weight: bold;">[Confidential]</span></xsl:if>
           </xsl:if>
           <xsl:if test="($structFlag='1') ">
              <xsl:value-of select="itemname"/>&#160;
              <xsl:if test="Confidential='yes'"><span style="color: red; font-weight: bold;">[Confidential]</span></xsl:if>
           <xsl:if test="count(StData) != 0">
              <xsl:for-each select="StData">
                  <xsl:variable name="stType" select='type'/>
                  <xsl:attribute name="encid">
                   <xsl:value-of select="encId"/>
                  </xsl:attribute>
                  <xsl:attribute name="categoryId">
                   <xsl:value-of select="catId"/>
                  </xsl:attribute>
                  <xsl:attribute name="itemId">
                    <xsl:value-of select="propId"/>
                  </xsl:attribute>
                  <xsl:attribute name="structId">
                    <xsl:value-of select="structId"/>
                  </xsl:attribute>
                  <xsl:attribute name="structType">
                    <xsl:value-of select="type"/>
                  </xsl:attribute>
                  <xsl:choose>
                      <xsl:when test="$structDataDisplay ='1'">
                        <br/>&#160;&#160;
                         <xsl:if test="$treeview != 0">
                            &#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;
                         </xsl:if>
                      </xsl:when>
                      <xsl:when test="($structDataDisplay ='0' or $structDataDisplay ='2') and not(position()=1)">,&#160;</xsl:when>
                  </xsl:choose>
                  <xsl:value-of select="name"/>
                  <xsl:choose>
                     <xsl:when test="$structDataDisplay ='1'">
                     &#160;<i><xsl:value-of select="value"/></i>
                     </xsl:when>
                     <xsl:when test="$structDataDisplay ='0'">
                     &#160;<xsl:value-of select="value"/>
                     </xsl:when>
                     <xsl:when test="$structDataDisplay ='2'">
                     &#160;<b><xsl:value-of select="value"/></b>
                     </xsl:when>
                 </xsl:choose>
              </xsl:for-each>
           </xsl:if>
           <xsl:if test="count(StData) = 0">
            <xsl:value-of select="value"/>.&#160;
           </xsl:if>
              <xsl:if test="($structDataDisplay ='0' or $structDataDisplay ='2') and count(StData) != 0">.&#160;</xsl:if>
           </xsl:if>
           <xsl:if test="($structDataDisplay ='1' or $treeview = 0) and position() != last()">
                <br/><xsl:if test="$treeview != 0">
                            &#160;&#160;&#160;&#160;&#160;
                    </xsl:if>
            </xsl:if>
           
       </xsl:for-each>

     </xsl:for-each>
      <xsl:for-each select="itemValueBR">
        <table class="rightPaneData" cellspacing="0" cellpadding="0">
          <tr>
            <td>
               <xsl:value-of select="." disable-output-escaping="yes"/>
             </td>
           </tr>
         </table>
     </xsl:for-each>
     <xsl:for-each select="category">
	<xsl:if test="categoryNotes !=''">
	<br/>&#160;&#160;&#160;<xsl:value-of select="categoryNotes"/>
	</xsl:if>
      </xsl:for-each>
       <xsl:for-each select="category">
    <xsl:if test="categoryNotesBR !=''">
    <xsl:if test="count(categoryName) != 0">
    <br/>
    </xsl:if><xsl:value-of select="categoryNotesBR" disable-output-escaping="yes"/>
    </xsl:if>
      </xsl:for-each>

     </td></tr>
  </table>
  </xsl:when>
  </xsl:choose>
</xsl:template>

<xsl:template match="gynHistory">
 <xsl:variable name="structDataDisplay" select='structDataDisplay'/>
  <xsl:choose>
  <xsl:when test=". != ''">
  <table cellspacing="0" cellpadding="0" width="100%">
    <tr class="rightPaneHeading"><td><xsl:value-of select="//return/ChartHeadings/GynHistory"/></td></tr>
    <tr class="rightPaneData"><td>
     <xsl:for-each select="category">
                <xsl:if test="position() != 1">
                <br/>
                </xsl:if>
           <xsl:value-of select="catName"/>
                 <xsl:variable name="structFlag" select='struct'/>
                 <xsl:choose>
                 <xsl:when test="$structFlag = 1">
                 <xsl:if test="count(StData) != 0">
                     <xsl:for-each select="StData">
                        <xsl:if test="$structDataDisplay = 1">
                            <br/>&#160;&#160;&#160;&#160;&#160;
                        </xsl:if>
                        <xsl:if test="value != ''">&#160;</xsl:if>
                        <xsl:value-of select="name"/>&#160;<xsl:choose>
                           <xsl:when test="$structDataDisplay = 0">
                               <xsl:value-of select="value"/>
                           </xsl:when>
                           <xsl:when test="$structDataDisplay = 2">
                               <b><xsl:value-of select="value"/></b>
                           </xsl:when>
                           <xsl:when test="$structDataDisplay = 1">
                               <i><xsl:value-of select="value"/></i>
                           </xsl:when>
                         </xsl:choose>
                         <xsl:if test="position() != last() and $structDataDisplay != 1">,&#160;</xsl:if>
                         <xsl:if test="position() = last() and $structDataDisplay != 1">.&#160;</xsl:if>
                     </xsl:for-each>
                  </xsl:if>
                   <xsl:if test="count(StData) = 0">
                      <xsl:value-of select="value"/>.&#160;
                  </xsl:if>
                 </xsl:when>
                 <xsl:otherwise>
                    <xsl:if test="value != ''">&#160;<xsl:value-of select="value"/></xsl:if>.&#160;
                 </xsl:otherwise>
                 </xsl:choose>
     </xsl:for-each>
     </td></tr>
  </table>
  </xsl:when>
  </xsl:choose>
</xsl:template>

<xsl:template match="obHistory">
 <xsl:variable name="structDataDisplay" select='structDataDisplay'/>
  <xsl:choose>
  <xsl:when test=". != ''">
  <table cellspacing="0" cellpadding="0" width="100%">
    <tr class="rightPaneHeading"><td><xsl:value-of select="//return/ChartHeadings/OBHistory"/></td></tr>
    <tr class="rightPaneData"><td>
     <xsl:for-each select="category">
                <xsl:if test="position() != 1">
                <br/>
                </xsl:if>
           <xsl:value-of select="catName"/>&#160;
                 <xsl:variable name="structFlag" select='struct'/>
                 <xsl:choose>
                 <xsl:when test="$structFlag = 1">
                 <xsl:if test="count(StData) != 0">
                     <xsl:for-each select="StData">
                        <xsl:if test="$structDataDisplay = 1">
                            <br/>&#160;&#160;&#160;&#160;&#160;
                        </xsl:if>
                        <xsl:value-of select="name"/>&#160;
                         <xsl:choose>
                           <xsl:when test="$structDataDisplay = 0">
                               <xsl:value-of select="value"/>
                           </xsl:when>
                           <xsl:when test="$structDataDisplay = 2">
                               <b><xsl:value-of select="value"/></b>
                           </xsl:when>
                           <xsl:when test="$structDataDisplay = 1">
                               <i><xsl:value-of select="value"/></i>
                           </xsl:when>
                         </xsl:choose>
                         <xsl:if test="position() != last() and $structDataDisplay != 1">,&#160;</xsl:if>
                         <xsl:if test="position() = last() and $structDataDisplay != 1">.&#160;</xsl:if>
                     </xsl:for-each>
                  </xsl:if>
                   <xsl:if test="count(StData) = 0">
                      <xsl:value-of select="value"/>.&#160;
                  </xsl:if>
                 </xsl:when>
                 <xsl:otherwise>
                    <xsl:value-of select="value"/>.&#160;
                 </xsl:otherwise>
                 </xsl:choose>
     </xsl:for-each>
     </td></tr>
  </table>
  </xsl:when>
  </xsl:choose>
</xsl:template>

<xsl:template match="allergies">
  <xsl:choose>
  <xsl:when test="itemValue != ''">
  <table cellspacing="0" cellpadding="0" width="100%">
    <tr class="rightPaneHeading"><td><xsl:value-of select="//return/ChartHeadings/Allergies"/></td></tr>
    <tr class="rightPaneData"><td>
     <xsl:for-each select="itemValue">
 		<table class="rightPaneData" cellspacing="0" cellpadding="0">
		  <tr>
			<td>
			   <xsl:value-of select="."/>
			 </td>
		   </tr>
		 </table>
     </xsl:for-each>
     </td></tr>
  </table>
  </xsl:when>
  </xsl:choose>
</xsl:template>

<xsl:template match="Hospitalization">
  <xsl:choose>
  <xsl:when test="itemValue != ''">
  <table cellspacing="0" cellpadding="0" width="100%">
    <tr class="rightPaneHeading"><td><xsl:value-of select="//return/ChartHeadings/Hospitalization"/></td></tr>
    <tr class="rightPaneData"><td>
     <xsl:for-each select="itemValue">
 		<table class="rightPaneData" cellspacing="0" cellpadding="0">
		  <tr>
			<td>
			   <xsl:value-of select="."/>
			 </td>
		   </tr>
		 </table>
     </xsl:for-each>
     </td></tr>
  </table>
  </xsl:when>
  </xsl:choose>
</xsl:template>

<xsl:template match="ros">
  <table cellspacing="0" cellpadding="0" width="100%">
    <tr class="rightPaneHeading"><td><xsl:value-of select="//return/ChartHeadings/ROS"/></td></tr>
    <tr class="rightPaneData"><td>
    <xsl:for-each select="category">
      <xsl:if test="(position()!=1)">
	<br/>
      </xsl:if>
      <u><xsl:value-of select="categoryName"/></u>:&#160;
	<xsl:for-each select="rosDetail">
		    <xsl:if test="(position()=1)">
		    	<br/>&#160;&#160;&#160;&#160;&#160;&#160;
		    </xsl:if>

            <xsl:choose>
              <xsl:when test="starts-with(value,'*')"><xsl:value-of select="translate(value,'*','')" />&#160;<xsl:value-of select="name" /></xsl:when>
              <xsl:when test="value = 'yes' "><xsl:value-of select="name" />&#160;<xsl:value-of select="translate(value,'*','')" /></xsl:when>
              <xsl:when test="value = 'no' "><xsl:value-of select="translate(value,'*','')" />&#160;<xsl:value-of select="name" /></xsl:when>
              <xsl:otherwise><xsl:value-of select="name" /><xsl:if test="value !=''">&#160;</xsl:if><xsl:value-of select="translate(value,'*','')" /></xsl:otherwise>
            </xsl:choose>

<xsl:if test="notes !=''">
<xsl:if test="value !=''">,&#160;<xsl:value-of select="rosNotes2" disable-output-escaping="yes"/></xsl:if>
<xsl:if test="value =''">&#160;<xsl:value-of select="rosNotes2" disable-output-escaping="yes"/></xsl:if>
</xsl:if>.&#160;


	</xsl:for-each>
       &#160;&#160;
    </xsl:for-each>
    <xsl:if test="count(category) != 0">
    <br/>
    </xsl:if><xsl:for-each select="notes">
      <xsl:value-of select="."/>
    </xsl:for-each>
    <xsl:for-each select="notesBR">
      <xsl:value-of select="." disable-output-escaping="yes"/>
    </xsl:for-each>
    </td></tr>
  </table>
</xsl:template>

<xsl:template match="cc">
   <xsl:choose>
   <xsl:when test="itemValue != ''">
   <table cellspacing="0" cellpadding="0" width="100%">
     <tr class="rightPaneHeading"><td><xsl:value-of select="//return/ChartHeadings/CC"/></td></tr>
     <tr class="rightPaneData"><td>
     <xsl:for-each select="itemValue">
 		<table class="rightPaneData" cellspacing="0" cellpadding="0">
		  <tr>
			<td>
			   <xsl:value-of select="position()"/>&#46;&#160;<xsl:value-of select="."/>
			 </td>
		   </tr>
		 </table>
     </xsl:for-each>
     </td></tr>
   </table>
   </xsl:when>
   </xsl:choose>
</xsl:template>

<xsl:template match="preventive">
<xsl:variable name="structDataDisplay" select='structDataDisplay'/>
  <xsl:choose>
  <xsl:when test=". != ''">
  <table cellspacing="0" cellpadding="0" width="100%">
    <tr class="rightPaneHeading"><td><xsl:value-of select="//return/ChartHeadings/PreventiveMedicine"/></td></tr>
    <tr class="rightPaneData"><td>
    <xsl:for-each select="category">
        <xsl:if test="count(item) != 0">
        <table class="rightPaneData" cellspacing="0" cellpadding="0">
          <tr>
            <td>
               <xsl:value-of select="categoryname"/>:&#160;
               <xsl:if test="$structDataDisplay = 1">
                <br/>&#160;&#160;&#160;&#160;
               </xsl:if>
               <xsl:for-each select="item">
                  <xsl:if test="position() != 1">
                     <br/>&#160;&#160;&#160;&#160;
                 </xsl:if>
                 <xsl:value-of select="itemname"/>&#160;
                 <xsl:variable name="structFlag" select='struct'/>
                 <xsl:choose>
                 <xsl:when test="$structFlag = 1">
                 <xsl:if test="count(StData) != 0">
                     <xsl:for-each select="StData">
                        <xsl:if test="$structDataDisplay = 1">
                            <br/>&#160;&#160;&#160;&#160;&#160;&#160;&#160;
                        </xsl:if>
                         <xsl:value-of select="name"/>&#160;
                         <xsl:choose>
                           <xsl:when test="$structDataDisplay = 0">
                               <xsl:value-of select="value"/>
                           </xsl:when>
                           <xsl:when test="$structDataDisplay = 2">
                               <b><xsl:value-of select="value"/></b>
                           </xsl:when>
                           <xsl:when test="$structDataDisplay = 1">
                               <i><xsl:value-of select="value"/></i>
                           </xsl:when>
                         </xsl:choose>
                         <xsl:if test="position() != last() and $structDataDisplay != 1">,&#160;</xsl:if>
                         <xsl:if test="position() = last() and $structDataDisplay != 1">.&#160;</xsl:if>
                     </xsl:for-each>
                  </xsl:if>
                   <xsl:if test="count(StData) = 0">
                      <xsl:value-of select="value"/>.&#160;
                  </xsl:if>
                 </xsl:when>
                 <xsl:otherwise>
                    <xsl:value-of select="value"/>.&#160;
                 </xsl:otherwise>
                 </xsl:choose>
               </xsl:for-each>
             </td>
           </tr>
         </table>
         </xsl:if>
     </xsl:for-each>
      <xsl:for-each select="itemValueBR">
        <table class="rightPaneData" cellspacing="0" cellpadding="0">
          <tr>
            <td>
               <xsl:value-of select="." disable-output-escaping="yes"/><br/>
             </td>
           </tr>
         </table>
     </xsl:for-each>
    </td></tr>
  </table>
  </xsl:when>
  </xsl:choose>
</xsl:template>

<xsl:template match="disposition">
  <xsl:choose>
  <xsl:when test=". != ''">
  <table cellspacing="0" cellpadding="0" width="100%">
    <tr class="rightPaneHeading"><td><xsl:value-of select="//return/ChartHeadings/Disposition"/></td></tr>
    <tr class="rightPaneData"><td>
    <xsl:for-each select="itemValue">
 		<table class="rightPaneData" cellspacing="0" cellpadding="0">
		  <tr>
			<td>
			   <xsl:value-of select="."/><br/>
			 </td>
		   </tr>
		 </table>
     </xsl:for-each>
    </td></tr>
  </table>
  </xsl:when>
  </xsl:choose>
</xsl:template>

<xsl:template match="PhysicalExamination">
  <xsl:variable name="structDataDisplay" select='structDataDisplay'/>
  <table cellspacing="0" cellpadding="0" width="100%">
    <tr class="rightPaneHeading"><td><xsl:value-of select="//return/ChartHeadings/PhysicalExamination"/></td></tr>
    <tr class="rightPaneData"><td>
    <xsl:for-each select="category">

    <xsl:if test="categoryName != ''">
    <u><xsl:value-of select="categoryName"/></u>:&#160;
	<br/>&#160;&#160;&#160;&#160;&#160;&#160;
      	<xsl:for-each select="categoryPhyExamDetail">
            <xsl:value-of select="itemName" />&#160;
        <xsl:variable name="structFlag2" select='struct'/>
            <xsl:if test="($structFlag2='0')">
                <xsl:attribute name="encid">
                    <xsl:value-of select="encounterId"/>
                </xsl:attribute>
                <xsl:attribute name="categoryId">
                    <xsl:value-of select="categoryId"/>
                </xsl:attribute>
                <xsl:attribute name="itemId">
                    <xsl:value-of select="itemId"/>
                </xsl:attribute>
                <xsl:value-of select="phyExamNotes" disable-output-escaping="yes"/>.&#160;
            </xsl:if>
            <xsl:if test="($structFlag2='1') ">
            <xsl:if test="count(StData) != 0">
                <xsl:for-each select="StData">
                <xsl:variable name="stType" select='type'/>
                <xsl:attribute name="encid">
                                <xsl:value-of select="encId"/>
                              </xsl:attribute>
                <xsl:attribute name="categoryId">
                      <xsl:value-of select="catId"/>
                </xsl:attribute>
                <xsl:attribute name="itemId">
                    <xsl:value-of select="propId"/>
                </xsl:attribute>

                <xsl:attribute name="structId">
                  <xsl:value-of select="structId"/>
                </xsl:attribute>
                <xsl:attribute name="structType">
                  <xsl:value-of select="type"/>
                </xsl:attribute>
                <xsl:choose>
                <xsl:when test="$structDataDisplay ='1'">
                  <br/>&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;
                  </xsl:when>
                  <xsl:when test="($structDataDisplay ='0' or $structDataDisplay ='2') and not(position()=1)">,&#160;</xsl:when>
                  </xsl:choose>
               <FONT SIZE="2"><xsl:value-of select="name"/></FONT>
               <FONT SIZE="2">
                <xsl:choose>
                   <xsl:when test="$structDataDisplay ='1'">
                   &#160;<i><xsl:value-of select="value"/></i>
                   </xsl:when>
                   <xsl:when test="$structDataDisplay ='0'">
                   &#160;<xsl:value-of select="value"/>
                   </xsl:when>
                   <xsl:when test="$structDataDisplay ='2'">
                   &#160;<b><xsl:value-of select="value"/></b>
                   </xsl:when>
               </xsl:choose>
               </FONT>
               </xsl:for-each>
             </xsl:if>
             <xsl:if test="count(StData) = 0">
                      <xsl:value-of select="phyExamNotes" disable-output-escaping="yes"/>.&#160;
              </xsl:if>
               <xsl:if test="($structDataDisplay ='0' or $structDataDisplay ='2') and count(StData) != 0">.&#160;</xsl:if>
            </xsl:if>
            <xsl:if test="$structDataDisplay ='1' and position() != last()">
                         <br/>&#160;&#160;&#160;&#160;&#160;&#160;
            </xsl:if>
 	</xsl:for-each>
 	</xsl:if>
 	<br/>
    </xsl:for-each>

    	&#160;&#160;&#160;

	<xsl:for-each select="notes">
      		<xsl:value-of select="."/>
    	</xsl:for-each>
    	<xsl:for-each select="notesBR">
            <xsl:value-of select="." disable-output-escaping="yes"/>
        </xsl:for-each>
   </td></tr>
   <xsl:for-each select="item/Drawing">
		<tr><td>Drawing:<xsl:value-of select="CustomName"/></td></tr>
	</xsl:for-each>
  </table>
</xsl:template>

<xsl:template match="hpi">
<xsl:variable name="structDataDisplay" select='structDataDisplay'/>
   <xsl:choose>
   <xsl:when test=". != ''">
   <table cellspacing="0" cellpadding="0" width="100%">
      <tr class="rightPaneHeading"><td><xsl:value-of select="//return/ChartHeadings/HPI"/></td></tr>
      <tr class="rightPaneData"><td>
      <xsl:for-each select="category">
	<xsl:if test="(position()!=1)">
	<br/>
	</xsl:if>
	<u><xsl:value-of select="categoryName"/></u>:&#160;
	<xsl:if test="categoryNotesHeader != ' '">
		<br/>&#160;&#160;&#160;&#160;&#160;&#160; <xsl:value-of select="categoryNotesHeader" disable-output-escaping="yes"/>
	</xsl:if>
                 <xsl:for-each select="HpiDetail1">
                 		
                 	<xsl:if test="(position()=1)">
		    	  <br/>&#160;&#160;&#160;&#160;&#160;&#160;
		   	</xsl:if>

		   	    <xsl:if test="(position()=1)">
		    		<xsl:value-of select="prefix1" />
		   	    </xsl:if>
			    
			     <xsl:if test="$structDataDisplay ='1' and position() != '1'">
                         <br/>&#160;&#160;&#160;&#160;&#160;&#160;
                     </xsl:if>
                     <xsl:value-of select="prefix2" />
                <xsl:value-of select="hpiName" />
							<xsl:if test="Confidential='yes'"><span style="color: red; font-weight: bold;">[Confidential]</span></xsl:if>
                   <xsl:if test="duration !=''">&#160;for&#160;<xsl:value-of select="duration" /></xsl:if>

              <xsl:variable name="structFlag" select='struct'/>

               <xsl:if test="($structFlag='0') and (notes !='') ">&#160;<xsl:value-of select="hpiNotes2" disable-output-escaping="yes"/>.&#160;</xsl:if>
                <xsl:if test="($structFlag='1') and (notes !='') ">&#160;
                <xsl:if test="count(StData) != 0">
                    <xsl:for-each select="StData">
                             <xsl:choose>
                                 <xsl:when test="$structDataDisplay ='1'">
                                   <br/>&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;
                                   </xsl:when>
                                   <xsl:when test="($structDataDisplay ='0' or $structDataDisplay ='2') and not(position()=1)">,&#160;</xsl:when>
                                   </xsl:choose>
                                <xsl:value-of select="name"/>
                                 <xsl:choose>
                                    <xsl:when test="$structDataDisplay ='1'">
                                    &#160;<i><xsl:value-of select="value"/></i>
                                    </xsl:when>
                                    <xsl:when test="$structDataDisplay ='0'">
                                    &#160;<xsl:value-of select="value"/>
                                    </xsl:when>
                                    <xsl:when test="$structDataDisplay ='2'">
                                    &#160;<b><xsl:value-of select="value"/></b>
                                    </xsl:when>
                                </xsl:choose>
                    </xsl:for-each>
                   </xsl:if>
                   <xsl:if test="count(StData) = 0">
                   &#160;<xsl:value-of select="hpiNotes2" disable-output-escaping="yes"/>.&#160;
                   </xsl:if>
                     <xsl:if test="($structDataDisplay ='0' or $structDataDisplay ='2') and count(StData) != 0">.&#160;</xsl:if>
                </xsl:if>
				<!--<xsl:if test="(count(StData) = 0 and notes = '')">.&#160;</xsl:if> --> <!-- PE-14620 -->
                    <xsl:if test="($structFlag='0' and notes = '')">.&#160;</xsl:if> <!-- PE-14620 -->
                                <xsl:if test="($structFlag='1' and notes = '')">.&#160;</xsl:if>
					</xsl:for-each>

                 <xsl:for-each select="HpiDetail2">
                 		
                 	<xsl:if test="(position()=1)">
		    			<br/>&#160;&#160;&#160;&#160;&#160;&#160;
		   			</xsl:if>

		   			<xsl:if test="(position()=1)">
		    			<xsl:value-of select="prefix" />
		   			</xsl:if>
		   			 <xsl:if test="$structDataDisplay ='1' and position() != '1'">
                         <br/>&#160;&#160;&#160;&#160;&#160;&#160;
                     </xsl:if>
                     <xsl:value-of select="hpiName" />
						<xsl:if test="Confidential='yes'"><span style="color: red; font-weight: bold;">[Confidential]</span></xsl:if>
                     <xsl:if test="duration !=''">&#160;for&#160;<xsl:value-of select="duration" /></xsl:if>

                     <xsl:variable name="structFlag" select='struct'/>

               <xsl:if test="($structFlag='0') and (notes !='') ">&#160;<xsl:value-of select="hpiNotes2" disable-output-escaping="yes"/>.&#160;</xsl:if>
                <xsl:if test="($structFlag='1') and (notes !='') ">&#160;
                <xsl:if test="count(StData) != 0">
                    <xsl:for-each select="StData">
                             <xsl:choose>
                                 <xsl:when test="$structDataDisplay ='1'">
                                   <br/>&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;
                                   </xsl:when>
                                   <xsl:when test="($structDataDisplay ='0' or $structDataDisplay ='2') and not(position()=1)">,&#160;</xsl:when>
                                   </xsl:choose>
                                <xsl:value-of select="name"/>
                                 <xsl:choose>
                                    <xsl:when test="$structDataDisplay ='1'">
                                    &#160;<i><xsl:value-of select="value"/></i>
                                    </xsl:when>
                                    <xsl:when test="$structDataDisplay ='0'">
                                    &#160;<xsl:value-of select="value"/>
                                    </xsl:when>
                                    <xsl:when test="$structDataDisplay ='2'">
                                    &#160;<b><xsl:value-of select="value"/></b>
                                    </xsl:when>
                                </xsl:choose>
                    </xsl:for-each>
                   </xsl:if>
                   <xsl:if test="count(StData) = 0">&#160;<xsl:value-of select="hpiNotes2" disable-output-escaping="yes"/>.&#160;</xsl:if>
                    <xsl:if test="($structDataDisplay ='0' or $structDataDisplay ='2') and count(StData) != 0">.&#160;</xsl:if>
                </xsl:if><xsl:if test="($structFlag='0' and count(StData) = 0 and notes = '')">.&#160;</xsl:if>
                <xsl:if test="($structFlag='1' and notes = '')">.&#160;</xsl:if>
					
                 </xsl:for-each>

                 <xsl:for-each select="HpiDetail3">
                 	
                 	<xsl:if test="(position()=1)">
		    			<br/>&#160;&#160;&#160;&#160;&#160;&#160;
		   			</xsl:if>
                     <xsl:if test="$structDataDisplay ='1' and position() != '1'">
                         <br/>&#160;&#160;&#160;&#160;&#160;&#160;
                     </xsl:if>
                     <xsl:value-of select="hpiName" />
						<xsl:if test="Confidential='yes'"><span style="color: red; font-weight: bold;">[Confidential]</span></xsl:if>
                     <xsl:if test="duration !=''">&#160;for&#160;<xsl:value-of select="duration" /></xsl:if>

                    <xsl:variable name="structFlag" select='struct'/>

               <xsl:if test="($structFlag='0') and (notes !='') ">&#160;<xsl:value-of select="hpiNotes2" disable-output-escaping="yes"/>.&#160;</xsl:if>
                <xsl:if test="($structFlag='1') and (notes !='') ">&#160;
                <xsl:if test="count(StData) != 0">
                    <xsl:for-each select="StData">
                             <xsl:choose>
                                 <xsl:when test="$structDataDisplay ='1'">
                                   <br/>&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;
                                   </xsl:when>
                                   <xsl:when test="($structDataDisplay ='0' or $structDataDisplay ='2') and not(position()=1)">,&#160;</xsl:when>
                                   </xsl:choose>
                                <xsl:value-of select="name"/>
                                 <xsl:choose>
                                    <xsl:when test="$structDataDisplay ='1'">
                                    &#160;<i><xsl:value-of select="value"/></i>
                                    </xsl:when>
                                    <xsl:when test="$structDataDisplay ='0'">
                                    &#160;<xsl:value-of select="value"/>
                                    </xsl:when>
                                    <xsl:when test="$structDataDisplay ='2'">
                                    &#160;<b><xsl:value-of select="value"/></b>
                                    </xsl:when>
                                </xsl:choose>
                    </xsl:for-each>
                  </xsl:if>
                  <xsl:if test="count(StData) = 0">&#160;<xsl:value-of disable-output-escaping="yes" select="hpiNotes2"/>.&#160;</xsl:if>
                    <xsl:if test="($structDataDisplay ='0' or $structDataDisplay ='2') and count(StData) != 0">.&#160;</xsl:if>
                </xsl:if>
                    <xsl:if test="($structFlag='1' and notes = '')">.&#160;</xsl:if>
                
				</xsl:for-each>

	<xsl:if test="hpiCatNotes != ' '">
	<br/>&#160;&#160;&#160;&#160;&#160;&#160; <xsl:value-of select="hpiCatNotes" disable-output-escaping="yes"/>
	</xsl:if>
      </xsl:for-each>
      <xsl:value-of select="itemAdtlNotes"/>
   </td></tr>
   </table>
   </xsl:when>
   </xsl:choose>
</xsl:template>

<!--<xsl:template match="item">
   <table cellspacing="0" cellpadding="0" width="100%">
      <tr>
         <td width="10">&#160;</td>
         <td style="word-wrap:break-word">
         <xsl:apply-templates select="itemName"/>&#160;
         <xsl:apply-templates select="itemValue"/>

	      <xsl:for-each select="category">
            <xsl:apply-templates select="categoryValue"/>
	         <xsl:apply-templates select="categoryNotes"/>
         </xsl:for-each>

         <xsl:apply-templates select="itemRemNotes"/>
         <xsl:apply-templates select="itemNotes"/>
         <xsl:apply-templates select="itemAdtlNotes"/>
      </td>
    </tr>
   </table>
</xsl:template>-->

<xsl:template match="xrays">
  <table cellspacing="0" cellpadding="0" width="100%">
  <tr class="rightPaneHeading"><td><xsl:value-of select="//return/ChartHeadings/DiagnosticImaging"/></td></tr>
      <table cellspacing="0" cellpadding="0" width="100%">

  	<xsl:for-each select="xraydetail">
  	<tr class="rightPaneData"><td>
  		&#160;&#160;&#160;&#160;&#160;
  		<u>Imaging: <xsl:value-of select="TestName" /></u>
  		<xsl:if test="Result !=''">
  			&#160;
  			<xsl:value-of select="Result" />
  		</xsl:if>
  		</td></tr>
  		
  		<tr class="rightPaneData">
	  		<td>
	  		<xsl:if test="TestValues">
				<xsl:apply-templates select="TestValues"/>
			</xsl:if>
	  		</td>
	  	</tr>
  		

  		<tr class="rightPaneData">
  			<td>
  			<xsl:if test="Notes !=''">
  				<xsl:apply-templates select="Notes"/>
  			</xsl:if>
  			</td>
  		</tr>
  		<tr>
			<td>								
			<xsl:if test="xRaysElectronic">
					<xsl:apply-templates select="xRaysElectronic"/>
			</xsl:if>
			</td>
		</tr>
  		
  	</xsl:for-each>
  </table>
  </table>
</xsl:template>



<xsl:template match="ProcedureReport">
  <table cellspacing="0" cellpadding="0" width="100%">
  <tr class="rightPaneHeading"><td>Procedure Orders:</td></tr>
      <table cellspacing="0" cellpadding="0" width="100%">

  	<xsl:for-each select="procedureDetail">
  	<tr class="rightPaneData"><td>
  		&#160;&#160;&#160;&#160;&#160;
  		<u>Procedure:<xsl:value-of select="TestName" /></u>
  		<xsl:if test="Result !=''">
  			&#160;
  			<xsl:value-of select="Result" />
  		</xsl:if>
  		</td></tr>
  		
  		<tr class="rightPaneData">
	  		<td>
	  		<xsl:if test="TestValues">
				<xsl:apply-templates select="TestValues"/>
			</xsl:if>
	  		</td>
	  	</tr>
  		

  		<tr class="rightPaneData">
  			<td>
  			<xsl:if test="Notes !=''">
  				<xsl:apply-templates select="Notes"/>
  			</xsl:if>
  			</td>
  		</tr>
  		
  		
  	</xsl:for-each>
  </table>
  </table>
</xsl:template>








<xsl:template match="labs">
  <table cellspacing="0" cellpadding="0" width="100%">
  <tr class="rightPaneHeading"><td><xsl:value-of select="//return/ChartHeadings/LabReports"/></td></tr>
    <table cellspacing="0" cellpadding="0" width="100%">
  	<xsl:for-each select="labdetail">
  	<tr class="rightPaneData"><td>
  		&#160;&#160;&#160;&#160;&#160;
  		<u>Lab: <xsl:value-of select="TestName" /></u>
  		<xsl:if test="Result !=''">
  			&#160;
  			<xsl:value-of select="Result" />
  		</xsl:if>
  		</td></tr>

  		<tr class="rightPaneData">
  			<td>
  			<xsl:if test="TestValues">
				<xsl:apply-templates select="TestValues"/>
			</xsl:if>
  			</td>
  		</tr>
  		
  		<tr class="rightPaneData">
  			<td>
  			<xsl:if test="Notes !=''">
  				<xsl:apply-templates select="Notes"/>
  			</xsl:if>
  			</td>
  		</tr>
  		
  		<tr class="rightPaneData">
  			<td>  		
  			<xsl:if test="Collection !=''">
  				<xsl:apply-templates select="Collection"/>
  			</xsl:if>
  			</td>
  		</tr>
  		
  		<tr class="rightPaneData">
  			<td>  		
  			<xsl:if test="Location !=''">
  				<xsl:apply-templates select="Location"/>
  			</xsl:if>
  			</td>
  		</tr>

  		<tr class="rightPaneData">
  			<td>  		
  			<xsl:if test="RuleOut !=''">
  				<xsl:apply-templates select="RuleOut"/>
  			</xsl:if>  		  		  		
  			</td>
  		</tr>
  		<tr class="rightPaneData">
  			<td>  		
  			<xsl:if test="CntLineValid ='1'">
  				<span>Control Line Valid</span>
  			</xsl:if>  		  		  		
  			</td>
  		</tr>
  	</xsl:for-each>
  </table>
  </table>
</xsl:template>


<xsl:template match="TestValues">
	<table cellspacing="0" cellpadding="0" border="0" width="100%" class="rightPaneData">
  	<xsl:if test="LabFlag =''">
  		<tr>
  			<td width="50%" align="left">&#160;&#160;&#160;&#160;&#160;<xsl:value-of select="LabName" /></td>
  			<td width="10%" align="left"><xsl:value-of select="LabValue" /></td>
  			<td width="10%" align="left"><xsl:value-of select="LabFlag" /></td>
  			<td width="30%" align="left"><xsl:value-of select="LabRange" /></td>
  		</tr>
  	</xsl:if>
	<xsl:if test="LabFlag !=''">
  		<tr>
  			<td width="50%" align="left" style="font-weight:bold;">&#160;&#160;&#160;&#160;&#160;<xsl:value-of select="LabName" /></td>
  			<td width="10%" align="left" style="font-weight:bold;"><xsl:value-of select="LabValue" /></td>
  			<td width="10%" align="left" style="font-weight:bold;"><xsl:value-of select="LabFlag" /></td>
  			<td width="30%" align="left" style="font-weight:bold;"><xsl:value-of select="LabRange" /></td>
  		</tr>
	</xsl:if>
	<xsl:if test="xRaysFlag =''">
			<tr class="rightPaneData">
				<td width="50%" align="left">&#160;&#160;&#160;&#160;&#160;<xsl:value-of select="xRaysName" /></td>
	  			<td width="20%" align="left"><xsl:value-of select="xRaysValue" /></td>
	  			<td width="30%" align="left"><xsl:value-of select="xRaysRange" /></td>
	  		</tr>
		</xsl:if>
		<xsl:if test="xRaysFlag !=''">
	  		<tr class="rightPaneData">
	  			<td width="50%" align="left" style="font-weight:bold;">&#160;&#160;&#160;&#160;&#160;<xsl:value-of select="xRaysName" /></td>
	  			<td width="20%" align="left" style="font-weight:bold;"><xsl:value-of select="xRaysValue" /></td>	  						
	  			<td width="30%" align="left" style="font-weight:bold;"><xsl:value-of select="xRaysRange" /></td>
	  		</tr>
		</xsl:if>
  	</table>
</xsl:template>
<xsl:template match="Notes">
	<table class="rightPaneData"><tr>
    	<td>&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;</td>
        <td><span class="normaltext"><xsl:value-of select="." /></span></td>
    </tr></table>
</xsl:template>
<xsl:template match="xRaysElectronic">
	<table class="rightPaneData">
	      <xsl:for-each select="HL7Notes">
		  <tr class="rightPaneData">
		  	<td>&#160;&#160;&#160;&#160;&#160;<xsl:value-of select="." /></td>
		  </tr>
 	      </xsl:for-each>
  		
  	</table>
</xsl:template>
<xsl:template match="Collection">
	<table class="rightPaneData"><tr>
    	<td>&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;</td>
        <td><span class="normaltext">Collection: <xsl:value-of select="." /></span></td>
    </tr></table>
</xsl:template>

<xsl:template match="Location">
	<table class="rightPaneData"><tr>
    	<td>&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;</td>
        <td><span class="normaltext">Location: <xsl:value-of select="." /></span></td>
    </tr></table>
</xsl:template>

<xsl:template match="RuleOut">
	<table class="rightPaneData"><tr>
    	<td>&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;</td>
        <td><span class="normaltext">Rule Out: <xsl:value-of select="." /></span></td>
    </tr></table>
</xsl:template>
  
<xsl:template match="procedures">
  <xsl:choose>
  <xsl:when test="count(itemValue) > 0">
  <table cellspacing="0" cellpadding="0" width="100%">
  <tr class="rightPaneHeading"><td><xsl:value-of select="//return/ChartHeadings/ProcedureCodes"/></td></tr>
  <tr class="rightPaneData"><td>
    <xsl:for-each select="itemValue">
 		<table class="rightPaneData" cellspacing="0" cellpadding="0">
		  <tr>
			<td>
			   <xsl:value-of select="."/>
			 </td>
		   </tr>
		 </table>
     </xsl:for-each>
    </td></tr>
  </table>
  </xsl:when>
  </xsl:choose>
</xsl:template>

<xsl:template match="FollowUp">
  <table cellspacing="0" cellpadding="0" width="100%">
     <tr class="rightPaneHeading"><td><xsl:value-of select="//return/ChartHeadings/NextAppointment"/></td></tr>
     <tr class="rightPaneData"><td><xsl:value-of select="."/></td></tr>
  </table>
</xsl:template>

<xsl:template match="DispositionAndCommunication">
	<xsl:if test="count(item/itemValue) > 0 and item/itemValue != ''">
	  <table cellspacing="0" cellpadding="0" width="100%">
		<tr class="rightPaneHeading"><td><xsl:value-of select="//return/ChartHeadings/DispositionAndCommunication"/></td></tr>
	     <tr class="rightPaneData"><td><xsl:value-of select="item/itemValue"/></td></tr>
	  </table>
  </xsl:if>
</xsl:template>


<xsl:template match="vitals">
  <table cellspacing="0" cellpadding="0" width="100%">
     <tr class="rightPaneHeading"><td><xsl:value-of select="//return/ChartHeadings/Vitals"/></td></tr>
     <tr class="rightPaneData"><td><xsl:value-of select="."/></td></tr>
  </table>
</xsl:template>

<xsl:template match="vitals2">
  <table cellspacing="0" cellpadding="0" width="100%">
     <tr class="rightPaneHeading"><td><xsl:value-of select="//return/ChartHeadings/Vitals"/></td></tr>
     <tr class="rightPaneData"><td><xsl:value-of select="." disable-output-escaping="yes"/></td></tr>
  </table>
</xsl:template>

<xsl:template match="vitals2BR">
  <table cellspacing="0" cellpadding="0" width="100%">
     <tr class="rightPaneHeading"><td><xsl:value-of select="//return/ChartHeadings/Vitals"/></td></tr>
     <tr class="rightPaneData"><td><xsl:value-of select="." disable-output-escaping="yes"/></td></tr>
  </table>
</xsl:template>

<xsl:template match="vitalHistory">
	<table cellspacing="0" cellpadding="0" width="100%">
		<tr class="rightPaneHeading"><td><xsl:value-of select="//return/ChartHeadings/Vitals"/></td></tr>
		<tr class="rightPaneData">
			<td>
				<table cellpadding="0" cellspacing="0"  border="1" width="100%" >
		  		<xsl:for-each select="vital">
				  	<tr class="rightPaneData" >
				  		<td colspan="3" align="center" bgcolor="F3F6FB" ><b><xsl:value-of select="vitalName"/></b></td>
				  	</tr>
				  	<tr class="rightPaneData">
				  		<td>
				  			<table border="0" width="100%">
				  				<xsl:for-each select="vitalData">
				  				<tr class="rightPaneData">
							  		<td  width="45%" align="left"><xsl:value-of select="vitalValue" disable-output-escaping="yes"/>&#160;&#160;</td>
							  		<td width="40%" align="center"><xsl:value-of select="updatedtime"/>&#160;&#160;</td>
							  		<td width="15%" align="center"><xsl:value-of select="ufname"/>&#160;<xsl:value-of select="ulname"/></td>
				  				</tr>
				  				</xsl:for-each>
				  			</table>
				  		</td>
				  	</tr>
				  
			  </xsl:for-each>
			  </table>	
		  </td>
	   </tr>
	   <tr class="rightPaneData"><td><xsl:value-of select="vitalHist2BR" disable-output-escaping="yes" /></td></tr>
	</table>
</xsl:template>

<xsl:template match="PastOrders">
  <table cellspacing="0" cellpadding="0" width="100%">
     <tr class="rightPaneHeading"><td><xsl:value-of select="//return/ChartHeadings/PastOrders"/></td></tr>
     	<xsl:for-each select="PastOrder">
     	
     	<!-- Display for non-cumulative Reports -->		  
		  <xsl:if test="not(CumulativeResult)">
			<tr class="rightPaneData">
				<td colspan="4">
					<u><xsl:value-of select="OrderName"/></u>					
				</td>
			</tr>
			
			<xsl:if test="OrderResult!=''">
				<tr class="rightPaneData">
					<td colspan="4">
						&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;Result: <xsl:value-of select="OrderResult"/>
					</td>
				</tr>
			</xsl:if>
		
	  <xsl:for-each select="OrderDetail">
  		  <xsl:if test="OrderItemFlag =''">
		     <tr>
			     <td width="50%" align="left">&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;<xsl:value-of select="OrderItemName" /></td>
				 <td width="10%" align="left"><xsl:value-of select="OrderItemValue" /></td>
	 			 <td width="10%" align="left"><xsl:value-of select="OrderItemFlag" /></td>
	 			 <td width="30%" align="left"><xsl:value-of select="OrderItemRange" /></td>
			</tr>
		  </xsl:if>
  		  <xsl:if test="OrderItemFlag !=''">
			    <tr>
				    <td width="50%" align="left"  style="font-weight:bold;">&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;<xsl:value-of select="OrderItemName" /></td>
					<td width="10%" align="left"  style="font-weight:bold;"><xsl:value-of select="OrderItemValue" /></td>
		 			<td width="10%" align="left" style="font-weight:bold;"><xsl:value-of select="OrderItemFlag" /></td>
		 			<td width="30%" align="left" style="font-weight:bold;"><xsl:value-of select="OrderItemRange" /></td>
				</tr>
		 </xsl:if>
   	   </xsl:for-each>
   	   
   	   		<xsl:if test="OrderNotes!=''">
				<tr class="rightPaneData">
					<td colspan="4">
						<span name="OrderNotes">&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;Notes: <xsl:value-of select="OrderNotes"/></span>
					</td>
				</tr>
			</xsl:if>
			
			<xsl:if test="ClinicalInfo !=''">
	            <tr class="rightPaneData">
	            	<td colspan="4">
						<span name="ClinicalInfo">&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;Clinical Info: <xsl:value-of select="ClinicalInfo"/></span>
					</td>	                            
	          </tr>	        
	        </xsl:if>
	        		
		</xsl:if> <!-- End of Display for non-cumulative Reports -->
		
		
		<!-- Display for cumulative Reports -->
	  			<xsl:if test="CumulativeResult">
	  			<tr class="rightPaneData">
				<td colspan="4">
					<u><xsl:value-of select="OrderName"/></u>		  			
		    	</td>
				</tr>	    	
		    		
		    		<tr>
		    		<td colspan="4">
		    		<table width="100%">
		    		<tr>
		    		
		    		<td width="2%"></td>
		    		
		    		<td>
		    		<table width="100%"  border="1" cellspacing="0" cellpadding="0" rules="rows" frame="void">

		    		<xsl:for-each select="labInfo">
		    				<tr>
			    				<td width="10%" align="left">
									Collection Date
								</td>
			    				<xsl:for-each select="labDates">
			    					<td width="10%" align="left">			    						
				    						 <xsl:value-of select="CollDate"/>											
			    					</td>								
							    </xsl:for-each>			    			 
			    			</tr>
			    			<tr>
			    				<td width="10%" align="left">
									Order Date
								</td>
			    				<xsl:for-each select="labDates">
			    					<td width="10%" align="left">
			    						<xsl:value-of select="OrderDate"/>
			    					</td>								
							    </xsl:for-each>			    			 
			    			</tr>
			    			
			    			<xsl:if test="ResultPresent">
			    			<tr class="rightPaneData">
			    				<td width="10%" align="left">
									Result:
								</td>
			    				<xsl:for-each select="labDates">
			    					<td width="10%" align="left">
			    						<xsl:value-of select="OrderResult"/>
			    					</td>								
							    </xsl:for-each>			    			 
			    			</tr>	
			    			</xsl:if>																
	  				</xsl:for-each>
	  				
	  				<xsl:for-each select="results">
	  						<xsl:for-each select="resultParam">
	  							<tr>
		  							<td width="10%" align="left">
										<xsl:value-of select="name"/>
									</td>
									
									<xsl:for-each select="resultSet">
										 <xsl:if test="flag =''">
											 <td width="10%" align="left">
												<xsl:value-of select="value"/>
												<br></br>
												<xsl:if test="range !=''">										
											 		(<xsl:value-of select="range"/>)									 
												</xsl:if>																																
											 </td>	
										</xsl:if>
										
										<xsl:if test="flag !=''">										
											<td width="10%" align="left">
												<FONT style="font-weight:bold;"><xsl:value-of select="value"/>&#160;&#160;&#160;&#160;<xsl:value-of select="flag"/></FONT>
												<br></br>
												<xsl:if test="range !=''">										
											 		(<xsl:value-of select="range"/>)									 
												</xsl:if>											
										    </td>	
										</xsl:if>							 									
									</xsl:for-each>									
	  							</tr>	  							
	  						</xsl:for-each>	  					
	  				</xsl:for-each>
	  				
	  				<xsl:for-each select="labInfo">
	  				  <xsl:if test="NotesPresent">
		  				  <tr class="rightPaneData">
		  				  	<td width="10%" align="left">
										Notes:
							</td>	
		  					<xsl:for-each select="labDates">
				    					<td width="10%" align="left">
				    						<xsl:value-of select="OrderNotes"/>
				    					</td>								
							</xsl:for-each>	
						  </tr>
					  </xsl:if> 
					  	
					  <xsl:if test="ClinicalInfoPresent">
		  				  <tr class="rightPaneData">
		  				  	<td width="10%" align="left">
										Clinical Info:
							</td>	
		  					<xsl:for-each select="labDates">
				    					<td width="10%" align="left">
				    						<xsl:value-of select="ClinicalInfo"/>
				    					</td>								
							</xsl:for-each>	
						  </tr> 
						</xsl:if>			    	 				
	  				</xsl:for-each>
	  				
	  				</table>
	  				</td>
	  				 
	  				<td width="2%"></td>  				
	  				</tr>
	  				</table>
	  				</td>
	  				</tr>
	  				
	  		</xsl:if> <!-- End of Display for cumulative Reports -->					
		
		</xsl:for-each>
  </table>
</xsl:template>

<xsl:template match="VisionExamination">
  <table cellspacing="0" cellpadding="0" width="100%">
    <tr><td class="rightPaneHeading"><xsl:value-of select="//return/ChartHeadings/VisionExamination"/><br/> </td> </tr>
    	 <tr class="rightPaneData"> <td>
				<xsl:apply-templates select="UnaidedAcuities"/>
				<xsl:apply-templates select="AidedAcuities"/>
				<xsl:apply-templates select="KRS"/>
				<xsl:apply-templates select="PDs"/>
				<xsl:apply-templates select="KRSADD"/>
				<xsl:apply-templates select="AutoRefractions"/>
				<xsl:apply-templates select="Retinoscopys"/>
				<xsl:apply-templates select="Cycloplegics"/>
				<xsl:apply-templates select="IOPS"/>
				<xsl:apply-templates select="PACHS"/>
				<xsl:apply-templates select="CDS"/>
				<xsl:if test="((Manifests != '') or (PSRs != '') or (FSRs != ''))">
					&#160;&#160;&#160;&#160;&#160; <u> Spectacle </u> <br/>
					<xsl:apply-templates select="PSRs"/>
					<xsl:apply-templates select="Manifests"/>
					<xsl:apply-templates select="FSRs"/>
				</xsl:if>

				<!--  Vishesh: 11-27-2012 Binocular tab data -->
				<xsl:if test="((BINCOVS != '') or (BINPHOS != '') or (BINVERBI != '') or (BINVERBO != '') or (BINMISCS != ''))">
					&#160;&#160;&#160;&#160;&#160;<u>Binocular</u><br/>
				</xsl:if>
				<xsl:if test="(BINCOVS != '')">
					<xsl:apply-templates select="BINCOVS"/>
				</xsl:if>
				<xsl:if test="(BINPHOS != '')">
					<xsl:apply-templates select="BINPHOS"/>
				</xsl:if>
				<xsl:if test="(BINVERBI != '')">
					<xsl:apply-templates select="BINVERBI"/>
				</xsl:if>
				<xsl:if test="(BINVERBO != '')">
					<xsl:apply-templates select="BINVERBO"/>
				</xsl:if>
				<xsl:if test="(BINMISCS != '')">
					<xsl:apply-templates select="BINMISCS"/>
				</xsl:if>
				

				<xsl:if test="(PCRs != '')">
					&#160;&#160;&#160;&#160;&#160; <u> Contacts </u> <br/>
					<xsl:apply-templates select="PCRs"/>
				</xsl:if>
		<br/>
    </td></tr>
    <tr height="5"><td></td></tr>
  </table>
</xsl:template>

<xsl:template match="DentalExamination">
    <xsl:apply-templates select="dental-procedures"/>
</xsl:template>

<xsl:template match="dental-procedures">
<xsl:if test="dental-procedure != ''">
        <TABLE class="table1" cellspacing="0" cellpadding="0" border="0" width="100%">
		<!-- Do not change this 'Dental Examination :' string, because this value is used to handle click event on it-->
        <TR><TD width="10"></TD><TD class="rightPaneHeading">Dental Examination/Plan:</TD>&#160;
    	<br/>
	</TR>
        <TR>
            <TD width="10px">&#160;&#160;&#160;&#160;&#160;</TD>
            <TD>
                <table border="1" class="normaltext" width="100%">
                    <tr>
                        <td width="20%" align="Center" class="TitleColor">
                            <b>Tooth / Surface</b>
                        </td>
                        <td width="5%" align="Center" class="TitleColor">
                            <b>Status</b>
                        </td>
                        <td width="60%" align="Center" class="TitleColor">
                            <b>Description</b>
                        </td>
                        <td width="5%" align="Center" class="TitleColor">
                            <b>Provider</b>
                        </td>
                        <td width="10%" align="Center" class="TitleColor">
                            <b>Date</b>
                        </td>
                    </tr>
                                        
                     <xsl:apply-templates select="dental-procedure"/>
					 </table>
            </TD>
            
        </TR>
    </TABLE>
</xsl:if>
</xsl:template>

<xsl:template match="dental-procedure">
<tr>
    <xsl:apply-templates select="toothNum-surface"/>
    <xsl:apply-templates select="statusImg"/>
    <xsl:apply-templates select="procDesc"/>
    <xsl:apply-templates select="provider"/>
	<xsl:apply-templates select="procDate"/>
</tr>	
<tr>
<xsl:apply-templates select="procNote"/>
</tr>
</xsl:template>

<xsl:template match="provider">
	<td align="Center" class="tablecell">
		<xsl:attribute name="title"><xsl:value-of select="fullName" /></xsl:attribute>
		<xsl:value-of select="initial-only" />
	</td>
</xsl:template>
<xsl:template match="statusImg">
    <td align="Center">
        <span>
            <xsl:attribute name="style">
                 <xsl:value-of select="css-style" />
            </xsl:attribute>
			<xsl:value-of select="abbr" />
        </span>
    </td>
</xsl:template>

<xsl:template match="procDate">
	<td align="Center" class="tablecell">
		<xsl:value-of select="." />
	</td>
</xsl:template>

<xsl:template match="toothNum-surface">
	<td align="Center" class="tablecell">
		<xsl:value-of select="." />
	</td>
</xsl:template>

<xsl:template match="procDesc">
	<td style="word-break: break-all;" align="Center" class="tablecell">
		<xsl:value-of select="." />
	</td>
</xsl:template>

<xsl:template match="procNote">
        <td colspan='5' class="tablecell" style="word-break: break-all;">		
        <xsl:call-template name="LFsToBRs">
		<xsl:with-param name="input" select="."/>
	</xsl:call-template>
    </td>
</xsl:template>
<xsl:template name="LFsToBRs">
	<xsl:param name="input" />
	<xsl:choose>
		<xsl:when test="contains($input, '&#10;')">
			<xsl:value-of disable-output-escaping="yes" select="substring-before($input, '&#10;')" /><br />
			<xsl:call-template name="LFsToBRs">
				<xsl:with-param name="input" select="substring-after($input, '&#10;')" />
			</xsl:call-template>
		</xsl:when>
		<xsl:otherwise>
			<xsl:value-of disable-output-escaping="yes" select="$input" />
		</xsl:otherwise>
	</xsl:choose>
</xsl:template>



<xsl:template match="examination">
<xsl:variable name="maindoc" select='item/maindoc'/>
<xsl:variable name="structDataDisplay" select='structDataDisplay'/>
   <xsl:choose>
   <xsl:when test=". != ''">
   <table cellspacing="0" cellpadding="0" width="100%">
      <tr class="rightPaneHeading"><td><xsl:value-of select="//return/ChartHeadings/Examination"/></td></tr>
      <tr class="rightPaneData"><td>
      <xsl:for-each select="category">
      		<xsl:variable name="ExamCatNotes"><xsl:value-of select="categoryNotes"/></xsl:variable>
            <xsl:variable name="ExamCatNotesBR"><xsl:value-of select="categoryNotesBR"/></xsl:variable>
			<xsl:variable name="ExamCatName"><xsl:value-of select="categoryName"/></xsl:variable>
				<xsl:if test="$ExamCatName !=''">
         <u><xsl:value-of select="categoryName"/></u>:<br/>&#160;&#160;&#160;&#160;&#160;&#160;
						<xsl:for-each select="categoryInDetail">
							<xsl:for-each select="cat_det">
							<xsl:variable name="structFlag2" select='struct'/>
							<xsl:variable name="encId" select='encounterID'/>
							<xsl:variable name="catId" select='examId'/>
							<xsl:variable name="itemId" select='categoryPropId'/>
							<xsl:variable name="docCount" select='docCount'/>
							<xsl:variable name="ThumbNailHeight" select='//return/ThumbNailHeight'/>
							<xsl:variable name="ShowThumbNailsInProgressNotes" select='//return/ShowThumbNailsInProgressNotes'/>
							 <xsl:if test="($structDataDisplay ='1' or $ShowThumbNailsInProgressNotes='yes') and position() != '1'">
                                <br/>&#160;&#160;&#160;&#160;&#160;&#160;
                             </xsl:if>
							<xsl:if test="($structFlag2='0')">
									<xsl:value-of select="categorySubName" />&#160;<xsl:if test="examNotes2 != ''"><xsl:value-of select="examNotes2" disable-output-escaping="yes"/>.&#160;</xsl:if>
									
									<xsl:if test="$docCount > 0">
                        <xsl:choose>
                        <xsl:when  test="//return/SummeryView='true' and $ShowThumbNailsInProgressNotes='yes'"><br/>&#160;&#160;&#160;&#160;&#160;&#160;<iframe name="imageIframe" id="imageIframe_&#123;&#36;catId&#125;_&#123;&#36;itemId&#125;" src= "/mobiledoc/jsp/catalog/xml/imageInPN.jsp?section=Examination&amp;encId=&#123;&#36;encId&#125;&amp;catId=&#123;&#36;catId&#125;&amp;itemId=&#123;&#36;itemId&#125;" scrolling="no" frameborder="0" style="border:21px; width:700px; height:{$ThumbNailHeight}px; overflow:hidden;" allowTransparency="true"></iframe><br/>&#160;&#160;&#160;&#160;&#160;&#160;</xsl:when>
                        
                        </xsl:choose>
                        </xsl:if>
							</xsl:if>
							<xsl:if test="($structFlag2='1') ">

							 <xsl:value-of select="categorySubName" />&#160;
						<xsl:if test="count(StData) != 0">
							
							 <xsl:for-each select="StData">
							 <xsl:if test="structId != ''">
							     <xsl:variable name="stType" select='type'/>
							     <span class="normaltext">
							     <xsl:attribute name="encid">
                                <xsl:value-of select="encId"/>
                              </xsl:attribute>
                              <xsl:attribute name="categoryId">
                                    <xsl:value-of select="catId"/>
                              </xsl:attribute>
                              <xsl:attribute name="itemId">
                                  <xsl:value-of select="propId"/>
                              </xsl:attribute>

                            <xsl:attribute name="structId">
                                <xsl:value-of select="structId"/>
                                </xsl:attribute>

                            <xsl:attribute name="structType">
                                <xsl:value-of select="type"/>
                                </xsl:attribute>

                                <xsl:choose>

                                   <xsl:when test="$structDataDisplay ='1'">
                                   <br/>&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;
                                   </xsl:when>
                                   <xsl:when test="($structDataDisplay ='0' or $structDataDisplay ='2') and not(position()=1)">,&#160;</xsl:when>
                                   </xsl:choose>
                                <xsl:value-of select="name"/>
                                 <xsl:choose>
                                    <xsl:when test="$structDataDisplay ='1'">
                                    &#160;<i><xsl:value-of select="value"/></i>
                                    </xsl:when>
                                    <xsl:when test="$structDataDisplay ='0'">
                                    &#160;<xsl:value-of select="value"/>
                                    </xsl:when>
                                    <xsl:when test="$structDataDisplay ='2'">
                                    &#160;<b><xsl:value-of select="value"/></b>
                                    </xsl:when>
                                </xsl:choose>
                                </span>
                                </xsl:if>
							 </xsl:for-each>
							  <xsl:if test="($structDataDisplay ='0' or $structDataDisplay ='2') and count(StData) != 0">.&#160;</xsl:if>
							  <xsl:if test="$docCount > 0">
                  <xsl:choose>
                  	<xsl:when  test="//return/SummeryView='true' and $ShowThumbNailsInProgressNotes='yes'"><br/>&#160;&#160;&#160;&#160;&#160;&#160;&#160;<iframe name="imageIframe" id="imageIframe_&#123;&#36;catId&#125;_&#123;&#36;itemId&#125;" src= "/mobiledoc/jsp/catalog/xml/imageInPN.jsp?section=Examination&amp;encId=&#123;&#36;encId&#125;&amp;catId=&#123;&#36;catId&#125;&amp;itemId=&#123;&#36;itemId&#125;" scrolling="no" frameborder="0" style="border:21px; width:99%; height:{$ThumbNailHeight}px;overflow:hidden;" allowTransparency="true"></iframe><br/></xsl:when>
                  	
                  </xsl:choose>
                  </xsl:if>
						</xsl:if>
						<xsl:if test="count(StData) = 0 and examNotes != ''">
                            <xsl:value-of select="examNotes" disable-output-escaping="yes"/>.&#160;
                        </xsl:if>

							 <xsl:if test="count(StData) != 0 and $ExamCatNotesBR =''"><br/></xsl:if>
							</xsl:if>
							<xsl:if test="($structFlag2='0' and position() = last() and $ExamCatNotesBR ='')"><br/></xsl:if>
							</xsl:for-each>
						</xsl:for-each>
						<xsl:if test="$ExamCatNotes !=''">
							&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;<xsl:value-of select="categoryNotes"/><br/>
						</xsl:if>
						<xsl:if test="$ExamCatNotesBR !=''">
							<xsl:if test="count(categoryInDetail) != 0">
	                            <br/>&#160;&#160;&#160;&#160;&#160;&#160;
	                        </xsl:if>
                       	<xsl:value-of select="categoryNotesBR" disable-output-escaping="yes"/><br/>
                        </xsl:if>
				</xsl:if>
      </xsl:for-each>
   </td></tr>
   </table>
   </xsl:when>
   </xsl:choose>
   <xsl:choose>
					
         <xsl:when test="//return/SummeryView='true'">
         <xsl:variable name="ThumbNailHeight" select='//return/ThumbNailHeight'/>
		 <xsl:variable name="ShowThumbNailsInProgressNotes" select='//return/ShowThumbNailsInProgressNotes'/>
					<xsl:variable name="EncounterId" select='//return/EncounterId'/>
					<xsl:if test="$maindoc= 'true'">
					<xsl:choose>
                   <xsl:when test="$ShowThumbNailsInProgressNotes = 'yes'">
                  <iframe name="imageIframe" id="imageIframe_0_0" src= "/mobiledoc/jsp/catalog/xml/imageInPN.jsp?section=Examination&amp;encId=&#123;&#36;EncounterId&#125;&amp;catId=0&amp;itemId=0" scrolling="no" frameborder="0" style="border:21px; width:99%; height:{$ThumbNailHeight}px; overflow:hidden;" allowTransparency="true"></iframe>
                  </xsl:when>
                  <xsl:otherwise>
                  		<xsl:for-each select="item/Drawing">
					<tr><td>Drawing:<xsl:value-of select="CustomName"/></td></tr>
					</xsl:for-each>
                  </xsl:otherwise>
                  </xsl:choose>
                  </xsl:if>
                  </xsl:when>
                  <xsl:otherwise>
                  	<xsl:if test="//return/ShowThumbNailsInProgressNotes != 'yes'">
                  		<xsl:for-each select="item/Drawing">
						<tr><td>Drawing:<xsl:value-of select="CustomName"/></td></tr>
						</xsl:for-each>
                  	</xsl:if>
                  </xsl:otherwise>
                  </xsl:choose>
</xsl:template>


<xsl:template match="Procedure">
  <xsl:variable name="structDataDisplay" select='structDataDisplay'/>
	<xsl:variable name="maindoc" select='item/maindoc'/>
  <table cellspacing="0" cellpadding="0" width="100%">
    <tr class="rightPaneHeading"><td><xsl:value-of select="//return/ChartHeadings/Procedures"/></td></tr>
    <tr class="rightPaneData"><td>
    <xsl:for-each select="category">

    <xsl:if test="categoryName != ''">

    <u><xsl:value-of select="categoryName"/></u>:&#160;
	<br/>&#160;&#160;&#160;&#160;&#160;&#160;
      	<xsl:for-each select="procDetail">

      		<xsl:variable name="structFlag2" select='struct'/>
            <xsl:variable name="encId" select='EncounterId'/>
			<xsl:variable name="catId" select='CategoryId'/>
			<xsl:variable name="itemId" select='ItemId'/>
			<xsl:variable name="docCount" select='docCount'/>
			<xsl:variable name="ThumbNailHeight" select='//return/ThumbNailHeight'/>
			<xsl:variable name="ShowThumbNailsInProgressNotes" select='//return/ShowThumbNailsInProgressNotes'/>
            <xsl:value-of select="name" />&#160;
            <xsl:if test="($structFlag2='0')">
                <xsl:attribute name="encid">
                    <xsl:value-of select="encounterId"/>
                </xsl:attribute>
                <xsl:attribute name="categoryId">
                    <xsl:value-of select="categoryId"/>
                </xsl:attribute>
                <xsl:attribute name="itemId">
                    <xsl:value-of select="itemId"/>
                </xsl:attribute>
                <xsl:if test="procnotes2 !=''"><xsl:value-of select="procnotes2" disable-output-escaping="yes"/>.&#160;</xsl:if>
            </xsl:if>
            <xsl:if test="($structFlag2='1') ">
            <xsl:if test="count(StData) != 0">
                <xsl:for-each select="StData">
                <xsl:variable name="stType" select='type'/>
                <xsl:attribute name="encid">
                                <xsl:value-of select="encId"/>
                              </xsl:attribute>
                <xsl:attribute name="categoryId">
                      <xsl:value-of select="catId"/>
                </xsl:attribute>
                <xsl:attribute name="itemId">
                    <xsl:value-of select="propId"/>
                </xsl:attribute>

                <xsl:attribute name="structId">
                  <xsl:value-of select="structId"/>
                </xsl:attribute>
                <xsl:attribute name="structType">
                  <xsl:value-of select="type"/>
                </xsl:attribute>
                <xsl:if test="value != ''">
	                <xsl:choose>
	                <xsl:when test="woundId != ''">
   					<br/>&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;<b><xsl:value-of select="woundId"/></b><br/>&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;
   				</xsl:when>
	                <xsl:when test="$structDataDisplay ='1' or (//return/SummeryView='true' and $ShowThumbNailsInProgressNotes='yes')">
	                  <br/>&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;
	                  </xsl:when>
	                  <xsl:when test="($structDataDisplay ='0' or $structDataDisplay ='2') and not(position()=1)">,&#160;</xsl:when>
	                  </xsl:choose>
	               <FONT SIZE="2"><xsl:value-of select="name"/></FONT>
	               <FONT SIZE="2">
	                <xsl:choose>
	                   <xsl:when test="$structDataDisplay ='1'">
	                   &#160;<i><xsl:value-of select="value"/></i>
	                   </xsl:when>
	                   <xsl:when test="$structDataDisplay ='0'">
	                   &#160;<xsl:value-of select="value"/>
	                   </xsl:when>
	                   <xsl:when test="$structDataDisplay ='2'">
	                   &#160;<b><xsl:value-of select="value"/></b>
	                   </xsl:when>
	               </xsl:choose>
	               </FONT>
               </xsl:if>
               </xsl:for-each>
             </xsl:if>
             <xsl:if test="count(StData) = 0">
                      <xsl:if test="procnotes2 !=''"><xsl:value-of select="procnotes2" disable-output-escaping="yes"/>.&#160;</xsl:if>
              </xsl:if>
               <xsl:if test="($structDataDisplay ='0' or $structDataDisplay ='2') and count(StData) != 0">.&#160;</xsl:if>
            </xsl:if>
            <xsl:if test="$docCount > 0">
                  <xsl:choose>
                  <xsl:when test="//return/SummeryView='true' and $ShowThumbNailsInProgressNotes='yes'"><br/>&#160;&#160;&#160;&#160;&#160;&#160;<iframe name="imageIframe" id="imageIframe_&#123;&#36;catId&#125;_&#123;&#36;itemId&#125;" src= "/mobiledoc/jsp/catalog/xml/imageInPN.jsp?section=Procedures&amp;encId=&#123;&#36;encId&#125;&amp;catId=&#123;&#36;catId&#125;&amp;itemId=&#123;&#36;itemId&#125;" scrolling="no" frameborder="0" style="border:21px; width:99%; height:{$ThumbNailHeight}px; overflow:hidden;" allowTransparency="true"></iframe><br/>&#160;&#160;&#160;&#160;&#160;&#160;&#160;</xsl:when>
                  
                  </xsl:choose>
           </xsl:if>
            <xsl:if test="($structDataDisplay ='1' or (//return/SummeryView='true' and $ShowThumbNailsInProgressNotes='yes')) and position() != last()">
                         <br/>&#160;&#160;&#160;&#160;&#160;&#160;
            </xsl:if>
 	</xsl:for-each>




 	</xsl:if>
 	<br/>
    </xsl:for-each>
<xsl:for-each select="categoryNotesBR">
      		<xsl:value-of select="." disable-output-escaping="yes"/>
    	</xsl:for-each>
    	
   </td></tr>
   	<tr class="rightPaneData"><td >
	<xsl:choose>
					
                  <xsl:when test="//return/SummeryView='true'">
                  <xsl:variable name="ThumbNailHeight" select='//return/ThumbNailHeight'/>
                  <xsl:variable name="ShowThumbNailsInProgressNotes" select='//return/ShowThumbNailsInProgressNotes'/>
					<xsl:variable name="EncounterId" select='//return/EncounterId'/>
					<xsl:if test="$maindoc= 'true'">
					<xsl:choose>
                   <xsl:when test="$ShowThumbNailsInProgressNotes = 'yes'">
                  <iframe name="imageIframe" id="imageIframe_0_0" src= "/mobiledoc/jsp/catalog/xml/imageInPN.jsp?section=Procedures&amp;encId=&#123;&#36;EncounterId&#125;&amp;catId=0&amp;itemId=0" scrolling="no" frameborder="0" style="border:21px; width:99%; height:{$ThumbNailHeight}px; overflow:hidden;" allowTransparency="true"></iframe><br/>
                  </xsl:when>
                  <xsl:otherwise>
                  		<xsl:for-each select="item/Drawing">
					<tr><td>Drawing:<xsl:value-of select="CustomName"/></td></tr>
					</xsl:for-each>
                  </xsl:otherwise>
                  </xsl:choose>
                  </xsl:if>
                  </xsl:when>
                  <xsl:otherwise>
                  	<xsl:if test="//return/ShowThumbNailsInProgressNotes != 'yes'">
                  		<xsl:for-each select="item/Drawing">
						<tr><td>Drawing:<xsl:value-of select="CustomName"/></td></tr>
						</xsl:for-each>
                  	</xsl:if>
                  </xsl:otherwise>
                  </xsl:choose>
	
	</td></tr>
  </table>


</xsl:template>

<xsl:template match="Therapeutic">
    <table cellspacing="0" cellpadding="0" width="100%">
      <tr class="rightPaneHeading"><td><xsl:value-of select="//return/ChartHeadings/Therapeutic"/></td></tr>
      <tr class="rightPaneData"><td>
      <xsl:for-each select="category">
	<u><xsl:value-of select="categoryName"/></u>
	<br/>
	<xsl:for-each select="categoryValues">
	    <xsl:for-each select="categoryValue">
         		&#160;&#160;&#160;&#160;&#160;&#160; <xsl:value-of select="."/><br/>
	    </xsl:for-each>
	 </xsl:for-each>
        </xsl:for-each>
     <xsl:for-each select="category">
	&#160;&#160;&#160;&#160;&#160;&#160;<xsl:value-of select="categoryNotes"/>
      </xsl:for-each>
   </td></tr>
   </table>
</xsl:template>

<xsl:template match="TherapyAssessment">
    <table cellspacing="0" cellpadding="0" width="100%">
      <tr class="rightPaneHeading"><td><xsl:value-of select="//return/ChartHeadings/TherapyAssessment"/></td></tr>
      <tr class="rightPaneData"><td>
      <xsl:for-each select="category">
	<u><xsl:value-of select="categoryName"/></u>
	<br/>
	<xsl:for-each select="categoryValues">
	    <xsl:for-each select="categoryValue">
         		&#160;&#160;&#160;&#160;&#160;&#160; <xsl:value-of select="."/><br/>
	    </xsl:for-each>
	 </xsl:for-each>
        </xsl:for-each>
     <xsl:for-each select="category">
	&#160;&#160;&#160;&#160;&#160;&#160;<xsl:value-of select="categoryNotes"/>
      </xsl:for-each>
   </td></tr>
   </table>
</xsl:template>

<xsl:template match="assessment">
    <xsl:choose>
    <xsl:when test="//subItems/assessment != ''">
    <xsl:if test="(position()=1)">
	<table cellspacing="0" cellpadding="0" width="100%">
	<tr class="rightPaneHeading"><td><xsl:value-of select="//return/ChartHeadings/Assessment"/></td></tr>
	</table>
    </xsl:if>
    <table cellspacing="0" cellpadding="0" width="100%">
	    	<tr class="rightPaneData"><td>
            <xsl:value-of select="position()"/>. <xsl:value-of select="."/>
            </td></tr>
    </table>
    </xsl:when>
    </xsl:choose>
</xsl:template>

<xsl:template match="alerts">
  <xsl:choose>
  <xsl:when test="HealthMaintenanceAlerts != ''">
  <table cellspacing="0" cellpadding="0" width="100%">
    <tr class="rightPaneHeading"><td><xsl:value-of select="//return/ChartHeadings/HealthMaintenanceAlerts"/></td></tr>
    <tr class="rightPaneData"><td>
    </td></tr>
  </table>
  <table cellSpacing="0" cellPadding="2" border="1" bordercolorlight="black" bordercolordark="black" style="border-collapse:collapse">
    <xsl:for-each select="HealthMaintenanceAlerts/TR">
		  <tr>
      <xsl:for-each select="TD">
			<td>
        <xsl:attribute name="colspan">
          <xsl:value-of select="@colspan" />
        </xsl:attribute>
        <xsl:attribute name="class">
          <xsl:value-of select="@class" />
        </xsl:attribute>
		<xsl:attribute name="style">
          <xsl:value-of select="@style" />
        </xsl:attribute>
        <xsl:attribute name="title">
          <xsl:value-of select="." disable-output-escaping="yes"/>
        </xsl:attribute>
         &#160;<xsl:value-of select="." disable-output-escaping="yes"/>
			 </td>
      </xsl:for-each>
		   </tr>
     </xsl:for-each>
  </table>
  </xsl:when>
  </xsl:choose>
</xsl:template>

<xsl:template match="Immunization">
  <xsl:choose>
  <xsl:when test="SubItems != ''">
  <table cellspacing="0" cellpadding="0" width="100%">
    <tr class="rightPaneHeading"><td><xsl:value-of select="//return/ChartHeadings/Immunizations"/></td></tr>
    <tr class="rightPaneData"><td>
    <xsl:for-each select="SubItems">
 		<table class="rightPaneData" cellspacing="0" cellpadding="0">
		  <tr>
			<td>
			   <xsl:value-of select="itemValue" /> <xsl:value-of select="itemDetails" />
			 </td>
		   </tr>
		 </table>
     </xsl:for-each>
    </td></tr>
  </table>
  <xsl:if test="itemValue">
     <xsl:if test="itemValue!=''">
    	<span class="rightPaneData" ><xsl:value-of select="itemValue" /><br/></span>
     </xsl:if>
	</xsl:if>
  </xsl:when>
  <xsl:otherwise>
  	<xsl:if test="itemValue">
  	      <xsl:if test="itemValue!=''">
  	       <table cellspacing="0" cellpadding="0" width="100%">
    		<tr class="rightPaneHeading"><td><xsl:value-of select="//return/ChartHeadings/Immunizations"/></td></tr>
			<tr class="rightPaneData">
    			<td>
			   		&#160;&#160;&#160;&#160;&#160;&#160;<xsl:value-of select="itemValue" /><br/>
			 	</td>
		   	 </tr>
		   </table>
		 </xsl:if>
  	  </xsl:if>
  </xsl:otherwise>
  </xsl:choose>
</xsl:template>

<xsl:template match="Injection">
  <xsl:choose>
  <xsl:when test="SubItems != ''">
  <table cellspacing="0" cellpadding="0" width="100%">
    <tr class="rightPaneHeading"><td><xsl:value-of select="//return/ChartHeadings/Injections"/></td></tr>
    <tr class="rightPaneData"><td>
    <xsl:for-each select="SubItems">
 		<table class="rightPaneData" cellspacing="0" cellpadding="0">
		  <tr>
			<td>
			   <xsl:value-of select="itemValue" /> <xsl:value-of select="itemDetails" />
			 </td>
		   </tr>
		 </table>
     </xsl:for-each>
    </td></tr>
  </table>
  </xsl:when>
  </xsl:choose>
</xsl:template>

<xsl:template match="//subItems/examination/category/MuscularExam">
  &#160;&#160;&#160;
  <span class="rightpanedata"><u>Musculoskeletal Exam</u></span><br/><br/>
  <table cellSpacing="0" cellPadding="1" border="1" bordercolorlight="black" bordercolordark="black" style="border-collapse:collapse">
    <xsl:for-each select="TR">
    <tr>
      <xsl:for-each select="TD">
        <td nowrap="1" >
        <xsl:attribute name="colspan">
          <xsl:value-of select="@colspan" />
        </xsl:attribute>
        <xsl:attribute name="class">
          <xsl:value-of select="@class" />
        </xsl:attribute>
        <xsl:attribute name="align">
          <xsl:value-of select="@align" />
        </xsl:attribute>
        <xsl:attribute name="title">
          <xsl:value-of select="." disable-output-escaping="yes"/>
        </xsl:attribute>
         &#160;<xsl:value-of select="." disable-output-escaping="yes"/>
        </td>
      </xsl:for-each>
    </tr>
    </xsl:for-each>
    </table>
</xsl:template>

<xsl:template match="UnaidedAcuities">
	<xsl:if test="AcuityData != ''">
		&#160;&#160;&#160;&#160;&#160;&#160;<u>Unaided Acuities</u> <br />
		<xsl:apply-templates select="AcuityData"/>
	</xsl:if>
</xsl:template>

<xsl:template match="AidedAcuities">
	<xsl:if test="AcuityData != ''">
		&#160;&#160;&#160;&#160;&#160;&#160;<u>Aided Acuities</u> <br />
		<xsl:apply-templates select="AcuityData"/>
	</xsl:if>
</xsl:template>

<xsl:template match="AcuityData">
<TABLE width="100%">
	<TR>
		<TD width="10px">&#160;&#160;&#160;</TD>
		<TD>
			<table cellSpacing="0" cellPadding="1" border="1" bordercolorlight="#C0C0C0" bordercolordark="#C0C0C0" style="border-collapse:collapse">
				<tr>
					<td width="2%" class="TitleColor">&#160;</td>
					<td width="5%" align="Center" class="TitleColor"><b>DVA</b></td>
					<td width="5%" align="Center" class="TitleColor"><b>NVA</b></td>
					<td width="5%" align="Center" class="TitleColor"><b>PH</b></td>
				</tr>
				<tr>
					<td width="2%" align="Center" class="TitleColor"><b>OD</b></td>
					<xsl:apply-templates select="DVAOD"/>
					<xsl:apply-templates select="NVAOD"/>
					<xsl:apply-templates select="PHOD"/>
				</tr>

				<tr>
					<td width="2%" align="Center" class="TitleColor"><b>OS</b></td>
					<xsl:apply-templates select="DVAOS"/>
					<xsl:apply-templates select="NVAOS"/>
					<xsl:apply-templates select="PHOS"/>
				</tr>

				<tr>
					<td width="2%" align="Center" class="TitleColor"><b>OU</b></td>
					<xsl:apply-templates select="DVAOU"/>
					<xsl:apply-templates select="NVAOU"/>
					<xsl:apply-templates select="PHOU"/>
				</tr>
			</table>
		</TD>
		<TD width="50px">&#160;&#160;&#160;&#160;&#160;</TD>
		<TD width="50px">&#160;&#160;&#160;&#160;&#160;</TD>
		<TD width="50px">&#160;&#160;&#160;&#160;&#160;</TD>
		<TD width="50px">&#160;&#160;&#160;&#160;&#160;</TD>
		<TD width="50px">&#160;&#160;&#160;&#160;&#160;</TD>
		<TD width="50px">&#160;&#160;&#160;&#160;&#160;</TD>
		<TD width="50px">&#160;&#160;&#160;&#160;&#160;</TD>
	</TR>
</TABLE>
</xsl:template>

<xsl:template match="IOPS">
	<xsl:if test="IOP != ''">
		&#160;&#160;&#160;&#160;&#160;
		<u> IOP </u>
		<br />
		<TABLE cellspacing="0" cellpadding="0" width="100%">
			<TR>
				<TD width="10px">&#160;&#160;&#160;&#160;&#160;</TD>
				<TD>
					<table cellSpacing="0" cellPadding="1" border="1" bordercolorlight="#C0C0C0" bordercolordark="#C0C0C0" style="border-collapse:collapse">
						<tr>
							<td width="2%" align="Center" class="TitleColor"><b>IOP</b></td>
							<td width="5%" align="Center" class="TitleColor"><b>OD</b></td>
							<td width="5%" align="Center" class="TitleColor"><b>OS</b></td>
							<td width="5%" align="Center" class="TitleColor"><b>Adj OD</b></td>
	                        <td width="5%" align="Center" class="TitleColor"><b>Adj OS</b></td>
							<td width="5%" align="Center" class="TitleColor"><b>Test</b></td>
							<td width="5%" align="Center" class="TitleColor"><b>Time</b></td>
							<td width="5%" align="Center" class="TitleColor"><b>Category</b></td>
						</tr>
						<xsl:for-each select="IOP">
							<tr>
								<td width="2%" align="Center" class="TitleColor"><xsl:value-of select="DISPLAYINDEX"/></td>
								<td width="5%" align="Center" class="tablecell"><xsl:value-of select="IOPOD"/></td>
								<td width="5%" align="Center" class="tablecell"><xsl:value-of select="IOPOS"/></td>
								<td width="5%" align="Center" class="tablecell"><xsl:value-of select="IOPAOD"/></td>
                                <td width="5%" align="Center" class="tablecell"><xsl:value-of select="IOPAOS"/></td>
								<td width="5%" align="Center" class="tablecell"><xsl:value-of select="IOPTEST"/></td>
								<td width="5%" align="Center" class="tablecell"><xsl:value-of select="IOPTIME"/></td>
								<td width="5%" align="Center" class="tablecell"><xsl:value-of select="IOPCAT"/></td>
							</tr>
						</xsl:for-each>
					</table>
				</TD>
				<TD width="50px">&#160;&#160;&#160;&#160;&#160;</TD>
				<TD width="50px">&#160;&#160;&#160;&#160;&#160;</TD>
				<TD width="50px">&#160;&#160;&#160;&#160;&#160;</TD>
				<TD width="50px">&#160;&#160;&#160;&#160;&#160;</TD>
			</TR>
		</TABLE>
	</xsl:if>
</xsl:template>

<xsl:template match="AutoRefractions">
	<xsl:if test="ARCData != ''">
		&#160;&#160;&#160;&#160;&#160; <u> Auto Refraction </u> <br />
		<xsl:apply-templates select="ARCData"/>
	</xsl:if>
</xsl:template>

<xsl:template match="Retinoscopys">
	<xsl:if test="ARCData != ''">
		&#160;&#160;&#160;&#160;&#160; <u> Retinoscopy </u> <br/>
		<xsl:apply-templates select="ARCData"/>
	</xsl:if>
</xsl:template>

<xsl:template match="Cycloplegics">
	<xsl:if test="CylManData != ''">
		&#160;&#160;&#160;&#160;&#160; <u> Cycloplegic </u> <br/>
		<xsl:apply-templates select="CylManData"/>
	</xsl:if>
</xsl:template>

<xsl:template match="Manifests">
	<xsl:if test="CylManData != ''">
		&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;<FONT COLOR="black">Manifest</FONT><br/>
		<xsl:apply-templates select="CylManData"/>
	</xsl:if>
</xsl:template>

<xsl:template match="PSRs">
	<xsl:apply-templates select="PSRFSRData"/>
</xsl:template>

<xsl:template match="FSRs">
	<xsl:apply-templates select="PSRFSRData"/>
</xsl:template>

<!-- GENERIC TEMPLATE FOR AUTO REFRACTION, RETINOSCOPY -->
<xsl:template match="ARCData">
	<TABLE cellspacing="0" cellpadding="0"
		width="100%">
		<TR>
			<TD width="10px">&#160;&#160;&#160;&#160;&#160;</TD>
			<TD>
					<table cellSpacing="0" cellPadding="1" border="1" bordercolorlight="#C0C0C0" bordercolordark="#C0C0C0" style="border-collapse:collapse">

					<tr>
						<td width="2%" align="Center" class="TitleColor">
							<b>&#160;</b>
						</td>
						<td width="5%" align="Center" class="TitleColor"><b>Sph</b></td>
						<td width="5%" align="Center" class="TitleColor"><b>Cyl</b></td>
						<td width="5%" align="Center" class="TitleColor"><b>Axis</b></td>
						<td width="5%" align="Center" class="TitleColor"><b>Add</b></td>
						<td width="5%" align="Center" class="TitleColor"><b>DVA</b></td>
						<td width="5%" align="Center" class="TitleColor"><b>NVA</b></td>
					</tr>

					<tr>
						<td width="2%" align="Center" class="TitleColor"><b>OD</b></td>
						<xsl:apply-templates select="SPHOD"/>
						<xsl:apply-templates select="CYLOD"/>
						<xsl:apply-templates select="AXISOD"/>
						<xsl:apply-templates select="ADDOD"/>
						<xsl:apply-templates select="DVAOD"/>
						<xsl:apply-templates select="NVAOD"/>
					</tr>

					<tr>
						<td width="2%" align="Center" class="TitleColor"><b>OS</b></td>
						<xsl:apply-templates select="SPHOS"/>
						<xsl:apply-templates select="CYLOS"/>
						<xsl:apply-templates select="AXISOS"/>
						<xsl:apply-templates select="ADDOS"/>
						<xsl:apply-templates select="DVAOS"/>
						<xsl:apply-templates select="NVAOS"/>
					</tr>
				</table>
			</TD>
			<TD width="50px">&#160;&#160;&#160;&#160;&#160;</TD>
			<TD width="50px">&#160;&#160;&#160;&#160;&#160;</TD>
			<TD width="50px">&#160;&#160;&#160;&#160;&#160;</TD>
			<TD width="50px">&#160;&#160;&#160;&#160;&#160;</TD>
		</TR>
	</TABLE>
</xsl:template>

<!-- GENERIC TEMPLATE FOR Cycloplegic, Manifest -->
<xsl:template match="CylManData">
				<TABLE cellspacing="0" cellpadding="0" width="100%" >
				<TR><TD width="10px">&#160;&#160;&#160;&#160;&#160;</TD>
				<TD >
					<table cellSpacing="0" cellPadding="1" border="1" bordercolorlight="#C0C0C0" bordercolordark="#C0C0C0" style="border-collapse:collapse">
 					<tr>
						<td width="2%" align="Center" class="TitleColor">&#160;</td>
						<td width="5%" align="Center" class="TitleColor"><b>Sph</b></td>
						<td width="5%" align="Center" class="TitleColor"><b>Cyl</b></td>
						<td width="5%" align="Center" class="TitleColor"><b>Axis</b></td>
						<td width="5%" align="Center" class="TitleColor"><b>H Prism</b></td>
						<td width="5%" align="Center" class="TitleColor"><b>V Prism</b></td>
						<td width="5%" align="Center" class="TitleColor"><b>Add</b></td>
						<td width="5%" align="Center" class="TitleColor"><b>DVA</b></td>
						<td width="5%" align="Center" class="TitleColor"><b>NVA</b></td>
						<td width="5%" align="Center" class="TitleColor"><b>PH</b></td>
					</tr>

 					<tr>
						<td width="2%" align="Center" class="TitleColor"><b>OD</b></td>
	 					<xsl:apply-templates select="SPHOD"/>
	 					<xsl:apply-templates select="CYLOD"/>
	 					<xsl:apply-templates select="AXISOD"/>
	 					<xsl:apply-templates select="HPRISMOD"/>
	 					<xsl:apply-templates select="VPRISMOD"/>
	 					<xsl:apply-templates select="ADDOD"/>
	 					<xsl:apply-templates select="DVAOD"/>
	 					<xsl:apply-templates select="NVAOD"/>
	 					<xsl:apply-templates select="PHOD"/>
					</tr>

 					<tr>
						<td width="2%" align="Center" class="TitleColor"><b>OS</b></td>
 						<xsl:apply-templates select="SPHOS"/>
	 					<xsl:apply-templates select="CYLOS"/>
	 					<xsl:apply-templates select="AXISOS"/>
	 					<xsl:apply-templates select="HPRISMOS"/>
	 					<xsl:apply-templates select="VPRISMOS"/>
	 					<xsl:apply-templates select="ADDOS"/>
	 					<xsl:apply-templates select="DVAOS"/>
	 					<xsl:apply-templates select="NVAOS"/>
	 					<xsl:apply-templates select="PHOS"/>
					</tr>
 				</table>
				</TD>
				<TD width="50px">&#160;&#160;&#160;&#160;&#160;</TD>
				</TR>
				<xsl:if test="SFittingComments != ''">
					<TR>
						<TD width="10px">&#160;&#160;&#160;&#160;&#160;</TD>
						<TD class="tablecell"><xsl:apply-templates select="SFittingComments"/></TD>
						<TD width="50px">&#160;&#160;&#160;&#160;&#160;</TD>
					</TR>
				</xsl:if>
				</TABLE>
</xsl:template>

<xsl:template match="PSRFSRData">
	<xsl:apply-templates select="ExamTabName"/>
	<TABLE cellspacing="0" cellpadding="0" width="100%">
		<TR>
			<TD width="10px">&#160;&#160;&#160;&#160;&#160;</TD>
			<TD>
					<table cellSpacing="0" cellPadding="1" border="1" bordercolorlight="#C0C0C0" bordercolordark="#C0C0C0" style="border-collapse:collapse">

					<tr>
						<td width="2%" align="Center" class="TitleColor">&#160;</td>
						<td width="5%" align="Center" class="TitleColor"><b>Sph</b></td>
						<td width="5%" align="Center" class="TitleColor"><b>Cyl</b></td>
						<td width="5%" align="Center" class="TitleColor"><b>Axis</b></td>
						<td width="5%" align="Center" class="TitleColor"><b>H Prism</b></td>
						<td width="5%" align="Center" class="TitleColor"><b>V Prism</b></td>
						<td width="5%" align="Center" class="TitleColor"><b>Add</b></td>
						<td width="5%" align="Center" class="TitleColor"><b>DVA</b></td>
						<td width="5%" align="Center" class="TitleColor"><b>NVA</b></td>
						<td width="5%" align="Center" class="TitleColor"><b>PH</b></td>
					</tr>

					<tr>
						<td width="2%" align="Center" class="TitleColor"><b>OD</b></td>
						<xsl:apply-templates select="SPHOD"/>
						<xsl:apply-templates select="CYLOD"/>
						<xsl:apply-templates select="AXISOD"/>
						<xsl:apply-templates select="HPRISMOD"/>
						<xsl:apply-templates select="VPRISMOD"/>
						<xsl:apply-templates select="ADDOD"/>
						<xsl:apply-templates select="DVAOD"/>
						<xsl:apply-templates select="NVAOD"/>
						<xsl:apply-templates select="PHOD"/>
					</tr>

					<tr>
						<td width="2%" align="Center" class="TitleColor"><b>OS</b></td>
						<xsl:apply-templates select="SPHOS"/>
						<xsl:apply-templates select="CYLOS"/>
						<xsl:apply-templates select="AXISOS"/>
						<xsl:apply-templates select="HPRISMOS"/>
						<xsl:apply-templates select="VPRISMOS"/>
						<xsl:apply-templates select="ADDOS"/>
						<xsl:apply-templates select="DVAOS"/>
						<xsl:apply-templates select="NVAOS"/>
						<xsl:apply-templates select="PHOS"/>
					</tr>

					<tr>
						<td width="2%" align="Center" class="TitleColor"><b>OU</b></td>
						<td width="5%" align="left"></td>
						<td width="5%" align="left"></td>
						<td width="5%" align="left"></td>
						<td width="5%" align="left"></td>
						<td width="5%" align="left"></td>
						<td width="5%" align="left"></td>
						<xsl:apply-templates select="DVAOU"/>
						<xsl:apply-templates select="NVAOU"/>
						<xsl:apply-templates select="PHOU"/>
					</tr>
				</table>
			</TD>
			<TD width="50px">&#160;&#160;&#160;&#160;&#160;</TD>
		</TR>
		<xsl:if test="SFittingComments != ''">
			<TR>
				<TD width="10px">&#160;&#160;&#160;&#160;&#160;</TD>
				<TD class="tablecell"><xsl:apply-templates select="SFittingComments"/></TD>
				<TD width="50px">&#160;&#160;&#160;&#160;&#160;</TD>
			</TR>
		</xsl:if>
	</TABLE>
</xsl:template>

<xsl:template match="PCRs">
	<xsl:apply-templates select="PCR"/>
</xsl:template>

<xsl:template match="PCR">
	<xsl:apply-templates select="PCRData"/>
	<xsl:apply-templates select="TrialRx"/>
	<xsl:apply-templates select="ORx"/>
	<xsl:apply-templates select="FinalContactRx"/>
</xsl:template>

<xsl:template match="PCRData">
<xsl:apply-templates select="ExamTabName"/>
<TABLE cellspacing="0" cellpadding="0"
	width="100%">
	<TR>
		<TD width="10px">&#160;&#160;&#160;&#160;&#160;</TD>
		<TD>
			<table cellSpacing="0" cellPadding="1" border="1" bordercolorlight="#C0C0C0" bordercolordark="#C0C0C0" style="border-collapse:collapse">

				<tr>
					<td width="2%" align="Center" class="TitleColor">&#160;</td>
					<td width="10%" align="center" class="TitleColor"><b>Product Name</b></td>
					<td width="2%" align="Center" class="TitleColor"><b>BC</b></td>
					<td width="5%" align="Center" class="TitleColor"><b>Dia</b></td>
					<td width="2%" align="Center" class="TitleColor"><b>Sph</b></td>
					<td width="5%" align="Center" class="TitleColor"><b>Cyl</b></td>
					<td width="5%" align="Center" class="TitleColor"><b>Axis</b></td>
					<td width="5%" align="Center" class="TitleColor"><b>Add</b></td>
					<td width="5%" align="Center" class="TitleColor"><b>DVA</b></td>
					<td width="5%" align="Center" class="TitleColor"><b>NVA</b></td>
					<td width="5%" align="Center" class="TitleColor"><b>Tint</b></td>
				</tr>

				<tr>
					<td width="2%" align="Center" class="TitleColor"><b>OD</b></td>
					<xsl:apply-templates select="PRODUCTNAMEOD"/>
					<xsl:apply-templates select="BCOD"/>
					<xsl:apply-templates select="DIAOD"/>
					<xsl:apply-templates select="SPHOD"/>
					<xsl:apply-templates select="CYLOD"/>
					<xsl:apply-templates select="AXISOD"/>
					<xsl:apply-templates select="ADDOD"/>
					<xsl:apply-templates select="DVAOD"/>
					<xsl:apply-templates select="NVAOD"/>
					<xsl:apply-templates select="TINTOD"/>
				</tr>

				<tr>
					<td width="2%" align="Center" class="TitleColor"><b>OS</b></td>
					<xsl:apply-templates select="PRODUCTNAMEOS"/>
					<xsl:apply-templates select="BCOS"/>
					<xsl:apply-templates select="DIAOS"/>
					<xsl:apply-templates select="SPHOS"/>
					<xsl:apply-templates select="CYLOS"/>
					<xsl:apply-templates select="AXISOS"/>
					<xsl:apply-templates select="ADDOS"/>
					<xsl:apply-templates select="DVAOS"/>
					<xsl:apply-templates select="NVAOS"/>
					<xsl:apply-templates select="TINTOS"/>
				</tr>

				<tr>
					<td width="2%" align="Center" class="TitleColor"><b>OU</b></td>
					<td width="5%" align="left"></td>
					<td width="5%" align="left"></td>
					<td width="5%" align="left"></td>
					<td width="5%" align="left"></td>
					<td width="5%" align="left"></td>
					<td width="5%" align="left"></td>
					<td width="5%" align="left"></td>
					<xsl:apply-templates select="DVAOU"/>
					<xsl:apply-templates select="NVAOU"/>
					<td width="5%" align="Center"></td>
				</tr>

			</table>
		</TD>
		<TD width="50px">&#160;&#160;&#160;&#160;&#160;</TD>
	</TR>
	<xsl:if test="CFittingComments != ''">
		<TR>
			<TD width="10px">&#160;&#160;&#160;&#160;&#160;</TD>
			<TD class="tablecell"><xsl:apply-templates select="CFittingComments"/></TD>
			<TD width="50px">&#160;&#160;&#160;&#160;&#160;</TD>
		</TR>
	</xsl:if>
</TABLE>
</xsl:template>

<xsl:template match="TrialRx">
<xsl:apply-templates select="ExamTabName"/>
<TABLE cellspacing="0" cellpadding="0" width="100%">
	<TR>
		<TD width="10px">&#160;&#160;&#160;&#160;&#160;</TD>
		<TD>
			<table cellSpacing="0" cellPadding="1" border="1" bordercolorlight="#C0C0C0" bordercolordark="#C0C0C0" style="border-collapse:collapse">

				<tr>
					<td width="2%" align="Center" class="TitleColor">&#160;</td>
					<td width="10%" align="Center" class="TitleColor"><b>Product Name</b></td>
					<td width="2%" align="Center" class="TitleColor"><b>BC</b></td>
					<td width="5%" align="Center" class="TitleColor"><b>Dia</b></td>
					<td width="2%" align="Center" class="TitleColor"><b>Sph</b></td>
					<td width="5%" align="Center" class="TitleColor"><b>Cyl</b></td>
					<td width="5%" align="Center" class="TitleColor"><b>Axis</b></td>
					<td width="5%" align="Center" class="TitleColor"><b>Add</b></td>
					<td width="5%" align="Center" class="TitleColor"><b>DVA</b></td>
					<td width="5%" align="Center" class="TitleColor"><b>NVA</b></td>
					<td width="5%" align="Center" class="TitleColor"><b>Tint</b></td>
				</tr>

				<tr>
					<td width="2%" align="Center" class="TitleColor"><b>OD</b></td>
					<xsl:apply-templates select="PRODUCTNAMEOD"/>
					<xsl:apply-templates select="BCOD"/>
					<xsl:apply-templates select="DIAOD"/>
					<xsl:apply-templates select="SPHOD"/>
					<xsl:apply-templates select="CYLOD"/>
					<xsl:apply-templates select="AXISOD"/>
					<xsl:apply-templates select="ADDOD"/>
					<xsl:apply-templates select="DVAOD"/>
					<xsl:apply-templates select="NVAOD"/>
					<xsl:apply-templates select="TINTOD"/>
				</tr>

				<tr>
					<td width="2%" align="Center" class="TitleColor"><b>OS</b></td>
					<xsl:apply-templates select="PRODUCTNAMEOS"/>
					<xsl:apply-templates select="BCOS"/>
					<xsl:apply-templates select="DIAOS"/>
					<xsl:apply-templates select="SPHOS"/>
					<xsl:apply-templates select="CYLOS"/>
					<xsl:apply-templates select="AXISOS"/>
					<xsl:apply-templates select="ADDOS"/>
					<xsl:apply-templates select="DVAOS"/>
					<xsl:apply-templates select="NVAOS"/>
					<xsl:apply-templates select="TINTOS"/>
				</tr>

				<tr>
					<td width="2%" align="Center" class="TitleColor"><b>OU</b></td>
					<td width="5%" align="Center"></td>
					<td width="5%" align="Center"></td>
					<td width="5%" align="Center"></td>
					<td width="5%" align="Center"></td>
					<td width="5%" align="Center"></td>
					<td width="5%" align="Center"></td>
					<td width="5%" align="Center"></td>
					<xsl:apply-templates select="DVAOU"/>
					<xsl:apply-templates select="NVAOU"/>
					<td width="5%" align="Center"></td>
				</tr>

			</table>
		</TD>
		<TD width="50px">&#160;&#160;&#160;&#160;&#160;</TD>
	</TR>
	<xsl:if test="CFittingComments != ''">
		<TR>
			<TD width="10px">&#160;&#160;&#160;&#160;&#160;</TD>
			<TD class="tablecell"><xsl:apply-templates select="CFittingComments"/></TD>
			<TD width="50px">&#160;&#160;&#160;&#160;&#160;</TD>
		</TR>
	</xsl:if>
</TABLE>
</xsl:template>

<xsl:template match="ORx">
<xsl:apply-templates select="ExamTabName"/>
<TABLE cellspacing="0" cellpadding="0" width="100%">
	<TR>
		<TD width="10px">&#160;&#160;&#160;&#160;&#160;</TD>
		<TD>
			<table cellSpacing="0" cellPadding="1" border="1" bordercolorlight="#C0C0C0" bordercolordark="#C0C0C0" style="border-collapse:collapse">
				<tr>
					<td width="2%" align="Center" class="TitleColor">&#160;</td>
					<td width="5%" align="Center" class="TitleColor"><b>Sph</b></td>
					<td width="5%" align="Center" class="TitleColor"><b>Cyl</b></td>
					<td width="5%" align="Center" class="TitleColor"><b>Axis</b></td>
					<td width="5%" align="Center" class="TitleColor"><b>Add</b></td>
					<td width="5%" align="Center" class="TitleColor"><b>DVA</b></td>
					<td width="5%" align="Center" class="TitleColor"><b>NVA</b></td>
				</tr>

				<tr>
					<td width="2%" align="Center" class="TitleColor"><b>OD</b></td>
					<xsl:apply-templates select="SPHOD"/>
					<xsl:apply-templates select="CYLOD"/>
					<xsl:apply-templates select="AXISOD"/>
					<xsl:apply-templates select="ADDOD"/>
					<xsl:apply-templates select="DVAOD"/>
					<xsl:apply-templates select="NVAOD"/>
				</tr>

				<tr>
					<td width="2%" align="Center" class="TitleColor"><b>OS</b></td>
					<xsl:apply-templates select="SPHOS"/>
					<xsl:apply-templates select="CYLOS"/>
					<xsl:apply-templates select="AXISOS"/>
					<xsl:apply-templates select="ADDOS"/>
					<xsl:apply-templates select="DVAOS"/>
					<xsl:apply-templates select="NVAOS"/>
				</tr>

			</table>
		</TD>
		<TD width="50px">&#160;&#160;&#160;&#160;&#160;</TD>
		<TD width="50px">&#160;&#160;&#160;&#160;&#160;</TD>
		<TD width="50px">&#160;&#160;&#160;&#160;&#160;</TD>
		<TD width="50px">&#160;&#160;&#160;&#160;&#160;</TD>
	</TR>
</TABLE>
</xsl:template>

<xsl:template match="FinalContactRx">
<xsl:apply-templates select="ExamTabName"/>
<TABLE cellspacing="0" cellpadding="0"
	width="100%">
	<TR>
		<TD width="10px">&#160;&#160;&#160;&#160;&#160;</TD>
		<TD>
			<table cellSpacing="0" cellPadding="1" border="1" bordercolorlight="#C0C0C0" bordercolordark="#C0C0C0" style="border-collapse:collapse">

				<tr>
					<td width="2%" align="Center" class="TitleColor">&#160;</td>
					<td width="10%" align="Center" class="TitleColor"><b>Product Name</b></td>
					<td width="2%" align="Center" class="TitleColor"><b>BC</b></td>
					<td width="5%" align="Center" class="TitleColor"><b>Dia</b></td>
					<td width="2%" align="Center" class="TitleColor"><b>Sph</b></td>
					<td width="5%" align="Center" class="TitleColor"><b>Cyl</b></td>
					<td width="5%" align="Center" class="TitleColor"><b>Axis</b></td>
					<td width="5%" align="Center" class="TitleColor"><b>Add</b></td>
					<td width="5%" align="Center" class="TitleColor"><b>DVA</b></td>
					<td width="5%" align="Center" class="TitleColor"><b>NVA</b></td>
					<td width="5%" align="Center" class="TitleColor"><b>Tint</b></td>
				</tr>

				<tr>
					<td width="2%" align="Center" class="TitleColor"><b>OD</b></td>
					<xsl:apply-templates select="PRODUCTNAMEOD"/>
					<xsl:apply-templates select="BCOD"/>
					<xsl:apply-templates select="DIAOD"/>
					<xsl:apply-templates select="SPHOD"/>
					<xsl:apply-templates select="CYLOD"/>
					<xsl:apply-templates select="AXISOD"/>
					<xsl:apply-templates select="ADDOD"/>
					<xsl:apply-templates select="DVAOD"/>
					<xsl:apply-templates select="NVAOD"/>
					<xsl:apply-templates select="TINTOD"/>
				</tr>

				<tr>
					<td width="2%" align="Center" class="TitleColor"><b>OS</b></td>
					<xsl:apply-templates select="PRODUCTNAMEOS"/>
					<xsl:apply-templates select="BCOS"/>
					<xsl:apply-templates select="DIAOS"/>
					<xsl:apply-templates select="SPHOS"/>
					<xsl:apply-templates select="CYLOS"/>
					<xsl:apply-templates select="AXISOS"/>
					<xsl:apply-templates select="ADDOS"/>
					<xsl:apply-templates select="DVAOS"/>
					<xsl:apply-templates select="NVAOS"/>
					<xsl:apply-templates select="TINTOS"/>
				</tr>

				<tr>
					<td width="2%" align="Center" class="TitleColor"><b>OU</b></td>
					<td width="5%" align="left"></td>
					<td width="5%" align="left"></td>
					<td width="5%" align="left"></td>
					<td width="5%" align="left"></td>
					<td width="5%" align="left"></td>
					<td width="5%" align="left"></td>
					<td width="5%" align="left"></td>
					<xsl:apply-templates select="DVAOU"/>
					<xsl:apply-templates select="NVAOU"/>
					<td width="5%" align="left"></td>
				</tr>

			</table>
		</TD>
		<TD width="50px">&#160;&#160;&#160;&#160;&#160;</TD>
	</TR>
	<xsl:if test="CFittingComments != ''">
		<TR>
			<TD width="10px">&#160;&#160;&#160;&#160;&#160;</TD>
			<TD class="tablecell"><xsl:apply-templates select="CFittingComments"/></TD>
			<TD width="50px">&#160;&#160;&#160;&#160;&#160;</TD>
		</TR>
	</xsl:if>
</TABLE>
</xsl:template>

<xsl:template match="ExamTabName">
	&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;
	<FONT COLOR="black">
		<xsl:value-of select="." />
	</FONT>
	<br />
</xsl:template>
<!-- GENERIC TEMPLATE FOR OD -->
<xsl:template match="SPHOD">
	<td width="5%" align="Center" class="tablecell">
		<xsl:value-of select="." />
	</td>
</xsl:template>
<xsl:template match="CYLOD">
	<td width="5%" align="Center" class="tablecell">
		<xsl:value-of select="." />
	</td>
</xsl:template>
<xsl:template match="AXISOD">
	<td width="5%" align="Center" class="tablecell">
		<xsl:value-of select="." />
	</td>
</xsl:template>
<xsl:template match="HPRISMOD">
	<td width="5%" align="Center" class="tablecell">
		<xsl:value-of select="." />
	</td>
</xsl:template>
<xsl:template match="VPRISMOD">
	<td width="5%" align="Center" class="tablecell">
		<xsl:value-of select="." />
	</td>
</xsl:template>
<xsl:template match="ADDOD">
	<td width="5%" align="Center" class="tablecell">
		<xsl:value-of select="." />
	</td>
</xsl:template>
<xsl:template match="DVAOD">
	<td width="5%" align="Center" class="tablecell">
		<xsl:value-of select="." />
	</td>
</xsl:template>
<xsl:template match="NVAOD">
	<td width="5%" align="Center" class="tablecell">
		<xsl:value-of select="." />
	</td>
</xsl:template>
<xsl:template match="PHOD">
	<td width="5%" align="Center" class="tablecell">
		<xsl:value-of select="." />
	</td>
</xsl:template>
<xsl:template match="BCOD">
	<td width="5%" align="Center" class="tablecell">
		<xsl:value-of select="." />
	</td>
</xsl:template>
<xsl:template match="DIAOD">
	<td width="5%" align="Center" class="tablecell">
		<xsl:value-of select="." />
	</td>
</xsl:template>
<xsl:template match="TINTOD">
	<td width="5%" align="Center" class="tablecell">
		<xsl:value-of select="." />
	</td>
</xsl:template>
<xsl:template match="PRODUCTNAMEOD">
	<td width="5%" align="Center" class="tablecell">
		<xsl:value-of select="." />
	</td>
</xsl:template>
<!-- GENERIC TEMPLATE FOR OS -->
<xsl:template match="SPHOS">
	<td width="5%" align="Center" class="tablecell">
		<xsl:value-of select="." />
	</td>
</xsl:template>
<xsl:template match="CYLOS">
	<td width="5%" align="Center" class="tablecell">
		<xsl:value-of select="." />
	</td>
</xsl:template>
<xsl:template match="AXISOS">
	<td width="5%" align="Center" class="tablecell">
		<xsl:value-of select="." />
	</td>
</xsl:template>
<xsl:template match="HPRISMOS">
	<td width="5%" align="Center" class="tablecell">
		<xsl:value-of select="." />
	</td>
</xsl:template>
<xsl:template match="VPRISMOS">
	<td width="5%" align="Center" class="tablecell">
		<xsl:value-of select="." />
	</td>
</xsl:template>
<xsl:template match="ADDOS">
	<td width="5%" align="Center" class="tablecell">
		<xsl:value-of select="." />
	</td>
</xsl:template>
<xsl:template match="DVAOS">
	<td width="5%" align="Center" class="tablecell">
		<xsl:value-of select="." />
	</td>
</xsl:template>
<xsl:template match="NVAOS">
	<td width="5%" align="Center" class="tablecell">
		<xsl:value-of select="." />
	</td>
</xsl:template>
<xsl:template match="PHOS">
	<td width="5%" align="Center" class="tablecell">
		<xsl:value-of select="." />
	</td>
</xsl:template>
<xsl:template match="BCOS">
	<td width="5%" align="Center" class="tablecell">
		<xsl:value-of select="." />
	</td>
</xsl:template>
<xsl:template match="DIAOS">
	<td width="5%" align="Center" class="tablecell">
		<xsl:value-of select="." />
	</td>
</xsl:template>
<xsl:template match="TINTOS">
	<td width="5%" align="Center" class="tablecell">
		<xsl:value-of select="." />
	</td>
</xsl:template>
<xsl:template match="PRODUCTNAMEOS">
	<td width="5%" align="Center" class="tablecell">
		<xsl:value-of select="." />
	</td>
</xsl:template>
<!-- GENERIC TEMPLATE FOR OU -->
<xsl:template match="SPHOU">
	<td width="5%" align="Center" class="tablecell">
		<xsl:value-of select="." />
	</td>
</xsl:template>
<xsl:template match="CYLOU">
	<td width="5%" align="Center" class="tablecell">
		<xsl:value-of select="." />
	</td>
</xsl:template>
<xsl:template match="AXISOU">
	<td width="5%" align="Center" class="tablecell">
		<xsl:value-of select="." />
	</td>
</xsl:template>
<xsl:template match="HPRISMOU">
	<td width="5%" align="Center" class="tablecell">
		<xsl:value-of select="." />
	</td>
</xsl:template>
<xsl:template match="VPRISMOU">
	<td width="5%" align="Center" class="tablecell">
		<xsl:value-of select="." />
	</td>
</xsl:template>
<xsl:template match="ADDOU">
	<td width="5%" align="Center" class="tablecell">
		<xsl:value-of select="." />
	</td>
</xsl:template>
<xsl:template match="DVAOU">
	<td width="5%" align="Center" class="tablecell">
		<xsl:value-of select="." />
	</td>
</xsl:template>
<xsl:template match="NVAOU">
	<td width="5%" align="Center" class="tablecell">
		<xsl:value-of select="." />
	</td>
</xsl:template>
<xsl:template match="PHOU">
	<td width="5%" align="Center" class="tablecell">
		<xsl:value-of select="." />
	</td>
</xsl:template>
<xsl:template match="BCOU">
	<td width="5%" align="Center" class="tablecell">
		<xsl:value-of select="." />
	</td>
</xsl:template>
<xsl:template match="DIAOU">
	<td width="5%" align="Center" class="tablecell">
		<xsl:value-of select="." />
	</td>
</xsl:template>
<xsl:template match="TINTOU">
	<td width="5%" align="Center" class="tablecell">
		<xsl:value-of select="." />
	</td>
</xsl:template>
<xsl:template match="PRODUCTNAMEOU">
	<td width="5%" align="Center" class="tablecell">
		<xsl:value-of select="." />
	</td>
</xsl:template>

<!-- Generic Template for fitting comments for spectacle and contacts -->
<xsl:template match="SFittingComments">
	<xsl:if test="Comments != ''">
		<b>Comments: </b><xsl:apply-templates select="Comments"/>
	</xsl:if>
</xsl:template>

<xsl:template match="CFittingComments">
	<table border="0" width="100%">
		<xsl:if test="Centration_Movement != ''">
			<tr><td class="tablecell"><b>Centration Movement: </b><xsl:apply-templates select="Centration_Movement"/></td></tr>
		</xsl:if>
		<xsl:if test="Toric_Orientation != ''">
			<tr><td class="tablecell"><b>Toric Orientation: </b><xsl:apply-templates select="Toric_Orientation"/></td></tr>
		</xsl:if>
		<xsl:if test="Nafi_Pattern != ''">
			<tr><td class="tablecell"><b>Nafi Pattern: </b><xsl:apply-templates select="Nafi_Pattern"/></td></tr>
		</xsl:if>
		<xsl:if test="Comments != ''">
			<tr><td class="tablecell"><b>Comments: </b><xsl:apply-templates select="Comments"/></td></tr>
		</xsl:if>
	</table>
</xsl:template>

<!-- Template for K-Readings -->
<xsl:template match="KRS">
	<xsl:for-each select="KR">
		&#160;&#160;&#160;&#160;&#160;
		<u>K-Readings</u>
		<br />
		<TABLE width="100%">
			<xsl:if test="DiopterMM != ''">
				<TR>
					<TD width="10px">&#160;&#160;&#160;</TD>
					<TD class="tablecell"><xsl:apply-templates select="DiopterMM"/></TD>
					<TD width="50px">&#160;&#160;&#160;</TD>
				</TR>
			</xsl:if>
			<TR>
				<TD width="10px">&#160;&#160;&#160;</TD>
				<TD>
					<table width="100%" cellSpacing="0" cellPadding="1" border="1" bordercolorlight="#C0C0C0" bordercolordark="#C0C0C0" style="border-collapse:collapse">
						<tr>
							<td width="2%" class="TitleColor">&#160;</td>
							<td width="5%" align="Center" class="TitleColor" colspan="2"><b>Flat K</b></td>
							<td width="5%" align="Center" class="TitleColor" colspan="2"><b>Steep K</b></td>
						</tr>
						<tr>
							<td width="2%" align="Center" class="TitleColor"><b></b></td>
							<td width="5%" align="Center" class="tablecell"><xsl:value-of select="FlatK1OD" /></td>
							<td width="5%" align="Center" class="tablecell"><xsl:value-of select="FlatK2OD" /></td>
							<td width="5%" align="Center" class="tablecell"><xsl:value-of select="SteepK1OD" /></td>
							<td width="5%" align="Center" class="tablecell"><xsl:value-of select="SteepK2OD" /></td>
						</tr>

						<tr>
							<td width="2%" align="Center" class="TitleColor"><b></b></td>
							<td width="5%" align="Center" class="tablecell"><xsl:value-of select="FlatK1OS" /></td>
							<td width="5%" align="Center" class="tablecell"><xsl:value-of select="FlatK2OS" /></td>
							<td width="5%" align="Center" class="tablecell"><xsl:value-of select="SteepK1OS" /></td>
							<td width="5%" align="Center" class="tablecell"><xsl:value-of select="SteepK2OS" /></td>
						</tr>

					</table>
				</TD>
				<TD width="50px">&#160;&#160;&#160;&#160;&#160;</TD>
				<TD width="50px">&#160;&#160;&#160;&#160;&#160;</TD>
				<TD width="50px">&#160;&#160;&#160;&#160;&#160;</TD>
				<TD width="50px">&#160;&#160;&#160;&#160;&#160;</TD>
				<TD width="50px">&#160;&#160;&#160;&#160;&#160;</TD>
				<TD width="50px">&#160;&#160;&#160;&#160;&#160;</TD>
				<TD width="50px">&#160;&#160;&#160;&#160;&#160;</TD>
			</TR>
		</TABLE>
	</xsl:for-each>
</xsl:template>

<!-- Template for PD (Dist/Near) -->
<xsl:template match="PDs">
	<xsl:for-each select="PD">
		&#160;&#160;&#160;&#160;&#160;
		<u>PD</u>
		<br />
		<TABLE width="100%">
			<TR>
				<TD width="10px">&#160;&#160;&#160;</TD>
				<TD>
					<table width="100%" cellSpacing="0" cellPadding="1" border="1" bordercolorlight="#C0C0C0" bordercolordark="#C0C0C0" style="border-collapse:collapse">
						<tr>
							<td width="2%" class="TitleColor">&#160;</td>
							<td width="5%" align="Center" class="TitleColor"><b>Dist</b></td>
							<td width="5%" align="Center" class="TitleColor"><b>Near</b></td>
						</tr>
						<tr>
							<td width="2%" align="Center" class="TitleColor"><b>OU</b></td>
							<xsl:apply-templates select="DVAOU"/>
							<xsl:apply-templates select="NVAOU"/>
						</tr>

						<tr>
							<td width="2%" align="Center" class="TitleColor"><b>OD</b></td>
							<xsl:apply-templates select="DVAOD"/>
							<xsl:apply-templates select="NVAOD"/>
						</tr>

						<tr>
							<td width="2%" align="Center" class="TitleColor"><b>OS</b></td>
							<xsl:apply-templates select="DVAOS"/>
							<xsl:apply-templates select="NVAOS"/>
						</tr>
					</table>
				</TD>
				<TD width="50px">&#160;&#160;&#160;&#160;&#160;</TD>
				<TD width="50px">&#160;&#160;&#160;&#160;&#160;</TD>
				<TD width="50px">&#160;&#160;&#160;&#160;&#160;</TD>
				<TD width="50px">&#160;&#160;&#160;&#160;&#160;</TD>
				<TD width="50px">&#160;&#160;&#160;&#160;&#160;</TD>
				<TD width="50px">&#160;&#160;&#160;&#160;&#160;</TD>
				<TD width="50px">&#160;&#160;&#160;&#160;&#160;</TD>
			</TR>
		</TABLE>
	</xsl:for-each>
</xsl:template>

<!-- Vertex Dist, Spec BC, Work Dist -->
<xsl:template match="KRSADD">
	<xsl:for-each select="KRADD">
		<xsl:if test="VertexDist != ''">
			&#160;&#160;&#160;&#160;&#160;&#160;<u>Vertex Dist</u>
			<br />
			<table border="0" class="tablecell" width="100%">
				<tr>
					<TD width="10px">&#160;&#160;&#160;&#160;&#160;&#160;&#160;</TD>
					<TD class="tablecell"><xsl:apply-templates select="VertexDist"/> mm</TD>
					<TD width="50px">&#160;&#160;&#160;&#160;&#160;</TD>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="SpecBC != ''">
			&#160;&#160;&#160;&#160;&#160;&#160;<u>Spec BC</u>
			<br />
			<table border="0" class="tablecell" width="100%">
				<tr>
					<TD width="10px">&#160;&#160;&#160;&#160;&#160;&#160;&#160;</TD>
					<TD class="tablecell"><xsl:apply-templates select="SpecBC"/></TD>
					<TD width="50px">&#160;&#160;&#160;&#160;&#160;</TD>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="WorkDist != ''">
			&#160;&#160;&#160;&#160;&#160;&#160;<u>Work Dist</u>
			<br />
			<table border="0" class="tablecell" width="100%">
				<tr>
					<TD width="10px">&#160;&#160;&#160;&#160;&#160;&#160;&#160;</TD>
					<TD class="tablecell"><xsl:apply-templates select="WorkDist"/> in</TD>
					<TD width="50px">&#160;&#160;&#160;&#160;&#160;</TD>
				</tr>
			</table>
		</xsl:if>
	</xsl:for-each>
</xsl:template>

<!-- Template for pachymetry -->
<xsl:template match="PACHS">
	<xsl:for-each select="PACH">
		&#160;&#160;&#160;&#160;&#160;
		<u>Pachymetry</u>
		<br />
		<TABLE width="100%">
			<TR>
				<TD width="10px">&#160;&#160;&#160;</TD>
				<TD>
					<table width="100%" cellSpacing="0" cellPadding="1" border="1" bordercolorlight="#C0C0C0" bordercolordark="#C0C0C0" style="border-collapse:collapse">
						<tr>
							<td width="2%" class="TitleColor">&#160;</td>
							<td width="5%" align="Center" class="TitleColor"><b>OD</b></td>
							<td width="5%" align="Center" class="TitleColor"><b>OS</b></td>
						</tr>
						<tr>
							<td width="2%" align="Center" class="TitleColor"><b></b></td>
							<td class="tablecell" align="Center"><xsl:apply-templates select="ODHORZ"/></td>
							<td class="tablecell" align="Center"><xsl:apply-templates select="OSHORZ"/></td>
						</tr>
					</table>
				</TD>
				<TD width="50px">&#160;&#160;&#160;&#160;&#160;</TD>
				<TD width="50px">&#160;&#160;&#160;&#160;&#160;</TD>
				<TD width="50px">&#160;&#160;&#160;&#160;&#160;</TD>
				<TD width="50px">&#160;&#160;&#160;&#160;&#160;</TD>
				<TD width="50px">&#160;&#160;&#160;&#160;&#160;</TD>
				<TD width="50px">&#160;&#160;&#160;&#160;&#160;</TD>
				<TD width="50px">&#160;&#160;&#160;&#160;&#160;</TD>
			</TR>
		</TABLE>
	</xsl:for-each>
</xsl:template>

<!-- Template for pachymetry -->
<xsl:template match="CDS">
	<xsl:for-each select="CD">
		&#160;&#160;&#160;&#160;&#160;
		<u>CD Ratio</u>
		<br />
		<TABLE width="100%">
			<TR>
				<TD width="10px">&#160;&#160;&#160;</TD>
				<TD>
					<table width="100%" cellSpacing="0" cellPadding="1" border="1" bordercolorlight="#C0C0C0" bordercolordark="#C0C0C0" style="border-collapse:collapse">
						<tr>
							<td width="2%" class="TitleColor">&#160;</td>
							<td width="5%" align="Center" class="TitleColor"><b>Horz</b></td>
							<td width="5%" align="Center" class="TitleColor"><b>Vert</b></td>
						</tr>
						<tr>
							<td width="2%" align="Center" class="TitleColor"><b>OD</b></td>
							<td class="tablecell" align="Center"><xsl:apply-templates select="ODHORZ"/></td>
							<td class="tablecell" align="Center"><xsl:apply-templates select="ODVERT"/></td>
						</tr>
						<tr>
							<td width="2%" align="Center" class="TitleColor"><b>OS</b></td>
							<td class="tablecell" align="Center"><xsl:apply-templates select="OSHORZ"/></td>
							<td class="tablecell" align="Center"><xsl:apply-templates select="OSVERT"/></td>
						</tr>
					</table>
				</TD>
				<TD width="50px">&#160;&#160;&#160;&#160;&#160;</TD>
				<TD width="50px">&#160;&#160;&#160;&#160;&#160;</TD>
				<TD width="50px">&#160;&#160;&#160;&#160;&#160;</TD>
				<TD width="50px">&#160;&#160;&#160;&#160;&#160;</TD>
				<TD width="50px">&#160;&#160;&#160;&#160;&#160;</TD>
				<TD width="50px">&#160;&#160;&#160;&#160;&#160;</TD>
				<TD width="50px">&#160;&#160;&#160;&#160;&#160;</TD>
			</TR>
		</TABLE>
	</xsl:for-each>
</xsl:template>
<!-- Template for CarePlan-->
<xsl:template match="CarePlanProblem">
	<table style="width:100%" cellspacing="0" cellpadding="0">
	<tr>
  		<td style="FONT-SIZE:2pt" WIDTH="4%"> </td> 
		<td colspan="2"><FONT  SIZE="2">Problem:<xsl:apply-templates select="CarePlanProblemName"/></FONT></td> 
	</tr>
	<tr>
	  		<td style="FONT-SIZE:2pt" WIDTH="8%"> </td> 
	  		<td><FONT  SIZE="2">Goal:</FONT><FONT COLOR="black" SIZE="2"><xsl:apply-templates select="CarePlanGoal"/></FONT>
	  		<FONT  SIZE="2"> Objective:</FONT><FONT COLOR="black" SIZE="2"><xsl:apply-templates select="CarePlanObjective"/></FONT>
	  		</td> 
			
	</tr>
	<tr>
			<td style="FONT-SIZE:2pt" WIDTH="8%"> </td> 
			<td><FONT COLOR="black" SIZE="2">Notes:<xsl:apply-templates select="CarePlanNotes"/></FONT>
			</td> 

	</tr>

	</table>
	<BR/>
</xsl:template>
<!-- Aftercare feature-->
<xsl:template match="CallbackHistory">
	<table style="width:100%;" cellspacing="0" cellpadding="0">
		<tr class="rightPaneHeading"><td>Aftercare</td></tr>
		<tr class="rightPaneData"><td>Callback History: <xsl:value-of select="CallbackHistoryNotes" disable-output-escaping="yes"/></td></tr>
	</table>
	<BR/>
</xsl:template>

<!-- Vishesh: 11-27-2012 Binocular tab data in progressnotes -->
<xsl:template match="BINCOVS | BINPHOS">
	<xsl:for-each select="BINCOVNEAR | BINCOVDIST | BINPHONEAR | BINPHODIST">
		&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;
		<xsl:if test="name(.)='BINCOVNEAR'">
			<FONT COLOR="black" SIZE="2"><u>Cover Test - Near</u>:</FONT>
		</xsl:if>
		<xsl:if test="name(.)='BINCOVDIST'">
			<FONT COLOR="black" SIZE="2"><u>Cover Test - Distance</u>:</FONT>
		</xsl:if>
		<xsl:if test="name(.)='BINPHONEAR'">
			<FONT COLOR="black" SIZE="2"><u>Phoria Test - Near</u>:</FONT>
		</xsl:if>
		<xsl:if test="name(.)='BINPHODIST'">
			<FONT COLOR="black" SIZE="2"><u>Phoria Test - Distance</u>:</FONT>
		</xsl:if>
		
		<xsl:if test="(TEST != '')">
			<br/>&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;
			<FONT COLOR="black" SIZE="2">Test:</FONT><xsl:text> </xsl:text><FONT COLOR="black" SIZE="2"><xsl:apply-templates select="TEST"/></FONT>
		</xsl:if>
		<xsl:if test="name(parent::*)='BINCOVS'">
			<xsl:if test="WWORx=0"><FONT COLOR="black" SIZE="2">, With RX</FONT></xsl:if>
		    <xsl:if test="WWORx=1"><FONT COLOR="black" SIZE="2">, Without RX</FONT></xsl:if>
		</xsl:if>
		<xsl:if test="( (ODHORZ != '') or (ODVERT != '') or (OSVERT != '') )">
		<TABLE cellspacing="0" cellpadding="0" width="40%">
			<TR>
				<TD width="10px">&#160;&#160;&#160;&#160;&#160;</TD>
				<TD>
					<table cellSpacing="0" cellPadding="1" border="1" bordercolorlight="#9CB8EB" bordercolordark="#9CB8EB" style="border-collapse:collapse">
						<tr>
							<td width="2%" class="TitleColor">&#160;</td>
							<td width="5%" align="Center" class="TitleColor"><b>Horz</b></td>
							<td width="5%" align="Center" class="TitleColor"><b>Vert</b></td>
						</tr>
						<tr>
							<td width="2%" align="Center" class="TitleColor"><b>OD</b></td>
							<td class="tablecell" align="Center"><xsl:apply-templates select="ODHORZ"/>&#160;</td>
							<td class="tablecell" align="Center"><xsl:apply-templates select="ODVERT"/>&#160;</td>
						</tr>
						<tr>
							<td width="2%" align="Center" class="TitleColor"><b>OS</b></td>
							<td class="tablecell" align="Center">&#160;</td>
							<td class="tablecell" align="Center"><xsl:apply-templates select="OSVERT"/>&#160;</td>
						</tr>
					</table>
				</TD>
			</TR>
		</TABLE>
		</xsl:if>
		<br/>
	</xsl:for-each>
</xsl:template>

<xsl:template match="BINVERBI | BINVERBO">
	&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;
	<xsl:if test="name(.)='BINVERBI'">
		<FONT COLOR="black" SIZE="2"><u>Vergence BI(Divergence)</u>:</FONT>
	</xsl:if>
	<xsl:if test="name(.)='BINVERBO'">
		<FONT COLOR="black" SIZE="2"><u>Vergence BO(Convergence)</u>:</FONT>
	</xsl:if>
    <xsl:if test="( (DISTBLUR != '') or (DISTBREAK != '') or (DISTRECV != '') or (NEARBLUR != '') or (NEARBREAK != '') or (NEARRECV != '') )">
		<TABLE class="table1" cellspacing="0" cellpadding="0" width="50%">
			<TR>
				<TD width="10px">&#160;&#160;&#160;&#160;&#160;</TD>
				<TD>
					<table cellSpacing="0" cellPadding="1" border="1" bordercolorlight="#9CB8EB" bordercolordark="#9CB8EB" style="border-collapse:collapse">
						<tr>
							<td width="2%" class="TitleColor">&#160;</td>
							<td width="5%" align="Center" class="TitleColor"><b>Blur</b></td>
							<td width="5%" align="Center" class="TitleColor"><b>Break</b></td>
							<td width="5%" align="Center" class="TitleColor"><b>Recovery</b></td>
						</tr>
						<tr>
							<td width="2%" align="Center" class="TitleColor"><b>Dist</b></td>
							<td class="tablecell" align="Center"><xsl:apply-templates select="DISTBLUR"/></td>
							<td class="tablecell" align="Center"><xsl:apply-templates select="DISTBREAK"/></td>
							<td class="tablecell" align="Center"><xsl:apply-templates select="DISTRECV"/></td>
						</tr>
						<tr>
							<td width="2%" align="Center" class="TitleColor"><b>Near</b></td>
							<td class="tablecell" align="Center"><xsl:apply-templates select="NEARBLUR"/></td>
							<td class="tablecell" align="Center"><xsl:apply-templates select="NEARBREAK"/></td>
							<td class="tablecell" align="Center"><xsl:apply-templates select="NEARRECV"/></td>
						</tr>
					</table>
				</TD>
			</TR>
		</TABLE>
	</xsl:if>
	<br/>
</xsl:template>
<!-- Binocular Miscellaneous data -->
<xsl:template match="BINMISCS">
	<xsl:for-each select="BINNPC | BINNPA | BINSTER | BINDOMI | BINFUSI | BINANIS | BINNRAPRA | BINACA | BINBXC">
		<xsl:if test="(name(.)='BINNPC') and (.!= '')">
			<xsl:if test="((NPC_WWORx != '') and (NPC_WWORx != '-1')) or (NPC_Test != '') or (NPC_Blur != '') or (NPC_Recv != '')">
				&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;
				<FONT COLOR="black" SIZE="2"><u>Near Point of Covergence</u>:</FONT>
			</xsl:if>
		    <xsl:if test="(NPC_Test != '')">
				<FONT COLOR="black" SIZE="2">Test:</FONT><FONT COLOR="black" SIZE="2"><xsl:apply-templates select="NPC_Test"/></FONT>,
			</xsl:if>
			<xsl:if test="NPC_WWORx='0'"><FONT COLOR="black" SIZE="2">With RX</FONT></xsl:if>
		    <xsl:if test="NPC_WWORx='1'"><FONT COLOR="black" SIZE="2">Without RX</FONT></xsl:if>
		    <xsl:if test="(NPC_Blur != '')">
			    ,<FONT COLOR="black" SIZE="2">Blur:</FONT><FONT COLOR="black" SIZE="2"><xsl:apply-templates select="NPC_Blur"/>&#160;cm</FONT>,
			</xsl:if>
		    <xsl:if test="(NPC_Break != '')">
				<FONT COLOR="black" SIZE="2">Break:</FONT><FONT COLOR="black" SIZE="2"><xsl:apply-templates select="NPC_Break"/>&#160;cm</FONT>,
			</xsl:if>
		    <xsl:if test="(NPC_Recv != '')">
				<FONT COLOR="black" SIZE="2">Recovery:</FONT><FONT COLOR="black" SIZE="2"><xsl:apply-templates select="NPC_Recv"/>&#160;cm</FONT>
			</xsl:if>
			<xsl:if test="((NPC_WWORx != '') and (NPC_WWORx != '-1')) or (NPC_Test != '') or (NPC_Blur != '') or (NPC_Recv != '')">
				<br/>
			</xsl:if>
		</xsl:if>
		<xsl:if test="(name(.)='BINNPA') and (.!= '')">
			<xsl:if test="((NPA_WWORx != '') and (NPA_WWORx != '-1')) or (NPA_OD != '') or (NPA_OS != '') or (NPA_OU != '')">
				&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;
				<FONT COLOR="black" SIZE="2"><u>Near Point of Accommodation</u>:</FONT>
			</xsl:if>
			<xsl:if test="NPA_WWORx='0'"><FONT COLOR="black" SIZE="2">With RX</FONT></xsl:if>
		    <xsl:if test="NPA_WWORx='1'"><FONT COLOR="black" SIZE="2">Without RX</FONT></xsl:if>
		    <xsl:if test="(NPA_OD != '')">
			    ,<FONT COLOR="black" SIZE="2">OD:</FONT><FONT COLOR="black" SIZE="2"><xsl:apply-templates select="NPA_OD"/>D</FONT>,
			</xsl:if>
		    <xsl:if test="(NPA_OS != '')">
				<FONT COLOR="black" SIZE="2">OS:</FONT><FONT COLOR="black" SIZE="2"><xsl:apply-templates select="NPA_OS"/>D</FONT>,
			</xsl:if>
		    <xsl:if test="(NPA_OU != '')">
				<FONT COLOR="black" SIZE="2">OU:</FONT><FONT COLOR="black" SIZE="2"><xsl:apply-templates select="NPA_OU"/>D</FONT>
			</xsl:if>
			<xsl:if test="((NPA_WWORx != '') and (NPA_WWORx != '-1')) or (NPA_OD != '') or (NPA_OS != '') or (NPA_OU != '')">
				<br/>
			</xsl:if>
		</xsl:if>
		<xsl:if test="(name(.)='BINSTER') and (.!= '')">
			<xsl:if test="((STEREOPSIS_WWORx != '') and (STEREOPSIS_WWORx != '-1')) or (STEREOPSIS_Test != '') or (STEREOPSIS_Dist != '') or (STEREOPSIS_Near != '')">
				&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;
				<FONT COLOR="black" SIZE="2"><u>Stereopsis</u>:</FONT>
			</xsl:if>
		    <xsl:if test="(STEREOPSIS_Test != '')">
				<FONT COLOR="black" SIZE="2">Test:</FONT><FONT COLOR="black" SIZE="2"><xsl:apply-templates select="STEREOPSIS_Test"/></FONT>,
			</xsl:if>
			<xsl:if test="STEREOPSIS_WWORx='0'"><FONT COLOR="black" SIZE="2">With RX</FONT></xsl:if>
		    <xsl:if test="STEREOPSIS_WWORx='1'"><FONT COLOR="black" SIZE="2">Without RX</FONT></xsl:if>
		    <xsl:if test="(STEREOPSIS_Dist != '')">
			    ,<FONT COLOR="black" SIZE="2">Distance:</FONT><FONT COLOR="black" SIZE="2"><xsl:apply-templates select="STEREOPSIS_Dist"/>&#160;sec</FONT>,
			</xsl:if>
			<xsl:if test="(STEREOPSIS_Near != '')">
				<FONT COLOR="black" SIZE="2">Near:</FONT><FONT COLOR="black" SIZE="2"><xsl:apply-templates select="STEREOPSIS_Near"/>&#160;sec</FONT>
			</xsl:if>
			<xsl:if test="((STEREOPSIS_WWORx != '') and (STEREOPSIS_WWORx != '-1')) or (STEREOPSIS_Test != '') or (STEREOPSIS_Dist != '') or (STEREOPSIS_Near != '')">
				<br/>
			</xsl:if>
		</xsl:if>
		<xsl:if test="(name(.)='BINDOMI') and (.!= '')">
			&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;
			<FONT COLOR="black" SIZE="2"><u>Dominance</u>:</FONT>
			<FONT COLOR="black" SIZE="2">Test:</FONT><FONT COLOR="black" SIZE="2"><xsl:apply-templates select="Dominance"/></FONT>,
			<FONT COLOR="black" SIZE="2"><xsl:apply-templates select="Dominance_Result"/></FONT>
			<br/>
		</xsl:if>
		<xsl:if test="(name(.)='BINFUSI') and (.!= '')">
			&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;
			<FONT COLOR="black" SIZE="2"><u>Fusion</u>:</FONT>
			<xsl:if test="(FUSION_Test != '')">
				<FONT COLOR="black" SIZE="2">Test:</FONT><FONT COLOR="black" SIZE="2"><xsl:apply-templates select="FUSION_Test"/></FONT>,
			</xsl:if>
			<xsl:if test="(FUSION_Dist != '')">
				<FONT COLOR="black" SIZE="2">Distance:</FONT><FONT COLOR="black" SIZE="2"><xsl:apply-templates select="FUSION_Dist"/></FONT>,
			</xsl:if>
			<xsl:if test="(FUSION_Near != '')">
				<FONT COLOR="black" SIZE="2">Near:</FONT><FONT COLOR="black" SIZE="2"><xsl:apply-templates select="FUSION_Near"/></FONT>,
			</xsl:if>
			<xsl:if test="(FUSION_Impression != '')">
				<FONT COLOR="black" SIZE="2">Impression:</FONT><FONT COLOR="black" SIZE="2"><xsl:apply-templates select="FUSION_Impression"/></FONT>
			</xsl:if>
			<br/>
		</xsl:if>
		<xsl:if test="(name(.)='BINANIS') and (.!= '')">
			&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;
			<FONT COLOR="black" SIZE="2"><u>Aniseikonia</u>:</FONT>
			<FONT COLOR="black" SIZE="2">Impression:</FONT><FONT COLOR="black" SIZE="2"><xsl:apply-templates select="ANISEIKONIA_Impression"/></FONT>
			<xsl:if test="( (ANISEIKONIA_ODHorz != '') or (ANISEIKONIA_ODVert != '') or (ANISEIKONIA_OSHorz != '') or (ANISEIKONIA_OSVert != '') )">
				<TABLE class="table1" cellspacing="0" cellpadding="0" width="40%">
					<TR>
						<TD width="10px">&#160;&#160;&#160;&#160;&#160;</TD>
						<TD>
							<table cellSpacing="0" cellPadding="1" border="1" bordercolorlight="#9CB8EB" bordercolordark="#9CB8EB" style="border-collapse:collapse">
								<tr>
									<td width="2%" class="TitleColor">&#160;</td>
									<td width="5%" align="Center" class="TitleColor"><b>Horz</b></td>
									<td width="5%" align="Center" class="TitleColor"><b>Vert</b></td>
								</tr>
								<tr>
									<td width="2%" align="Center" class="TitleColor"><b>OD</b></td>
									<td class="tablecell" align="Center"><xsl:apply-templates select="ANISEIKONIA_ODHorz"/></td>
									<td class="tablecell" align="Center"><xsl:apply-templates select="ANISEIKONIA_ODVert"/></td>
								</tr>
								<tr>
									<td width="2%" align="Center" class="TitleColor"><b>OS</b></td>
									<td class="tablecell" align="Center"><xsl:apply-templates select="ANISEIKONIA_OSHorz"/></td>
									<td class="tablecell" align="Center"><xsl:apply-templates select="ANISEIKONIA_OSVert"/></td>
								</tr>
							</table>
						</TD>
					</TR>
				</TABLE>
			</xsl:if>
			<br/>
		</xsl:if>
		<xsl:if test="(name(.)='BINNRAPRA') and (.!= '')">
			&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;
			<FONT COLOR="black" SIZE="2"><u>NRA/PRA</u>:</FONT>
			<TABLE class="table1" cellspacing="0" cellpadding="0" width="40%">
				<TR>
					<TD width="10px">&#160;&#160;&#160;&#160;&#160;</TD>
					<TD>
						<table cellSpacing="0" cellPadding="1" border="1" bordercolorlight="#9CB8EB" bordercolordark="#9CB8EB" style="border-collapse:collapse">
							<tr>
								<td width="2%" class="TitleColor">&#160;</td>
								<td width="5%" align="Center" class="TitleColor"><b>Blur</b></td>
								<td width="5%" align="Center" class="TitleColor"><b>Recv</b></td>
							</tr>
							<tr>
								<td width="2%" align="Center" class="TitleColor"><b>NRA</b></td>
								<td class="tablecell" align="Center"><xsl:apply-templates select="NRA_Blur"/></td>
								<td class="tablecell" align="Center"><xsl:apply-templates select="NRA_Recv"/></td>
							</tr>
							<tr>
								<td width="2%" align="Center" class="TitleColor"><b>PRA</b></td>
								<td class="tablecell" align="Center"><xsl:apply-templates select="PRA_Blur"/></td>
								<td class="tablecell" align="Center"><xsl:apply-templates select="PRA_Recv"/></td>
							</tr>
						</table>
					</TD>
				</TR>
			</TABLE>
		</xsl:if>
		<xsl:if test="(name(.)='BINACA') and (.!= '')">
			&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;
			<FONT COLOR="black" SIZE="2"><u>AC/A Ratio</u>:</FONT>
			<FONT COLOR="black" SIZE="2"><xsl:apply-templates select="ACARatio"/>, calculated</FONT>
			<br/>
		</xsl:if>
		<xsl:if test="(name(.)='BINBXC') and (.!= '')">
			&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;
			<FONT COLOR="black" SIZE="2"><u>BXC/14B</u>:</FONT>
			<FONT COLOR="black" SIZE="2"><xsl:apply-templates select="BXC"/></FONT>
			<br/>
		</xsl:if>		
	</xsl:for-each>
</xsl:template>

<!-- Template for CCMR-->
<xsl:template match="CCMRHRALIST">
	<!-- <p style="page-break-before:always">&#160;</p> -->
	<div class="rightPaneHeading">Health Risk Assessment</div>
	<table style="width:99%; border-collapse: collapse;" cellspacing="0" cellpadding="1" >
	<xsl:for-each select="HRACategory">
		<tr height="20px">
				<xsl:if test="position()>0">
				<td colspan="3" class="tableCP" >
					<b><xsl:apply-templates select="HRACategoryName"/></b>
				</td>
				</xsl:if>
		</tr>
		<xsl:for-each select="HRASubItem">
			<xsl:if test="HRASubItemValue != '' or HRASubItemComments != ''">
				<tr>
					<td style="width:60%; border: 1px solid #808080;" class="tableCP"><xsl:apply-templates select="HRASubItemName"/></td>
					<td style="width:20%; border: 1px solid #808080;" class="tableCP"><xsl:value-of select="HRASubItemValue" disable-output-escaping="yes"/></td>
					<td style="width:20%; border: 1px solid #808080" class="tableCP"><xsl:value-of select="HRASubItemComments" disable-output-escaping="yes"/></td>
				</tr>
			</xsl:if>	
		</xsl:for-each>
	</xsl:for-each>
	</table>
</xsl:template>	

<xsl:template match="CCMRCATLIST">
	<!-- <p style="page-break-before:always">&#160;</p> -->
	<div class="rightPaneHeading">Care Plan Details</div>
	<xsl:if test="CCMRBHCategory != ''">
	<table style="width:100%;" cellspacing="0" cellpadding="1">
	<xsl:for-each select="CCMRBHCategory">
		<xsl:for-each select="CCMRBHSubItem">
				<tr>
					<td style="width:100%" class="rightPaneData"><xsl:value-of select="Question" disable-output-escaping="yes"/></td>
				</tr>
		</xsl:for-each>
	</xsl:for-each>
	</table>
	</xsl:if>
	<table style="width:99%; border-collapse: collapse;" cellspacing="0" cellpadding="1" >
	<xsl:for-each select="CCMRCategory">
		<tr height="20px">
				<xsl:if test="position()>1">
				<td colspan="3" class="tableCP" >
					<b><xsl:apply-templates select="CCMRCategoryName"/></b>
				</td>
			</xsl:if>
		</tr>
		
		<xsl:for-each select="CCMRSubItem">
			<xsl:if test="CCMRSubItemValue != '' or CCMRSubItemComments != ''">
				<tr>
					<td style="width:60%; border: 1px solid #808080;" class="tableCP"><xsl:apply-templates select="CCMRSubItemName"/></td>
					<td style="width:20%; border: 1px solid #808080;" class="tableCP"><xsl:value-of select="CCMRSubItemValue" disable-output-escaping="yes"/></td>
					<td style="width:20%; border: 1px solid #808080;" class="tableCP"><xsl:value-of select="CCMRSubItemComments" disable-output-escaping="yes"/></td>
				</tr>
			</xsl:if>	
		</xsl:for-each>
		
	</xsl:for-each>
	</table>
</xsl:template>

</xsl:stylesheet>