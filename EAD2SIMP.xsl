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
			<!-- organization name -->
			<xsl:value-of select="//ead:controlaccess/ead:controlaccess[3]" />
			<xsl:text>; </xsl:text>
			
			<!-- location -->
			<xsl:value-of select="//ead:controlaccess/ead:controlaccess[4]" />
			<xsl:text>; </xsl:text>
			
			<!-- form -->
			<xsl:value-of select="//ead:controlaccess/ead:controlaccess[13]" />
			<xsl:text>; </xsl:text>
			<xsl:value-of select="//ead:controlaccess/ead:controlaccess[14]" />
			<xsl:text>; </xsl:text>
			
			<!-- subject -->
			<xsl:choose>
				<xsl:when test="ead:did/ead:container[@type='box'] = '1'">
					<xsl:value-of select="//ead:controlaccess/ead:controlaccess[5]" />
					<xsl:value-of select="$tab" />
				</xsl:when>
				<xsl:when test="ead:did/ead:container[@type='box'] = '2'">
					<xsl:value-of select="//ead:controlaccess/ead:controlaccess[6]" />
					<xsl:value-of select="$tab" />
				</xsl:when>
				<xsl:when test="ead:did/ead:container[@type='box'] = '3'">
					<xsl:value-of select="//ead:controlaccess/ead:controlaccess[7]" />
					<xsl:value-of select="$tab" />
				</xsl:when>
				<xsl:when test="ead:did/ead:container[@type='box'] = '4'">
					<xsl:value-of select="//ead:controlaccess/ead:controlaccess[8]" />
					<xsl:value-of select="$tab" />
				</xsl:when>
				<xsl:when test="ead:did/ead:container[@type='box'] = '5'">
					<xsl:value-of select="//ead:controlaccess/ead:controlaccess[9]" />
					<xsl:value-of select="$tab" />
				</xsl:when>
				<xsl:when test="ead:did/ead:container[@type='box'] = '6'">
					<xsl:value-of select="//ead:controlaccess/ead:controlaccess[10]" />
					<xsl:value-of select="$tab" />
				</xsl:when>
				<xsl:when test="ead:did/ead:container[@type='box'] = '7'">
					<xsl:value-of select="//ead:controlaccess/ead:controlaccess[11]" />
					<xsl:value-of select="$tab" />
				</xsl:when>
				<xsl:when test="ead:did/ead:container[@type='box'] = '8'">
					<xsl:value-of select="//ead:controlaccess/ead:controlaccess[12]" />
					<xsl:value-of select="$tab" />
				</xsl:when>
				<xsl:otherwise>
					<xsl:text>Ethnic groups--Utah--Salt Lake City</xsl:text>
					<xsl:value-of select="$tab" />
				</xsl:otherwise>
			</xsl:choose>
			
			<!-- collection name -->
			<xsl:value-of select="//ead:controlaccess/ead:controlaccess[15]" />
		</xsl:for-each>
	</xsl:template>
</xsl:stylesheet>