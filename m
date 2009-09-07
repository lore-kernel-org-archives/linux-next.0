From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: slab tree build failure
Date: Mon, 7 Sep 2009 17:31:08 +1000
Message-ID: <20090907173108.3c0148d7.sfr@canb.auug.org.au>
References: <20090907153723.0c984c83.sfr@canb.auug.org.au>
	<84144f020909062310u37ecdddfw31c6cc9a22ccabd9@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Mon__7_Sep_2009_17_31_08_+1000_XQrxa/LxHHLJwMWj"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:36811 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751262AbZIGHbR (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 7 Sep 2009 03:31:17 -0400
In-Reply-To: <84144f020909062310u37ecdddfw31c6cc9a22ccabd9@mail.gmail.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Pekka Enberg <penberg@cs.helsinki.fi>
Cc: Christoph Lameter <cl@linux-foundation.org>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, "Luis R. Rodriguez" <lrodriguez@atheros.com>, "John W. Linville" <linville@tuxdriver.com>, Catalin Marinas <catalin.marinas@arm.com>

--Signature=_Mon__7_Sep_2009_17_31_08_+1000_XQrxa/LxHHLJwMWj
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Pekka,

On Mon, 7 Sep 2009 09:10:18 +0300 Pekka Enberg <penberg@cs.helsinki.fi> wro=
te:
>
> AFAICT, you're interested in kmemleak.git, not slab.git. Catalin?

I first got the error after merging the slab tree ... the kmemleak tree
is merged much later.

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Mon__7_Sep_2009_17_31_08_+1000_XQrxa/LxHHLJwMWj
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkqktrwACgkQjjKRsyhoI8ySRQCgk42zmMKddcDGTp856yqyG8f5
XkMAnAooOdMXDzYwCgfnlV4KX6NQZ1+z
=dPZU
-----END PGP SIGNATURE-----

--Signature=_Mon__7_Sep_2009_17_31_08_+1000_XQrxa/LxHHLJwMWj--
