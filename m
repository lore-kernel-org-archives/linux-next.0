From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: ide tree build failure
Date: Thu, 22 Jan 2009 12:57:00 +1100
Message-ID: <20090122125700.bde1fabe.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Thu__22_Jan_2009_12_57_00_+1100_J5BeBH/L=T8OcUgM"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:55667 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1755218AbZAVB5I (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 21 Jan 2009 20:57:08 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Bartlomiej Zolnierkiewicz <bzolnier@gmail.com>
Cc: linux-next@vger.kernel.org

--Signature=_Thu__22_Jan_2009_12_57_00_+1100_J5BeBH/L=T8OcUgM
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Bart,

Today's linux-next build (powerpc ppc64_defconfig) failed like this:

drivers/ide/ide-eh.c: In function 'do_reset1':
drivers/ide/ide-eh.c:341: error: implicit declaration of function 'ndelay'

The immediate cause is commit 891ac63a7b4e11f13cfdbef59c77d489edd8e0ba
("ide: move error handling code to ide-eh.c").

I have dropped the ide tree for today.
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Thu__22_Jan_2009_12_57_00_+1100_J5BeBH/L=T8OcUgM
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkl30mwACgkQjjKRsyhoI8zfRQCggMr8X8v+sLqOHuh8vo+jyq79
HSkAn1JZHU60MnWopF6wK/usUVrOMly3
=HovH
-----END PGP SIGNATURE-----

--Signature=_Thu__22_Jan_2009_12_57_00_+1100_J5BeBH/L=T8OcUgM--
