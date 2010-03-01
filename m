From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build warning after merge of the drm tree
Date: Mon, 1 Mar 2010 18:14:52 +1100
Message-ID: <20100301181452.9efa3661.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Mon__1_Mar_2010_18_14_52_+1100_+6eyE0/gS3dy4+hu"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:39792 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750733Ab0CAHO7 (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 1 Mar 2010 02:14:59 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Dave Airlie <airlied@linux.ie>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Pauli Nieminen <suokkos@gmail.com>

--Signature=_Mon__1_Mar_2010_18_14_52_+1100_+6eyE0/gS3dy4+hu
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Dave,

After merging the drm tree, today's linux-next build (x86_64 allmodconfig)
produced this warning:

drivers/gpu/drm/radeon/r300_cmdbuf.c: In function 'r300_do_cp_cmdbuf':
drivers/gpu/drm/radeon/r300_cmdbuf.c:1154: warning: format '%d' expects typ=
e 'int', but argument 4 has type 'long unsigned int'

Introduced by commit b4fe945405e477cded91772b4fec854705443dd5
("drm/radeon: Fix memory allocation failures in the preKMS command stream
checking").

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Mon__1_Mar_2010_18_14_52_+1100_+6eyE0/gS3dy4+hu
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEARECAAYFAkuLaWwACgkQjjKRsyhoI8x/WgCeItglYu7tTlRdvCa3vkrlPS0m
A78AoKUhW2ipf+gQYL+phVCEDzNj6Gq5
=Zmnm
-----END PGP SIGNATURE-----

--Signature=_Mon__1_Mar_2010_18_14_52_+1100_+6eyE0/gS3dy4+hu--
