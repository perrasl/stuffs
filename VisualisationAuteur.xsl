<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE stylesheet [
<!ENTITY space "<xsl:text> </xsl:text>">
]>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns="http://www.iro.umontreal.ca/lilyNlena/bibliotheque" version="2.0">
    
    <xsl:param name="auteur" select="."/>
    
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
                <title>HTML compaction of Bibliotheque auteur</title>
            </head>
            <body>
                <xsl:apply-templates/>
            </body>
        </html>
    </xsl:template>
    
    <xsl:template match="bibliotheque">
        <h1>
            Bibliothèque, liste des auteurs
            <!-- ceci serait uniquement pour tous les auteurs -->
        </h1>
        <table border="1">
            <tr>
                <xsl:for-each select="'ident', 'pays', 'photo', 'commentaire'">
                    <th><xsl:value-of select="."/></th>
                </xsl:for-each>
            </tr>
            <xsl:apply-templates select="auteur"/>    
        </table>
    </xsl:template>
    
    <xsl:template match="auteur">
        <tr>
            <td><xsl:value-of select="@ident"/></td>
            <td><xsl:value-of select="@ipays"/></td>
            <td><xsl:value-of select="@photo"/></td>
            <!-- Ceci ne permet pas de visualiser l'image
            comment insérer img src puisqu'on fait référence...-->
            <td><xsl:value-of select="@commentaire"/></td>
        </tr>
    </xsl:template>
</xsl:stylesheet>
    
<!--
        &space;<xsl:value-of select="local-name()"/>
        <xsl:text>="</xsl:text><xsl:value-of select="."/><xsl:text>"</xsl:text>

    
    <xsl:template match="*">
        <li>
            <b><xsl:value-of select="local-name()"/></b>
            <xsl:apply-templates select="@*"/>
            <xsl:choose>
                <xsl:when test="count(*)=0"> <!-\-single text node ?-\->
                    &space;<xsl:value-of select="."/>
                </xsl:when>
                <xsl:otherwise> <!-\-possible mixed node-\->
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
-->