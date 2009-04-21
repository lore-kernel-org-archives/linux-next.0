From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: cris build failure
Date: Tue, 21 Apr 2009 13:58:43 +1000
Message-ID: <20090421135843.0993cb89.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Tue__21_Apr_2009_13_58_43_+1000_GQDG6QHgdA98Kvov"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:54029 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751091AbZDUD6y (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 20 Apr 2009 23:58:54 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Jesper Nilsson <jesper.nilsson@axis.com>
Cc: linux-next@vger.kernel.org

--Signature=_Tue__21_Apr_2009_13_58_43_+1000_GQDG6QHgdA98Kvov
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Jesper,=20

Having figured out that I needed a crisv32 compiler (not a cris one) to
build the kernel, I now get this error:

  LD      arch/cris/arch-v32/boot/rescue/rescue.o
/bin/sh: gcc-cris: command not found
make[3]: *** [arch/cris/arch-v32/boot/rescue/rescue.o] Error 127

arch/cris/arch-v32/boot/rescue/Makefile has an explicit reference to
gcc-cris.  Surely there is some better way specify this.  I created a
symlink for gcc-cris to my crisv32 cross compiler and that allowed the
kernel to finish building, but that is not a very nice solution.
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Tue__21_Apr_2009_13_58_43_+1000_GQDG6QHgdA98Kvov
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkntRHMACgkQjjKRsyhoI8xQkQCdFU0Swv2+e6RDD7gqWyaEy5rb
2UQAnRZEpfhDVgqxqt3pVPvPkJRTpdcz
=crB9
-----END PGP SIGNATURE-----

--Signature=_Tue__21_Apr_2009_13_58_43_+1000_GQDG6QHgdA98Kvov--
