<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xd="http://www.oxygenxml.com/ns/doc/xsl"
    exclude-result-prefixes="xd"
    version="1.0">
    <xd:doc scope="stylesheet">
        <xd:desc>
            <xd:p><xd:b>Created on:</xd:b> Feb 3, 2016</xd:p>
            <xd:p><xd:b>Author:</xd:b> Lilyanne</xd:p>
            <xd:p></xd:p>
        </xd:desc>
    </xd:doc>    
    
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
    
    
    
    <xsl:template match="ns1:bibliotheque" xmlns:ns1="http://www.iro.umontreal.ca/lilyNlena/bibliotheque">
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
    
    <xsl:template match="ns1:auteur" xmlns:ns1="http://www.iro.umontreal.ca/lilyNlena/bibliotheque">
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