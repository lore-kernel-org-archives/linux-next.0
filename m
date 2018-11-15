From: Mark Brown <broonie@kernel.org>
Subject: Re: linux-next: build warning after merge of the spi tree
Date: Thu, 15 Nov 2018 11:26:31 -0800
Message-ID: <20181115192631.GN2089@sirena.org.uk>
References: <20181114131844.57c4cdc7@canb.auug.org.au>
 <CAP6Zq1gp+hmNkvk8D2uv8FUqTXE4+ZMPhMB7A7vLMaM6swHy4g@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="Is40wmw6z7H9MUbF"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CAP6Zq1gp+hmNkvk8D2uv8FUqTXE4+ZMPhMB7A7vLMaM6swHy4g@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Tomer Maimon <tmaimon77@gmail.com>
Cc: sfr@canb.auug.org.au, linux-next@vger.kernel.org, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org


--Is40wmw6z7H9MUbF
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 15, 2018 at 05:56:19PM +0200, Tomer Maimon wrote:
> Hi Mark and Stephen,
>=20
> I saw the warning from the kbuilt, in this matter the ioread() function
> will call every time (and the val parameter will used) because rsize can =
be
> 1 or 2.
>=20
> rsize =3D min(bytes_per_word(priv->bits_per_word), priv->rx_bytes);
> bytes_per_word(priv->bits_per_word)function return 1 or 2.
> npcm_pspi_recv()function will called only if parameter priv->rx_bytes is
> not 0.
>=20
> please let me know if you think that I still need to modify the npcm_pspi=
_recv
> to fix kbuilt warning.

Please, it's going to create noise for people working on the kernel if
they get a spurious warning.

--Is40wmw6z7H9MUbF
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAlvtyGYACgkQJNaLcl1U
h9B2Ugf+KfiAeQh/AfrlCM6c7MGPjhJIFE5rf1lfbyZUZjyvPW7X6Y8uERPTR8E+
D/bM4oAtrredlxKjH0qXnHU/EIa5CQBBcg6B32dBMHoRCNJxkbf2Vkhnbyybo4h0
a+NnBAnMSq3JbzuCmiQApamTKzfL11Ap9ZD4A/k0R02s41aYEF2tnPo8fuKBrzxu
Q2K2a02vfOgHFgldYUp1l+v6BN1amRvJI0ILnR2FxlUAs3ditlKZcsSdWE1f3GHa
TpoSvi8f94+SfY2HJkgaENHxpsI9J/qO+sRDYaJg/qG7kDUzCXjdkz4DEQY4+xPb
CBzAqM9YXOQWm1N9B0Be2XB1UeBp6A==
=v4i6
-----END PGP SIGNATURE-----

--Is40wmw6z7H9MUbF--
