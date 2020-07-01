<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:tei="http://www.tei-c.org/ns/1.0"
    xpath-default-namespace="http://www.tei-c.org/ns/1.0"
    exclude-result-prefixes="xs tei"
    version="2.0">
    
    <xsl:output method="html" indent="yes" encoding="UTF-8"/>
    
    <!-- Gestion des espaces parasites -->
    <xsl:strip-space elements="*"/>
    
    <!-- CONFIGURATION DES SORTIES -->
    
    <xsl:template match="/">
        <!-- Récupération du nom et du chemin du fichier courant -->
        <xsl:variable name="file">
            <xsl:value-of select="replace(base-uri(XML_Sevigne), '.xml', '')"/>
        </xsl:variable>
        
        <!-- Définition des variables contenant les chemins vers chaque page web et leurs noms -->
        <xsl:variable name="pathAccueil">
            <xsl:value-of select="concat($file,'accueil','.html')"/>
        </xsl:variable>
        <xsl:variable name="pathSource">
            <xsl:value-of select="concat($file,'source','.html')"/>
        </xsl:variable>
        <xsl:variable name="pathIndexLettres">
            <xsl:value-of select="concat($file,'indexlettres','.html')"/>
        </xsl:variable>
        <xsl:variable name="pathIndexPers">
            <xsl:value-of select="concat($file,'indexpers','.html')"/>
        </xsl:variable>
        <xsl:variable name="pathIndexPlace">
            <xsl:value-of select="concat($file,'indexplace','.html')"/>
        </xsl:variable>   
        <xsl:variable name="pathLettre1362">
            <xsl:value-of select="concat($file,'lettre1362','.html')"/>
        </xsl:variable>
        <xsl:variable name="pathLettre1363">
            <xsl:value-of select="concat($file,'lettre1363','.html')"/>
        </xsl:variable>
        <xsl:variable name="pathLettre1364">
            <xsl:value-of select="concat($file,'lettre1364','.html')"/>
        </xsl:variable>
        <xsl:variable name="pathLettre1365">
            <xsl:value-of select="concat($file,'lettre1365','.html')"/>
        </xsl:variable>
        
        <!-- Définition des variables contenant les éléments communs à toutes les pages web -->
        <!-- Métadonnées -->
        <xsl:variable name="meta">
            <head>
                <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
                <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous"/>
                <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Pinyon+Script"/>    
                <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"/>
                <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"/>
                <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"/>
                <title>
                    <xsl:value-of select="//titleStmt/title[@type='main']"/>
                </title>
            </head>
        </xsl:variable>
        
        <!-- Barre de navigation -->
        <xsl:variable name="navbar">
            <nav class="navbar navbar-expand-sm bg-light navbar-light">
                <div class="container-fluid">
                    <!-- Marque -->
                    <ul class="nav navbar-nav navbar-right">
                        <li><a class="navbar-brand" href="{$pathAccueil}"><img src="logo_ecole.jpg" alt="Logo" style="width:100px;"/></a></li>
                        <li><h1 class="text-center" style="color:#000000; font-family:'Pinyon Script', cursive; font-weight: bold; font-size:50px;">Correspondance de la marquise de Sévigné</h1></li>
                    </ul>
                    <!-- Liens -->
                    <ul class="navbar-nav navbar-right">
                        <li class="nav-item">
                            <a class="nav-link" href="{$pathSource}">Source</a>
                        </li>
                        <!-- Menu déroulant -->
                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle" href="#" id="navbardrop" data-toggle="dropdown">
                                Lettres
                            </a>
                            <div class="dropdown-menu">
                                <a class="dropdown-item" href="{$pathIndexLettres}">Index</a>
                                <a class="dropdown-item" href="{$pathLettre1362}">Lettre 1362</a>
                                <a class="dropdown-item" href="{$pathLettre1363}">Lettre 1363</a>
                                <a class="dropdown-item" href="{$pathLettre1364}">Lettre 1364</a>
                                <a class="dropdown-item" href="{$pathLettre1365}">Lettre 1365</a>
                            </div>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="{$pathIndexPers}">Index des personnes</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="{$pathIndexPlace}">Index des lieux</a>
                        </li>   
                    </ul>
                </div>
            </nav>
        </xsl:variable>
        
        <!-- Définition des sorties pour chaque page web -->
        <!-- Page d'accueil -->
        <xsl:result-document href="{$pathAccueil}" method="html" indent="yes">
            <html>
                <xsl:copy-of select="$meta"/>
                <body>
                    <!-- Les règles CSS ont été regroupées (sauf rare exception) dans un élément style au début du body. Je me suis par ailleurs appuyée sur la bibliothèque Bootstrap pour le style -->
                    <style>
                        body {
                        background: url('portrait_femme_lettre.jpg') no-repeat center center fixed;
                        -webkit-background-size: cover;
                        -moz-background-size: cover;
                        background-size: cover;
                        -o-background-size: cover;
                        height: 100%;}
                        .container {
                        padding:90px;}
                        .card {
                        margin: 20px; 
                        border: 1px solid black;
                        border-radius: 30px;
                        background: rgba(255, 255, 255, 0.5);}
                        .lead {
                        color:#000000; 
                        font-weight:500;
                        text-align:center;}
                        .footer {
                        position: fixed;
                        left: 0;
                        bottom: 0;
                        width: 100%;
                        height: 20px;
                        text-align: center;
                        color: white;}    
                    </style>
                    <xsl:copy-of select="$navbar"/>
                    <div class="container">
                        <div class="card border-0 shadow my-5">
                            <div class="card-body p-4">
                                <br/>
                                <p class="lead">Ce site a été réalisé en avril 2020 pour l'évaluation du cours de XSLT de <a href="https://github.com/ArianePinche" class="text-dark">Mme Ariane Pinche</a>.</p>
                                <br/>
                                <p class="lead">Il propose une édition numérique de lettres de la marquise de Sévigné publiées en 1823 par Pierre-Marie Gault de Saint-Germain.</p>
                                <br/>
                                <p class="lead">L'édition papier a été numérisée et est disponible sur <a href="https://gallica.bnf.fr/ark:/12148/bpt6k6323006w/f7.item" class="text-dark">Gallica</a>.</p>
                            </div>
                        </div> 
                    </div>
                    <footer class="footer">
                        <div>
                            <small>© Morgane Rousselot - Site créé en 2020 dans le cadre du M2 TNAH de l'École des Chartes</small>
                        </div>
                    </footer>
                </body>
            </html>
        </xsl:result-document>
        
        <!-- Page source -->
        <xsl:result-document href="{$pathSource}" method="html" indent="yes">
            <html>
                <xsl:copy-of select="$meta"/>
                <body>
                    <style>
                        h3 {
                        text-align:center;
                        margin-bottom:20px;
                        }
                    </style>
                    <xsl:copy-of select="$navbar"/>
                    <div class="container-fluid">
                        <div class="row">
                            <div class="col-7 mx-auto p-4">                                
                                <h3>Édition papier</h3>
                                <ul><b>Titre complet : </b><xsl:value-of select="//sourceDesc//titleStmt/title[@type='main']"/>, <xsl:value-of select="//sourceDesc//titleStmt/title[@type='subtitle'][1]"/>, <xsl:value-of select="//sourceDesc//titleStmt/title[@type='subtitle'][2]"/></ul>
                                <ul><b>Auteur (principal) : </b><xsl:value-of select="//fileDesc/titleStmt/author[@role='main']"/>.</ul>
                                <ul><b>Auteur (secondaire) : </b><xsl:value-of select="//fileDesc/titleStmt/author[@role='contributor']"/>.</ul>
                                <ul><b>Éditeur scientifique : </b><xsl:value-of select="//sourceDesc//titleStmt/editor"/> (<xsl:value-of select="//sourceDesc//titleStmt/editor/@xml:id"/>).</ul>
                                <ul><b>Maison d'édition : </b><xsl:value-of select="//sourceDesc//publicationStmt/publisher[1]"/> - <xsl:value-of select="//sourceDesc//publicationStmt/publisher[2]"/>.</ul>
                                <ul><b>Lieu d'édition : </b><xsl:value-of select="//sourceDesc//publicationStmt/pubPlace"/>.</ul>
                                <ul><b>Date d'édition : </b><xsl:value-of select="//sourceDesc//publicationStmt/date"/>.</ul>                                                               
                                <ul><b>Institution : </b><xsl:value-of select="//sourceDesc//publicationStmt/distributor"/>.</ul>
                                <ul><b>Notice catalogue : </b><a href="https://catalogue.bnf.fr/ark:/12148/cb30487834x" class="text-dark">https://catalogue.bnf.fr/ark:/12148/cb30487834x</a></ul>
                                <ul><b>Cote : </b>Z-14885 </ul>
                                <ul><b>Fac-similés : </b><a href="https://gallica.bnf.fr/ark:/12148/bpt6k6323006w?rk=257512;0" class="text-dark"><xsl:value-of select="//sourceDesc//publicationStmt/distributor/@facs"/></a></ul>
                                <ul><b>Licence : </b><xsl:value-of select="//sourceDesc//publicationStmt//availability/licence"/>.</ul>                               
                            </div>  
                            <div class="col-5 mx-auto p-4">
                                <h3>Édition numérique</h3>
                                <ul><b>Volume : </b><xsl:value-of select="//sourceDesc//seriesStmt/biblScope[@unit='volume']"/>.</ul>
                                <ul><b>Numéros des lettres : </b><xsl:value-of select="//sourceDesc//seriesStmt/biblScope[@unit='letter']"/>.</ul>
                                <ul><b>Pages : </b><xsl:value-of select="//sourceDesc//seriesStmt/biblScope[@unit='page']"/>.</ul>                                
                            </div>
                        </div>
                    </div>
                </body>
            </html>
        </xsl:result-document>
        
        <!-- Page d'index des lettres -->
        <xsl:result-document href="{$pathIndexLettres}" method="html" indent="yes">
            <html>
                <xsl:copy-of select="$meta"/>
                <body>
                    <style>
                        h2 {
                        text-align: center; 
                        margin-bottom:20px;}                       
                    </style>
                    <xsl:copy-of select="$navbar"/>
                    <div class="media">
                        <img src="lettre_sevigne_a_sa_fille_le_2_fevrier_1671.jpg" class="align-self-start mr-2" alt="lettre de la marquise a sa fille 1671" title="Lettre de la marquise de Sévigné à sa fille datée du 2 février 1671" style="max-width: 30%;"/>
                        <div class="media-body mr-5 mt-4">
                            <h2>Index des lettres</h2>                             
                            <ul><xsl:call-template name="indexLettres"/></ul>                            
                        </div>
                    </div>
                </body>
            </html>
        </xsl:result-document>
        
        <!-- Page Lettre 1362 -->
        <!-- Pour plus de clarté, j'ai créé une page par lettre --> 
        <xsl:result-document href="{$pathLettre1362}" method="html" indent="yes">
            <html>
                <xsl:copy-of select="$meta"/>
                <body>
                    <style>
                        .container {
                        margin-top: 20px;}
                        .col {
                        text-align: right;}
                        .entete {
                        text-align: center;}
                        .corps {
                        padding-left: 100px;
                        padding-right: 100px;
                        margin-left: 200px;
                        margin-right: 200px;}
                        .font-italic {
                        text-align: right;}                    
                        .paragraphe {
                        text-align: justify; 
                        text-indent: 5%; 
                        line-height: 2;}
                        .notes {
                        padding-left: 110px;
                        padding-right: 110px; 
                        text-align: justify;}                     
                    </style>
                    <xsl:copy-of select="$navbar"/>
                    <div class="container">
                        <div class="row">
                            <div class="col"/>
                            <div class="col"><a href="{$pathLettre1363}" class="btn btn-light btn-sm active" role="button" aria-pressed="true">Lettre suivante</a></div>
                        </div>
                    </div>
                    <div>
                        <div class="entete">
                            <h2><xsl:value-of select="//text//div1[@n='1362']/head"/></h2> 
                            <h5><xsl:apply-templates select="//text//div1[@n='1362']//opener/name"/></h5>
                        </div>
                        <div class="corps">
                            <br/>
                            <ul class="font-italic"><xsl:apply-templates select="//text//div1[@n='1362']//opener/dateline"/></ul>
                            <ul class="paragraphe">
                                <xsl:apply-templates select="//text//div1[@n='1362']/p"/>
                                <xsl:apply-templates select="//text//div1[@n='1362']/closer"/>
                                <hr/>
                            </ul>  
                        </div>
                        <ul class="notes">
                            <xsl:call-template name="notesLettre1362"/>
                        </ul>
                    </div>
                </body>
            </html>
        </xsl:result-document>
        
        <!-- Page Lettre 1363 -->
        <xsl:result-document href="{$pathLettre1363}" method="html" indent="yes">
            <html>
                <xsl:copy-of select="$meta"/>
                <body>
                    <style>
                        .container {
                        margin-top: 20px;}
                        .entete {
                        text-align: center;}
                        .corps {
                        padding-left: 100px;
                        padding-right: 100px;
                        margin-left: 200px;
                        margin-right: 200px;}
                        .font-italic {
                        text-align: right;}                    
                        .paragraphe {
                        text-align: justify; 
                        text-indent: 5%; 
                        line-height: 2;}
                        .addition {
                        padding-left: 110px;
                        padding-right: 110px;}
                        h6 {
                        text-align: center;}
                        .notes {
                        padding-left: 110px;
                        padding-right: 110px; 
                        text-align: justify;}
                    </style>
                    <xsl:copy-of select="$navbar"/>
                    <div class="container">
                        <div class="row">
                            <div class="col" style="text-align:left;"><a href="{$pathLettre1362}" class="btn btn-light btn-sm active" role="button" aria-pressed="true">Lettre précédente</a></div>
                            <div class="col" style="text-align:right;"><a href="{$pathLettre1364}" class="btn btn-light btn-sm active" role="button" aria-pressed="true">Lettre suivante</a></div>
                        </div>
                    </div>
                    <div>
                        <div class="entete">
                            <h2><xsl:value-of select="//text//div1[@n='1363']/head"/></h2> 
                            <h5><xsl:apply-templates select="//text//div1[@n='1363']/opener/name"/></h5>
                        </div>
                        <div class="corps">
                            <br/>
                            <ul class="font-italic"><xsl:apply-templates select="//text//div1[@n='1363']//opener/dateline"/></ul>
                            <ul class="paragraphe">
                                <xsl:apply-templates select="//text//div1[@n='1363']/div2[@type='beginning']//p"/>
                                <br/>
                                <br/>
                                <div class="addition">
                                    <h6><xsl:apply-templates select="//text//div1[@n='1363']/div2[@type='addition']/opener/name"/></h6>
                                    <xsl:apply-templates select="//text//div1[@n='1363']/div2[@type='addition']//p"/>
                                </div>
                                <br/>
                                <br/>
                                <h6><xsl:apply-templates select="//text//div1[@n='1363']/div2[@type='end']/opener/name"/></h6>
                                <xsl:apply-templates select="//text//div1[@n='1363']/div2[@type='end']//p"/>
                                <hr/>
                            </ul>     
                        </div>
                        <ul class="notes">
                            <xsl:call-template name="notesLettre1363"/>
                        </ul>
                    </div>
                </body>
            </html>
        </xsl:result-document>
        
        <!-- Page Lettre 1364 -->
        <xsl:result-document href="{$pathLettre1364}" method="html" indent="yes">
            <html>
                <xsl:copy-of select="$meta"/>
                <body>
                    <style>
                        .container {
                        margin-top: 20px;}
                        .entete {
                        text-align: center;}
                        .corps {
                        padding-left: 100px;
                        padding-right: 100px;
                        margin-left: 200px;
                        margin-right: 200px;}
                        .font-italic {
                        text-align: right;}                    
                        .paragraphe {
                        text-align: justify; 
                        text-indent: 5%; 
                        line-height: 2;}            
                    </style>
                    <xsl:copy-of select="$navbar"/>
                    <div class="container">
                        <div class="row">
                            <div class="col" style="text-align:left;"><a href="{$pathLettre1363}" class="btn btn-light btn-sm active" role="button" aria-pressed="true">Lettre précédente</a></div>
                            <div class="col" style="text-align:right;"><a href="{$pathLettre1365}" class="btn btn-light btn-sm active" role="button" aria-pressed="true">Lettre suivante</a></div>
                        </div>
                    </div>
                    <div>
                        <div class="entete">
                            <h2><xsl:value-of select="//text//div1[@n='1364']/head"/></h2> 
                            <h5><xsl:apply-templates select="//text//div1[@n='1364']//opener/name"/></h5>
                        </div>
                        <div class="corps">
                            <br/>
                            <ul class="font-italic"><xsl:apply-templates select="//text//div1[@n='1364']//opener/dateline"/></ul>
                            <ul class="paragraphe">
                                <xsl:apply-templates select="//text//div1[@n='1364']/p"/>
                                <xsl:apply-templates select="//text//div1[@n='1364']/closer"/>
                                <hr/>
                            </ul>    
                        </div>
                    </div>
                </body>
            </html>
        </xsl:result-document>
        
        <!-- Page Lettre 1365 -->
        <xsl:result-document href="{$pathLettre1365}" method="html" indent="yes">
            <html>
                <xsl:copy-of select="$meta"/>
                <body>
                    <style>
                        .container {
                        margin-top: 20px;}
                        .col {
                        text-align: left;}
                        .entete {
                        text-align: center;}
                        .corps {
                        padding-left: 100px;
                        padding-right: 100px;
                        margin-left: 200px;
                        margin-right: 200px;}
                        .font-italic {
                        text-align: right;}                    
                        .paragraphe {
                        text-align: justify; 
                        text-indent: 5%; 
                        line-height: 2;}
                        .notes {
                        padding-left: 110px;
                        padding-right: 110px; 
                        text-align: justify;}                     
                    </style>
                    <xsl:copy-of select="$navbar"/>
                    <div class="container">
                        <div class="row">
                            <div class="col"><a href="{$pathLettre1364}" class="btn btn-light btn-sm active" role="button" aria-pressed="true">Lettre précédente</a></div>
                            <div class="col"/>
                        </div>
                    </div> 
                    <div>
                        <div class="entete">
                            <h2><xsl:value-of select="//text//div1[@n='1365']/head"/></h2> 
                            <h5><xsl:apply-templates select="//text//div1[@n='1365']//opener/name"/></h5>
                        </div>
                        <div class="corps">
                            <br/>
                            <ul class="font-italic"><xsl:apply-templates select="//text//div1[@n='1365']//opener/dateline"/></ul>
                            <ul class="paragraphe">
                                <xsl:apply-templates select="//text//div1[@n='1365']/p"/>
                                <xsl:apply-templates select="//text//div1[@n='1365']/closer"/>
                                <hr/>
                            </ul>
                        </div>
                        <ul class="notes">
                            <xsl:call-template name="notesLettre1365"/>
                        </ul>
                    </div>
                </body>
            </html>
        </xsl:result-document>
        
        <!-- Page d'index des personnes -->
        <xsl:result-document href="{$pathIndexPers}" method="html" indent="yes">
            <html>
                <xsl:copy-of select="$meta"/>
                <body>
                    <style>
                        h2 {
                        text-align: center;
                        margin-top: 20px;}
                        img {
                        max-width: 100%;}
                    </style>
                    <xsl:copy-of select="$navbar"/>
                    <div class="container-fluid">
                        <h2>Index des personnes</h2> 
                        <div class="row">
                            <div class="col-3 mx-auto p-4">                                
                                <img src="portrait_sevigne.jpg" class="align-self-start mr-1 rounded-circle" alt="portrait marquise de sevigne" title="Portrait de la marquise de Sévigné"/>                                
                            </div>
                            <div class="col-9 mr-0 p-2">                                
                                <xsl:call-template name="indexPers"/>                                                                
                            </div>
                        </div>
                    </div> 
                </body>
            </html>
        </xsl:result-document>
        
        <!-- Page d'index des lieux -->
        <xsl:result-document href="{$pathIndexPlace}" method="html" indent="yes">
            <html>
                <xsl:copy-of select="$meta"/>
                <body>
                    <style>
                        h2 {
                        text-align: center; 
                        margin-bottom: 20px;}
                    </style>
                    <xsl:copy-of select="$navbar"/>
                    <div class="media">
                        <img src="chateau_grignan.jpg" class="align-self-start mr-2" alt="chateau grignan" title="Tours du château de Grignan" style="max-width: 40%;"/>
                        <div class="media-body mr-5 mt-4">
                            <h2>Index des lieux</h2> 
                            <xsl:call-template name="indexPlace"/>                            
                        </div>    
                    </div>
                </body>
            </html>
        </xsl:result-document>     
    </xsl:template>
    
    <!-- RÈGLES DE PRÉSENTATION SPÉCIFIQUES (appelées ci-dessus par des call-template) -->
    
    <!-- Règle pour l'index des lettres -->
    <xsl:template name="indexLettres">
            <body>
                <!-- Création d'un tableau -->
                <table class="table table-bordered table-striped">
                <!-- Création de l'entête des 5 colonnes du tableau -->
                <thead style="text-align: center;">
                    <th>Expéditeur</th>
                    <th>Destinataire</th>
                    <th>Lieu de rédaction</th>
                    <th>Date d'envoi</th>
                    <th>Numéro de lettre</th>
                </thead>
                    <!-- Création d'une ligne de tableau par lettre -->
                    <xsl:for-each select="//correspDesc">
                        <tr style="text-align: center;">
                            <td><xsl:value-of select="correspAction[@type='sent']//persName"/></td>
                            <td><xsl:value-of select="correspAction[@type='received']//persName"/></td>
                            <td><xsl:value-of select="correspAction[@type='sent']//placeName"/></td>
                            <td><xsl:value-of select="correspAction//date"/></td>
                            <!-- Création d'un lien vers chaque lettre --> 
                            <td>
                                <xsl:variable name="idCorresp">
                                    <xsl:value-of select=".//@xml:id"/>
                                </xsl:variable>
                                <xsl:variable name="link">
                                    <xsl:for-each select="ancestor::TEI//body//div1[replace(@decls, '#','')=$idCorresp]">
                                        <xsl:value-of select="./@n"/>
                                    </xsl:for-each>
                                </xsl:variable>
                                <xsl:choose>
                                    <!-- Si le contenu de la variable link est égale à la valeur indiquée, alors un lien est créé vers la lettre correspondante -->
                                    <xsl:when test="$link='1362'">
                                        <a href="lettre1362.html">1362</a>
                                    </xsl:when>
                                    <xsl:when test="$link='1363'">
                                        <a href="lettre1363.html">1363</a>
                                    </xsl:when>
                                    <xsl:when test="$link='1364'">
                                        <a href="lettre1364.html">1364</a>
                                    </xsl:when>
                                    <xsl:when test="$link='1365'">
                                        <a href="lettre1365.html">1365</a>
                                    </xsl:when>
                                </xsl:choose>
                            </td>
                        </tr>
                    </xsl:for-each>
                </table>
            </body>
    </xsl:template>
    
    <!-- Règle pour l'index des personnes -->
    <xsl:template name="indexPers">
        <!-- Pour chaque personne citée,... -->
        <xsl:for-each select="//listPerson/person/persName">
            <!-- ...j'opère un tri par ordre alphabétique ascendant et... -->
            <xsl:sort select="surname[1]" order="ascending"/>
            <!-- ...je crée une ligne... -->
            <li>
                <span style="font-weight:bold;">
                <!-- ...avec son nom,... -->
                <xsl:value-of select="surname[1]"/>
                <!-- ...sa particule (si elle existe),... -->
                <xsl:if test="nameLink[2]">
                    <xsl:text> </xsl:text>
                    <xsl:value-of select="nameLink[2]"/>
                    <xsl:text> </xsl:text>
                </xsl:if>
                <!-- ...son autre nom (si il existe),... -->
                <xsl:if test="surname[2]">
                    <xsl:text> </xsl:text>
                    <xsl:value-of select="surname[2]"/>
                </xsl:if>
                <xsl:text>, </xsl:text>
                <!-- ...son prénom et... -->
                <xsl:value-of select="forename"/>
                <xsl:text> </xsl:text>
                <!-- ...son autre particule (si elle existe) en gras,... -->
                <xsl:value-of select="nameLink[1]"/>
                </span>
                <xsl:text> (</xsl:text>
                <!-- ...son titre/rôle,... -->
                <xsl:if test="roleName">
                    <xsl:value-of select="roleName"/>
                    <xsl:text>, </xsl:text>
                </xsl:if>
                <!-- ...ses dates de naissance et de mort si elles existent, sinon une croix,... -->
                <xsl:choose>
                    <xsl:when test="following-sibling::birth and following-sibling::death">
                        <xsl:value-of select="following-sibling::birth"/>
                        <xsl:text>-</xsl:text>
                        <xsl:value-of select="following-sibling::death"/>
                    </xsl:when>
                    <xsl:otherwise>
                        <xsl:text>†</xsl:text>
                    </xsl:otherwise>
                </xsl:choose>
                <!-- ...et un lien vers sa notice Data BNF ou Wikipedia si elle existe. -->
                <xsl:if test="@ref">
                    <xsl:text>, voir</xsl:text> 
                    <a href="{@ref}"> notice</a>
                </xsl:if>
                <xsl:text>)</xsl:text>
                <xsl:variable name="idPerson">
                    <xsl:value-of select="parent::person//@xml:id"/>
                </xsl:variable>
                <xsl:text> : </xsl:text>
                <!-- Ensuite pour chaque personne, je récupère toutes les occurences de son nom dans les lettres ET dans les notes. -->
                <!-- Je crée au passage un lien vers les lettres et les notes correspondantes. -->
                <!-- J'ai modifié l'emplacement des notes dans mon XML (mon ODD a donc été actualisée) en créant un élément notesStmt dans le fileDesc du teiHeader (la manipulation est précisée dans la règle pour les notes ci-dessous). -->
                <!-- Sauf que j'avais des persName et des placeName dans ces notes. Avec un seul for-each-group, les personnes (ou les lieux) citées dans ces notes n'affichaient aucun renvoi.-->
                <!-- J'ai donc dû créer un deuxième for-each-group spécifique pour les notes à défaut de réussir à tout rassembler dans le même. -->
                <xsl:for-each-group select="ancestor::TEI//body//persName[replace(@ref, '#','')=$idPerson]" group-by="ancestor::div1/@n">
                    <xsl:text> lettre </xsl:text>
                    <!-- Si l'@n à une certaine valeur, alors le renvoi s'affiche et un lien est créé (lien qui a la même valeur que celle du n) -->
                    <xsl:if test="ancestor::div1/@n='1362'">
                        <a href="lettre1362.html"><xsl:value-of select="ancestor::div1/@n"/></a>
                    </xsl:if>
                    <xsl:if test="ancestor::div1/@n='1363'">
                        <a href="lettre1363.html"><xsl:value-of select="ancestor::div1/@n"/></a>
                    </xsl:if>
                    <xsl:if test="ancestor::div1/@n='1364'">
                        <a href="lettre1364.html"><xsl:value-of select="ancestor::div1/@n"/></a>
                    </xsl:if>
                    <xsl:if test="ancestor::div1/@n='1365'">
                        <a href="lettre1365.html"><xsl:value-of select="ancestor::div1/@n"/></a>
                    </xsl:if>
                    <xsl:if test="position()!= last()">, </xsl:if>
                    <xsl:if test="position() = last()">, </xsl:if>
                </xsl:for-each-group>
                <xsl:for-each-group select="ancestor::TEI//teiHeader//fileDesc//notesStmt//note//persName[replace(@ref, '#','')=$idPerson]" group-by="parent::note/@n">
                    <!-- Si l'@decls à une certaine valeur, alors le renvoi s'affiche et un lien est créé -->
                    <xsl:if test="parent::note[@decls='#letter1362']">
                        <xsl:text>note </xsl:text>
                        <a href="lettre1362.html"><xsl:value-of select="parent::note/@n"/></a>
                        <xsl:text> (lettre 1362)</xsl:text>
                    </xsl:if>
                    <xsl:if test="parent::note[@decls='#letter1363']">
                        <xsl:text>note </xsl:text>
                        <a href="lettre1363.html"><xsl:value-of select="parent::note/@n"/></a>
                        <xsl:text> (lettre 1363)</xsl:text>
                    </xsl:if>
                    <xsl:if test="parent::note[@decls='#letter1364']">
                        <xsl:text>note </xsl:text>
                        <a href="lettre1364.html"><xsl:value-of select="parent::note/@n"/></a>
                        <xsl:text> (lettre 1364)</xsl:text>
                    </xsl:if>
                    <xsl:if test="parent::note[@decls='#letter1365']">
                        <xsl:text>note </xsl:text>
                        <a href="lettre1365.html"><xsl:value-of select="parent::note/@n"/></a>
                        <xsl:text> (lettre 1365)</xsl:text>
                    </xsl:if>
                    <xsl:if test="position()!= last()">, </xsl:if>
                    <xsl:if test="position() = last()">.</xsl:if>
                </xsl:for-each-group>
            </li>
        </xsl:for-each>       
    </xsl:template>
    
    <!-- Règle pour l'index des lieux -->
    <xsl:template name="indexPlace">
        <!-- Pour chaque lieu cité,... -->
        <xsl:for-each select="//listPlace//placeName">
            <!-- ...j'opère un tri par ordre alphabétique ascendant et... -->
            <xsl:sort select="name" order="ascending"/>
            <!-- ...je crée une ligne... -->
            <li>
                <span style="font-weight:bold;">
                <!-- ...avec son nom en gras... -->
                <xsl:value-of select="name"/>
                </span>
                <xsl:choose>
                    <!-- ...le nom de la localité et du pays ou juste du pays (pour éviter une redondance entre le name et le settlement)... -->
                    <xsl:when test="settlement">
                        <xsl:text> (</xsl:text>
                        <xsl:value-of select="settlement"/>
                        <xsl:text>, </xsl:text>
                        <xsl:value-of select="country"/>
                        <xsl:text>)</xsl:text>
                    </xsl:when>
                    <xsl:otherwise>
                        <xsl:text> (</xsl:text>
                        <xsl:value-of select="country"/>
                        <xsl:text>)</xsl:text>
                    </xsl:otherwise>
                </xsl:choose>
                <xsl:variable name="idPlace">
                    <xsl:value-of select="parent::place/@xml:id"/>
                </xsl:variable>
                <xsl:text> : </xsl:text>
                <!-- Ensuite pour chaque lieu, je récupère toutes les occurences de son nom dans les lettres ET dans les notes. -->
                <!-- Comme pour l'index des personnes, j'ai utilisé deux for-each-group : un pour les lettres, l'autre pour les notes. -->
                <xsl:for-each-group select="ancestor::TEI//body//placeName[replace(@ref, '#','')=$idPlace]" group-by="ancestor::div1/@n">
                    <xsl:text>lettre </xsl:text>
                    <!-- Si l'@n à une certaine valeur, alors le renvoi s'affiche et un lien est créé (lien qui a la même valeur que celle de l'@n) --> 
                    <xsl:if test="ancestor::div1/@n='1362'">
                        <a href="lettre1362.html"><xsl:value-of select="ancestor::div1/@n"/></a>
                    </xsl:if>
                    <xsl:if test="ancestor::div1/@n='1363'">
                        <a href="lettre1363.html"><xsl:value-of select="ancestor::div1/@n"/></a>
                    </xsl:if>
                    <xsl:if test="ancestor::div1/@n='1364'">
                        <a href="lettre1364.html"><xsl:value-of select="ancestor::div1/@n"/></a>
                    </xsl:if>
                    <xsl:if test="ancestor::div1/@n='1365'">
                        <a href="lettre1365.html"><xsl:value-of select="ancestor::div1/@n"/></a>
                    </xsl:if>
                    <xsl:if test="position()!= last()">, </xsl:if>
                    <xsl:if test="position() = last()">.</xsl:if>
                 </xsl:for-each-group>
                <xsl:for-each-group select="ancestor::TEI//teiHeader//fileDesc//notesStmt//note//placeName[replace(@ref, '#','')=$idPlace]" group-by="parent::note/@decls">
                    <!-- Si l'@decls à une certaine valeur, alors le renvoi s'affiche et un lien est créé -->
                    <!-- Une seule lettre était concernée par la présence d'un placeName dans une note. Je me suis donc contentée d'une seule condition. -->
                    <xsl:text>note </xsl:text>
                    <xsl:if test="parent::note[@decls='#letter1363']">
                        <a href="lettre1363.html"><xsl:value-of select="parent::note/@n"/></a>
                        <xsl:text> (lettre 1363)</xsl:text>
                    </xsl:if>
                    <xsl:if test="position()!= last()">, </xsl:if>
                    <xsl:if test="position() = last()">.</xsl:if>
                </xsl:for-each-group>
            </li>
        </xsl:for-each>  
    </xsl:template>
    
    <!-- Règle pour les notes -->
    
    <!-- Comme évoqué dans la règle de l'index des personnes, j'ai modifié mon fichier XML car mes notes étaient placées directement dans le texte des lettres sous cette forme : <note resp="editor" place="foot" n="1"> -->
    <!-- Créer un notesStmt avec des éléments enfants notes dans le fileDesc et des éléments ref[@note] dans le text m'a permis d'insérer un appel de note directement dans le texte et la note correspondante en bas de page. -->
    <!-- J'ai donc dû actualiser mon ODD (qui était/est très restrictive). -->
    
    <!-- Je commence par créer l'exposant qui signale la note directement dans le texte... -->
    <xsl:template match="ref[@type='note']">
        <sup>
            <a>
                <xsl:attribute name="href">
                    <xsl:text>#</xsl:text>
                    <xsl:value-of select="./@n"/>
                </xsl:attribute>
                <xsl:value-of select="./@n"/>
            </a>
        </sup>
    </xsl:template>
    
    <!-- ...puis je récupère les notes. --> 
    <!-- J'ai répété l'opération pour chaque lettre puisque j'ai créé une page web par lettre (sauf pour la lettre 1364 qui ne contient pas de notes) -->
    <xsl:template name="notesLettre1362">
        <xsl:for-each select="//notesStmt/note[@decls='#letter1362']">
            <p>
                <xsl:attribute name="id">
                    <xsl:value-of select="./@n"/>
                </xsl:attribute>
                <xsl:value-of select="./@n"/>
                <xsl:text>. </xsl:text>
                <xsl:apply-templates/>
            </p>
        </xsl:for-each>
    </xsl:template>
    
    <xsl:template name="notesLettre1363">
        <xsl:for-each select="//notesStmt/note[@decls='#letter1363']">
            <p>
                <xsl:attribute name="id">
                    <xsl:value-of select="./@n"/>
                </xsl:attribute>
                <xsl:value-of select="./@n"/>
                <xsl:text>. </xsl:text>
                <xsl:apply-templates/>
            </p>
        </xsl:for-each>
    </xsl:template>
    
    <xsl:template name="notesLettre1365">
        <xsl:for-each select="//notesStmt/note[@decls='#letter1365']">
            <p>
                <xsl:attribute name="id">
                    <xsl:value-of select="./@n"/>
                </xsl:attribute>
                <xsl:value-of select="./@n"/>
                <xsl:text>. </xsl:text>
                <xsl:apply-templates/>
            </p>
        </xsl:for-each>
    </xsl:template>
    
</xsl:stylesheet>