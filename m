From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build warning
Date: Mon, 24 Nov 2008 17:38:23 +1100
Message-ID: <20081124173823.cb6a22cf.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Mon__24_Nov_2008_17_38_23_+1100_O5pRtZs/_6Ky_s0u"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:46241 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750954AbYKXGiq (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 24 Nov 2008 01:38:46 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Neil Brown <neilb@suse.de>
Cc: linux-next@vger.kernel.org, Cheng Renquan <crquan@gmail.com>, Andrew Morton <akpm@linux-foundation.org>

--Signature=_Mon__24_Nov_2008_17_38_23_+1100_O5pRtZs/_6Ky_s0u
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Neil,

Today's linux-next build (i386 defconfig) produced these warnings:

drivers/md/md.c: In function 'print_sb_1':
drivers/md/md.c:1678: warning: left shift count >=3D width of type
drivers/md/md.c:1702: warning: left shift count >=3D width of type

Caused by commit 8a11632aeb9ad49bbda3e2c6978b207c6aff1aa8 ("md: need
another print_sb for mdp_superblock_1").

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Mon__24_Nov_2008_17_38_23_+1100_O5pRtZs/_6Ky_s0u
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkkqS98ACgkQjjKRsyhoI8wVyQCgo9E3oZp8pM9rN6ijH/IWU1ck
xoQAoJPN9HBYhPxwVMMvUM3bJ6BpOpJj
=YA+F
-----END PGP SIGNATURE-----

--Signature=_Mon__24_Nov_2008_17_38_23_+1100_O5pRtZs/_6Ky_s0u--
