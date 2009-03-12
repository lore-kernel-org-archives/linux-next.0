From: Geert Uytterhoeven <Geert.Uytterhoeven@sonycom.com>
Subject: Re: linux-next: block/proc tree build failure
Date: Thu, 12 Mar 2009 14:21:22 +0100 (CET)
Message-ID: <alpine.LRH.2.00.0903121421040.25257@vixen.sonytel.be>
References: <20090311224418.f1a7cb5f.sfr@canb.auug.org.au> <20090311233026.GA2134@x200.localdomain>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=ISO-8859-15
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-next-owner@vger.kernel.org>
Received: from vervifontaine.sonytel.be ([80.88.33.193]:51735 "EHLO
	vervifontaine.sonycom.com" rhost-flags-OK-OK-OK-FAIL)
	by vger.kernel.org with ESMTP id S1755442AbZCLNV0 (ORCPT
	<rfc822;linux-next@vger.kernel.org>);
	Thu, 12 Mar 2009 09:21:26 -0400
In-Reply-To: <20090311233026.GA2134@x200.localdomain>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Alexey Dobriyan <adobriyan@gmail.com>
Cc: Jens Axboe <jens.axboe@oracle.com>, linux-next@vger.kernel.org, Stephen Rothwell <sfr@canb.auug.org.au>

On Thu, 12 Mar 2009, Alexey Dobriyan wrote:
> On Wed, Mar 11, 2009 at 10:44:18PM +1100, Stephen Rothwell wrote:
> > --- a/drivers/block/ps3vram.c
> > +++ b/drivers/block/ps3vram.c
> > @@ -552,7 +552,6 @@ static void __devinit ps3vram_proc_init(struct =
ps3_system_bus_device *dev)
> >  		return;
> >  	}
> > =20
> > -	pde->owner =3D THIS_MODULE;
> >  	pde->data =3D priv;
>=20
> Geert, driver should use proc_create_data() as well, and ->owner wasn=
't
> necessary in the first place.

Thanks! So here's a replacement patch:

commit 077f72d323360f112aaf41a75307dc2a284176a7
Author: Geert Uytterhoeven <Geert.Uytterhoeven@sonycom.com>
Date:   Thu Mar 12 14:19:12 2009 +0100

    ps3vram: Use proc_create_data() instead of proc_create()
   =20
    Use proc_create_data() to avoid race conditions, and kill the unnec=
essary
    setting of ->owner (this field is already gone in linux-next)
   =20
    Reported-by: Alexey Dobriyan <adobriyan@gmail.com>
    Signed-off-by: Geert Uytterhoeven <Geert.Uytterhoeven@sonycom.com>

diff --git a/drivers/block/ps3vram.c b/drivers/block/ps3vram.c
index 271f137..6e73868 100644
--- a/drivers/block/ps3vram.c
+++ b/drivers/block/ps3vram.c
@@ -546,14 +546,10 @@ static void __devinit ps3vram_proc_init(struct ps=
3_system_bus_device *dev)
 	struct ps3vram_priv *priv =3D dev->core.driver_data;
 	struct proc_dir_entry *pde;
=20
-	pde =3D proc_create(DEVICE_NAME, 0444, NULL, &ps3vram_proc_fops);
-	if (!pde) {
+	pde =3D proc_create_data(DEVICE_NAME, 0444, NULL, &ps3vram_proc_fops,
+			       priv);
+	if (!pde)
 		dev_warn(&dev->core, "failed to create /proc entry\n");
-		return;
-	}
-
-	pde->owner =3D THIS_MODULE;
-	pde->data =3D priv;
 }
=20
 static int ps3vram_make_request(struct request_queue *q, struct bio *b=
io)

With kind regards,

Geert Uytterhoeven
Software Architect

Sony Techsoft Centre Europe
The Corporate Village =B7 Da Vincilaan 7-D1 =B7 B-1935 Zaventem =B7 Bel=
gium

Phone:    +32 (0)2 700 8453
=46ax:      +32 (0)2 700 8622
E-mail:   Geert.Uytterhoeven@sonycom.com
Internet: http://www.sony-europe.com/

A division of Sony Europe (Belgium) N.V.
VAT BE 0413.825.160 =B7 RPR Brussels
=46ortis =B7 BIC GEBABEBB =B7 IBAN BE41293037680010
