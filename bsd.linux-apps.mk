#-*- mode: Makefile; tab-width: 4; -*-
# ex:ts=4
#
# $FreeBSD$
#
# Please view me with 4 column tabs!

# This section defines possible names of linux infrastructure ports
# (components) and all information necessary for ports to use those components.
# 
# Ports can use this as follows:
#
# USE_LINUX_APPS=    esound xorglibs
#
# .include <bsd.port.mk>
#
# As a result proper RUN_DEPENDS will be added.
#
# Variables:
# LINUX_DIST_SUFFIX	- Contains the value which is added to a port's name
#					  (i.e. linux<this_variable>-port ) to get the right
#					  linux infrastructure port.
# _ALL_LINUX_APPS	- A (sorted) list of all linux infrastructure ports
#					  (components), covered here.
# OVERRIDE_LINUX_NONBASE_PORTS
#			- This specifies a none-default linux infrastructure ports to use.
#					  Valid value is "f8" to use Linux Fedora 8 ports.
#					  This is an user-only variable. Don't use it in any port,
#					  it's meant to be used in make.conf.

.if !defined(_POSTMKINCLUDED) && !defined(Linux_APPS_Pre_Include)

Linux_APPS_Include_MAINTAINER=	emulation@FreeBSD.org
Linux_APPS_Pre_Include=			bsd.linux-apps.mk

.endif

.if defined(_POSTMKINCLUDED) && !defined(Linux_APPS_Post_Include)

Linux_APPS_Post_Include=	bsd.linux-apps.mk

# OVERRIDE_LINUX_NONBASE_PORTS may be used only with LINUX_OSRELEASE=2.6.16
.  if (${LINUX_OSRELEASE} == "2.6.16") && defined(OVERRIDE_LINUX_NONBASE_PORTS)
.    if ${OVERRIDE_LINUX_NONBASE_PORTS} == "f8"
LINUX_DIST_SUFFIX=	-f8
.    else
IGNORE=		valid value for OVERRIDE_LINUX_NONBASE_PORTS is \"f8\"
.    endif
.  else
LINUX_DIST_SUFFIX=
.  endif

# I'm not sure if kompozer is better for linux-f8 ports, so use nvu
WEB_AUTH=			nvu

# Non-version specific components
_LINUX_APPS_ALL=	allegro alsalib arts aspell atk cairo curl esound expat fontconfig \
					freealut gdkpixbuf gtk gtk2 hicontheme imlib jpeg libaudiofile \
					libg2c libglade libglade2 libglu libmng libogg libsigcpp20 libtheora \
					libvorbis libxml libxml2 mikmod openal openmotif openssl pango png png10 qt33 \
					scimgtk scimlibs sdl12 sdlimage sdlmixer tiff xorglibs ucl ungif upx webauth

# 2.4.2 components
_LINUX_APPS_ALL+=

# 2.6.16 components
_LINUX_APPS_ALL+=

# Component definition section
#
# component${LINUX_DIST_SUFFIX:S/-/_/}_FILE
#					- Variables are used to name a file to check,
#					  file names may differ for different LINUX_DIST_SUFFIX.
#					  The value is LINUX_DIST_SUFFIX without the leading dash.
# component_DETECT	- The resulting file to check for a dependency existence.
# component_PORT	- A port which will be used to install a missing dependency.
# component_DEPENDS	- A list of components the current component depends on.

allegro_FILE=		${LINUXBASE}/usr/lib/liballeg-4.0.3.so
allegro_f8_FILE=	${LINUXBASE}/usr/lib/liballeg-4.2.2.so
allegro_DETECT=		${allegro${LINUX_DIST_SUFFIX:S/-/_/}_FILE}
allegro_PORT=		${PORTSDIR}/devel/linux${LINUX_DIST_SUFFIX}-allegro
allegro_DEPENDS=	xorglibs

alsalib_FILE=		${LINUXBASE}/lib/libasound.so.2.0.0
alsalib_f8_FILE=	${alsalib_FILE}
alsalib_DETECT=		${alsalib${LINUX_DIST_SUFFIX:S/-/_/}_FILE}
alsalib_PORT=		${PORTSDIR}/audio/linux${LINUX_DIST_SUFFIX}-alsa-lib

arts_FILE=			${LINUXBASE}/usr/lib/libartsc.so.0
arts_f8_FILE=		${arts_FILE}
arts_DETECT=		${arts${LINUX_DIST_SUFFIX:S/-/_/}_FILE}
arts_PORT=			${PORTSDIR}/audio/linux${LINUX_DIST_SUFFIX}-arts

