From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: origin tree build failure
Date: Tue, 14 Apr 2009 20:26:57 +1000
Message-ID: <20090414202657.8f355e7c.sfr@canb.auug.org.au>
References: <20090414144317.026498df.sfr@canb.auug.org.au>
	<20090414.020818.174886786.davem@davemloft.net>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Tue__14_Apr_2009_20_26_57_+1000_ZKI.WXkSg6wDe5H4"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:50338 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750746AbZDNK1F (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 14 Apr 2009 06:27:05 -0400
In-Reply-To: <20090414.020818.174886786.davem@davemloft.net>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: David Miller <davem@davemloft.net>
Cc: torvalds@linux-foundation.org, linux-next@vger.kernel.org, fweisbec@gmail.com, linux-kernel@vger.kernel.org, mingo@elte.hu

--Signature=_Tue__14_Apr_2009_20_26_57_+1000_ZKI.WXkSg6wDe5H4
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Dave,

On Tue, 14 Apr 2009 02:08:18 -0700 (PDT) David Miller <davem@davemloft.net>=
 wrote:
>
> From: Stephen Rothwell <sfr@canb.auug.org.au>
> Date: Tue, 14 Apr 2009 14:43:17 +1000
>=20
> > sparc: asm/atomic.h on 32bit should include asm/system.h for xchg
> >=20
> > Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
>=20
> Just in case it wasn't clear, I'm applying this :)

Ah, ok, thanks :-)

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Tue__14_Apr_2009_20_26_57_+1000_ZKI.WXkSg6wDe5H4
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAknkZPEACgkQjjKRsyhoI8yF+QCgv4DXdMBFD3Djv1AMiWRbqre9
CUkAnA0zm/YGWjVIv3zdBTahhEtJlOqx
=+hIc
-----END PGP SIGNATURE-----

--Signature=_Tue__14_Apr_2009_20_26_57_+1000_ZKI.WXkSg6wDe5H4--
