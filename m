From: Mark Brown <broonie@kernel.org>
Subject: Re: linux-next: build warning after merge of the sound-asoc tree
Date: Thu, 2 Aug 2018 15:37:39 +0100
Message-ID: <20180802143739.GP9117@sirena.org.uk>
References: <20180802140630.7618b9d1@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="l7GkBbkEatsaRqBf"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20180802140630.7618b9d1@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Rohit kumar <rohitkr@codeaurora.org>
List-Id: linux-next.vger.kernel.org


--l7GkBbkEatsaRqBf
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 02, 2018 at 02:06:30PM +1000, Stephen Rothwell wrote:
> Hi all,
>=20
> After merging the sound-asoc tree, today's linux-next build (x86_64
> allmodconfig) produced this warning:

I was sent a patch for this already, should be fixed tomorrow.  Thanks
for reporting.

--l7GkBbkEatsaRqBf
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAltjFzMACgkQJNaLcl1U
h9AAnQf7Bzmvgt8cSKgmYOTF09b+mjKTJZw07x/ZMSUQAOpT8lT881G9VZ3ByJ+W
nCADSeb+E8GeIgSsB9Ri8QdJy7q0j+WEXNpTW0Pl4oXgSXncEBgAkJeL7GYuIJCV
1OxIDvUJWixA+T6OTU/OTYTcV1d92X4sIVwZeoYW1JYegzE6BMVTSNcRml5LlgjL
geMdo0olyU1AO3PcJ5BlGqP960OjNY4NUA5n22dIpk3o+vM4kFc29CKLxfKQCrUn
sZZoAn9HygQWpYZqu+tWUf+EX8DkyOr6fMHdqs71wLkvya/tmj+OsSBEi3/eBFQJ
gBRbOts/5Ub2bT75/jiQehW05/axIg==
=a3Jz
-----END PGP SIGNATURE-----

--l7GkBbkEatsaRqBf--
