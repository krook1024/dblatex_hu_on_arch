# A szükséges módosítások

Fontos megjegyezni viszont, hogy a fájlok nem biztos hogy minden disztró minden
csomagjában ezeken a helyeken lesznek, ezek megkeresésére alkalmas pl. a `locate` parancs.
A fájlok módosítása a fájlnévtől függetlenül a következőképpen végezendő el.

## `/usr/share/dblatex/latex/style/dbk_locale.sty`

Ezt egy az egyben be kell másolni a fájlba valahová, érdemes oda, ahol a többi
`\langsetupdbk` blokk található.

```latex
\langsetupdbk{hu}{
  \def\examplename{P\'elda}
  \def\dbequationname{Equation}
  \def\ondate{on}
  \renewcommand{\DBKreleaseinfo}{Munkaanyag}
  \def\writtenby{\'IRTA}
  \def\projname{PROJEKT}
  \def\titlename{C\'IM}
  \def\DBKrefname{REFERENCIA}
  \def\DBKindname{N\'EV}
  \def\DBKindtitle{K\"OZREM\"UK\"ODTEK}
  \def\DBKrevtitle{VERZI\'OT\"ORT\'ENET}
  \def\DBKrevdesc{LE\'IR\'AS}
  \def\DBKrevnumber{VERZI\'O}
  \def\DBKrevname{N\'EV}
  \def\DBKrevdate{D\'ATUM}
  \def\DBKcontrib{HOZZ\'AJ\'ARUL\'AS}
  \def\DBKsignature{AL\'A\'IR\'AS}
}
```

## `/usr/share/dblatex/xsl/common/hu.xml`

501. sor:
```xml
   <l:context name="authorgroup">
      <l:template name="sep" text=", "/>
      <l:template name="sep2" text=" \'{e}s "/>
      <l:template name="seplast" text=", \'{e}s "/>
   </l:context>
```

## `/usr/share/dblatex/xsl/common/common.xsl`

`589.` sort kikommentelni:
```xml
  <!--  <xsl:text> [FAMILY Given]</xsl:text> -->
```

`598.` sorban a vesszőt törölni:

```xml
  <xsl:if test="$node//surname and $node//firstname">
    <xsl:text> </xsl:text>
  </xsl:if>
```