aspell_FILE=		${LINUXBASE}/usr/lib/libaspell.so.15.0.2
aspell_f8_FILE=		${LINUXBASE}/usr/lib/libaspell.so.15.1.4
aspell_DETECT=		${aspell${LINUX_DIST_SUFFIX:S/-/_/}_FILE}
aspell_PORT=		${PORTSDIR}/textproc/linux${LINUX_DIST_SUFFIX}-aspell

atk_FILE=			${LINUXBASE}/usr/lib/libatk-1.0.so.0.901.0
atk_f8_FILE=		${LINUXBASE}/usr/lib/libatk-1.0.so.0.2009.1
atk_DETECT=			${atk${LINUX_DIST_SUFFIX:S/-/_/}_FILE}
atk_PORT=			${PORTSDIR}/accessibility/linux${LINUX_DIST_SUFFIX}-atk

cairo_FILE=			${LINUXBASE}/usr/lib/libcairo.so.2.2.3
cairo_f8_FILE=		${LINUXBASE}/usr/lib/libcairo.so.2.11.7
cairo_DETECT=		${cairo${LINUX_DIST_SUFFIX:S/-/_/}_FILE}
cairo_PORT=			${PORTSDIR}/graphics/linux${LINUX_DIST_SUFFIX}-cairo
cairo_DEPENDS=		fontconfig png xorglibs

curl_FILE=		${LINUXBASE}/usr/lib/libcurl.so.3.0.0
curl_f8_FILE=		${LINUXBASE}/usr/lib/libcurl.so.4.1.0
curl_DETECT=		${curl${LINUX_DIST_SUFFIX:S/-/_/}_FILE}
curl_PORT=		${PORTSDIR}/ftp/linux${LINUX_DIST_SUFFIX}-curl

esound_FILE=		${LINUXBASE}/usr/lib/libesd.so.0.2.36
esound_f8_FILE=		${LINUXBASE}/usr/lib/libesd.so.0.2.38
esound_DETECT=		${esound${LINUX_DIST_SUFFIX:S/-/_/}_FILE}
esound_PORT=		${PORTSDIR}/audio/linux${LINUX_DIST_SUFFIX}-esound
esound_DEPENDS=		libaudiofile

expat_FILE=			${LINUXBASE}/usr/lib/libexpat.so.0
expat_f8_FILE=		${LINUXBASE}/lib/libexpat.so.1
expat_DETECT=		${expat${LINUX_DIST_SUFFIX:S/-/_/}_FILE}
expat_PORT=			${PORTSDIR}/textproc/linux${LINUX_DIST_SUFFIX}-expat

fontconfig_FILE=	${LINUXBASE}/usr/lib/libfontconfig.so.1
fontconfig_f8_FILE=	${LINUXBASE}/usr/lib/libfontconfig.so.1.2.0
fontconfig_DETECT=	${fontconfig${LINUX_DIST_SUFFIX:S/-/_/}_FILE}
fontconfig_PORT=	${PORTSDIR}/x11-fonts/linux${LINUX_DIST_SUFFIX}-fontconfig
fontconfig_DEPENDS=	expat

freealut_FILE=		${LINUXBASE}/usr/lib/libalut.so.0.1.0
freealut_f8_FILE=	${freealut_FILE}
freealut_DETECT=	${freealut${LINUX_DIST_SUFFIX:S/-/_/}_FILE}
freealut_PORT=		${PORTSDIR}/audio/linux${LINUX_DIST_SUFFIX}-freealut
freealut_DEPENDS=	openal

gdkpixbuf_FILE=		${LINUXBASE}/usr/lib/libgdk_pixbuf.so.2
gdkpixbuf_f8_FILE=	${gdkpixbuf_FILE}
gdkpixbuf_DETECT=	${gdkpixbuf${LINUX_DIST_SUFFIX:S/-/_/}_FILE}
gdkpixbuf_PORT=		${PORTSDIR}/graphics/linux${LINUX_DIST_SUFFIX}-gdk-pixbuf

gtk_FILE=			${LINUXBASE}/usr/lib/libgtk-1.2.so.0.9.1
gtk_f8_FILE=		${gtk_FILE}
gtk_DETECT=			${gtk${LINUX_DIST_SUFFIX:S/-/_/}_FILE}
gtk_PORT=			${PORTSDIR}/x11-toolkits/linux${LINUX_DIST_SUFFIX}-gtk
gtk_DEPENDS=		xorglibs

