From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: linux-next: manual merge of the pwm tree with the regulator tree
Date: Tue, 3 May 2016 14:18:43 +0200
Message-ID: <20160503121843.GA18517@ulmo.ba.sec>
References: <20160503182509.42658c4f@canb.auug.org.au>
 <20160503110343.GM6292@sirena.org.uk>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="7AUc2qLy4jB3hD7Z"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-wm0-f50.google.com ([74.125.82.50]:38258 "EHLO
	mail-wm0-f50.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932252AbcECMSr (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 3 May 2016 08:18:47 -0400
Content-Disposition: inline
In-Reply-To: <20160503110343.GM6292@sirena.org.uk>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Mark Brown <broonie@kernel.org>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Liam Girdwood <lgirdwood@gmail.com>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Boris Brezillon <boris.brezillon@free-electrons.com>, Laxman Dewangan <ldewangan@nvidia.com>


--7AUc2qLy4jB3hD7Z
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, May 03, 2016 at 12:03:43PM +0100, Mark Brown wrote:
> On Tue, May 03, 2016 at 06:25:09PM +1000, Stephen Rothwell wrote:
>=20
> > I fixed it up (see below) and can carry the fix as necessary. This
> > is now fixed as far as linux-next is concerned, but any non trivial
> > conflicts should be mentioned to your upstream maintainer when your tree
> > is submitted for merging.  You may also want to consider cooperating
> > with the maintainer of the conflicting tree to minimise any particularly
> > complex conflicts.
>=20
> Please send me a pull request for the regulator commits you've added.

I had to reshuffle things a little, but I've new sent out a pull request
for a stable branch that contains the one regulator patch on top of the
shared dependency branch that adds the new struct pwm_args.

Let me know if you need anything else.

Thierry

--7AUc2qLy4jB3hD7Z
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAABCAAGBQJXKJcgAAoJEN0jrNd/PrOh+r0QAJzUaXzqc69HYuloJqNqSqLD
+zBrfUr1DK17zJrLe91jEl3kHqoMlaq3bSGr+b1hixdAs9K/wSxNh1OVJiFfuaAf
yd/xHC5Sc1sEXLX26UPi5YXgxqMJof9xDyKIJCnWIzHw+Ypj9SzD99VtA1a51GXK
Day977m63VPMrJ0gLayAdRyWWur/aj/1+KIKiNf2640b0PqO2s5ZTQdTYzZ7fAUq
FcTm4ZPZyGwWKQzKmeSgWtw5A+RM1e0dkxL2ahBErabgiL3oV3TqamE+GlmMmVmf
UpYlvv89pg+//ovXvG9suO6+3kNSSY6sMBrusx9nd9GJIvm4Z3b1ujsAZmSoLUsm
xam+qi5JlwRYyRPfzrKC6H3ATyjITncnT+Em/ihi6uheW8nLxYFSOj4A08bxcgx5
JXpImy1fVIGuRFP5+coEHPC4f5M8CtUGlrB8d9XfpJmoIqgpqwXwQzd8DKpUjAvc
BDn+Ipd9AGxMZQ3SZyEU8nVRxBzfZkf2Vl2+PWHPInF/yaJg8XbM15y/Q1GwlQyn
hPjlzDiZJn1Q0Dqnsnw6jO4o9VFkZv5rTvhQZZWz3jnCRgt62MQJzFSXmUvU6dm7
/Rh+bKK9lRgD6jBDRBoVoHu3AGmfTdikntzMRGGfvhO5d/3p1ZbVVOU/AcoXVmmK
XtJHiQnOn/oV2SXb12KZ
=vLOV
-----END PGP SIGNATURE-----

--7AUc2qLy4jB3hD7Z--
