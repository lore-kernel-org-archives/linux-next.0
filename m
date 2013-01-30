From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: [PATCH -next] staging: comedi: ISA DMA drivers should depend on ISA_DMA_API
Date: Wed, 30 Jan 2013 13:00:09 +0100
Message-ID: <1359547209-15712-1-git-send-email-geert@linux-m68k.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-next-owner@vger.kernel.org>
Received: from georges.telenet-ops.be ([195.130.137.68]:58032 "EHLO
	georges.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751029Ab3A3MAR (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 30 Jan 2013 07:00:17 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, H Hartley Sweeten <hsweeten@visionengravers.com>, Mori Hess <fmhess@users.sourceforge.net>
Cc: devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org, linux-next@vger.kernel.org, Geert Uytterhoeven <geert@linux-m68k.org>

m68k allmodconfig:

  CC [M]  drivers/staging/comedi/drivers/pcl812.o
drivers/staging/comedi/drivers/pcl812.c: In function =E2=80=98pcl812_ai=
_cmd=E2=80=99:
drivers/staging/comedi/drivers/pcl812.c:736: error: implicit declaratio=
n of function =E2=80=98set_dma_mode=E2=80=99
drivers/staging/comedi/drivers/pcl812.c:736: error: =E2=80=98DMA_MODE_R=
EAD=E2=80=99 undeclared (first use in this function)
drivers/staging/comedi/drivers/pcl812.c:736: error: (Each undeclared id=
entifier is reported only once
drivers/staging/comedi/drivers/pcl812.c:736: error: for each function i=
t appears in.)
drivers/staging/comedi/drivers/pcl812.c:737: error: implicit declaratio=
n of function =E2=80=98claim_dma_lock=E2=80=99
drivers/staging/comedi/drivers/pcl812.c:738: error: implicit declaratio=
n of function =E2=80=98clear_dma_ff=E2=80=99
drivers/staging/comedi/drivers/pcl812.c:739: error: implicit declaratio=
n of function =E2=80=98set_dma_addr=E2=80=99
drivers/staging/comedi/drivers/pcl812.c:740: error: implicit declaratio=
n of function =E2=80=98set_dma_count=E2=80=99
drivers/staging/comedi/drivers/pcl812.c:741: error: implicit declaratio=
n of function =E2=80=98release_dma_lock=E2=80=99
drivers/staging/comedi/drivers/pcl812.c:742: error: implicit declaratio=
n of function =E2=80=98enable_dma=E2=80=99
drivers/staging/comedi/drivers/pcl812.c: In function =E2=80=98interrupt=
_pcl812_ai_dma=E2=80=99:
drivers/staging/comedi/drivers/pcl812.c:883: error: implicit declaratio=
n of function =E2=80=98disable_dma=E2=80=99
drivers/staging/comedi/drivers/pcl812.c:884: error: =E2=80=98DMA_MODE_R=
EAD=E2=80=99 undeclared (first use in this function)
drivers/staging/comedi/drivers/pcl812.c: In function =E2=80=98pcl812_ai=
_poll=E2=80=99:
drivers/staging/comedi/drivers/pcl812.c:947: error: implicit declaratio=
n of function =E2=80=98get_dma_residue=E2=80=99
make[2]: *** [drivers/staging/comedi/drivers/pcl812.o] Error 1
  CC [M]  drivers/staging/comedi/drivers/pcl816.o
drivers/staging/comedi/drivers/pcl816.c: In function =E2=80=98interrupt=
_pcl816_ai_mode13_dma=E2=80=99:
drivers/staging/comedi/drivers/pcl816.c:359: error: implicit declaratio=
n of function =E2=80=98disable_dma=E2=80=99
drivers/staging/comedi/drivers/pcl816.c:366: error: implicit declaratio=
n of function =E2=80=98set_dma_mode=E2=80=99
drivers/staging/comedi/drivers/pcl816.c:366: error: =E2=80=98DMA_MODE_R=
EAD=E2=80=99 undeclared (first use in this function)
drivers/staging/comedi/drivers/pcl816.c:366: error: (Each undeclared id=
entifier is reported only once
drivers/staging/comedi/drivers/pcl816.c:366: error: for each function i=
t appears in.)
drivers/staging/comedi/drivers/pcl816.c:367: error: implicit declaratio=
n of function =E2=80=98claim_dma_lock=E2=80=99
drivers/staging/comedi/drivers/pcl816.c:369: error: implicit declaratio=
n of function =E2=80=98set_dma_addr=E2=80=99
drivers/staging/comedi/drivers/pcl816.c:372: error: implicit declaratio=
n of function =E2=80=98set_dma_count=E2=80=99
drivers/staging/comedi/drivers/pcl816.c:378: error: implicit declaratio=
n of function =E2=80=98release_dma_lock=E2=80=99
drivers/staging/comedi/drivers/pcl816.c:379: error: implicit declaratio=
n of function =E2=80=98enable_dma=E2=80=99
drivers/staging/comedi/drivers/pcl816.c: In function =E2=80=98pcl816_ai=
_cmd=E2=80=99:
drivers/staging/comedi/drivers/pcl816.c:629: error: =E2=80=98DMA_MODE_R=
EAD=E2=80=99 undeclared (first use in this function)
drivers/staging/comedi/drivers/pcl816.c:631: error: implicit declaratio=
n of function =E2=80=98clear_dma_ff=E2=80=99
drivers/staging/comedi/drivers/pcl816.c: In function =E2=80=98pcl816_ai=
_poll=E2=80=99:
drivers/staging/comedi/drivers/pcl816.c:679: error: implicit declaratio=
n of function =E2=80=98get_dma_residue=E2=80=99
make[2]: *** [drivers/staging/comedi/drivers/pcl816.o] Error 1
  CC [M]  drivers/staging/comedi/drivers/pcl818.o
drivers/staging/comedi/drivers/pcl818.c: In function =E2=80=98interrupt=
_pcl818_ai_mode13_dma=E2=80=99:
drivers/staging/comedi/drivers/pcl818.c:547: error: implicit declaratio=
n of function =E2=80=98disable_dma=E2=80=99
drivers/staging/comedi/drivers/pcl818.c:550: error: implicit declaratio=
n of function =E2=80=98set_dma_mode=E2=80=99
drivers/staging/comedi/drivers/pcl818.c:550: error: =E2=80=98DMA_MODE_R=
EAD=E2=80=99 undeclared (first use in this function)
drivers/staging/comedi/drivers/pcl818.c:550: error: (Each undeclared id=
entifier is reported only once
drivers/staging/comedi/drivers/pcl818.c:550: error: for each function i=
t appears in.)
drivers/staging/comedi/drivers/pcl818.c:551: error: implicit declaratio=
n of function =E2=80=98claim_dma_lock=E2=80=99
drivers/staging/comedi/drivers/pcl818.c:552: error: implicit declaratio=
n of function =E2=80=98set_dma_addr=E2=80=99
drivers/staging/comedi/drivers/pcl818.c:555: error: implicit declaratio=
n of function =E2=80=98set_dma_count=E2=80=99
drivers/staging/comedi/drivers/pcl818.c:561: error: implicit declaratio=
n of function =E2=80=98release_dma_lock=E2=80=99
drivers/staging/comedi/drivers/pcl818.c:562: error: implicit declaratio=
n of function =E2=80=98enable_dma=E2=80=99
drivers/staging/comedi/drivers/pcl818.c: In function =E2=80=98pcl818_ai=
_mode13dma_int=E2=80=99:
drivers/staging/comedi/drivers/pcl818.c:886: error: =E2=80=98DMA_MODE_R=
EAD=E2=80=99 undeclared (first use in this function)
drivers/staging/comedi/drivers/pcl818.c:888: error: implicit declaratio=
n of function =E2=80=98clear_dma_ff=E2=80=99
make[2]: *** [drivers/staging/comedi/drivers/pcl818.o] Error 1
  CC [M]  drivers/staging/comedi/drivers/das16.o
drivers/staging/comedi/drivers/das16.c: In function =E2=80=98das16_cmd_=
exec=E2=80=99:
drivers/staging/comedi/drivers/das16.c:644: error: implicit declaration=
 of function =E2=80=98claim_dma_lock=E2=80=99
drivers/staging/comedi/drivers/das16.c:645: error: implicit declaration=
 of function =E2=80=98disable_dma=E2=80=99
drivers/staging/comedi/drivers/das16.c:648: error: implicit declaration=
 of function =E2=80=98clear_dma_ff=E2=80=99
drivers/staging/comedi/drivers/das16.c:650: error: implicit declaration=
 of function =E2=80=98set_dma_addr=E2=80=99
drivers/staging/comedi/drivers/das16.c:654: error: implicit declaration=
 of function =E2=80=98set_dma_count=E2=80=99
drivers/staging/comedi/drivers/das16.c:655: error: implicit declaration=
 of function =E2=80=98enable_dma=E2=80=99
drivers/staging/comedi/drivers/das16.c:656: error: implicit declaration=
 of function =E2=80=98release_dma_lock=E2=80=99
drivers/staging/comedi/drivers/das16.c: In function =E2=80=98disable_dm=
a_on_even=E2=80=99:
drivers/staging/comedi/drivers/das16.c:845: error: implicit declaration=
 of function =E2=80=98get_dma_residue=E2=80=99
drivers/staging/comedi/drivers/das16.c: In function =E2=80=98das16_atta=
ch=E2=80=99:
drivers/staging/comedi/drivers/das16.c:1197: error: implicit declaratio=
n of function =E2=80=98set_dma_mode=E2=80=99
drivers/staging/comedi/drivers/das16.c:1197: error: =E2=80=98DMA_MODE_R=
EAD=E2=80=99 undeclared (first use in this function)
drivers/staging/comedi/drivers/das16.c:1197: error: (Each undeclared id=
entifier is reported only once
drivers/staging/comedi/drivers/das16.c:1197: error: for each function i=
t appears in.)
make[2]: *** [drivers/staging/comedi/drivers/das16.o] Error 1
  CC [M]  drivers/staging/comedi/drivers/das1800.o
drivers/staging/comedi/drivers/das1800.c: In function =E2=80=98das1800_=
flush_dma_channel=E2=80=99:
drivers/staging/comedi/drivers/das1800.c:555: error: implicit declarati=
on of function =E2=80=98disable_dma=E2=80=99
drivers/staging/comedi/drivers/das1800.c:559: error: implicit declarati=
on of function =E2=80=98clear_dma_ff=E2=80=99
drivers/staging/comedi/drivers/das1800.c:562: error: implicit declarati=
on of function =E2=80=98get_dma_residue=E2=80=99
drivers/staging/comedi/drivers/das1800.c: In function =E2=80=98das1800_=
flush_dma=E2=80=99:
drivers/staging/comedi/drivers/das1800.c:586: error: implicit declarati=
on of function =E2=80=98claim_dma_lock=E2=80=99
drivers/staging/comedi/drivers/das1800.c:603: error: implicit declarati=
on of function =E2=80=98release_dma_lock=E2=80=99
drivers/staging/comedi/drivers/das1800.c: In function =E2=80=98das1800_=
handle_dma=E2=80=99:
drivers/staging/comedi/drivers/das1800.c:622: error: implicit declarati=
on of function =E2=80=98set_dma_addr=E2=80=99
drivers/staging/comedi/drivers/das1800.c:624: error: implicit declarati=
on of function =E2=80=98set_dma_count=E2=80=99
drivers/staging/comedi/drivers/das1800.c:625: error: implicit declarati=
on of function =E2=80=98enable_dma=E2=80=99
drivers/staging/comedi/drivers/das1800.c: In function =E2=80=98das1800_=
init_dma=E2=80=99:
drivers/staging/comedi/drivers/das1800.c:1424: error: implicit declarat=
ion of function =E2=80=98set_dma_mode=E2=80=99
drivers/staging/comedi/drivers/das1800.c:1424: error: =E2=80=98DMA_MODE=
_READ=E2=80=99 undeclared (first use in this function)
drivers/staging/comedi/drivers/das1800.c:1424: error: (Each undeclared =
identifier is reported only once
drivers/staging/comedi/drivers/das1800.c:1424: error: for each function=
 it appears in.)
make[2]: *** [drivers/staging/comedi/drivers/das1800.o] Error 1
  CC [M]  drivers/staging/comedi/drivers/dt282x.o
drivers/staging/comedi/drivers/dt282x.c: In function =E2=80=98dt282x_ao=
_dma_interrupt=E2=80=99:
drivers/staging/comedi/drivers/dt282x.c:328: error: implicit declaratio=
n of function =E2=80=98disable_dma=E2=80=99
drivers/staging/comedi/drivers/dt282x.c: In function =E2=80=98prep_ai_d=
ma=E2=80=99:
drivers/staging/comedi/drivers/dt282x.c:416: error: implicit declaratio=
n of function =E2=80=98set_dma_mode=E2=80=99
drivers/staging/comedi/drivers/dt282x.c:416: error: =E2=80=98DMA_MODE_R=
EAD=E2=80=99 undeclared (first use in this function)
drivers/staging/comedi/drivers/dt282x.c:416: error: (Each undeclared id=
entifier is reported only once
drivers/staging/comedi/drivers/dt282x.c:416: error: for each function i=
t appears in.)
drivers/staging/comedi/drivers/dt282x.c:417: error: implicit declaratio=
n of function =E2=80=98claim_dma_lock=E2=80=99
drivers/staging/comedi/drivers/dt282x.c:418: error: implicit declaratio=
n of function =E2=80=98clear_dma_ff=E2=80=99
drivers/staging/comedi/drivers/dt282x.c:419: error: implicit declaratio=
n of function =E2=80=98set_dma_addr=E2=80=99
drivers/staging/comedi/drivers/dt282x.c:420: error: implicit declaratio=
n of function =E2=80=98set_dma_count=E2=80=99
drivers/staging/comedi/drivers/dt282x.c:421: error: implicit declaratio=
n of function =E2=80=98release_dma_lock=E2=80=99
drivers/staging/comedi/drivers/dt282x.c:423: error: implicit declaratio=
n of function =E2=80=98enable_dma=E2=80=99
drivers/staging/comedi/drivers/dt282x.c: In function =E2=80=98prep_ao_d=
ma=E2=80=99:
drivers/staging/comedi/drivers/dt282x.c:439: error: =E2=80=98DMA_MODE_W=
RITE=E2=80=99 undeclared (first use in this function)
drivers/staging/comedi/drivers/dt282x.c: In function =E2=80=98dt282x_in=
terrupt=E2=80=99:
drivers/staging/comedi/drivers/dt282x.c:471: error: =E2=80=98DMA_MODE_R=
EAD=E2=80=99 undeclared (first use in this function)
drivers/staging/comedi/drivers/dt282x.c: In function =E2=80=98dt282x_ai=
_cmd=E2=80=99:
drivers/staging/comedi/drivers/dt282x.c:690: error: =E2=80=98DMA_MODE_R=
EAD=E2=80=99 undeclared (first use in this function)
drivers/staging/comedi/drivers/dt282x.c: In function =E2=80=98dt282x_ao=
_cmd=E2=80=99:
drivers/staging/comedi/drivers/dt282x.c:938: error: =E2=80=98DMA_MODE_W=
RITE=E2=80=99 undeclared (first use in this function)
make[2]: *** [drivers/staging/comedi/drivers/dt282x.o] Error 1
  CC [M]  drivers/staging/comedi/drivers/ni_at_a2150.o
drivers/staging/comedi/drivers/ni_at_a2150.c: In function =E2=80=98a215=
0_interrupt=E2=80=99:
drivers/staging/comedi/drivers/ni_at_a2150.c:237: error: implicit decla=
ration of function =E2=80=98claim_dma_lock=E2=80=99
drivers/staging/comedi/drivers/ni_at_a2150.c:238: error: implicit decla=
ration of function =E2=80=98disable_dma=E2=80=99
drivers/staging/comedi/drivers/ni_at_a2150.c:241: error: implicit decla=
ration of function =E2=80=98clear_dma_ff=E2=80=99
drivers/staging/comedi/drivers/ni_at_a2150.c:249: error: implicit decla=
ration of function =E2=80=98get_dma_residue=E2=80=99
drivers/staging/comedi/drivers/ni_at_a2150.c:286: error: implicit decla=
ration of function =E2=80=98set_dma_addr=E2=80=99
drivers/staging/comedi/drivers/ni_at_a2150.c:287: error: implicit decla=
ration of function =E2=80=98set_dma_count=E2=80=99
drivers/staging/comedi/drivers/ni_at_a2150.c:288: error: implicit decla=
ration of function =E2=80=98enable_dma=E2=80=99
drivers/staging/comedi/drivers/ni_at_a2150.c:290: error: implicit decla=
ration of function =E2=80=98release_dma_lock=E2=80=99
drivers/staging/comedi/drivers/ni_at_a2150.c: In function =E2=80=98a215=
0_attach=E2=80=99:
drivers/staging/comedi/drivers/ni_at_a2150.c:794: error: implicit decla=
ration of function =E2=80=98set_dma_mode=E2=80=99
drivers/staging/comedi/drivers/ni_at_a2150.c:794: error: =E2=80=98DMA_M=
ODE_READ=E2=80=99 undeclared (first use in this function)
drivers/staging/comedi/drivers/ni_at_a2150.c:794: error: (Each undeclar=
ed identifier is reported only once
drivers/staging/comedi/drivers/ni_at_a2150.c:794: error: for each funct=
ion it appears in.)
make[2]: *** [drivers/staging/comedi/drivers/ni_at_a2150.o] Error 1

Make PCL816, PCL818, DAS16, DAS1800, DT282X, and NI_AT_A2150 depend on
ISA_DMA_API to fix this.

Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
---
http://kisskb.ellerman.id.au/kisskb/buildresult/8113432/

Seeing al these "new" ISA DMA drivers suddenly makes me see the m68k po=
rt
from a new perspective...

 drivers/staging/comedi/Kconfig |   13 +++++++------
 1 files changed, 7 insertions(+), 6 deletions(-)

diff --git a/drivers/staging/comedi/Kconfig b/drivers/staging/comedi/Kc=
onfig
index 4c80ac9..bb9acc9 100644
--- a/drivers/staging/comedi/Kconfig
+++ b/drivers/staging/comedi/Kconfig
@@ -164,7 +164,7 @@ config COMEDI_PCL730
=20
 config COMEDI_PCL812
 	tristate "Advantech PCL-812/813 and ADlink ACL-8112/8113/8113/8216"
-	depends on VIRT_TO_BUS
+	depends on VIRT_TO_BUS && ISA_DMA_API
 	---help---
 	  Enable support for Advantech PCL-812/PG, PCL-813/B, ADLink
 	  ACL-8112DG/HG/PG, ACL-8113, ACL-8216, ICP DAS A-821PGH/PGL/PGL-NDA,
@@ -175,7 +175,7 @@ config COMEDI_PCL812
=20
 config COMEDI_PCL816
 	tristate "Advantech PCL-814 and PCL-816 ISA card support"
-	depends on VIRT_TO_BUS
+	depends on VIRT_TO_BUS && ISA_DMA_API
 	---help---
 	  Enable support for Advantech PCL-814 and PCL-816 ISA cards
=20
@@ -184,7 +184,7 @@ config COMEDI_PCL816
=20
 config COMEDI_PCL818
 	tristate "Advantech PCL-718 and PCL-818 ISA card support"
-	depends on VIRT_TO_BUS
+	depends on VIRT_TO_BUS && ISA_DMA_API
 	---help---
 	  Enable support for Advantech PCL-818 ISA cards
 	  PCL-818L, PCL-818H, PCL-818HD, PCL-818HG, PCL-818 and PCL-718
@@ -278,6 +278,7 @@ config COMEDI_DAS08_ISA
=20
 config COMEDI_DAS16
 	tristate "DAS-16 compatible ISA and PC/104 card support"
+	depends on ISA_DMA_API
 	select COMEDI_8255
 	select COMEDI_FC
 	---help---
@@ -307,7 +308,7 @@ config COMEDI_DAS800
=20
 config COMEDI_DAS1800
 	tristate "DAS1800 and compatible ISA card support"
-	depends on VIRT_TO_BUS
+	depends on VIRT_TO_BUS && ISA_DMA_API
 	select COMEDI_FC
 	---help---
 	  Enable support for DAS1800 and compatible ISA cards
@@ -372,7 +373,7 @@ config COMEDI_DT2817
 config COMEDI_DT282X
 	tristate "Data Translation DT2821 series and DT-EZ ISA card support"
 	select COMEDI_FC
-	depends on VIRT_TO_BUS
+	depends on VIRT_TO_BUS && ISA_DMA_API
 	---help---
 	  Enable support for Data Translation DT2821 series including DT-EZ
 	  DT2821, DT2821-F-16SE, DT2821-F-8DI, DT2821-G-16SE, DT2821-G-8DI,
@@ -444,7 +445,7 @@ config COMEDI_ADQ12B
 config COMEDI_NI_AT_A2150
 	tristate "NI AT-A2150 ISA card support"
 	select COMEDI_FC
-	depends on VIRT_TO_BUS
+	depends on VIRT_TO_BUS && ISA_DMA_API
 	---help---
 	  Enable support for National Instruments AT-A2150 cards
=20
--=20
1.7.0.4
