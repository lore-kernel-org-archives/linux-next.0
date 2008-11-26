From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: kbuild tree build failure
Date: Wed, 26 Nov 2008 15:42:06 +1100
Message-ID: <20081126154206.31958aed.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Wed__26_Nov_2008_15_42_06_+1100_V/wcGQDpY09tQVpI"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:50945 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752239AbYKZEm0 (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 25 Nov 2008 23:42:26 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Sam Ravnborg <sam@ravnborg.org>
Cc: linux-next@vger.kernel.org

--Signature=_Wed__26_Nov_2008_15_42_06_+1100_V/wcGQDpY09tQVpI
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Sam,

Today's linux-next build (x86_64 allmodconfig) failed like this:

In file included from arch/x86/include/asm/processor.h:15,
                 from include/linux/prefetch.h:14,
                 from include/linux/list.h:6,
                 from include/linux/module.h:9,
                 from kernel/configs.mod.c:1:
arch/x86/include/asm/current.h:23: error: expected '=3D', ',', ';', 'asm' o=
r '__attribute__' before 'struct'

and went rapidly down hill from there.

I have dropped the kbuild tree again.
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Wed__26_Nov_2008_15_42_06_+1100_V/wcGQDpY09tQVpI
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkks054ACgkQjjKRsyhoI8xXTgCeKcfXCQ3K5IfMYTFE5x38zgYO
VaEAn1qBshjyAVSYB1Ki7wLb1ky56Hy/
=rcII
-----END PGP SIGNATURE-----

--Signature=_Wed__26_Nov_2008_15_42_06_+1100_V/wcGQDpY09tQVpI--