gtk2_FILE=			${LINUXBASE}/usr/lib/libgtk-x11-2.0.so.0.600.10
gtk2_f8_FILE=		${LINUXBASE}/usr/lib/libgtk-x11-2.0.so.0.1200.8
gtk2_DETECT=		${gtk2${LINUX_DIST_SUFFIX:S/-/_/}_FILE}
gtk2_PORT=			${PORTSDIR}/x11-toolkits/linux${LINUX_DIST_SUFFIX}-gtk2
gtk2_DEPENDS=		atk jpeg png pango tiff xorglibs

hicontheme_FILE=	${LINUXBASE}/usr/share/icons/hicolor
hicontheme_f8_FILE=	${hicontheme_FILE}
hicontheme_DETECT=	${hicontheme${LINUX_DIST_SUFFIX:S/-/_/}_FILE}
hicontheme_PORT=	${PORTSDIR}/x11-themes/linux${LINUX_DIST_SUFFIX}-hicolor-icon-theme

imlib_FILE=			${LINUXBASE}/usr/lib/libgdk_imlib.so.1.9.13
imlib_f8_FILE=		${LINUXBASE}/usr/lib/libgdk_imlib.so.1.9.15
imlib_DETECT=		${imlib${LINUX_DIST_SUFFIX:S/-/_/}_FILE}
imlib_PORT=			${PORTSDIR}/graphics/linux${LINUX_DIST_SUFFIX}-imlib

jpeg_FILE=			${LINUXBASE}/usr/lib/libjpeg.so.62.0.0
jpeg_f8_FILE=		${jpeg_FILE}
jpeg_DETECT=		${jpeg${LINUX_DIST_SUFFIX:S/-/_/}_FILE}
jpeg_PORT=			${PORTSDIR}/graphics/linux${LINUX_DIST_SUFFIX}-jpeg

libaudiofile_FILE=	${LINUXBASE}/usr/lib/libaudiofile.so.0.0.2
libaudiofile_f8_FILE=	${libaudiofile_FILE}
libaudiofile_DETECT=	${libaudiofile${LINUX_DIST_SUFFIX:S/-/_/}_FILE}
libaudiofile_PORT=	${PORTSDIR}/audio/linux${LINUX_DIST_SUFFIX}-libaudiofile

libg2c_FILE=		${LINUXBASE}/usr/lib/libg2c.so.0.0.0
libg2c_f8_FILE=		${libg2c_FILE}
libg2c_DETECT=		${libg2c${LINUX_DIST_SUFFIX:S/-/_/}_FILE}
libg2c_PORT=		${PORTSDIR}/lang/linux${LINUX_DIST_SUFFIX}-libg2c

libglade_FILE=		${LINUXBASE}/usr/lib/libglade.so.0.4.2
libglade_f8_FILE=	${libglade_FILE}
libglade_DETECT=	${libglade${LINUX_DIST_SUFFIX:S/-/_/}_FILE}
libglade_PORT=		${PORTSDIR}/devel/linux${LINUX_DIST_SUFFIX}-libglade

libglade2_FILE=		${LINUXBASE}/usr/lib/libglade-2.0.so.0.0.7
libglade2_f8_FILE=	${libglade2_FILE}
libglade2_DETECT=	${libglade2${LINUX_DIST_SUFFIX:S/-/_/}_FILE}
libglade2_PORT=		${PORTSDIR}/devel/linux${LINUX_DIST_SUFFIX}-libglade2

libglu_FILE=		${LINUXBASE}/usr/X11R6/lib/libGLU.so.1.3
libglu_f8_FILE=		${LINUXBASE}/usr/lib/libGLU.so.1.3.070002
libglu_DETECT=		${libglu${LINUX_DIST_SUFFIX:S/-/_/}_FILE}
libglu_PORT=		${PORTSDIR}/graphics/linux${LINUX_DIST_SUFFIX}-libGLU

libmng_FILE=		${LINUXBASE}/usr/lib/libmng.so.1.0.0
libmng_f8_FILE=		${libmng_FILE}
libmng_DETECT=		${libmng${LINUX_DIST_SUFFIX:S/-/_/}_FILE}
libmng_PORT=		${PORTSDIR}/graphics/linux${LINUX_DIST_SUFFIX}-libmng
libmng_DEPENDS=		jpeg

