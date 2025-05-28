<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:fo="http://www.w3.org/1999/XSL/Format"
                version="1.0">
    
    <!-- Root template: Start der XSL-FO Struktur -->
    <xsl:template match="/">
        <fo:root xmlns:fo="http://www.w3.org/1999/XSL/Format"
                 xmlns:fox="http://xmlgraphics.apache.org/fop/extensions">
            
            <fo:layout-master-set>
                
                <!-- Seitenlayout Kapitelseite links -->
                <fo:simple-page-master master-name="chapter-page-left"
                                       page-height="215mm"
                                       page-width="135mm">
                    <fo:region-body margin-top="12.7mm"
                                    margin-bottom="15.558mm"
                                    margin-left="18mm"
                                    margin-right="18mm"/>
                    <fo:region-after region-name="Fußzeile-links" extent="9.697mm" /> <!-- Footer-Bereich für Seitenzahlen -->
                </fo:simple-page-master>
                
                <!-- Seitenlayout Kapitelseite rechts -->
                <fo:simple-page-master master-name="chapter-page-right"
                                       page-height="215mm"
                                       page-width="135mm">
                    <fo:region-body margin-top="12.7mm"
                                    margin-bottom="15.558mm"
                                    margin-left="18mm"
                                    margin-right="18mm"/>
                    <fo:region-after region-name="Fußzeile-rechts" extent="9.697mm" /> <!-- Footer-Bereich für Seitenzahlen -->
                </fo:simple-page-master>
                
                <!-- Seitenlayout für linke Seiten -->
                <fo:simple-page-master master-name="left"
                                       page-height="215mm"
                                       page-width="135mm">
                    <fo:region-body margin-top="12.7mm"
                                    margin-bottom="15.558mm"
                                    margin-left="18mm"
                                    margin-right="18mm"/>
                    <fo:region-after region-name="Fußzeile-links" extent="9.697mm" /> <!-- Footer-Bereich für Seitenzahlen -->
                </fo:simple-page-master>
                
                <!-- Seitenlayout für rechte Seiten -->
                <fo:simple-page-master master-name="right"
                                       page-height="215mm"
                                       page-width="135mm">
                    <fo:region-body margin-top="12.7mm"
                                    margin-bottom="15.558mm"
                                    margin-left="18mm"
                                    margin-right="18mm"/>
                    <fo:region-after region-name="Fußzeile-rechts" extent="9.697mm" /> <!-- Footer-Bereich für Seitenzahlen -->
                    <fo:region-end region-name="Seitenrand-rechts" reference-orientation="270"/>
                </fo:simple-page-master>
                
                
                <!-- Definiere eine Sequenz von Seiten: Abwechselnd links und rechts -->
                <fo:page-sequence-master master-name="page-sequence">
                    <fo:repeatable-page-master-alternatives>
                        
                        <!-- Kapitelseite links -->
                        <fo:conditional-page-master-reference master-reference="chapter-page-left" odd-or-even="even" page-position="first"/>
                        
                        <!-- Kapitelseite rechts -->
                        <fo:conditional-page-master-reference master-reference="chapter-page-right" odd-or-even="odd" page-position="first"/>
                        
                        <!-- Normale linke Seite -->
                        <fo:conditional-page-master-reference master-reference="left" odd-or-even="even"/>
                        
                        <!-- Normale rechte Seite -->
                        <fo:conditional-page-master-reference master-reference="right" odd-or-even="odd"/>
                    </fo:repeatable-page-master-alternatives>
                </fo:page-sequence-master>
                
                <!-- Extra-Seite für die Titelei. Es wird keine Seitensequenz definiert. -->
                <fo:simple-page-master master-name="title-pages"
                                       page-height="215mm"
                                       page-width="135mm"
                                       margin-top="12.7mm"
                                       margin-bottom="15.558mm"
                                       margin-left="18mm"
                                       margin-right="18mm">
                    <fo:region-body margin-top="2mm"/>
                </fo:simple-page-master>
                
            </fo:layout-master-set>
            
            <fo:declarations>
                <fo:color-profile color-profile-name="#CMYK" src="url('../ressources/color-profile/ISOcoated_v2_eci.icc')"/>
            </fo:declarations>
            
            
            <xsl:apply-templates/>
        </fo:root>
    </xsl:template>
    
    <!-- Schriftarten müssen auf dem System lokal installiert sein und können dann mit ihrem Namen angegeben werden. -->
    
    <!-- Konvertiere <title> -->
    <xsl:template match="title">
        <!-- Ignoriere das title-Element -->
    </xsl:template>
    
    <!-- Konvertiere <subtitle> -->
    <xsl:template match="subtitle">
        <!-- Ignoriere das subtitle-Element -->
    </xsl:template>
    
    <!-- Konvertiere Erscheinungsjahr -->
    <xsl:template match="year">
        <!-- Ignoriere das year-Element -->
    </xsl:template>
    
    <xsl:template match="author">
        <fo:page-sequence master-reference="title-pages" force-page-count="no-force">
            <fo:flow flow-name="xsl-region-body">
                
                <!-- Schmutztitel -->
                
                <!-- Block für die Abbildung -->
                <fo:block-container absolute-position="fixed" top="194mm" left="91.998mm">
                    <fo:block>
                        <fo:external-graphic src="url('../ressources/YourLogo')" content-height="12.4mm" content-width="30.454mm"/>
                    </fo:block>
                </fo:block-container>
                
                <!-- Titelseite -->
                <fo:block font-family="Merriweather-LightItalic" font-size="10pt" font-weight="lighter"
                          line-height="14.7pt" hyphenate="false" text-align="left" margin-left="-2.25mm"
                          space-after="4.2mm" page-break-before="right">
                    <xsl:value-of select="."/>
                </fo:block>
                
                <fo:block-container absolute-position="fixed" top="68.744mm" left="15.75mm">
                    <fo:block font-family="MerriweatherSans-Regular" font-size="31pt" font-weight="bolder"
                              line-height="33pt" hyphenate="false" text-align="left" 
                              letter-spacing="1.24pt" text-transform="uppercase" color="cmyk(0,0,0,0.64)">
                        <xsl:value-of select="//title"/>
                    </fo:block>
                    <fo:block-container width="70mm">
                        <fo:block font-family="MerriweatherSans-Regular" font-size="11pt" font-weight="lighter"
                                  line-height="13pt" space-before="8mm" hyphenate="false" text-align="left" text-transform="uppercase" 
                                  color="cmyk(0,0,0,0.64)">
                            <xsl:value-of select="//subtitle"/>
                        </fo:block>
                    </fo:block-container>
                    <fo:block space-before="2mm">
                        <fo:leader leader-length="120%" rule-thickness="0.5pt" color="cmyk(0,0,0,0.64)" leader-pattern="rule"/>
                    </fo:block>
                </fo:block-container>
                
                <fo:block-container absolute-position="fixed" top="195.704mm" left="108mm">
                    <fo:block font-family="MerriweatherSans-Light" font-size="10pt"
                              line-height="16.536pt" hyphenate="false">
                        <xsl:value-of select="//year"/>
                    </fo:block>
                </fo:block-container>
                
                <!-- Impressum -->
                <xsl:variable name="impressum" select="document('../XML/impressum.xml')"/>
                
                <fo:block-container font-family="MerriweatherSans-Light" font-size="7pt" line-height="11pt" page-break-before="always">
                    <fo:block>
                        Themenreihe <xsl:value-of select="$impressum/impressum/produktionsdaten/reihe"/>
                    </fo:block>
                    <fo:block>
                        Umschlaggestaltung: <xsl:value-of select="$impressum/impressum/produktionsdaten/umschlaggestaltung"/>
                    </fo:block>
                    <fo:block>
                        Umschlagmotiv: <xsl:value-of select="$impressum/impressum/produktionsdaten/umschlagmotiv"/>
                    </fo:block>
                    <fo:block>
                        Redaktion: <xsl:value-of select="$impressum/impressum/produktionsdaten/redaktion"/>
                    </fo:block>
                    <fo:block>
                        Reihengestaltung: <xsl:value-of select="$impressum/impressum/produktionsdaten/layout-und-satz"/>
                    </fo:block>
                    <fo:block space-before="11pt">
                        Printed in <xsl:value-of select="$impressum/impressum/produktionsdaten/printed-in"/>
                    </fo:block>
                    <fo:block>
                        Druck und Bindung: <xsl:value-of select="$impressum/impressum/produktionsdaten/druck-und-bindung"/>
                    </fo:block>
                </fo:block-container>
                
                <!-- FSC + CO2 Logo -->
                <fo:table table-layout="fixed" width="55%" space-after="11pt">
                    <fo:table-column column-width="50%"/>
                    <fo:table-column column-width="50%"/>
                    <fo:table-body>
                        <fo:table-row>
                            <fo:table-cell>
                                <fo:block margin-left="-1mm" margin-top="2mm" display-align="after">
                                    <fo:external-graphic src="url('../ressources/CPI_FSC_Logo_quer.pdf')" content-width="28.8mm" content-height="13.05mm"/>
                                </fo:block>
                            </fo:table-cell>
                            <fo:table-cell>
                                <fo:block>
                                    <fo:external-graphic src="url('../ressources/CPI_Klimaneutral_Logo.pdf')" content-width="17.646mm" content-height="14.651mm"/>
                                </fo:block>
                            </fo:table-cell>
                        </fo:table-row>
                    </fo:table-body>
                </fo:table>
                
                <fo:block font-family="MerriweatherSans-Light" font-size="7pt" line-height="11pt">
                    <xsl:value-of select="$impressum/impressum/buchdaten/auflage"/>
                </fo:block>
                
                <fo:block font-family="MerriweatherSans-Light" font-size="7pt" line-height="11pt">
                    ISBN <xsl:value-of select="$impressum/impressum/buchdaten/isbn/print"/> (Printversion)
                </fo:block>
                
                <fo:block font-family="MerriweatherSans-Light" font-size="7pt" line-height="11pt" space-after="11pt">
                    ISBN <xsl:value-of select="$impressum/impressum/buchdaten/isbn/epub"/> (ePub)
                </fo:block>
                
                <fo:block-container width="60mm" line-height="8pt">
                    <fo:block font-family="MerriweatherSans-Light" font-size="7pt">
                        <xsl:value-of select="$impressum/impressum/buchdaten/copyright"/>
                    </fo:block>
                </fo:block-container>
                
                <fo:block font-family="MerriweatherSans-Light" font-size="7pt" line-height="11pt" space-after="11pt">
                    <xsl:value-of select="$impressum/impressum/buchdaten/rechte"/>
                </fo:block>
                
                <fo:block-container width="75mm" line-height="11pt">
                    <fo:block font-family="MerriweatherSans-Light" font-size="7pt" space-after="4.2mm">
                        Bibliografische Information der Deutschen Nationalbibliothek: Die Deutsche
                        Nationalbibliothek verzeichnet diese Publikation in der Deutschen Nationalbiografie;
                        detaillierte bibliografische Daten sind im Internet http://dnb.d-nb.de abrufbar.
                    </fo:block>
                </fo:block-container>
                
                <!-- Inhaltsverzeichnis -->
                <fo:block font-family="MerriweatherSans-Bold" font-size="8.5pt"
                          line-height="10.5pt" space-after="22pt" hyphenate="false" text-align="left" page-break-before="right" text-transform="uppercase" color="cmyk(0,0,0,0.64)">
                    Inhalt
                </fo:block>
                
                <fo:block line-height="13pt" text-align-last="justify">
                    <xsl:for-each select="//h1 | //h2 | //h3 | //h1_num | //h2_num | //h3_num">
                        <xsl:choose>
                            <xsl:when test="self::h1_num">
                                <fo:table width="100%">
                                    <fo:table-column column-width="3%"/> <!-- Spalte für Nummerierung -->
                                    <fo:table-column column-width="97%"/> <!-- Spalte für Überschrift, Linie und Seitenzahl -->
                                    <fo:table-body>
                                        <fo:table-row>
                                            <fo:table-cell>
                                                <fo:block font-family="MerriweatherSans-Bold" font-size="8.5pt" color="cmyk(0,0,0,0.64)" text-transform="uppercase" padding-top="8.5pt">
                                                    <xsl:number level="any" count="h1_num" format="1"/>
                                                </fo:block>
                                            </fo:table-cell>
                                            <fo:table-cell>
                                                <fo:block font-family="MerriweatherSans-Bold" font-size="8.5pt" color="cmyk(0,0,0,0.64)" text-transform="uppercase" padding-top="8.5pt">
                                                    <fo:basic-link internal-destination="{@id}">
                                                        <xsl:value-of select="."/>
                                                    </fo:basic-link>
                                                    <fo:leader leader-pattern="dots" font-family="MerriweatherSans-Bold" font-size="8.73pt" color="cmyk(0,0,0,0.64)"/>
                                                    <fo:inline font-family="MerriweatherSans-Light" font-size="8.73pt" color="cmyk(0,0,0,1)">
                                                        <fo:page-number-citation ref-id="{@id}"/>
                                                    </fo:inline>
                                                </fo:block>
                                            </fo:table-cell>
                                        </fo:table-row>
                                    </fo:table-body>
                                </fo:table>
                            </xsl:when>
                            <xsl:when test="self::h2_num">
                                <fo:table width="100%">
                                    <fo:table-column column-width="3%"/> <!-- Spalte für Nummerierung -->
                                    <fo:table-column column-width="97%"/> <!-- Spalte für Überschrift, Linie und Seitenzahl -->
                                    <fo:table-body>
                                        <fo:table-row>
                                            <fo:table-cell>
                                                <fo:block font-family="MerriweatherSans-Regular" font-size="8.5pt" start-indent="6mm" padding-top="2.835pt">
                                                    <xsl:number level="any" count="h1_num" format="1."/>
                                                    <xsl:number level="any" count="h2_num" from="h1_num" format="1"/>
                                                </fo:block>
                                            </fo:table-cell>
                                            <fo:table-cell>
                                                <fo:block font-family="MerriweatherSans-Regular" font-size="8.5pt" padding-top="2.835pt">
                                                    <fo:basic-link internal-destination="{@id}">
                                                        <xsl:value-of select="."/>
                                                    </fo:basic-link>
                                                    <fo:leader leader-pattern="dots" font-family="MerriweatherSans-Bold" font-size="8.73pt" color="cmyk(0,0,0,0.64)"/>
                                                    <fo:inline font-family="MerriweatherSans-Light" font-size="8.73pt" color="cmyk(0,0,0,1)">
                                                        <fo:page-number-citation ref-id="{@id}"/>
                                                    </fo:inline>
                                                </fo:block>
                                            </fo:table-cell>
                                        </fo:table-row>
                                    </fo:table-body>
                                </fo:table>
                            </xsl:when>
                            <xsl:when test="self::h3_num">
                                <fo:table width="100%">
                                    <fo:table-column column-width="3%"/> <!-- Spalte für Nummerierung -->
                                    <fo:table-column column-width="97%"/> <!-- Spalte für Überschrift, Linie und Seitenzahl -->
                                    <fo:table-body>
                                        <fo:table-row>
                                            <fo:table-cell>
                                                <fo:block font-family="MerriweatherSans-Regular" font-size="8.5pt" start-indent="12mm" padding-top="2.835pt">
                                                    <xsl:number level="multiple" count="h3_num" from="h2_num" format="1.1.1"/>
                                                </fo:block>
                                            </fo:table-cell>
                                            <fo:table-cell>
                                                <fo:block font-family="MerriweatherSans-Regular" font-size="8.5pt" padding-top="2.835pt">
                                                    <fo:basic-link internal-destination="{@id}">
                                                        <xsl:value-of select="."/>
                                                    </fo:basic-link>
                                                    <fo:leader leader-pattern="dots" font-family="MerriweatherSans-Bold" font-size="8.73pt" color="cmyk(0,0,0,0.64)"/>
                                                    <fo:inline font-family="MerriweatherSans-Light" font-size="8.73pt" color="cmyk(0,0,0,1)">
                                                        <fo:page-number-citation ref-id="{@id}"/>
                                                    </fo:inline>
                                                </fo:block>
                                            </fo:table-cell>
                                        </fo:table-row>
                                    </fo:table-body>
                                </fo:table>
                            </xsl:when>
                            <xsl:when test="self::h1">
                                <fo:table width="100%">
                                    <fo:table-body>
                                        <fo:table-row>
                                            <fo:table-cell>
                                                <fo:block font-family="MerriweatherSans-Bold" font-size="8.5pt" color="cmyk(0,0,0,0.64)" text-transform="uppercase" padding-top="8.5pt">
                                                    <fo:basic-link internal-destination="{@id}">
                                                        <xsl:value-of select="."/>
                                                    </fo:basic-link>
                                                    <fo:leader leader-pattern="dots" font-family="MerriweatherSans-Bold" font-size="8.73pt" color="cmyk(0,0,0,0.64)"/>
                                                    <fo:inline font-family="MerriweatherSans-Light" font-size="8.73pt" color="cmyk(0,0,0,1)">
                                                        <fo:page-number-citation ref-id="{@id}"/>
                                                    </fo:inline>
                                                </fo:block>
                                            </fo:table-cell>
                                        </fo:table-row>
                                    </fo:table-body>
                                </fo:table>
                            </xsl:when>
                            <xsl:when test="self::h2">
                                <fo:table width="100%">
                                    <fo:table-body>
                                        <fo:table-row>
                                            <fo:table-cell>
                                                <fo:block font-family="MerriweatherSans-Regular" font-size="8.5pt" start-indent="6mm" padding-top="2.835pt">
                                                    <fo:basic-link internal-destination="{@id}">
                                                        <xsl:value-of select="."/>
                                                    </fo:basic-link>
                                                    <fo:leader leader-pattern="dots" font-family="MerriweatherSans-Bold" font-size="8.73pt" color="cmyk(0,0,0,0.64)"/>
                                                    <fo:inline font-family="MerriweatherSans-Light" font-size="8.73pt" color="cmyk(0,0,0,1)">
                                                        <fo:page-number-citation ref-id="{@id}"/>
                                                    </fo:inline>
                                                </fo:block>
                                            </fo:table-cell>
                                        </fo:table-row>
                                    </fo:table-body>
                                </fo:table>
                            </xsl:when>
                            <xsl:when test="self::h3">
                                <fo:table width="100%">
                                    <fo:table-body>
                                        <fo:table-row>
                                            <fo:table-cell>
                                                <fo:block font-family="MerriweatherSans-Regular" font-size="8.5pt" start-indent="12mm" padding-top="2.835pt">
                                                    <fo:basic-link internal-destination="{@id}">
                                                        <xsl:value-of select="."/>
                                                    </fo:basic-link>
                                                    <fo:leader leader-pattern="dots" font-family="MerriweatherSans-Bold" font-size="8.73pt" color="cmyk(0,0,0,0.64)"/>
                                                    <fo:inline font-family="MerriweatherSans-Light" font-size="8.73pt" color="cmyk(0,0,0,1)">
                                                        <fo:page-number-citation ref-id="{@id}"/>
                                                    </fo:inline>
                                                </fo:block>
                                            </fo:table-cell>
                                        </fo:table-row>
                                    </fo:table-body>
                                </fo:table>
                            </xsl:when>
                        </xsl:choose>
                    </xsl:for-each>
                </fo:block>
                
                <!-- Widmung (falls vorhanden) -->
                <xsl:variable name="widmung" select="document('../XML/widmung.xml')"/>
                <xsl:if test="$widmung/widmung != ''">
                    <fo:block-container width="66mm" page-break-before="always" margin-top="50%" text-align="center" margin-left="11mm">
                        <fo:block font-family="Sabon" font-size="10.5pt" font-style="italic" line-height="15pt">
                            <xsl:value-of select="$widmung/widmung"/>
                        </fo:block>
                    </fo:block-container>
                </xsl:if>
                
            </fo:flow>
        </fo:page-sequence>
    </xsl:template>
    
    
    <xsl:template match="chapter">
        <fo:page-sequence master-reference="page-sequence" force-page-count="no-force" >
            
            <fo:static-content flow-name="Fußzeile-links">
                <fo:block text-align="left" margin-left="18mm" font-family="MerriweatherSans-Regular" font-size="8.7pt" line-height="10.44pt">
                    <fo:page-number/>
                </fo:block>
            </fo:static-content>
            <fo:static-content flow-name="Fußzeile-rechts">
                <fo:block text-align="right" margin-right="18mm" font-family="MerriweatherSans-Regular" font-size="8.7pt" line-height="10.44pt">
                    <fo:page-number/>
                </fo:block>
            </fo:static-content>
            
            <fo:static-content flow-name="Seitenrand-rechts">
                <fo:block-container text-align="left" margin-top="6.5mm" margin-left="21.9075mm">
                    <fo:block font-family="MerriweatherSans-Regular" font-size="8pt" line-height="10pt" color="cmyk(0,0,0,0.64)" text-transform="uppercase">
                        <fo:retrieve-marker retrieve-class-name="h1"
                                            retrieve-position="first-including-carryover"
                                            retrieve-boundary="page-sequence"/>
                    </fo:block>
                </fo:block-container>
            </fo:static-content>
            
            <fo:flow flow-name="xsl-region-body">
                <xsl:apply-templates/>
            </fo:flow>
        </fo:page-sequence>
    </xsl:template>
    
    <!-- Überschriften -->
    <xsl:template match="h0">
        <fo:block id="{@id}" font-family="ScalaSans-Bold" font-size="14pt" font-weight="bold"
                  line-height="14pt" space-after="16.5mm" hyphenate="false" text-align="right" text-indent="0" page-break-before="right">
            <xsl:value-of select="."/>
        </fo:block>
    </xsl:template>
    
    <xsl:template match="h1">
        <fo:block id="{@id}" font-family="MerriweatherSans-Bold" font-size="16pt" font-weight="bold"
                  line-height="17pt" space-after="3.175mm" hyphenate="false" text-align="left" text-indent="0" 
                  color="cmyk(0,0,0,0.64)" keep-with-next="always">
            <fo:marker marker-class-name="h1">
                <xsl:choose>
                    <xsl:when test="self::h1">
                        <xsl:value-of select="."/>
                    </xsl:when>
                    <xsl:when test="self::h1_num">
                        <xsl:value-of select="."/>
                    </xsl:when>
                </xsl:choose>
            </fo:marker>
            <xsl:value-of select="."/>
        </fo:block>
    </xsl:template>
    
    <xsl:template match="h2">
        <fo:block id="{@id}" font-family="MerriweatherSans-Regular" font-size="12pt" 
                  line-height="16pt" space-before="6mm" space-after="3mm" hyphenate="false" 
                  text-align="left" keep-with-next="always" color="cmyk(0,0,0,0.64)">
            <fo:marker marker-class-name="h2">
                <xsl:choose>
                    <xsl:when test="self::h2">
                        <xsl:value-of select="."/>
                    </xsl:when>
                    <xsl:when test="self::h2_num">
                        <xsl:value-of select="."/>
                    </xsl:when>
                </xsl:choose>
            </fo:marker>
            <xsl:value-of select="."/>
        </fo:block>
    </xsl:template>
    
    <xsl:template match="h3">
        <fo:block id="{@id}" font-family="ScalaSans-Bold" font-size="9.8pt" font-weight="bold"
                  line-height="12pt" margin-left="4mm" hyphenate="false" text-align="left" keep-with-next="always">
            <xsl:value-of select="."/>
        </fo:block>
    </xsl:template>
    
    <xsl:template match="h0_num">
        <fo:block id="{@id}" font-family="ScalaSans-Bold" font-size="14pt" font-weight="bold"
                  line-height="14pt" space-after="16.5mm" hyphenate="false" text-align="right" page-break-before="right">
            <xsl:number level="single" format="1"/>
            <xsl:value-of select="."/>
        </fo:block>
        
    </xsl:template>
    
    <!-- Überschrift mit großer Nummerierung -->
    <xsl:template match="h1_num">
        <fo:block id="{@id}" font-family="MerriweatherSans-Regular" font-size="24pt" font-weight="bold"
                  line-height="25pt" hyphenate="false" text-align="left" text-transform="uppercase" 
                  color="cmyk(0,0,0,0.64)" margin-top="57mm" page-break-before="always" keep-with-next="always">
            
            <!-- Marker für Kolumnentitel -->
            <fo:marker marker-class-name="h1">
                <xsl:number level="any" count="h1_num" format="1"/> 
                <xsl:text> </xsl:text> 
                <xsl:value-of select="."/>
            </fo:marker>
            
            <fo:table table-layout="fixed" width="100%">
                <fo:table-column column-width="14%"/> <!-- Spalte für die Nummerierung -->
                <fo:table-column column-width="86%"/> <!-- Spalte für den Überschriftstext -->
                <fo:table-body>
                    <fo:table-row>
                        <!-- Nummerierung -->
                        <fo:table-cell>
                            <fo:block font-size="58pt" line-height="50pt" color="cmyk(0,0,0,0.64)" text-align="left" space-before="1mm" margin-top="1mm">
                                <xsl:number level="any" count="h1_num" format="1"/>
                            </fo:block>
                        </fo:table-cell>
                        <!-- Überschriftstext -->
                        <fo:table-cell>
                            <fo:block padding-left="2.65mm">
                                <xsl:value-of select="."/>
                            </fo:block>
                        </fo:table-cell>
                    </fo:table-row>
                </fo:table-body>
            </fo:table>
        </fo:block>
        <fo:block space-after="25pt">
            <fo:leader leader-length="120%" rule-thickness="0.5pt" color="cmyk(0,0,0,0.64)" leader-pattern="rule"/>
        </fo:block>
    </xsl:template>
    
    
    <xsl:template match="h2_num">
        <fo:block id="{@id}" font-family="MerriweatherSans-Regular" font-size="12pt" 
                  line-height="16pt" space-before="6mm" space-after="3mm" hyphenate="false" text-align="left" margin-left="10mm" text-indent="-6mm" keep-with-next="always" color="cmyk(0,0,0,0.64)">
            <fo:marker marker-class-name="h2">
                <xsl:choose>
                    <xsl:when test="self::h2">
                        <xsl:value-of select="."/>
                    </xsl:when>
                    <xsl:when test="self::h2_num">
                        <xsl:number level="any" count="h1_num" format="1." />
                        <xsl:number level="any" count="h2_num" from="h1_num" format="1" />
                        <fo:inline padding-left="5.2mm">
                            <xsl:value-of select="."/>
                        </fo:inline>
                    </xsl:when>
                </xsl:choose>
            </fo:marker>
            <!-- Nummerierung und Inhalt -->
            <xsl:number level="any" count="h1_num" format="1." />
            <xsl:number level="any" count="h2_num" from="h1_num" format="1" />
            <fo:inline padding-left="5.2mm">
                <xsl:value-of select="."/>
            </fo:inline>
        </fo:block>
    </xsl:template>
    
    <xsl:template match="h3_num">
        <fo:block id="{@id}" font-family="ScalaSans-Bold" font-size="9.8pt" font-weight="bold"
                  line-height="12pt" margin-left="4mm" hyphenate="false" text-align="left" keep-with-next="always">
            <xsl:number level="multiple" count="h3_num" from="h2_num" format="1.1.1"/>
            <fo:leader leader-length="1em"/> <!-- Fügt einen festen Abstand von 1em zwischen Nummer und Überschrift ein -->
            <xsl:value-of select="."/>
        </fo:block>
    </xsl:template>
    
    <!-- Absatzformatierungen -->
    <!-- Konvertiere <p> in einen normalen Absatz mit Blocksatz und Silbentrennung -->
    <xsl:template match="p">
        <fo:block font-family="Merriweather-Light" font-size="8.7pt" line-height="14pt" 
                  text-align="justify" hyphenate="true" xml:lang="de" hyphenation-character="-" hyphenation-push-character-count="4" hyphenation-remain-character-count="4" widows="2">
            <!-- Bedingung für den Erstzeileneinzug: Kein Einzug, wenn der vorherige Knoten ein <h1>, <h2>, <h3>, <h1_num> oder <h2_num> war -->
            <xsl:choose>
                <xsl:when test="preceding-sibling::*[1][self::h1 or self::h2 or self::h3 or self::h4 or self::h5 or self::h1_num or self::h2_num or self::h3_num or self::case or self::ul or self::ol or self::quote or self::instruction or self::comment or self::box]">
                    <xsl:attribute name="text-indent">0mm</xsl:attribute>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:attribute name="text-indent">3mm</xsl:attribute>
                </xsl:otherwise>
            </xsl:choose>
            <!-- Bedingung für den Abstand nach dem Absatz: 2.2mm, wenn das folgende Element kein Absatz ist -->
            <xsl:choose>
                <xsl:when test="following-sibling::*[1][not(self::p)]">
                    <xsl:attribute name="space-after">2.2mm</xsl:attribute>
                </xsl:when>
            </xsl:choose>
            <xsl:apply-templates/>
        </fo:block>
    </xsl:template>
    
    <!-- Konvertieren Anleitungen -->
    
    <xsl:template match="instruction[not(preceding-sibling::*[1][self::instruction])]">
        <!-- Block-Container für zusammenhängende instruction-Elemente -->
        <fo:block-container padding-left="3mm" padding-right="4mm" space-after="1mm"
                            border-width="0.5pt" border-color="cmyk(0,0,0,0.64)" border-style="solid">
            <!-- Wende Templates für alle zusammenhängenden instruction-Elemente an -->
            <xsl:for-each select=".|following-sibling::*[self::instruction]">
                <fo:block font-family="MerriweatherSans-Light" font-size="8.5pt" line-height="14.5pt"
                          text-align="justify" hyphenate="true" xml:lang="de" hyphenation-character="-" orphans="2">
                    <xsl:apply-templates/>
                </fo:block>
            </xsl:for-each>
        </fo:block-container>
    </xsl:template>
    
    <!-- Leere Anweisung für nachfolgende instruction-Elemente, die bereits verarbeitet wurden -->
    <xsl:template match="instruction[preceding-sibling::*[1][self::instruction]]"/>
    
    <!-- Bullet-Listen -->
    <xsl:template match="ul">
        <fo:block font-family="Merriweather-Light" font-size="8.7pt" line-height="14.7pt" text-align="justify" hyphenate="true" xml:lang="de" hyphenation-character="-">
            <fo:list-block provisional-distance-between-starts="4mm" provisional-label-separation="2mm" space-before="2mm" space-after="2mm">
                <xsl:for-each select="li">
                    <fo:list-item>
                        <fo:list-item-label end-indent="label-end()">
                            <fo:block font-family="MerriweatherSans-ExtraBold" font-size="10pt" line-height="12pt" color="cmyk(0,0,0,0.64)">▶</fo:block> <!-- Aufzählungszeichen -->
                        </fo:list-item-label>
                        <fo:list-item-body start-indent="4mm">
                            <fo:block>
                                <xsl:apply-templates select="node()"/>
                            </fo:block>
                        </fo:list-item-body>
                    </fo:list-item>
                </xsl:for-each>
            </fo:list-block>
        </fo:block>
    </xsl:template>
    
    <!-- Nummerierte Listen -->
    <xsl:template match="ol">
        <fo:block font-family="Merriweather-Light" font-size="8.7pt" line-height="14.7pt" text-align="justify" hyphenate="true" xml:lang="de" hyphenation-character="-">
            <fo:list-block provisional-distance-between-starts="4mm" provisional-label-separation="2mm" space-before="2mm" space-after="2mm">
                <xsl:for-each select="li">
                    <fo:list-item>
                        <fo:list-item-label end-indent="label-end()">
                            <fo:block font-family="MerriweatherSans-ExtraBold" font-size="10pt" line-height="12pt" color="cmyk(0,0,0,0.64)">
                                <xsl:number/>
                            </fo:block>
                        </fo:list-item-label>
                        <fo:list-item-body start-indent="4mm">
                            <fo:block>
                                <xsl:value-of select="."/>
                            </fo:block>
                        </fo:list-item-body>
                    </fo:list-item>
                </xsl:for-each>
            </fo:list-block>
        </fo:block>
    </xsl:template>
    
    <!-- Konvertiere Bildunterschriften und integriere Alternativtext und Bildlink -->
    <xsl:template match="image">
        <fo:block space-after="3.2mm">
            <!-- Bild-Link -->
            <fo:block-container>
                <fo:block text-align="center">
                    <fo:external-graphic src="{url}" content-width="100%" content-height="55mm" scaling="uniform"/>
                </fo:block>
            </fo:block-container>
            
            <!-- Bildunterschrift -->
            <fo:block font-family="Sabon-Italic" font-size="8.8pt" line-height="11pt" margin-left="4mm"
                      text-align="left" hyphenate="true" xml:lang="de" hyphenation-character="-" keep-with-previous="always">
                <xsl:value-of select="caption"/>
            </fo:block>
        </fo:block>
    </xsl:template>
    
    <!-- Literaturverzeichnis -->
    <xsl:template match="bib">
        <fo:block font-family="Sabon" font-size="8.25pt" line-height="12pt" text-align="justify" margin-left="5mm" text-indent="-5mm" space-after="1.2mm" hyphenate="true" hyphenation-character="-" xml:lang="de" orphans="2">
            <xsl:apply-templates/>
        </fo:block>
    </xsl:template>
    
    
    <!-- Tabellen -->
    <xsl:template match="table">
        <fo:table border="1">
            <fo:table-header>
                <fo:table-row>
                    <xsl:for-each select="row[1]/cell">
                        <fo:table-cell>
                            <fo:block font-weight="bold">
                                <xsl:value-of select="."/>
                            </fo:block>
                        </fo:table-cell>
                    </xsl:for-each>
                </fo:table-row>
            </fo:table-header>
            
            <fo:table-body>
                <xsl:for-each select="row[position() > 1]">
                    <fo:table-row>
                        <xsl:for-each select="cell">
                            <fo:table-cell>
                                <fo:block>
                                    <xsl:value-of select="."/>
                                </fo:block>
                            </fo:table-cell>
                        </xsl:for-each>
                    </fo:table-row>
                </xsl:for-each>
            </fo:table-body>
        </fo:table>
    </xsl:template>
    
    
    <!-- Zeichenformatierungen -->
    <!-- Konvertiere <i> in kursiven Inline-Text -->
    <xsl:template match="i">
        <fo:inline font-family="Merriweather" font-style="italic">
            <xsl:apply-templates/>
        </fo:inline>
    </xsl:template>
    
    <!-- Konvertiere <b> in fetten Inline-Text -->
    <xsl:template match="b">
        <fo:inline font-family="Merriweather" font-weight="bold">
            <xsl:apply-templates/>
        </fo:inline>
    </xsl:template>
    
    <!-- Fußnoten -->
    <xsl:template match="footnote">
        <fo:footnote>
            <!-- Inline Content -->
            <fo:inline font-size="7pt" baseline-shift="super">
                <xsl:value-of select="@id"/>
            </fo:inline>
            <!-- Footnote Body -->
            <fo:footnote-body>
                <fo:block text-indent="0" keep-with-next="always">
                    <fo:leader leader-length="50%" rule-thickness="0.5pt" 
                               leader-pattern="rule"/>
                </fo:block>
                <fo:block font-size="8pt" text-align="justify" text-indent="0" line-height="8.9pt">
                    <fo:inline font-size="7pt">
                        <xsl:value-of select="@id"/>
                    </fo:inline>
                    <xsl:value-of select="."/>
                </fo:block>
            </fo:footnote-body>
        </fo:footnote>
    </xsl:template>
    
    
    
</xsl:stylesheet>