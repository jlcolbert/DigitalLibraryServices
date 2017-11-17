<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:ead="urn:isbn:1-931666-22-9" xmlns:xlink="http://www.w3.org/1999/xlink"
    xmlns="urn:isbn:1-931666-22-9" exclude-result-prefixes="ead">

    <xsl:output method="text" omit-xml-declaration="yes" encoding="UTF-8"/>

    <xsl:strip-space elements="*"/>

    <xsl:variable name="tab">
        <xsl:text>&#x09;</xsl:text>
    </xsl:variable>

    <xsl:variable name="newline">
        <xsl:text>&#xa;</xsl:text>
	</xsl:variable>
	
	<xsl:template match="ead:ead">
		<xsl:for-each select="ead:archdesc/ead:dsc/ead:c01/ead:c02">
			<xsl:value-of select="$newline" />
			<!-- box -->
             <xsl:value-of select="ead:did/ead:container[@type='box']"/>
             <xsl:value-of select="$tab"/>

             <!-- folder -->
             <xsl:value-of select="ead:did/ead:container[@type='folder']"/>
             <xsl:value-of select="$tab"/>
             
             <!-- unittitle -->
             <xsl:value-of select="ead:did/ead:unittitle" />
             <xsl:value-of select="$tab" />
             
             <!-- creator -->
            	 <xsl:if test="contains(ead:scopecontent/ead:p, 'George Janecek')">
            	 	<xsl:value-of select="//ead:controlaccess/ead:controlaccess[1]" />
            	 	<xsl:value-of select="$tab" />
            	 </xsl:if>
            	 <xsl:if test="contains(ead:scopecontent/ead:p, 'Kent Miles')">
            	 	<xsl:value-of select="//ead:controlaccess/ead:controlaccess[2]" />
            	 	<xsl:value-of select="$tab" />
            	 </xsl:if>
            	 <xsl:if test="contains(ead:scopecontent/ead:p, 'Al Hartmann')">
            	 	<xsl:text>Hartmann, Al</xsl:text>
            	 	<xsl:value-of select="$tab" />
            	 </xsl:if>
            	 <xsl:if test="contains(ead:scopecontent/ead:p, 'Barbara Richards')">
            	 	<xsl:text>Richards, Barbara (Photographer)</xsl:text>
            	 	<xsl:value-of select="$tab" />
            	 </xsl:if>
			
			<!-- description -->
			<xsl:text>Proof sheets depicting </xsl:text><xsl:value-of select="ead:did/ead:unittitle" /><xsl:text>.</xsl:text>
			<xsl:value-of select="$tab" />
			
			<!-- date -->
			<xsl:value-of select="ead:did/ead:unitdate" />
			<xsl:value-of select="$tab" />
			
			<!-- extent -->
			<xsl:value-of select="ead:did/ead:physdesc/ead:extent" />
			<xsl:value-of select="$tab" />
			
			<!-- subjects -->
		</xsl:for-each>
	</xsl:template>
</xsl:stylesheet>