libogg_FILE=		${LINUXBASE}/usr/lib/libogg.so.0.5.2
libogg_f8_FILE=		${LINUXBASE}/usr/lib/libogg.so.0.5.3
libogg_DETECT=		${libogg${LINUX_DIST_SUFFIX:S/-/_/}_FILE}
libogg_PORT=		${PORTSDIR}/audio/linux${LINUX_DIST_SUFFIX}-libogg

libsigcpp20_FILE=	${LINUXBASE}/usr/lib/libsigc-2.0.so.0
libsigcpp20_f8_FILE=	${libsigcpp20_FILE}
libsigcpp20_DETECT=	${libsigcpp20${LINUX_DIST_SUFFIX:S/-/_/}_FILE}
libsigcpp20_PORT=	${PORTSDIR}/devel/linux${LINUX_DIST_SUFFIX}-libsigc++20

libtheora_FILE=		${LINUXBASE}/usr/lib/libtheora.so.0.1.0
libtheora_f8_FILE=	${LINUXBASE}/usr/lib/libtheora.so.0.3.2
libtheora_DETECT=	${libtheora${LINUX_DIST_SUFFIX:S/-/_/}_FILE}
libtheora_PORT=		${PORTSDIR}/multimedia/linux${LINUX_DIST_SUFFIX}-libtheora

libvorbis_FILE=		${LINUXBASE}/usr/lib/libvorbis.so.0.3.0
libvorbis_f8_FILE=	${LINUXBASE}/usr/lib/libvorbis.so.0.4.0
libvorbis_DETECT=	${libvorbis${LINUX_DIST_SUFFIX:S/-/_/}_FILE}
libvorbis_PORT=		${PORTSDIR}/audio/linux${LINUX_DIST_SUFFIX}-libvorbis
libvorbis_DEPENDS=	libogg

libxml_FILE=		${LINUXBASE}/usr/lib/libxml.so.1.8.17
libxml_f8_FILE=		${libxml_FILE}
libxml_DETECT=		${libxml${LINUX_DIST_SUFFIX:S/-/_/}_FILE}
libxml_PORT=		${PORTSDIR}/textproc/linux${LINUX_DIST_SUFFIX}-libxml

libxml2_FILE=		${LINUXBASE}/usr/lib/libxml2.so.2.6.19
libxml2_f8_FILE=	${LINUXBASE}/usr/lib/libxml2.so.2.6.31
libxml2_DETECT=		${libxml2${LINUX_DIST_SUFFIX:S/-/_/}_FILE}
libxml2_PORT=		${PORTSDIR}/textproc/linux${LINUX_DIST_SUFFIX}-libxml2

mikmod_FILE=		${LINUXBASE}/usr/lib/libmikmod.so.2.0.4
mikmod_f8_FILE=		${mikmod_FILE}
mikmod_DETECT=		${mikmod${LINUX_DIST_SUFFIX:S/-/_/}_FILE}
mikmod_PORT=		${PORTSDIR}/audio/linux${LINUX_DIST_SUFFIX}-mikmod

# didn't find an openmotif distro for Fedora 8, so use the same version for now
openmotif_FILE=		${LINUXBASE}/usr/X11R6/lib/libXm.so.3.0.3
openmotif_f8_FILE=	${openmotif_FILE}
openmotif_DETECT=	${openmotif${LINUX_DIST_SUFFIX:S/-/_/}_FILE}
openmotif_PORT=		${PORTSDIR}/x11-toolkits/linux${LINUX_DIST_SUFFIX}-openmotif
openmotif_DEPENDS=	xorglibs

openal_FILE=		${LINUXBASE}/usr/lib/libopenal.so.0.0.0
openal_f8_FILE=		${openal_FILE}
openal_DETECT=		${openal${LINUX_DIST_SUFFIX:S/-/_/}_FILE}
openal_PORT=		${PORTSDIR}/audio/linux${LINUX_DIST_SUFFIX}-openal
openal_DEPENDS=		alsalib arts esound libaudiofile libvorbis sdl12

openssl_FILE=		${LINUXBASE}/lib/libssl.so.0.9.7f
openssl_f8_FILE=	${LINUXBASE}/lib/libssl.so.0.9.8b
openssl_DETECT=		${openssl${LINUX_DIST_SUFFIX:S/-/_/}_FILE}
openssl_PORT=		${PORTSDIR}/security/linux${LINUX_DIST_SUFFIX}-openssl

