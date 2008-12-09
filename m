From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: avr32 build failure
Date: Tue, 9 Dec 2008 17:40:43 +1100
Message-ID: <20081209174043.966eda84.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Tue__9_Dec_2008_17_40_43_+1100_9rVIXX0u2TC+DJQJ"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:57535 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751769AbYLIGkz (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 9 Dec 2008 01:40:55 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Rusty Russell <rusty@rustcorp.com.au>
Cc: linux-next@vger.kernel.org, Haavard Skinnemoen <hskinnemoen@atmel.com>

--Signature=_Tue__9_Dec_2008_17_40_43_+1100_9rVIXX0u2TC+DJQJ
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Rusty,

The linux-next build (avr32 defconfig) failed like this:

arch/avr32/lib/lib.a(findbit.o): In function `generic_find_next_le_bit':
arch/avr32/lib/findbit.S:(.text+0xa6): multiple definition of `generic_find=
_next_le_bit'
lib/lib.a(find_next_bit.o):find_next_bit.c:(.text+0x58): first defined here
arch/avr32/lib/lib.a(findbit.o): In function `generic_find_next_zero_le_bit=
':
arch/avr32/lib/findbit.S:(.text+0xde): multiple definition of `generic_find=
_next_zero_le_bit'
lib/lib.a(find_next_bit.o):find_next_bit.c:(.text+0x144): first defined here

Caused by commit 9c5b94713eeadb030a3c72f7bfb07d7695f75699
("bitmap:find_last_bit") which caused lib/find_next_bit.o to be built
where it would not have been before.
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Tue__9_Dec_2008_17_40_43_+1100_9rVIXX0u2TC+DJQJ
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkk+EusACgkQjjKRsyhoI8wZugCeP+nPdwPRXsWuB9Ft0QhcFfiH
ZzAAoJxK0sh8FcCkYfzpvO4QDVKyZQ5B
=rhm5
-----END PGP SIGNATURE-----

--Signature=_Tue__9_Dec_2008_17_40_43_+1100_9rVIXX0u2TC+DJQJ--
