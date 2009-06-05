From: Benjamin Herrenschmidt <benh@kernel.crashing.org>
Subject: Re: [BUILD FAILURE 01/04] Next June 04:PPC64 randconfig
 [drivers/staging/comedi/drivers.o]
Date: Sat, 06 Jun 2009 09:32:29 +1000
Message-ID: <1244244749.31984.16.camel@pasglop>
References: <20090605182625.24093.7808.sendpatchset@elm3a191.beaverton.ibm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-next-owner@vger.kernel.org>
Received: from gate.crashing.org ([63.228.1.57]:55244 "EHLO gate.crashing.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752399AbZFEXdZ (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Fri, 5 Jun 2009 19:33:25 -0400
In-Reply-To: <20090605182625.24093.7808.sendpatchset@elm3a191.beaverton.ibm.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Subrata Modak <subrata@linux.vnet.ibm.com>
Cc: Paul Mackerras <paulus@samba.org>, Greg KH <greg@kroah.com>, Sachin P Sant <sachinp@linux.vnet.ibm.com>, Linux-Kernel <linux-kernel@vger.kernel.org>, Linux-Next <linux-next@vger.kernel.org>, Geert Uytterhoeven <Geert.Uytterhoeven@sonycom.com>, Stephen Rothwell <sfr@canb.auug.org.au>, Geert Uytterhoeven <geert@linux-m68k.org>, Linuxppc-dev <Linuxppc-dev@ozlabs.org>, Michael Ellerman <michael@ellerman.id.au>


> I tried this. But, with some catch. =E2=80=98PAGE_KERNEL_NOCACHE=E2=80=
=99 seems to be the
> choice for majority of architectures like frv, m32r, sh, x86, etc, as=
 Geert
> mentions below. However, i believe POWERPC defines it as =E2=80=98PAG=
E_KERNEL_NC=E2=80=98
> found at arch/powerpc/include/asm/pte-common.h.
>=20
> Paul/Banjamin,
> Can you please confirm this ?

Read my reply to Greg. Why the heck are you trying to map memory
non-cacheable in the first place ?

Cheers
Ben.

> The below patch fixes the build error.
>=20
> Signed-off-by: Subrata Modak <subrata@linux.vnet.ibm.com>
> ---
>=20
> --- linux-2.6.30-rc8/drivers/staging/comedi/drivers.c.orig	2009-06-05=
 12:46:35.000000000 -0500
> +++ linux-2.6.30-rc8/drivers/staging/comedi/drivers.c	2009-06-05 13:0=
3:31.000000000 -0500
> @@ -43,9 +43,13 @@
>  #include <linux/vmalloc.h>
>  #include <linux/cdev.h>
>  #include <linux/dma-mapping.h>
> -
>  #include <asm/io.h>
>  #include <asm/system.h>
> +#ifdef __powerpc64__
> +#include <asm/pte-common.h>
> +#else
> +#include <asm/pgtable.h>
> +#endif
> =20
>  static int postconfig(struct comedi_device *dev);
>  static int insn_rw_emulate_bits(struct comedi_device *dev, struct co=
medi_subdevice *s,
> @@ -492,8 +496,13 @@ int comedi_buf_alloc(struct comedi_devic
>  		}
>  		if (i =3D=3D n_pages) {
>  			async->prealloc_buf =3D
> +#ifdef __powerpc64__
> +				vmap(pages, n_pages, VM_MAP,
> +				PAGE_KERNEL_NC);
> +#else
>  				vmap(pages, n_pages, VM_MAP,
>  				PAGE_KERNEL_NOCACHE);
> +#endif
>  		}
>  		if (pages) {
>  			vfree(pages);
>=20
> ---
> Regards--
> Subrata
>=20
> > PAGE_KERNEL_NOCACHE is defined on a few architectures only, namely
> > frv, m32r, mn10300, sh, and x86[*]. On all others, it will fail.
> >=20
> > [*] Interestingly, sparc refers to it in one of its include files,
> > without providing a
> >     definition, Probably that code is unused.
> >=20
> > Gr{oetje,eeting}s,
> >=20
> > 						Geert
> >=20
> > --
> > Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@li=
nux-m68k.org
> >=20
