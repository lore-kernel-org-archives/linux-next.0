From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the sparc tree
Date: Wed, 16 Jul 2008 17:31:31 +1000
Message-ID: <20080716173131.aae2b18e.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Wed__16_Jul_2008_17_31_31_+1000_TQBaIp=yUK/mBV.e"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:45933 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753385AbYGPHbh (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 16 Jul 2008 03:31:37 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: David Miller <davem@davemloft.net>
Cc: linux-next@vger.kernel.org, Jens Axboe <jens.axboe@oracle.com>, Sam Ravnborg <sam@ravnborg.org>

--Signature=_Wed__16_Jul_2008_17_31_31_+1000_TQBaIp=yUK/mBV.e
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Dave,

Today's linux-next merge of the sparc tree got a conflict in
include/asm-sparc/smp.h between commit
8691e5a8f691cc2a4fda0651e8d307aaba0e7d68 ("smp_call_function: get rid of
the unused nonatomic/retry argument") from Linus' tree and commit
0d4b5053275562b4ff7a9a98942936c9eb9b5c18 ("sparc: join the remaining
header files") from the sparc tree.

I applied the part of the patch from Linus' tree to asm-sparc/smp_32.h.

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Wed__16_Jul_2008_17_31_31_+1000_TQBaIp=yUK/mBV.e
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkh9o9MACgkQjjKRsyhoI8xAbQCfYUgWR+s/NhQZprn1aCBzqLPP
bgQAn3OY6cI7G4VItYJnRXBUFkyzSFyZ
=NW/m
-----END PGP SIGNATURE-----

--Signature=_Wed__16_Jul_2008_17_31_31_+1000_TQBaIp=yUK/mBV.e--
