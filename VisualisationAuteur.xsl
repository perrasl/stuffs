<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE stylesheet [
<!ENTITY space "<xsl:text> </xsl:text>">
]>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xd="http://www.oxygenxml.com/ns/doc/xsl"
    xmlns:ns1="http://www.iro.umontreal.ca/lilyNlena/bibliotheque" 
    exclude-result-prefixes="xd"
    version="2.0">

    <!-- to produce legal and validable XHTML ... -->
    <xsl:output method="xhtml" 
        doctype-public="-//W3C//DTD XHTML 1.0 Strict//EN"
        doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd" 
        indent="yes"
        encoding="UTF-8"/>
    
    <xsl:param name="auteur" select="."/>
    <!-- <xsl:param name="auteur" select="A1"/> -->

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
    
    <xsl:template match="ns1:bibliotheque">
        <h1>
            Bibliothèque, liste des auteurs
            <!-- ceci serait uniquement pour tous les auteurs -->
        </h1>
        <table border="1">
            <tr>
                <xsl:for-each select="'Ident', 'Nom', 'Prénom', 'Pays', 'Photo', 'Commentaire'">
                    <th><xsl:value-of select="."/></th>
                </xsl:for-each>
            </tr>
            <xsl:apply-templates/>    
        </table>
    </xsl:template>
    
    <xsl:template match="ns1:auteur">
        <tr>
            <td><xsl:value-of select="@ident"/></td>
            <td><xsl:value-of select="ns1:nom"/></td>
            <td><xsl:value-of select="ns1:prenom"/></td>
            <td><xsl:value-of select="ns1:pays"/></td>
            <td>
                <xsl:call-template name="templatePhoto">
                </xsl:call-template>
            <!-- Ceci ne permet pas de visualiser l'image
                créer un template pour img
                comment insérer img src puisqu'on fait référence...-->
            </td>
            <td><xsl:value-of select="ns1:commentaire"/></td>
        </tr>
    </xsl:template>
    
    <xsl:template name="templatePhoto">
       <img>
           <xsl:attribute name="src">
               <xsl:value-of select="ns1:photo"/>
           </xsl:attribute>
       </img>           
    </xsl:template>
    
    <xsl:template match="ns1:livre">
        
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