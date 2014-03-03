From: Liviu Dudau <Liviu.Dudau@arm.com>
Subject: Re: linux-next: manual merge of the tip tree with the pci tree
Date: Mon, 3 Mar 2014 09:26:28 +0000
Message-ID: <20140303092628.GX1692@e106497-lin.cambridge.arm.com>
References: <20140303170335.7a4dd42c6e4f4b9034144a25@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-next-owner@vger.kernel.org>
Received: from service87.mimecast.com ([91.220.42.44]:45019 "EHLO
	service87.mimecast.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754103AbaCCJ0e convert rfc822-to-8bit (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 3 Mar 2014 04:26:34 -0500
In-Reply-To: <20140303170335.7a4dd42c6e4f4b9034144a25@canb.auug.org.au>
Content-Disposition: inline
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>, Bjorn Helgaas <bhelgaas@google.com>, "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Mon, Mar 03, 2014 at 06:03:35AM +0000, Stephen Rothwell wrote:
> Hi all,
>=20
> Today's linux-next merge of the tip tree got a conflict in
> drivers/pci/Makefile between commit 39656f29f665 ("PCI: Cleanup per-a=
rch
> list of object files") from the pci tree and commit c5f9ee3d665a ("x8=
6,
> platforms: Remove SGI Visual Workstation") from the tip tree.
>=20
> I fixed it up (see below) and can carry the fix as necessary (no acti=
on
> is required).

Thanks Stephen, that looks fine to me.

Best regards,
Liviu

>=20
> --=20
> Cheers,
> Stephen Rothwell                    sfr@canb.auug.org.au
>=20
> diff --cc drivers/pci/Makefile
> index e2501ac6fe84,9d5ee4dcee7d..000000000000
> --- a/drivers/pci/Makefile
> +++ b/drivers/pci/Makefile
> @@@ -33,15 -33,20 +33,14 @@@ obj-$(CONFIG_PCI_IOV) +=3D iov.
>   #
>   # Some architectures use the generic PCI setup functions
>   #
>  -obj-$(CONFIG_X86) +=3D setup-bus.o
>  -obj-$(CONFIG_ALPHA) +=3D setup-bus.o setup-irq.o
>  -obj-$(CONFIG_ARM) +=3D setup-bus.o setup-irq.o
>  -obj-$(CONFIG_UNICORE32) +=3D setup-bus.o setup-irq.o
>  -obj-$(CONFIG_PARISC) +=3D setup-bus.o
>  -obj-$(CONFIG_SUPERH) +=3D setup-bus.o setup-irq.o
>  -obj-$(CONFIG_PPC) +=3D setup-bus.o
>  -obj-$(CONFIG_FRV) +=3D setup-bus.o
>  -obj-$(CONFIG_MIPS) +=3D setup-bus.o setup-irq.o
>  -obj-$(CONFIG_MN10300) +=3D setup-bus.o
>  -obj-$(CONFIG_MICROBLAZE) +=3D setup-bus.o
>  -obj-$(CONFIG_TILE) +=3D setup-bus.o setup-irq.o
>  -obj-$(CONFIG_SPARC_LEON) +=3D setup-bus.o setup-irq.o
>  -obj-$(CONFIG_M68K) +=3D setup-bus.o setup-irq.o
>  +obj-$(CONFIG_ALPHA) +=3D setup-irq.o
>  +obj-$(CONFIG_ARM) +=3D setup-irq.o
>  +obj-$(CONFIG_UNICORE32) +=3D setup-irq.o
>  +obj-$(CONFIG_SUPERH) +=3D setup-irq.o
>  +obj-$(CONFIG_MIPS) +=3D setup-irq.o
> - obj-$(CONFIG_X86_VISWS) +=3D setup-irq.o
>  +obj-$(CONFIG_TILE) +=3D setup-irq.o
>  +obj-$(CONFIG_SPARC_LEON) +=3D setup-irq.o
>  +obj-$(CONFIG_M68K) +=3D setup-irq.o
>  =20
>   #
>   # ACPI Related PCI FW Functions



--=20
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
| I would like to |
| fix the world,  |
| but they're not |
| giving me the   |
 \ source code!  /
  ---------------
    =C2=AF\_(=E3=83=84)_/=C2=AF
