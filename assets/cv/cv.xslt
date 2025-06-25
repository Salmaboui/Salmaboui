<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:param name="lang" select="'fr'"/>
    <xsl:template match="/">
        <html xmlns="http://www.w3.org/1999/xhtml" xmlns:dc="http://purl.org/dc/elements/1.1/">
            <head>
                <title><xsl:value-of select="//cv/me/name[@lang=$lang]"/></title>
                <link rel="stylesheet" type="text/css" href="assets/cv/cv.css"/>
                <link rel="stylesheet" type="text/css" href="assets/cv/cvedit.css"/>
            </head>
            <body typeof="schema:Person">
                <div id="container">
                    <div id="me">
                        <h1 property="schema:name"><xsl:value-of select="//cv/me/name[@lang=$lang]"/></h1>
                        <ul id="contactdetails">
                            <li property="schema:email">
                                <xsl:value-of select="//cv/me/email/label[@lang=$lang]"/>:
                                <xsl:value-of select="//cv/me/email/address"/>
                            </li>
                        </ul>
                    </div>

                    <div id="content">
                        <div id="statement">
                            <p property="schema:description">
                                <xsl:value-of select="//cv/me/description[@lang=$lang]"/>
                            </p>
                        </div>

                        <div id="sxscontainer">
                            <div id="education">
                                <h2 property="schema:educationalCredentialAwarded">
                                    <xsl:value-of select="//cv/education/title[@lang=$lang]"/>
                                </h2>
                                <xsl:call-template name="showEducation"/>
                            </div>

                            <div id="employment">
                                <h2 property="schema:workExperience">
                                    <xsl:value-of select="//cv/employment/title[@lang=$lang]"/>
                                </h2>
                                <xsl:call-template name="showEmployment"/>
                            </div>
                        </div>

                        <div id="projectsandawards">
                            <xsl:call-template name="showProjects"/>
                            <xsl:call-template name="showAwards"/>
                        </div>

                        <div id="hobbiesandinterests">
                            <h2 property="schema:hobby">
                                <xsl:value-of select="//cv/hobandint/title[@lang=$lang]"/>
                            </h2>
                            <p property="schema:description">
                                <xsl:value-of select="//cv/hobandint/description[@lang=$lang]"/>
                            </p>
                        </div>
                    </div>
                </div>
                <script type="text/javascript" src="cvedit.js"></script>
            </body>
        </html>
    </xsl:template>

    <xsl:template name="showEducation">
        <xsl:for-each select="//cv/education/qualification">
            <div typeof="schema:EducationalOccupationalCredential">
                <h3 class="qualtype" property="schema:educationalCredentialAwarded">
                    <xsl:value-of select="type[@lang=$lang]"/>
                </h3>
                <div class="qual">
                    <p class="qualcontent" property="schema:description">
                        <xsl:value-of select="description[@lang=$lang]"/>
                    </p>
                    <p class="qualestablishment">
                        <xsl:value-of select="establishment[@lang=$lang]"/>
                        (<xsl:value-of select="from[@lang=$lang]"/> - <xsl:value-of select="to[@lang=$lang]"/>)
                    </p>
                </div>
            </div>
        </xsl:for-each>
    </xsl:template>

    <xsl:template name="showEmployment">
        <xsl:for-each select="//cv/employment/experience">
            <div typeof="schema:WorkExperience">
                <h3 class="jobtitle" property="schema:jobTitle">
                    <strong><xsl:value-of select="job_title[@lang=$lang]"/></strong>,
                    <xsl:value-of select="establishment[@lang=$lang]"/>
                    (<xsl:value-of select="from[@lang=$lang]"/> - <xsl:value-of select="to[@lang=$lang]"/>)
                </h3>
                <p class="jobdescription" property="schema:description">
                    <xsl:value-of select="description[@lang=$lang]"/>
                </p>
            </div>
        </xsl:for-each>
    </xsl:template>

    <xsl:template name="showProjects">
        <div id="projects">
            <h2><xsl:value-of select="//cv/projects/title[@lang=$lang]"/></h2>
            <xsl:for-each select="//cv/projects/project">
                <div typeof="schema:CreativeWork">
                    <h3 property="schema:name">
                        <xsl:value-of select="name[@lang=$lang]"/>
                    </h3>
                    <p property="schema:description">
                        <xsl:value-of select="description[@lang=$lang]"/>
                    </p>
                </div>
            </xsl:for-each>
        </div>
    </xsl:template>

    <xsl:template name="showAwards">
        <div id="awards">
            <h2><xsl:value-of select="//cv/awards/title[@lang=$lang]"/></h2>
            <ul>
                <xsl:for-each select="//cv/awards/award[@lang=$lang]">
                    <li property="schema:award">
                        <xsl:value-of select="."/>
                    </li>
                </xsl:for-each>
            </ul>
        </div>
    </xsl:template>
</xsl:stylesheet>
