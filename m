From: Bartlomiej Zolnierkiewicz <bzolnier@gmail.com>
Subject: Re: [BUILD FAILURE 05/12] Next April 21 : PPC64 randconfig [drivers/macintosh/mediabay.o]
Date: Tue, 21 Apr 2009 21:04:14 +0200
Message-ID: <200904212104.14665.bzolnier@gmail.com>
References: <1240339875.9110.137.camel@subratamodak.linux.ibm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-fx0-f158.google.com ([209.85.220.158]:39522 "EHLO
	mail-fx0-f158.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752074AbZDUTAx convert rfc822-to-8bit (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 21 Apr 2009 15:00:53 -0400
In-Reply-To: <1240339875.9110.137.camel@subratamodak.linux.ibm.com>
Content-Disposition: inline
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: subrata@linux.vnet.ibm.com
Cc: Linuxppc-dev <Linuxppc-dev@ozlabs.org>, Paul Mackerras <paulus@samba.org>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, Stefan Bader <stefan.bader@canonical.com>, Marcelo Tosatti <marcelo@conectiva.com.br>, Adrian Bunk <bunk@kernel.org>, Stephen Rothwell <sfr@canb.auug.org.au>, linux-next <linux-next@vger.kernel.org>, sachinp <sachinp@linux.vnet.ibm.com>, linux-kernel <linux-kernel@vger.kernel.org>, Alexander Beregalov <a.beregalov@gmail.com>

On Tuesday 21 April 2009 20:51:15 Subrata Modak wrote:
> Reported this earlier on 14th April:
> http://lkml.org/lkml/2009/4/14/490,
>=20
> Is there a solution available ?

Perfect timing.  I was just going through overdue reports.

> CC      drivers/macintosh/mediabay.o
> In file included from drivers/macintosh/mediabay.c:21:
> include/linux/ide.h:610: error: field =E2=80=98sense_rq=E2=80=99 has =
incomplete type
> make[2]: *** [drivers/macintosh/mediabay.o] Error 1
> make[1]: *** [drivers/macintosh] Error 2
> make: *** [drivers] Error 2
> ---

=46rom: Bartlomiej Zolnierkiewicz <bzolnier@gmail.com>
Subject: [PATCH] mediabay: fix build for CONFIG_BLOCK=3Dn

On Tuesday 14 April 2009 20:31:21 Subrata Modak wrote:
> Observed the following build error:
> ---
> CC      drivers/macintosh/mediabay.o
> In file included from drivers/macintosh/mediabay.c:21:
> include/linux/ide.h:605: error: field =E2=80=98request_sense_rq=E2=80=
=99 has incomplete
> type
> make[2]: *** [drivers/macintosh/mediabay.o] Error 1
> make[1]: *** [drivers/macintosh] Error 2
> make: *** [drivers] Error 2
> ---

mediabay shouldn't include <linux/ide.h> unconditionally so
remove the superfluous include from mediabay.c (<asm/mediabay.h>
will pull <linux/ide.h> in for CONFIG_BLK_DEV_IDE_PMAC=3Dy).

Reported-by: Subrata Modak <subrata@linux.vnet.ibm.com>
Cc: Paul Mackerras <paulus@samba.org>
Signed-off-by: Bartlomiej Zolnierkiewicz <bzolnier@gmail.com>
---
 drivers/macintosh/mediabay.c |    1 -
 1 file changed, 1 deletion(-)

Index: b/drivers/macintosh/mediabay.c
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
--- a/drivers/macintosh/mediabay.c
+++ b/drivers/macintosh/mediabay.c
@@ -18,7 +18,6 @@
 #include <linux/timer.h>
 #include <linux/stddef.h>
 #include <linux/init.h>
-#include <linux/ide.h>
 #include <linux/kthread.h>
 #include <linux/mutex.h>
 #include <asm/prom.h>
