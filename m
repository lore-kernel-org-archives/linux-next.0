From: Mark Brown <broonie@kernel.org>
Subject: Re: linux-next: manual merge of the sound-asoc tree with the
 slave-dma tree
Date: Tue, 3 Dec 2013 16:48:24 +0000
Message-ID: <20131203164824.GG27568@sirena.org.uk>
References: <20131203113852.63cc7e97a7a9e05f939f4ac1@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="4IS0x2wnB+8sCNhC"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20131203113852.63cc7e97a7a9e05f939f4ac1@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Vinod Koul <vinod.koul@intel.com>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Nicolin Chen <b42378@freescale.com>
List-Id: linux-next.vger.kernel.org


--4IS0x2wnB+8sCNhC
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 03, 2013 at 11:38:52AM +1100, Stephen Rothwell wrote:
> Hi all,
>=20
> Today's linux-next merge of the sound-asoc tree got a conflict in
> sound/soc/fsl/fsl_ssi.c between commit bf02c7cb4314 ("ASoC: fsl_ssi: Add
> dual fifo mode support") from the slave-dma tree and commit 2924a9981006
> ("ASoC: fsl_ssi: Add monaural audio support for non-ac97 interface") from
> the sound-asoc tree.
>=20
> I fixed it up (see below) and can carry the fix as necessary (no action
> is required).

Looks good to me, thanks.

--4IS0x2wnB+8sCNhC
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iQIcBAEBAgAGBQJSngtVAAoJELSic+t+oim9rpcP/3ENRUrSZ1WO3AzsTnaujR+3
/+e+7csFKWrlHrDpMthXMI2d/uZG3NZzZ3rHEvgQAf51EeBIjupL9zA3tnEcSDwp
/wHRgPSMqD+Kx82uWKOyr9FO7zWS2xWtaEZdT6Ej2W0wtyCFW8UoCbjs+CPy3dg5
IJqYUbJUrLB3TLM6lH3bHvHksp1BvY83RhDFibyyeX7SLc9iNAKNZxyTNxQFqBdo
8mOq/JAeVHY8wA4wqzHHWWjZNS8ueL1r34vLM32CPMlYleM9uHmVUXPfRZbj73ls
M/28sfM/s9AXVLG/vPvZN2M2fJNAU57oGfP0iqP1wSLfd9hHeERHzzHhPkAR+Cyw
tUlgwZnDxu7Y8i9B5XlavHSgO2IoaKfbgxL0uzTBlvO33sVkkiHmx93Xgx+S/EYP
I++4ChdYJU48GnoWS91mbn2ihGsX5EzQFrqM4GfqB77b5XE0jlBIwAKx2Fd5vc3F
zy8ao+MtKZHLW34zWQlT3/xbu+xJ+g3lz5Fo9JMCorh3gJg9PTVYZdaZNRCTpR8o
4KflMEdeKlfhQyhnt4EyUfYdqpbNi2JFN4aoshEQIPVBT33cgJgFgkPnvRG1prnc
eNazPNrSLclBrCJnG/6Q1eZNHA2CJ7QpN3BLK0pyqOBa70qeccP0yULWJY/pxUbp
h2gLSw62iuW5mK9M+2nr
=tCA0
-----END PGP SIGNATURE-----

--4IS0x2wnB+8sCNhC--
