From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: dwmw2 tree build failure
Date: Thu, 4 Sep 2008 10:51:52 +1000
Message-ID: <20080904105152.f82ed9e5.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Thu__4_Sep_2008_10_51_52_+1000_qqz/t+8eX5KUanN3"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:54580 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751784AbYIDAwJ (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 3 Sep 2008 20:52:09 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: David Woodhouse <dwmw2@infradead.org>
Cc: linux-next@vger.kernel.org

--Signature=_Thu__4_Sep_2008_10_51_52_+1000_qqz/t+8eX5KUanN3
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi David,

Today's linux-next build (/scratch/sfr/x86_64_allmodconfig/Makefile) failed=
 like this:

arch/x86/kernel/early-quirks.c: In function 'intel_g33_dmar':
arch/x86/kernel/early-quirks.c:102: error: syntax error before '=3D' token
arch/x86/kernel/early-quirks.c:104: error: 'status' undeclared (first use i=
n this function)
arch/x86/kernel/early-quirks.c:107: error: 'dmar_disabled' undeclared (firs=
t use in this function)

Introduced by commit 1bc3029e516e62baa14318888985075f3f3a9f7e ("Blacklist
DMAR on Intel G31/G33 chipsets").  I have reverted that commit.

Please, at least build test this stuff. :-(
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Thu__4_Sep_2008_10_51_52_+1000_qqz/t+8eX5KUanN3
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAki/MSgACgkQjjKRsyhoI8wPOwCfQWVs2PpcU8gXImT1VAuZ8gOZ
VIIAoItI4YLENqUG2Fki+H12KLgWdli9
=EeT5
-----END PGP SIGNATURE-----

--Signature=_Thu__4_Sep_2008_10_51_52_+1000_qqz/t+8eX5KUanN3--
