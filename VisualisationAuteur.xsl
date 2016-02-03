<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE stylesheet [
<!ENTITY space "<xsl:text> </xsl:text>">
]>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns="http://www.iro.umontreal.ca/lilyNlena/bibliotheque" version="2.0">
    
    <xsl:strip-space elements="*"/>
    <!-- to produce legal and validable XHTML ... -->
    <xsl:output method="xhtml" 
        doctype-public="-//W3C//DTD XHTML 1.0 Strict//EN"
        doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd" 
        indent="yes"
        encoding="UTF-8"/>
    
    <xsl:template match="/">
        <html>
            <head>
                <title>HTML compaction of 
  "<xsl:value-of select="replace(document-uri(.),'.*/(.*)','$1')"/>"</title>
            </head>
            <body>
                <ul>
                    <xsl:apply-templates/>
                </ul>
            </body>
        </html>
    </xsl:template>
    
    <xsl:template match="@*">
        &space;<xsl:value-of select="local-name()"/>
        <xsl:text>="</xsl:text><xsl:value-of select="."/><xsl:text>"</xsl:text>
    </xsl:template>
    
    <xsl:template match="*">
        <li>
            <b><xsl:value-of select="local-name()"/></b>
            <xsl:apply-templates select="@*"/>
            <xsl:choose>
                <xsl:when test="count(*)=0"> <!--single text node ?-->
                    &space;<xsl:value-of select="."/>
                </xsl:when>
                <xsl:otherwise> <!--possible mixed node-->
                    <ul>
                        <xsl:apply-templates/>
                    </ul>
                </xsl:otherwise>
            </xsl:choose>
        </li>
    </xsl:template>
    
    <xsl:template match="text()">
        <li><xsl:value-of select="."/></li>
    </xsl:template>
    
</xsl:stylesheet>

