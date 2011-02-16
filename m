From: Grant Likely <grant.likely@secretlab.ca>
Subject: Re: linux-next: manual merge of the devicetree tree with the
 spi-current tree
Date: Tue, 15 Feb 2011 21:41:41 -0700
Message-ID: <AANLkTin2xfDBk5n5ch=EYNauyPZEBq2SozQM6by6EY+G@mail.gmail.com>
References: <20110216150943.b4969ddf.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-iw0-f174.google.com ([209.85.214.174]:46628 "EHLO
	mail-iw0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756349Ab1BPEmC convert rfc822-to-8bit (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 15 Feb 2011 23:42:02 -0500
In-Reply-To: <20110216150943.b4969ddf.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Sebastian Andrzej Siewior <bigeasy@linutronix.de>

On Tue, Feb 15, 2011 at 9:09 PM, Stephen Rothwell <sfr@canb.auug.org.au=
> wrote:
> Hi Grant,
>
> Today's linux-next merge of the devicetree tree got a conflict in
> drivers/spi/pxa2xx_spi_pci.c between commit
> 0f3e1d27a7e3f98d996d707d649128e229b65deb ("spi/pxa2xx pci: fix the
> release - remove race") from the spi-current tree and commit
> c9e358dfc4a8cb2227172ef77908c2e0ee17bcb9 ("driver-core: remove
> conditionals around devicetree pointers") from the devicetree tree.
>
> I fixed it up (see below) and can carry the fix as necessary.

Heh, seeing as those are *both* my trees, I'll take care of merging
appropriately to sort this out.  :-)

g.

> --
> Cheers,
> Stephen Rothwell =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0sfr@canb.auug=
=2Eorg.au
>
> diff --cc drivers/spi/pxa2xx_spi_pci.c
> index 19752b0,b6589bb..0000000
> --- a/drivers/spi/pxa2xx_spi_pci.c
> +++ b/drivers/spi/pxa2xx_spi_pci.c
> @@@ -75,24 -84,25 +75,22 @@@ static int __devinit ce4100_spi_probe(s
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0return ret;
> =A0 =A0 =A0 =A0}
>
> =A0+ =A0 =A0 =A0pdev =3D platform_device_alloc("pxa2xx-spi", dev->dev=
fn);
> =A0 =A0 =A0 =A0spi_info =3D kzalloc(sizeof(*spi_info), GFP_KERNEL);
> =A0- =A0 =A0 =A0if (!spi_info) {
> =A0+ =A0 =A0 =A0if (!pdev || !spi_info ) {
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0ret =3D -ENOMEM;
> =A0- =A0 =A0 =A0 =A0 =A0 =A0 =A0goto err_kz;
> =A0+ =A0 =A0 =A0 =A0 =A0 =A0 =A0goto err_nomem;
> =A0 =A0 =A0 =A0}
> =A0- =A0 =A0 =A0ssp =3D &spi_info->ssp;
> =A0- =A0 =A0 =A0pdev =3D &spi_info->spi_pdev;
> =A0- =A0 =A0 =A0spi_pdata =3D =A0&spi_info->spi_pdata;
> =A0+ =A0 =A0 =A0memset(&spi_pdata, 0, sizeof(spi_pdata));
> =A0+ =A0 =A0 =A0spi_pdata.num_chipselect =3D dev->devfn;
>
> =A0- =A0 =A0 =A0pdev->name =3D "pxa2xx-spi";
> =A0- =A0 =A0 =A0pdev->id =3D dev->devfn;
> =A0- =A0 =A0 =A0pdev->dev.parent =3D &dev->dev;
> =A0- =A0 =A0 =A0pdev->dev.platform_data =3D &spi_info->spi_pdata;
> =A0+ =A0 =A0 =A0ret =3D platform_device_add_data(pdev, &spi_pdata, si=
zeof(spi_pdata));
> =A0+ =A0 =A0 =A0if (ret)
> =A0+ =A0 =A0 =A0 =A0 =A0 =A0 =A0goto err_nomem;
>
> =A0+ =A0 =A0 =A0pdev->dev.parent =3D &dev->dev;
> - #ifdef CONFIG_OF
> =A0 =A0 =A0 =A0pdev->dev.of_node =3D dev->dev.of_node;
> - #endif
> =A0- =A0 =A0 =A0pdev->dev.release =3D plat_dev_release;
> =A0-
> =A0- =A0 =A0 =A0spi_pdata->num_chipselect =3D dev->devfn;
> =A0-
> =A0+ =A0 =A0 =A0ssp =3D &spi_info->ssp;
> =A0 =A0 =A0 =A0ssp->phys_base =3D pci_resource_start(dev, 0);
> =A0 =A0 =A0 =A0ssp->mmio_base =3D ioremap(phys_beg, phys_len);
> =A0 =A0 =A0 =A0if (!ssp->mmio_base) {
>



--=20
Grant Likely, B.Sc., P.Eng.
Secret Lab Technologies Ltd.
