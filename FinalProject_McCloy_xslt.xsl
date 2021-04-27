<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:tei="http://www.tei-c.org/ns/1.0" xmlns="http://www.w3.org/1999/xhtml"
    exclude-result-prefixes="tei" version="2.0">

    <xsl:output method="html" indent="yes" encoding="iso-8859-1" omit-xml-declaration="yes"/>

    <!-- "DINNER PARTY MENU" TEMPLATE. I USE THIS TO ORGANIZE THE BASIC STRUCTURE 
    OF THE OUTPUT DOCUMENT. SO IT WILL INCLUDE BASIC DOCUMENT STRUCTURE TAGS AND
    ANY PULLING/REORGANIZING OF INFORMATION FROM THE ORIGINAL.-->

    <xsl:template match="/">
        <html>
        <head><link rel="stylesheet" href= "FinalProject.css"/></head>
            <body>
                <!--                <ul>
                    <h3>These are the events referenced in Terrell's speech</h3>
                    <xsl:call-template name="list_event"/>
                </ul>    --> 

                <xsl:apply-templates/>
                <ol>
                    <h3 align="center">Bibliography</h3>
                    <xsl:call-template name="bibliography"/>
                </ol>
            </body>
        </html>
    </xsl:template>


    <!-- "FOOD PREP/MISE EN PLACE" TEMPLATES -->

    <!-- This is Formatting-->
    <xsl:template match="tei:p">
        <p>
            <xsl:apply-templates/>
        </p>
    </xsl:template>

    <xsl:template match="tei:teiHeader"/>

    <xsl:template match="tei:head">
        <h1 align="center">
            <xsl:apply-templates/>
        </h1>
    </xsl:template>

    <xsl:template match="tei:tag">
        <header align="center">
            <xsl:apply-templates/>
        </header>
    </xsl:template>

    <xsl:template match="tei:listBibl"/>

    <!-- This is Linking within the document to my events -->

    <xsl:template match="tei:ref">
        <xsl:element name="a"> <xsl:attribute name="href"> <xsl:value-of select="@target"/>
            </xsl:attribute> CLICK ME! </xsl:element>
        <apply-templates/>
    </xsl:template>

    <xsl:template match="tei:event">
        <xsl:element name="a">
            <xsl:attribute name="id">
                <xsl:value-of select="@xml:id"/>
            </xsl:attribute>
        </xsl:element>
        <h4>
            <xsl:apply-templates select="tei:label"/>
        </h4>
        <xsl:apply-templates/>
    </xsl:template>


    <!-- This is a list of events in my document 

    <xsl:template name="list_event">
        <xsl:for-each select="//tei:event">
            <li>
                <xsl:apply-templates/>
            </li>
        </xsl:for-each>
    </xsl:template>

-->

    <!-- This is getting rid of the errors in her text -->

    <xsl:template match="tei:sic"/>


    <!--This is a Bibliography that I want in my text-->

    <xsl:template name="bibliography">
        <xsl:for-each select="//tei:bibl">
            <li>
                <p>
                    <xsl:value-of select="tei:author"> </xsl:value-of>
                </p>
                <cite>
                    <xsl:value-of select="tei:title"/>
                </cite>
                <p>
                    <xsl:value-of select="tei:date"/>
                </p>
                <p>
                    <xsl:value-of select="tei:note"/>
                </p>
            </li>
        </xsl:for-each>
    </xsl:template>

    <!--This is my images-->
    <xsl:template match="tei:pb">
        <xsl:element name="a">
            <xsl:attribute name="href">
                <xsl:value-of select="concat('full/', @facs)"/>
            </xsl:attribute>
            <xsl:element name="img">
                <xsl:attribute name="src">
                    <xsl:value-of select="concat('thumbs/', @facs)"/>
                </xsl:attribute>
                <xsl:apply-templates/>
            </xsl:element>
        </xsl:element>
    </xsl:template>


</xsl:stylesheet>
