From: Geert Uytterhoeven <Geert.Uytterhoeven@sonycom.com>
Subject: Re: [BUILD FAILURE 09/12] Next April 21 : PPC64 randconfig
 [drivers/staging/comedi/drivers.o]
Date: Wed, 22 Apr 2009 09:43:31 +0200 (CEST)
Message-ID: <alpine.LRH.2.00.0904220942430.6852@vixen.sonytel.be>
References: <1240340029.9110.142.camel@subratamodak.linux.ibm.com> <1240358910.6571.6.camel@localhost>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-next-owner@vger.kernel.org>
Received: from vervifontaine.sonytel.be ([80.88.33.193]:40296 "EHLO
	pophost.sonytel.be" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
	with ESMTP id S1751512AbZDVHnf (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 22 Apr 2009 03:43:35 -0400
In-Reply-To: <1240358910.6571.6.camel@localhost>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Michael Ellerman <michael@ellerman.id.au>
Cc: subrata@linux.vnet.ibm.com, sachinp <sachinp@linux.vnet.ibm.com>, Stephen Rothwell <sfr@canb.auug.org.au>, Greg KH <greg@kroah.com>, "David A. Schleef" <ds@schleef.org>, linux-kernel <linux-kernel@vger.kernel.org>, Linuxppc-dev <Linuxppc-dev@ozlabs.org>, linux-next <linux-next@vger.kernel.org>, Alexander Beregalov <a.beregalov@gmail.com>

On Wed, 22 Apr 2009, Michael Ellerman wrote:
> On Wed, 2009-04-22 at 00:23 +0530, Subrata Modak wrote:
> > Reported this error on 14th April:
> > http://lkml.org/lkml/2009/4/14/488,
> >=20
> > CC [M]  drivers/staging/comedi/drivers.o=20
> > drivers/staging/comedi/drivers.c: In function =E2=80=98comedi_buf_a=
lloc=E2=80=99:
> > drivers/staging/comedi/drivers.c:496: error: =E2=80=98PAGE_KERNEL_N=
OCACHE=E2=80=99
> > undeclared (first use in this function)
> > drivers/staging/comedi/drivers.c:496: error: (Each undeclared ident=
ifier
> > is reported only once
> > drivers/staging/comedi/drivers.c:496: error: for each function it
> > appears in.)
> > make[3]: *** [drivers/staging/comedi/drivers.o] Error 1
> > make[2]: *** [drivers/staging/comedi] Error 2
> > make[1]: *** [drivers/staging] Error 2
> > make: *** [drivers] Error 2
>=20
> Subrata, unless someone says otherwise, please do not send randconfig
> failures for drivers in staging - those drivers have bigger problems
> than randconfig failures.

Indeed, in particular this one http://lkml.org/lkml/2009/3/9/349.

> To avoid them, do this:
>=20
> # make randconfig
> # sed -i -e 's/^\(CONFIG_STAGING\)=3Dy/# \1 is not set/' .config
                                       ^^^^^^^^^^^^^^^
Recently I discovered that `n' actually works, too!

> # make oldconfig

With kind regards,

Geert Uytterhoeven
Software Architect
Techsoft Centre

Technology and Software Centre Europe
The Corporate Village =C2=B7 Da Vincilaan 7-D1 =C2=B7 B-1935 Zaventem =C2=
=B7 Belgium

Phone:    +32 (0)2 700 8453
=46ax:      +32 (0)2 700 8622
E-mail:   Geert.Uytterhoeven@sonycom.com
Internet: http://www.sony-europe.com/

A division of Sony Europe (Belgium) N.V.
VAT BE 0413.825.160 =C2=B7 RPR Brussels
=46ortis =C2=B7 BIC GEBABEBB =C2=B7 IBAN BE41293037680010
