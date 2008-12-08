From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: ide tree build failure
Date: Mon, 8 Dec 2008 13:16:09 +1100
Message-ID: <20081208131609.c6e0fd31.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Mon__8_Dec_2008_13_16_09_+1100_a9+g=GEVG3AxF2lZ"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:58731 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753300AbYLHCQR (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Sun, 7 Dec 2008 21:16:17 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Bartlomiej Zolnierkiewicz <bzolnier@gmail.com>
Cc: linux-next@vger.kernel.org

--Signature=_Mon__8_Dec_2008_13_16_09_+1100_a9+g=GEVG3AxF2lZ
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Bart,

Today's linux-next build (powerpc ppc64_defconfig) failed like this:

drivers/built-in.o: In function `.ide_cd_do_request':
ide-cd.c:(.text+0x11a97c): undefined reference to `.ide_cd_get_xferlen'
drivers/built-in.o:(.toc1+0x83b8): undefined reference to `ide_cd_expiry'

So I have dropped the ide tree for today.
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Mon__8_Dec_2008_13_16_09_+1100_a9+g=GEVG3AxF2lZ
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkk8g2kACgkQjjKRsyhoI8zrogCgnidyn29cC5NKUzZXpgaMoCPv
tJoAnjct/A+YKxRXijCJpCLTyBvvUT6m
=Ddtl
-----END PGP SIGNATURE-----

--Signature=_Mon__8_Dec_2008_13_16_09_+1100_a9+g=GEVG3AxF2lZ--
