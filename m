From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: build failure
Date: Mon, 12 May 2008 20:42:51 +1000
Message-ID: <20080512204251.a184d53c.sfr@canb.auug.org.au>
References: <20080512.005454.31875425.davem@davemloft.net>
	<20080512180903.c512397f.sfr@canb.auug.org.au>
	<20080512181557.62cc3e36.sfr@canb.auug.org.au>
	<20080512.015349.174504402.davem@davemloft.net>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Mon__12_May_2008_20_42_51_+1000_qqP7poYv7YEK6kzi"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:60784 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1754674AbYELKnB (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 12 May 2008 06:43:01 -0400
In-Reply-To: <20080512.015349.174504402.davem@davemloft.net>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: David Miller <davem@davemloft.net>
Cc: greg@kroah.com, linux-next@vger.kernel.org, kay.sievers@vrfy.org

--Signature=_Mon__12_May_2008_20_42_51_+1000_qqP7poYv7YEK6kzi
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Dave,

On Mon, 12 May 2008 01:53:49 -0700 (PDT) David Miller <davem@davemloft.net>=
 wrote:
>
> :-)  The fix is likely something like this:
>=20
> diff --git a/arch/powerpc/kernel/pci_64.c b/arch/powerpc/kernel/pci_64.c
> index 5275074..776703e 100644
> --- a/arch/powerpc/kernel/pci_64.c
> +++ b/arch/powerpc/kernel/pci_64.c
> @@ -189,8 +189,8 @@ struct pci_dev *of_create_pci_dev(struct device_node =
*node,
> =20
>  	dev->cfg_size =3D pci_cfg_space_size(dev);
> =20
> -	sprintf(pci_name(dev), "%04x:%02x:%02x.%d", pci_domain_nr(bus),
> -		dev->bus->number, PCI_SLOT(devfn), PCI_FUNC(devfn));
> +	dev_set_name(&dev->dev, "%04x:%02x:%02x.%d", pci_domain_nr(bus),
> +		     dev->bus->number, PCI_SLOT(devfn), PCI_FUNC(devfn));
>  	dev->class =3D get_int_prop(node, "class-code", 0);
>  	dev->revision =3D get_int_prop(node, "revision-id", 0);
> =20
> diff --git a/arch/sparc64/kernel/pci.c b/arch/sparc64/kernel/pci.c
> index 112b09f..bfc8c5d 100644
> --- a/arch/sparc64/kernel/pci.c
> +++ b/arch/sparc64/kernel/pci.c
> @@ -408,8 +408,8 @@ struct pci_dev *of_create_pci_dev(struct pci_pbm_info=
 *pbm,
>  	dev->class =3D class >> 8;
>  	dev->revision =3D class & 0xff;
> =20
> -	sprintf(pci_name(dev), "%04x:%02x:%02x.%d", pci_domain_nr(bus),
> -		dev->bus->number, PCI_SLOT(devfn), PCI_FUNC(devfn));
> +	dev_set_name(&dev->dev, "%04x:%02x:%02x.%d", pci_domain_nr(bus),
> +		     dev->bus->number, PCI_SLOT(devfn), PCI_FUNC(devfn));
> =20
>  	if (ofpci_verbose)
>  		printk("    class: 0x%x device name: %s\n",
>=20

Thanks.  If there is nothing in Greg's tree tomorrow I will apply this
temporarily.

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Mon__12_May_2008_20_42_51_+1000_qqP7poYv7YEK6kzi
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.6 (GNU/Linux)

iD8DBQFIKB8wTgG2atn1QN8RAkAZAJ9sUCV6hXguwoid0MB5Xct03W39KACfcm0n
iG+tx8fNeUuqRddg0/5o71U=
=3fVp
-----END PGP SIGNATURE-----

--Signature=_Mon__12_May_2008_20_42_51_+1000_qqP7poYv7YEK6kzi--
