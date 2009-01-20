From: Huang Ying <ying.huang@intel.com>
Subject: Re: linux-next: crypto tree build failure
Date: Tue, 20 Jan 2009 11:04:27 +0800
Message-ID: <1232420667.13948.62.camel@yhuang-dev.sh.intel.com>
References: <20090120133043.29efee3f.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1; protocol="application/pgp-signature"; boundary="=-b1SzkWaY97g1U6jURBQ+"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mga01.intel.com ([192.55.52.88]:40413 "EHLO mga01.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751500AbZATDEj (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 19 Jan 2009 22:04:39 -0500
In-Reply-To: <20090120133043.29efee3f.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Herbert Xu <herbert@gondor.apana.org.au>
Cc: "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>, Stephen Rothwell <sfr@canb.auug.org.au>


--=-b1SzkWaY97g1U6jURBQ+
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

Hi, Herbert,

On Tue, 2009-01-20 at 10:30 +0800, Stephen Rothwell wrote:
> Hi Herbert,
>=20
> Today's linux-next build (x86_64 allmodconfig) failed like this:
>=20
> arch/x86/crypto/aesni-intel_glue.c:22:21: error: asm/aes.h: No such file =
or directory

I don't know why. But it seems that asm/aes.h is not included in git,
while it is in my original patch. I will submit a fix patch.

Best Regards,
Huang Ying



--=-b1SzkWaY97g1U6jURBQ+
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEABECAAYFAkl1PzgACgkQKhFGF+eHlpjRSgCdGrPs+ow3ylhvOqmv6e8IKW0E
5RsAmwcWp79Tl0mWntMJ7apenaWHWNll
=F8Js
-----END PGP SIGNATURE-----

--=-b1SzkWaY97g1U6jURBQ+--
