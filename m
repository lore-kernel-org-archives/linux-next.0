From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: crypto tree build failure
Date: Tue, 11 Nov 2008 15:07:31 +1100
Message-ID: <20081111150731.c8826d1e.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Tue__11_Nov_2008_15_07_31_+1100_oU_s3KqsFB7DO7H0"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:50830 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750787AbYKKEHn (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 10 Nov 2008 23:07:43 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Herbert Xu <herbert@gondor.apana.org.au>
Cc: linux-next@vger.kernel.org

--Signature=_Tue__11_Nov_2008_15_07_31_+1100_oU_s3KqsFB7DO7H0
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Herbert,

Today's linux-next build (powerpc ppc64_defconfig) failed like this:

ERROR: ".crc32c" [net/ipv4/netfilter/nf_nat_proto_sctp.ko] undefined!

I am not quite sure which commit caused this, but there are recent
commits to the crypto tree that play with crc32c, so I am dropping the
crypto tree for today.

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Tue__11_Nov_2008_15_07_31_+1100_oU_s3KqsFB7DO7H0
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkkZBQMACgkQjjKRsyhoI8yZRgCgpCYHN2qBLpgHz21zrV/ZJXK8
XHUAni50gGPR6HkWbGVYAd8zJdXNxKcO
=/kP2
-----END PGP SIGNATURE-----

--Signature=_Tue__11_Nov_2008_15_07_31_+1100_oU_s3KqsFB7DO7H0--
