From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: next-20160215 build: 3 failures 14 warnings (next-20160215)
Date: Mon, 15 Feb 2016 14:24:25 +0100
Message-ID: <20160215132425.GA21048@ulmo>
References: <E1aVFDg-00066P-6L@optimist>
 <20160215121922.GH18988@sirena.org.uk>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="C7zPtVaVf+AK4Oqc"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-wm0-f41.google.com ([74.125.82.41]:33467 "EHLO
	mail-wm0-f41.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753240AbcBONY1 (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 15 Feb 2016 08:24:27 -0500
Received: by mail-wm0-f41.google.com with SMTP id g62so148980101wme.0
        for <linux-next@vger.kernel.org>; Mon, 15 Feb 2016 05:24:27 -0800 (PST)
Content-Disposition: inline
In-Reply-To: <20160215121922.GH18988@sirena.org.uk>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Mark Brown <broonie@kernel.org>
Cc: "J. German Rivera" <German.Rivera@freescale.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linaro-kernel@lists.linaro.org, linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org


--C7zPtVaVf+AK4Oqc
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 15, 2016 at 12:19:22PM +0000, Mark Brown wrote:
> On Mon, Feb 15, 2016 at 09:13:24AM +0000, Build bot for Mark Brown wrote:
>=20
> Today's linux-next fails to build an arm64 allmodconfig due to recent
> commits adding generic MSI and GICv3 support:
>=20
> > 	arm64-allmodconfig
> > ERROR: "msi_create_irq_domain" [drivers/staging/fsl-mc/bus/mc-bus-drive=
r.ko] undefined!
> > ERROR: "irq_chip_mask_parent" [drivers/staging/fsl-mc/bus/mc-bus-driver=
=2Eko] undefined!
> > ERROR: "free_msi_entry" [drivers/staging/fsl-mc/bus/mc-bus-driver.ko] u=
ndefined!
> > ERROR: "msi_domain_alloc_irqs" [drivers/staging/fsl-mc/bus/mc-bus-drive=
r.ko] undefined!
> > ERROR: "of_msi_get_domain" [drivers/staging/fsl-mc/bus/mc-bus-driver.ko=
] undefined!
> > ERROR: "irq_chip_eoi_parent" [drivers/staging/fsl-mc/bus/mc-bus-driver.=
ko] undefined!
> > ERROR: "msi_domain_set_affinity" [drivers/staging/fsl-mc/bus/mc-bus-dri=
ver.ko] undefined!
> > ERROR: "msi_get_domain_info" [drivers/staging/fsl-mc/bus/mc-bus-driver.=
ko] undefined!
> > ERROR: "msi_domain_free_irqs" [drivers/staging/fsl-mc/bus/mc-bus-driver=
=2Eko] undefined!
> > ERROR: "alloc_msi_entry" [drivers/staging/fsl-mc/bus/mc-bus-driver.ko] =
undefined!
> > ERROR: "irq_chip_unmask_parent" [drivers/staging/fsl-mc/bus/mc-bus-driv=
er.ko] undefined!
>=20
> Presumably some missing select or dependency there...

I think this is caused by the MSI IRQ domain API not being exported.
I've just sent out a couple of patches that I've been carrying in my
local tree for a few days now.

Thierry

--C7zPtVaVf+AK4Oqc
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAABCAAGBQJWwdGDAAoJEN0jrNd/PrOhkjYP/1rYW++d8VteGGCAvlVXmksT
2G+Rg3QmwJpSCGm0CawfuhWNWEYxAjLAvIYquCcu1i5Hj/1d0nlHmLftCqlESbRc
qy/+OAZLoJVQxO/JFkrbz1MD9K7fofvGy2c7pM7qBfyvvxPu2Yk6X4Zt97UdDFov
8B9c3QnkijNywwZn+cQDfRgOlYJ9d0c7lkRjHtG+/bYiR1PvGRinsikR2ToQXuWn
q5h4fI1agALMyN932ErGWwXRrJ7QqmL+l3+uQmDBfE4+cVGpWYzHsUdJ0BoptSYk
R27lqeuDwkT4rcXRybS6nqYqKODA1MnK8JG38Xfm1Tpw+VyS9XPntlSj5sNVcHwQ
rPgcwyyKbtuDWeYNJGYODloZdHOM8YNBaZhOVTE5JIyx85nfdj5+nUroHR05xs3/
sZRyLuDwi3WsLa3A37fq+VakvcOH3T0mSfHJ9qzPlxJvPxnRAPjngTI0CEyFj+E2
YpJc2839GkcYbatucI6ELJxHrjkT7vgl3KIr8fprVNdzSnexzizzLfF4hwsO2yPr
S5eVKfdpeOl9DnqkJ9f8wnDT4gLXt+C4AnnivnUgr+B2zkWtMp1E/xB28B1xO1l9
+RaoDzhfNUkEBRl81f9twMXoMC7cmh4wVRgPWUX4NpAWveA8N72us9qmVvuLLuGZ
oUxnx2VAo1vxkkQnx85z
=YY3U
-----END PGP SIGNATURE-----

--C7zPtVaVf+AK4Oqc--
