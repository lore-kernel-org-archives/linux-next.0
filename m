From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: [PATCH] tpm/tpm_tis: Add missing ifdef CONFIG_ACPI for
 pnp_acpi_device
Date: Thu, 22 Jan 2015 08:34:32 +1100
Message-ID: <20150122083432.2adaaee2@canb.auug.org.au>
References: <1421872815-16644-1-git-send-email-peterhuewe@gmx.de>
	<20150122082350.121301eb@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/XohsF7ClZivEVOvr5Vu72Yx"; protocol="application/pgp-signature"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:55553 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752308AbbAUVek (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 21 Jan 2015 16:34:40 -0500
In-Reply-To: <20150122082350.121301eb@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Peter Huewe <peterhuewe@gmx.de>
Cc: linux-next <linux-next@vger.kernel.org>, tpmdd-devel@lists.sourceforge.net, Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>, Jim Davis <jim.epost@gmail.com>

--Sig_/XohsF7ClZivEVOvr5Vu72Yx
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Peter,

On Thu, 22 Jan 2015 08:23:50 +1100 Stephen Rothwell <sfr@canb.auug.org.au> =
wrote:
>
> To save on the ifdef, why not
>=20
> 	struct acpi_device *acpi;
>=20
> 	.
> 	.
>=20
> 	acpi =3D pnp_acpi_device(dev);
> 	if (acpi)
> 		acpi_dev_handle =3D acpi->handle;

I guess struct acpi_device may not be visible when CONFIG_ACPI is not
set? That would be a pain :-(

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

--Sig_/XohsF7ClZivEVOvr5Vu72Yx
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJUwBtsAAoJEMDTa8Ir7ZwVp0YP/RrckqMcnqLHmLkQC3WzICLN
NZINm5h63xaRPIZBTr6egliPgtBK2xTW+VABMMvk9XQ8eBw/i8drMlUGhdKft5C/
2aSJuRU7cHPBBLjfWPrK7Ow+tPqDYp+ccfwmDzSpFK8tC6w/g+XDJCfgOl6HARCR
ef6B8ULZWjJV/egEaFjap2oBP20MgES/RiPf0+a5gigq/7j0zO1+1PXk5+m87anQ
qnCWTNZhQUX4dEwZLuKbJvXUT3pZXyChdlWsrop3c5TNRRYoXO7WjKlRagFGQlBi
Yn5nISYYco9eV3YMcty7uga3ww7fm02SFTEInWPzPkqVEDX4Hji5ETpIg9aH4dzo
eMz/SELyyShnwllrmD1THHOJbk1YO45C2nZ2hwZxd2Rh99Xhvwj1NY6GPYk6GJDj
XWHNg0IVBe+r79I4j2+Kc6s/ubtVdqdH8qGeapY6rcff5a9Pkhp9BKNmLQ7dwCT6
0kO/fzcDRm4SS6ULU7uSa1IR4iKMViILODTKgYNC/TrRDo7NxlPgjoD03pjnvelQ
MuwCk/5OsnDMUd0rVWA0N7nZrXD4fJiLRDQEWlS0KyHMwg3Rscx9D0yBvTV4i5Ma
1VqI1LX4CdXEMWNqoQFkCiSv6ZsSKf2BPghtnERbabcsbk4uenOgVFH21DjwMo7w
bB26wJ91+RAFUewyF9UG
=C8/0
-----END PGP SIGNATURE-----

--Sig_/XohsF7ClZivEVOvr5Vu72Yx--