pango_FILE=			${LINUXBASE}/usr/lib/libpango-1.0.so.0.1001.1
pango_f8_FILE=		${LINUXBASE}/usr/lib/libpango-1.0.so.0.1800.4
pango_DETECT=		${pango${LINUX_DIST_SUFFIX:S/-/_/}_FILE}
pango_PORT=			${PORTSDIR}/x11-toolkits/linux${LINUX_DIST_SUFFIX}-pango
pango_DEPENDS=		cairo expat fontconfig xorglibs

png_FILE=			${LINUXBASE}/usr/lib/libpng.so.3.1.2.8
png_f8_FILE=		${LINUXBASE}/usr/lib/libpng.so.3.22.0
png_DETECT=			${png${LINUX_DIST_SUFFIX:S/-/_/}_FILE}
png_PORT=			${PORTSDIR}/graphics/linux${LINUX_DIST_SUFFIX}-png

png10_FILE=			${LINUXBASE}/usr/lib/libpng.so.2.1.0.18
png10_f8_FILE=		${LINUXBASE}/usr/lib/libpng.so.2.1.0.30
png10_DETECT=		${png10${LINUX_DIST_SUFFIX:S/-/_/}_FILE}
png10_PORT=			${PORTSDIR}/graphics/linux${LINUX_DIST_SUFFIX}-png10

qt33_FILE=			${LINUXBASE}/usr/lib/qt-3.3/lib/libqt-mt.so.3.3.4
qt33_f8_FILE=		${LINUXBASE}/usr/lib/qt-3.3/lib/libqt-mt.so.3.3.8
qt33_DETECT=		${qt33${LINUX_DIST_SUFFIX:S/-/_/}_FILE}
qt33_PORT=			${PORTSDIR}/x11-toolkits/linux${LINUX_DIST_SUFFIX}-qt33
qt33_DEPENDS=		fontconfig libmng png

sdl12_FILE=		${LINUXBASE}/usr/lib/libSDL-1.2.so.0.7.3
sdl12_f8_FILE=		${LINUXBASE}/usr/lib/libSDL-1.2.so.0.11.2
sdl12_DETECT=		${sdl12${LINUX_DIST_SUFFIX:S/-/_/}_FILE}
sdl12_PORT=			${PORTSDIR}/devel/linux${LINUX_DIST_SUFFIX}-sdl12
sdl12_DEPENDS=		xorglibs

sdlimage_FILE=		${LINUXBASE}/usr/lib/libSDL_image-1.2.so.0.1.4
sdlimage_f8_FILE=	${LINUXBASE}/usr/lib/libSDL_image-1.2.so.0.1.5
sdlimage_DETECT=	${sdlimage${LINUX_DIST_SUFFIX:S/-/_/}_FILE}
sdlimage_PORT=		${PORTSDIR}/graphics/linux${LINUX_DIST_SUFFIX}-sdl_image
sdlimage_DEPENDS=	sdl12

sdlmixer_FILE=		${LINUXBASE}/usr/lib/libSDL_mixer-1.2.so.0.2.4
sdlmixer_f8_FILE=	${LINUXBASE}/usr/lib/libSDL_mixer-1.2.so.0.2.6
sdlmixer_DETECT=	${sdlmixer${LINUX_DIST_SUFFIX:S/-/_/}_FILE}
sdlmixer_PORT=		${PORTSDIR}/audio/linux${LINUX_DIST_SUFFIX}-sdl_mixer
sdlmixer_DEPENDS=	sdl12

scimgtk_FILE=		${LINUXBASE}/usr/lib/gtk-2.0/immodules/im-scim.so
scimgtk_f8_FILE=	${scimgtk_FILE}
scimgtk_DETECT=		${scimgtk${LINUX_DIST_SUFFIX:S/-/_/}_FILE}
scimgtk_PORT=		${PORTSDIR}/textproc/linux${LINUX_DIST_SUFFIX}-scim-gtk
scimgtk_DEPENDS=	gtk2 scimlibs

scimlibs_FILE=		${LINUXBASE}/usr/lib/libscim-1.0.so.8
scimlibs_f8_FILE=	${LINUXBASE}/usr/lib/libscim-1.0.so.8
scimlibs_DETECT=	${scimlibs${LINUX_DIST_SUFFIX:S/-/_/}_FILE}
scimlibs_PORT=		${PORTSDIR}/textproc/linux${LINUX_DIST_SUFFIX}-scim-libs
scimlibs_DEPENDS=	gtk2

tiff_FILE=			${LINUXBASE}/usr/lib/libtiff.so.3.7.1
tiff_f8_FILE=		${LINUXBASE}/usr/lib/libtiff.so.3.8.2
tiff_DETECT=		${tiff${LINUX_DIST_SUFFIX:S/-/_/}_FILE}
tiff_PORT=			${PORTSDIR}/graphics/linux${LINUX_DIST_SUFFIX}-tiff
tiff_DEPENDS=		jpeg

