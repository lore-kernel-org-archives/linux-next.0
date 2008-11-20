From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: md tree build warnings
Date: Thu, 20 Nov 2008 16:10:56 +1100
Message-ID: <20081120161056.47b6130e.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Thu__20_Nov_2008_16_10_56_+1100_MvCK456Au+yyviX3"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:41382 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751174AbYKTFLU (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 20 Nov 2008 00:11:20 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Neil Brown <neilb@suse.de>
Cc: linux-next@vger.kernel.org, Cheng Renquan <crquan@gmail.com>, Andrew Morton <akpm@linux-foundation.org>

--Signature=_Thu__20_Nov_2008_16_10_56_+1100_MvCK456Au+yyviX3
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Neil,

Today's linux-next build (powerpc ppc64_defconfig) produced these new
warnings:

drivers/md/md.c: In function 'print_sb_1':
drivers/md/md.c:1698: warning: format '%Ld' expects type 'long long int', b=
ut argument 3 has type '__le64'
drivers/md/md.c:1698: warning: format '%Ld' expects type 'long long int', b=
ut argument 7 has type '__le64'
drivers/md/md.c:1698: warning: format '%Ld' expects type 'long long int', b=
ut argument 8 has type '__le64'
drivers/md/md.c:1698: warning: format '%Ld' expects type 'long long int', b=
ut argument 9 has type '__le64'
drivers/md/md.c:1698: warning: format '%Ld' expects type 'long long int', b=
ut argument 10 has type '__le64'
drivers/md/md.c:1698: warning: format '%Lu' expects type 'long long unsigne=
d int', but argument 29 has type '__le64'
drivers/md/md.c:1698: warning: format '%Ld' expects type 'long long int', b=
ut argument 30 has type '__le64'
drivers/md/md.c:1698: warning: format '%Ld' expects type 'long long int', b=
ut argument 31 has type '__le64'

Added by commit 4c3da1f23cf20603339493525adf8903a5722417 "md: need
another print_sb for mdp_superblock_1".  We cast 64 bit quantities to
"unsigned long long" when we print them since they are just "unsigned
long" on some architectures.  Also since they are __le64, will they print
anything useful on a big endian architecture?

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Thu__20_Nov_2008_16_10_56_+1100_MvCK456Au+yyviX3
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkkk8WAACgkQjjKRsyhoI8xYQwCeITpsedlOLDP10YwThApqq03T
RRwAoLE/32URf2Xq1/DA1Obt+Mme60U5
=SC8x
-----END PGP SIGNATURE-----

--Signature=_Thu__20_Nov_2008_16_10_56_+1100_MvCK456Au+yyviX3--
