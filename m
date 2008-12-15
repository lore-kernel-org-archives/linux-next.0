From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: boot-params tree build failure
Date: Tue, 16 Dec 2008 00:20:48 +1100
Message-ID: <20081216002048.be5b36bf.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Tue__16_Dec_2008_00_20_48_+1100_heUivFWq2L82oScO"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:45729 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751154AbYLONUz (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 15 Dec 2008 08:20:55 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Rusty Russell <rusty@rustcorp.com.au>
Cc: linux-next@vger.kernel.org

--Signature=_Tue__16_Dec_2008_00_20_48_+1100_heUivFWq2L82oScO
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Rusty,

Today's linux-next build (powerpc ppc64_defconfig) failed like this:

arch/powerpc/kernel/setup_64.c:516: error: conflicting types for 'setup_arc=
h'
include/linux/init.h:153: error: previous declaration of 'setup_arch' was h=
ere

I dropped the boot-params tree for today.
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Tue__16_Dec_2008_00_20_48_+1100_heUivFWq2L82oScO
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAklGWbAACgkQjjKRsyhoI8xvHwCZAf609kYL0QFMLJ1GjEkvNLVu
6skAnjDBn3phgsO4uvyVq87SRzK5BZpw
=rz9F
-----END PGP SIGNATURE-----

--Signature=_Tue__16_Dec_2008_00_20_48_+1100_heUivFWq2L82oScO--
