From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: kgdb tree build failure
Date: Mon, 4 Jan 2010 16:42:09 +1100
Message-ID: <20100104164209.a5ac8d6a.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Mon__4_Jan_2010_16_42_09_+1100_ykUiEfaTaTQfaFVb"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:53054 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752881Ab0ADFmO (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 4 Jan 2010 00:42:14 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Jason Wessel <jason.wessel@windriver.com>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

--Signature=_Mon__4_Jan_2010_16_42_09_+1100_ykUiEfaTaTQfaFVb
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Jason,

Today's linux-next build (arm realview_defconfig) failed like this:

arch/arm/kernel/traps.c: In function 'die':
arch/arm/kernel/traps.c:260: error: implicit declaration of function 'kgdb_=
die_hook'

Caused by commit a5fdc3c5dddc4eca77e06bc727c2c2cce349a498 ("arm,kgdb: Add
hook to catch an oops with debugger").  CONFIG_KGDB is not set.

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Mon__4_Jan_2010_16_42_09_+1100_ykUiEfaTaTQfaFVb
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEARECAAYFAktBf7EACgkQjjKRsyhoI8zKhgCeNNZRmGyiXLyN1fPyfpd84h42
40MAnRlJbAouVlVMfXAKR0fSiAuejbZv
=UxrB
-----END PGP SIGNATURE-----

--Signature=_Mon__4_Jan_2010_16_42_09_+1100_ykUiEfaTaTQfaFVb--