xorglibs_FILE=		${LINUXBASE}/usr/X11R6/lib/libXrandr.so.2.0
xorglibs_f8_FILE=	${LINUXBASE}/usr/lib/libXrandr.so.2.1.0
xorglibs_DETECT=	${xorglibs${LINUX_DIST_SUFFIX:S/-/_/}_FILE}
xorglibs_PORT=		${PORTSDIR}/x11/linux${LINUX_DIST_SUFFIX}-xorg-libs
xorglibs_DEPENDS=	fontconfig

ucl_FILE=		${LINUXBASE}/usr/lib/libucl.so.1
ucl_f8_FILE=		${ucl_FILE}
ucl_DETECT=		${ucl${LINUX_DIST_SUFFIX:S/-/_/}_FILE}
ucl_PORT=		${PORTSDIR}/archivers/linux${LINUX_DIST_SUFFIX}-ucl

ungif_FILE=			${LINUXBASE}/usr/lib/libgif.so.4.1.3
ungif_f8_FILE=		${ungif_FILE}
ungif_DETECT=		${ungif${LINUX_DIST_SUFFIX:S/-/_/}_FILE}
ungif_PORT=			${PORTSDIR}/graphics/linux${LINUX_DIST_SUFFIX}-ungif

upx_FILE=			${LINUXBASE}/usr/bin/upx
upx_f8_FILE=		${upx_FILE}
upx_DETECT=			${upx${LINUX_DIST_SUFFIX:S/-/_/}_FILE}
upx_PORT=			${PORTSDIR}/archivers/linux${LINUX_DIST_SUFFIX}-upx
upx_DEPENDS=		ucl

# use the same wabauth for now
webauth_FILE=		${LOCALBASE}/bin/linux-nvu
webauth_f8_FILE=	${webauth_FILE}
webauth_DETECT=		${webauth${LINUX_DIST_SUFFIX:S/-/_/}_FILE}
webauth_PORT=		${PORTSDIR}/www/linux-${WEB_AUTH}
webauth_DEPENDS=	gtk2 atk pango fontconfig

# End component definition section

# Let's check if components from USE_LINUX_APPS exist at _LINUX_APPS_ALL
.  for component in ${USE_LINUX_APPS}
.    if ${_LINUX_APPS_ALL:M${component}}==""
IGNORE=	bsd.linux-apps.mk test failed: Invalid component USE_LINUX_APPS=${component}
.    endif
.  endfor

# Let's check if components from USE_LINUX_APPS have corresponding <app>_DETECT
# i.e. if a corresponding <app>_FILE defined for given LINUX_DIST_SUFFIX
.  for component in ${USE_LINUX_APPS}
.    if ${${component}_DETECT}==""
.      if defined(${component}${LINUX_DIST_SUFFIX:S/-/_/}_FILE)
IGNORE=	bsd.linux-apps.mk test failed: The component ${component} is empty for LINUX_DIST_SUFFIX=${LINUX_DIST_SUFFIX} (the corresponding variable ${component}${LINUX_DIST_SUFFIX:S/-/_/}_FILE is empty)
.      else
IGNORE=	bsd.linux-apps.mk test failed: The component ${component} is not defined for LINUX_DIST_SUFFIX=${LINUX_DIST_SUFFIX} (the corresponding variable ${component}${LINUX_DIST_SUFFIX:S/-/_/}_FILE is not defined)
.      endif
.    endif
.  endfor

# Recursively expand all dependencies for each app at _LINUX_APPS_ALL
.  for component in ${_LINUX_APPS_ALL}
.    for subcomponent in ${${component}_DEPENDS}
${component}_DEPENDS+=${${subcomponent}_DEPENDS}
.    endfor
.  endfor

# Use just expanded dependencies (<app>_DEPENDS) to expand USE_LINUX_APPS
.  for component in ${USE_LINUX_APPS}
_USE_LINUX_APPS+=${${component}_DEPENDS} ${component}
.  endfor

# Set dependencies for _USE_LINUX_APPS which exists at _LINUX_APPS_ALL
.  for component in ${_LINUX_APPS_ALL}
.    if ${_USE_LINUX_APPS:M${component}}!=""
RUN_DEPENDS+=   ${${component}_DETECT}:${${component}_PORT}
.    endif
.  endfor
.endif