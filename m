From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build failure after merge of the slab tree
Date: Wed, 27 Oct 2010 11:33:41 +1100
Message-ID: <20101027113341.e77169cc.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Wed__27_Oct_2010_11_33_41_+1100_fXpFl.dkRsJtJ_h3"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:36232 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1760660Ab0J0Adr (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 26 Oct 2010 20:33:47 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Pekka Enberg <penberg@cs.helsinki.fi>, Christoph Lameter <cl@linux-foundation.org>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

--Signature=_Wed__27_Oct_2010_11_33_41_+1100_fXpFl.dkRsJtJ_h3
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the slab tree, today's linux-next build (x86_64 allmodconfig)
failed like this:

gcc: /scratch/sfr/next/Documentation/vm/slabinfo.c: No such file or directo=
ry
gcc: no input files

Caused by commit f5ac4916e9840292edd33c7a52b10364526547f3 ("slub: move
slabinfo.c to tools/slub/slabinfo.c").  Missing update to
Documentation/vm/Makefile?

I have used the slab tree from next-20101026 for today.
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Wed__27_Oct_2010_11_33_41_+1100_fXpFl.dkRsJtJ_h3
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iQEcBAEBAgAGBQJMx3NlAAoJEDMEi1NhKgbsjKkH/2LoUJ44X8p9f5W+XVcuQZRv
205uQTuyWrtFJ61bSYL7aIdmyC0yLdXkj7B8bX6zg2YRrQP95X3C/qw5Y/Uj0iTK
OaVPYT2XGaMQTdtVGmmdsuNhJTSQ7Sdl/t4lxfQFneE7r6tZK9mftmSWIF1V6uYa
o620/hftl1TlOBKlrwYRgQKKSU8Sd6ZzCAMKKHBzWBxETIhiN+G2hsq23Zz88kOn
y9ZKyF2XruTMM9G+JYl/ci2yvWXEocZAUksG4NHvIuaqcecgztDC35NHu6/hzBJo
46PhDPGzzL27EfCDunlFgu7JxcQfRJOGyBoltNlHyjEPS84mI0M/lHmT6WWCTwY=
=DNPG
-----END PGP SIGNATURE-----

--Signature=_Wed__27_Oct_2010_11_33_41_+1100_fXpFl.dkRsJtJ_h3--
