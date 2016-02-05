<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xd="http://www.oxygenxml.com/ns/doc/xsl"
    xmlns:ns1="http://www.iro.umontreal.ca/lilyNlena/bibliotheque"
    exclude-result-prefixes="xd"
    version="2.0">
    
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
    
    <xsl:param name="auteur" select="."/>
    
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
            <!-- ceci serait uniquement pour tous les auteurs  -->
        </h1>
        <table border="1">
            <tr>
                <xsl:for-each select="'Ident No,','Prénom', 'Nom','Pays', 'Photo', 'Commentaire'">
                    <th><xsl:value-of select="."/></th>
                </xsl:for-each>
            </tr>
            <xsl:apply-templates/>    
        </table>
    </xsl:template>
    
    
    <xsl:template match="ns1:auteur">
        <tr>
            <td><xsl:value-of select="@ident"/></td>
            <td><xsl:value-of select="ns1:prenom"/></td>
            <td><xsl:value-of select="ns1:nom"/></td>
            <td><xsl:value-of select="ns1:pays"/></td>
            <td>
                <xsl:value-of select="ns1:photo"/>
                <xsl:call-template name="getPict">
                    <xsl:with-param name="photo" select="ns1:photo"/>
                </xsl:call-template>
            </td>
            
            
            <!-- Ceci ne permet pas de visualiser l'image
            comment insérer img src puisqu'on fait référence...
            
            <xsl:apply-templates jojo/>
            #call template : url en param qui genre 
            
            <xsl:template>
                <xsl:param name=""/>
                
              </xsl:template>
            
            <xsl:call-template> <- jojo genere l<image
                <xsl:with-params>....
            </xsl:call-template>
            
            -->
            <td><xsl:value-of select="ns1:commentaire"/></td>
        </tr>
    </xsl:template>


    <xsl:template name="getPict">
        <xsl:param name="photo"/>
        <img src="photo" alt="photo"></img>
    </xsl:template>
    
    <xsl:template match="ns1:livre">
    </xsl:template>


    
</xsl:stylesheet>