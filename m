From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: boot-params tree build failure
Date: Wed, 17 Dec 2008 16:55:57 +1100
Message-ID: <20081217165557.b4898a4b.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Wed__17_Dec_2008_16_55_57_+1100_IeNe+hxv2ZYdNod3"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:49177 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751041AbYLQF4P (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 17 Dec 2008 00:56:15 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Rusty Russell <rusty@rustcorp.com.au>
Cc: linux-next@vger.kernel.org, Geert Uytterhoeven <geert@linux-m68k.org>

--Signature=_Wed__17_Dec_2008_16_55_57_+1100_IeNe+hxv2ZYdNod3
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Rusty,

The build of next-20081216 (m68k defconfig) failed like this:

arch/m68k/kernel/setup.c:230: error: conflicting types for '_end'
arch/m68k/kernel/setup.c:215: error: previous declaration of '_end' was here

Caused by commit 0de5c2d9f02d2018fd671ca1015432dffa5eb338 ("param:
arch_get_boot_command_line()") from the poot-params tree.

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Wed__17_Dec_2008_16_55_57_+1100_IeNe+hxv2ZYdNod3
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAklIlG0ACgkQjjKRsyhoI8xOmQCgjCYKawK3LP6Y82qovFpW+x3t
x3AAoKsRFSueRYYvTFzeAsVWNG3xR64o
=2kP8
-----END PGP SIGNATURE-----

--Signature=_Wed__17_Dec_2008_16_55_57_+1100_IeNe+hxv2ZYdNod3--
