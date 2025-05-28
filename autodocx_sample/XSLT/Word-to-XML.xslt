<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:w="http://schemas.openxmlformats.org/wordprocessingml/2006/main"
                xmlns:pkg="http://schemas.openxmlformats.org/package/2006/metadata/core-properties"
                xmlns:r="http://schemas.openxmlformats.org/officeDocument/2006/relationships"
                version="1.0">
    
    <!-- Ausgabe-XML mit Deklaration und ohne Namensraum -->
    <xsl:output method="xml" encoding="UTF-8" indent="yes" omit-xml-declaration="no"/>
    
    <!-- ROOT -->
    <xsl:template match="/">
        <document xml:lang="de">
            <xsl:apply-templates select="//w:body"/>
        </document>
    </xsl:template>
    
    <!-- Textkörper verarbeiten -->
    <xsl:template match="w:body">
        <xsl:apply-templates select="w:p | w:tbl | w:footnotes"/>
    </xsl:template>
    <!-- AUTOR UND TITEL UND UNTERTITEL -->
    <!-- Autor als <author> umwandeln -->
    <xsl:template match="w:p[w:pPr/w:pStyle/@w:val='YourFormat']">
        <author>
            <xsl:apply-templates select="w:r"/>
        </author>
    </xsl:template>
    
    <!-- Titel als <title> umwandeln -->
    <xsl:template match="w:p[w:pPr/w:pStyle/@w:val='YourFormat']">
        <title>
            <xsl:apply-templates select="w:r"/>
        </title>
    </xsl:template>
    
    <!-- Untertitel als <subtitle> umwandeln -->
    <xsl:template match="w:p[w:pPr/w:pStyle/@w:val='YourFormat']">
        <subtitle>
            <xsl:apply-templates select="w:r"/>
        </subtitle>
    </xsl:template>
    
    <!-- Jahr als <year> umwandeln -->
    <xsl:template match="w:p[w:pPr/w:pStyle/@w:val='YourFormat']">
        <year>
            <xsl:apply-templates select="w:r"/>
        </year>
    </xsl:template>
    
    
    
    <!-- ÜBERSCHRIFTEN -->
    <!-- Überschrift als <h1> umwandeln -->
    <xsl:template match="w:p[w:pPr/w:pStyle/@w:val='YourFormat']">
        <xsl:variable name="id" select="generate-id()" />  <!-- Generiert eine eindeutige ID -->
        <h1 id="{$id}">
            <xsl:apply-templates select="w:r"/>
        </h1>
    </xsl:template>
    
    <!-- Überschrift als <h2> umwandeln -->
    <xsl:template match="w:p[w:pPr/w:pStyle/@w:val='YourFormat']">
        <xsl:variable name="id" select="generate-id()" />  <!-- Generiert eine eindeutige ID -->
        <h2 id="{$id}">
            <xsl:apply-templates select="w:r"/>
        </h2>
    </xsl:template>
    
    <!-- Überschrift als <h3> umwandeln -->
    <xsl:template match="w:p[w:pPr/w:pStyle/@w:val='YourFormat']">
        <xsl:variable name="id" select="generate-id()" />  <!-- Generiert eine eindeutige ID -->
        <h3 id="{$id}">
            <xsl:apply-templates select="w:r"/>
        </h3>
    </xsl:template>
    
    <!-- Überschrift als <h4> umwandeln -->
    <xsl:template match="w:p[w:pPr/w:pStyle/@w:val='YourFormat']">
        <xsl:variable name="id" select="generate-id()" />  <!-- Generiert eine eindeutige ID -->
        <h4 id="{$id}">
            <xsl:apply-templates select="w:r"/>
        </h4>
    </xsl:template>
    
    <!-- Überschrift als <h5> umwandeln -->
    <xsl:template match="w:p[w:pPr/w:pStyle/@w:val='YourFormat']">
        <xsl:variable name="id" select="generate-id()" />  <!-- Generiert eine eindeutige ID -->
        <h5 id="{$id}">
            <xsl:apply-templates select="w:r"/>
        </h5>
    </xsl:template>
    
    <!-- Teil-Überschrift als <h0> -->
    <xsl:template match="w:p[w:pPr/w:pStyle/@w:val='YourFormat']">
        <xsl:variable name="id" select="generate-id()" />  <!-- Generiert eine eindeutige ID -->
        <h0 id="{$id}">
            <xsl:apply-templates select="w:r"/>
        </h0>
    </xsl:template>
    
    <!-- Überschrift als <h1_num> umwandeln -->
    <xsl:template match="w:p[w:pPr/w:pStyle/@w:val='YourFormat']">
        <xsl:variable name="id" select="generate-id()" />  <!-- Generiert eine eindeutige ID -->
        <h1_num id="{$id}">
            <xsl:apply-templates select="w:r"/>
        </h1_num>
    </xsl:template>
    
    <!-- Überschrift als <h2_num> umwandeln -->
    <xsl:template match="w:p[w:pPr/w:pStyle/@w:val='YourFormat']">
        <xsl:variable name="id" select="generate-id()" />  <!-- Generiert eine eindeutige ID -->
        <h2_num id="{$id}">
            <xsl:apply-templates select="w:r"/>
        </h2_num>
    </xsl:template>
    
    <!-- Überschrift als <h3_num> umwandeln -->
    <xsl:template match="w:p[w:pPr/w:pStyle/@w:val='YourFormat']">
        <xsl:variable name="id" select="generate-id()" />  <!-- Generiert eine eindeutige ID -->
        <h3_num id="{$id}">
            <xsl:apply-templates select="w:r"/>
        </h3_num>
    </xsl:template>
    
    <!-- Überschrift als <h4_num> umwandeln -->
    <xsl:template match="w:p[w:pPr/w:pStyle/@w:val='YourFormat']">
        <xsl:variable name="id" select="generate-id()" />  <!-- Generiert eine eindeutige ID -->
        <h4_num id="{$id}">
            <xsl:apply-templates select="w:r"/>
        </h4_num>
    </xsl:template>
    
    <!-- Überschrift als <h5_num> umwandeln -->
    <xsl:template match="w:p[w:pPr/w:pStyle/@w:val='YourFormat']">
        <xsl:variable name="id" select="generate-id()" />  <!-- Generiert eine eindeutige ID -->
        <h5_num id="{$id}">
            <xsl:apply-templates select="w:r"/>
        </h5_num>
    </xsl:template>
    
    <!-- Teil-Überschrift als <h0_num> -->
    <xsl:template match="w:p[w:pPr/w:pStyle/@w:val='YourFormat']">
        <xsl:variable name="id" select="generate-id()" />  <!-- Generiert eine eindeutige ID -->
        <h0_num id="{$id}">
            <xsl:apply-templates select="w:r"/>
        </h0_num>
    </xsl:template>
    
    
    <!-- ABSÄTZE -->
    <!-- Absatz als <p> umwandeln -->
    <xsl:template match="w:p[w:pPr/w:pStyle/@w:val='YourFormat']">
        <p>
            <xsl:apply-templates select="w:r"/>
        </p>
    </xsl:template>
    
    <!-- Text in Runs extrahieren und FUßNOTEN einfügen -->
    <xsl:template match="w:r">
        <xsl:choose>
            <xsl:when test="w:footnoteReference">
                <!-- Text vor der Fußnote -->
                <xsl:value-of select="w:t"/>
                
                <!-- Fußnote extrahieren -->
                <footnote>
                    <!-- ID der Fußnote als Attribut -->
                    <xsl:attribute name="id">
                        <xsl:value-of select="w:footnoteReference/@w:id"/>
                    </xsl:attribute>
                    
                    <!-- Fußnotentext durch ID-Abgleich -->
                    <xsl:variable name="footnoteId" select="w:footnoteReference/@w:id"/>
                    <xsl:for-each select="//w:footnotes/w:footnote[@w:id = $footnoteId]//w:t">
                        <xsl:value-of select="."/>
                    </xsl:for-each>
                </footnote>
            </xsl:when>
            <xsl:otherwise>
                <!-- Normaler Text -->
                <xsl:value-of select="w:t"/>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
    
    <!-- Textknoten -->
    <xsl:template match="w:t">
        <xsl:value-of select="."/>
    </xsl:template>
    
    <!-- Uninteressante Knoten ignorieren -->
    <xsl:template match="text() | @* | *">
        <!-- Überspringe alles außer definierten Tags -->
    </xsl:template>
    
    
    
    
    <!-- LISTEN -->
    
    <!-- Template für CAVAufzhlungBullet -->
    <xsl:template match="w:p[w:pPr/w:pStyle/@w:val='YourFormat']">
        <!-- Vorheriger Absatz in Variabel -->
        <xsl:variable name="previousPara" select="preceding-sibling::w:p[1]" />
        <!-- Aktueller Absatz in Variabel -->
        <xsl:variable name="currentPara" select="." />
        <!-- Folgender Absatz in Variabel -->
        <xsl:variable name="nextPara" select="following-sibling::w:p[1]" />
        
        <!-- Öffnen der Liste, wenn der vorherige Absatz kein "CAVAufzhlungBullet" hat oder wenn es zwar eine Aufzählung ist, aber kein oder ein kleineres w:ilvl hat -->
        <xsl:choose>
            <xsl:when test="not($previousPara/w:pPr/w:pStyle/@w:val='YourFormat') or ($previousPara/w:pPr/w:pStyle/@w:val='CAVAufzhlungBullet' and not($previousPara/w:pPr/w:numPr/w:ilvl) and $currentPara/w:pPr/w:numPr/w:ilvl) or ($previousPara/w:pPr/w:pStyle/@w:val='CAVAufzhlungBullet' and ($previousPara/w:pPr/w:numPr/w:ilvl/@w:val &lt; $currentPara/w:pPr/w:numPr/w:ilvl/@w:val))">
                <xsl:text disable-output-escaping="yes">&lt;ul&gt;</xsl:text>
            </xsl:when>
        </xsl:choose>
        
        <!-- Listenelement für den aktuellen Absatz -->
        <li>
            <xsl:apply-templates select="w:r"/>
        </li>
        
        <!-- Schließen der Liste, wenn der nächste Absatz kein "CAVAufzhlungBullet" hat oder wenn es zwar eine Aufzählung ist, aber kein oder ein kleineres w:ilvl hat -->
        <xsl:choose>
            <xsl:when test="not($nextPara/w:pPr/w:pStyle/@w:val='YourFormat') or ($nextPara/w:pPr/w:pStyle/@w:val='CAVAufzhlungBullet' and not($nextPara/w:pPr/w:numPr/w:ilvl) and $currentPara/w:pPr/w:numPr/w:ilvl) or ($nextPara/w:pPr/w:pStyle/@w:val='CAVAufzhlungBullet' and ($nextPara/w:pPr/w:numPr/w:ilvl/@w:val &lt; $currentPara/w:pPr/w:numPr/w:ilvl/@w:val))">
                <xsl:text disable-output-escaping="yes">&lt;/ul&gt;</xsl:text>
            </xsl:when>
        </xsl:choose>
    </xsl:template>
    
    
    <!-- Template für CAVAufzhlungnummeriert -->
    <xsl:template match="w:p[w:pPr/w:pStyle/@w:val='YourFormat']">
        <!-- Vorheriger Absatz in Variabel -->
        <xsl:variable name="previousPara" select="preceding-sibling::w:p[1]" />
        <!-- Aktueller Absatz in Variabel -->
        <xsl:variable name="currentPara" select="." />
        <!-- Folgender Absatz in Variabel -->
        <xsl:variable name="nextPara" select="following-sibling::w:p[1]" />
        
        <!-- Öffnen der Liste, wenn der vorherige Absatz kein "CAVAufzhlungBullet" hat oder wenn es zwar eine Aufzählung ist, aber kein oder ein kleineres w:ilvl hat -->
        <xsl:choose>
            <xsl:when test="not($previousPara/w:pPr/w:pStyle/@w:val='YourFormat') or ($previousPara/w:pPr/w:pStyle/@w:val='CAVAufzhlungnummeriert' and not($previousPara/w:pPr/w:numPr/w:ilvl) and $currentPara/w:pPr/w:numPr/w:ilvl) or ($previousPara/w:pPr/w:pStyle/@w:val='CAVAufzhlungnummeriert' and ($previousPara/w:pPr/w:numPr/w:ilvl/@w:val &lt; $currentPara/w:pPr/w:numPr/w:ilvl/@w:val))">
                <xsl:text disable-output-escaping="yes">&lt;ul&gt;</xsl:text>
            </xsl:when>
        </xsl:choose>
        
        <!-- Listenelement für den aktuellen Absatz -->
        <li>
            <xsl:apply-templates select="w:r"/>
        </li>
        
        <!-- Schließen der Liste, wenn der nächste Absatz kein "CAVAufzhlungBullet" hat oder wenn es zwar eine Aufzählung ist, aber kein oder ein kleineres w:ilvl hat -->
        <xsl:choose>
            <xsl:when test="not($nextPara/w:pPr/w:pStyle/@w:val='YourFormat') or ($nextPara/w:pPr/w:pStyle/@w:val='CAVAufzhlungnummeriert' and not($nextPara/w:pPr/w:numPr/w:ilvl) and $currentPara/w:pPr/w:numPr/w:ilvl) or ($nextPara/w:pPr/w:pStyle/@w:val='CAVAufzhlungnummeriert' and ($nextPara/w:pPr/w:numPr/w:ilvl/@w:val &lt; $currentPara/w:pPr/w:numPr/w:ilvl/@w:val))">
                <xsl:text disable-output-escaping="yes">&lt;/ul&gt;</xsl:text>
            </xsl:when>
        </xsl:choose>
    </xsl:template>
    
    
    <!-- TABELLEN -->
    <!-- Template für Tabellen -->
    <xsl:template match="w:tbl">
        <table>
            <xsl:apply-templates select="w:tr"/>
        </table>
    </xsl:template>
    
    <!-- Template für Tabellenzeilen -->
    <xsl:template match="w:tr">
        <row>
            <xsl:apply-templates select="w:tc"/>
        </row>
    </xsl:template>
    
    <!-- Template für Tabellenspalten -->
    <xsl:template match="w:tc">
        <cell>
            <xsl:apply-templates select="w:p"/>
        </cell>
    </xsl:template>
    
    
    
    
    
    <!-- KURSIV und FETT und KAPITÄLCHEN -->
    <!-- Text mit kursiven Style umwandeln -->
    <xsl:template match="w:r[w:rPr/w:i]">
        <i>
            <xsl:apply-templates select="w:t"/>
        </i>
    </xsl:template>
    
    <!-- Text mit kursiven Style "CAVFlietextkursiv" umwandeln -->
    <xsl:template match="w:r[w:rPr/w:rStyle/@w:val='YourFormat']">
        <i>
            <xsl:apply-templates select="w:t"/>
        </i>
    </xsl:template>
    
    <!-- Text mit fetten Style umwandeln -->
    <xsl:template match="w:r[w:rPr/w:b]">
        <b>
            <xsl:apply-templates select="w:t"/>
        </b>
    </xsl:template>
    
    <!-- Text mit kursiven Style "CAVFlietextkursiv" umwandeln -->
    <xsl:template match="w:r[w:rPr/w:rStyle/@w:val='YourFormat']">
        <b>
            <xsl:apply-templates select="w:t"/>
        </b>
    </xsl:template>
    
    <!-- Text mit kapitälchen Style "CAVKapitlchen" umwandeln -->
    <xsl:template match="w:r[w:rPr/w:rStyle/@w:val='YourFormat']">
        <smallcaps>
            <xsl:apply-templates select="w:t"/>
        </smallcaps>
    </xsl:template>
    
    
    
    
    
    <!-- SONDERFORMATIERUNGEN -->
    <!-- Anleitungen "CAVAnleitung" -->
    <xsl:template match="w:p[w:pPr/w:pStyle/@w:val='YourFormat']">
        <instruction>
            <xsl:apply-templates select="w:r"/>
        </instruction>
    </xsl:template>
    
    <!-- Bildunterschriften "YourFormat-Bildunterschrift" samt Bild-Verlinkung -->
    <xsl:template match="w:p[w:pPr/w:pStyle/@w:val='YourFormat-Bildunterschrift']">
        <image>
            <url>
                <xsl:variable name="imageCounter" select="count(preceding::w:p[w:pPr/w:pStyle/@w:val='YourFormat-Bildunterschrift']) + 1"/>
                <xsl:value-of select="concat('Abbildungen/Abb_', $imageCounter, '.jpg')"/> <!-- Es kann sein, dass Bilder nicht gefunden werden, weil das hier kein richtiger relativer Pfad ist -->
            </url>
            <alt></alt>
            <caption>
                <xsl:apply-templates select="w:r"/>
            </caption>
        </image>
    </xsl:template>
    
    <!-- Literaturverzeichnis "CAVLiteraturverzeichnis" -->
    <xsl:template match="w:p[w:pPr/w:pStyle/@w:val='CAVLiteraturverzeichnis']">
        <bib>
            <xsl:apply-templates select="w:r"/>
        </bib>
    </xsl:template>
    
</xsl:stylesheet>
