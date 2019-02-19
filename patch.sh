#!/usr/bin/env bash

if [[ $EUID -ne 0 ]]; then
   echo "Ezt a programot sudo-val kell hogy futtasd!"
   exit 1
fi

## /usr/share/dblatex/latex/style/dbk_locale.sty
F_DBK_LOCALE=$(locate dbk_locale.sty | head -n1)

if ! grep -qF "\langsetupdbk{hu}" $F_DBK_LOCALE;then
	cat << EOF > tmp.txt
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
EOF
	sed -i "/Define the locale setups in docbook/r tmp.txt" $F_DBK_LOCALE
fi

## /usr/share/dblatex/xsl/common/hu.xml
F_HUXML=$(locate xsl/common/hu.xml | head -n1)

sed -i "s|\" &#233;s \"|\" \\\'{e\}s \"|g" $F_HUXML
sed -i "s|\", &#233;s \"|\", \\\'{e\}s \"|g" $F_HUXML

## /usr/share/dblatex/xsl/common/common.xsl
F_COMMONXSL=$(locate xsl/common/common.xsl | head -n1)

if ! grep -q "<\!--<xsl:text> \[FAMILY" /usr/share/dblatex/xsl/common/common.xsl; then
	sed -i "s|<xsl\:text> \[FAMILY Given\]</xsl\:text>|<!--<xsl:text> [FAMILY Given]</xsl:text>-->|g" $F_COMMONXSL
fi

# TODO:
# Vessző kicserelése semmire a
#  <xsl:if test="$node//surname and $node//firstname">
#    <xsl:text>, </xsl:text>
#  </xsl:if>
# kontextusban.
# A sed kevésnek bizonyul ehhez.
# Addig, a következő hacky megoldás:

cp $F_COMMONXSL $F_COMMONXSL.bak
sed -i "s|\ \ \ \ <xsl:text>, <\/xsl:text>|\ \ \ \ <xsl:text> <\/xsl:text>|g" $F_COMMONXSL

# Cleanup
rm -f tmp.txt >/dev/null 2>&1
