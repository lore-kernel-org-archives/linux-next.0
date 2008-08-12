From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: creds build failure
Date: Tue, 12 Aug 2008 18:29:39 +1000
Message-ID: <20080812182939.9665a435.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Tue__12_Aug_2008_18_29_39_+1000_jBZ.NBGXZ2hlt5qG"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:46784 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751575AbYHLIaB (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 12 Aug 2008 04:30:01 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: David Howells <dhowells@redhat.com>
Cc: James Morris <jmorris@namei.org>, linux-next@vger.kernel.org, "Luck, Tony" <tony.luck@intel.com>

--Signature=_Tue__12_Aug_2008_18_29_39_+1000_jBZ.NBGXZ2hlt5qG
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi David,

The linux-next build for 20080811 failed (ia64 defconfig) like this (and
I am pretty sure today's will as well):

arch/ia64/kernel/perfmon.c:2410: error: structure has no member named `euid'
arch/ia64/kernel/perfmon.c:2410: error: structure has no member named `suid'
arch/ia64/kernel/perfmon.c:2410: error: structure has no member named `uid'
arch/ia64/kernel/perfmon.c:2410: error: structure has no member named `egid'
arch/ia64/kernel/perfmon.c:2410: error: structure has no member named `sgid'
arch/ia64/kernel/perfmon.c:2419: error: structure has no member named `euid'
arch/ia64/kernel/perfmon.c:2420: error: structure has no member named `suid'
arch/ia64/kernel/perfmon.c:2421: error: structure has no member named `uid'
arch/ia64/kernel/perfmon.c:2422: error: structure has no member named `egid'
arch/ia64/kernel/perfmon.c:2423: error: structure has no member named `sgid'
arch/ia64/kernel/perfmon.c:2424: error: structure has no member named `gid'
arch/ia64/kernel/perfmon.c:2424: error: syntax error before ')' token
arch/ia64/ia32/sys_ia32.c:2092: error: structure has no member named `group=
_info'
arch/ia64/ia32/sys_ia32.c:2093: error: structure has no member named `group=
_info'
arch/ia64/ia32/sys_ia32.c:2099: error: structure has no member named `group=
_info'
arch/ia64/ia32/sys_ia32.c:2105: error: structure has no member named `group=
_info'

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Tue__12_Aug_2008_18_29_39_+1000_jBZ.NBGXZ2hlt5qG
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkihSfMACgkQjjKRsyhoI8ximwCgtf6/UQ62aYOrGyaIqCYGu/AM
MNsAn0WGyV2jnNcoWmiaPAfaw/G4ARgz
=sB7s
-----END PGP SIGNATURE-----

--Signature=_Tue__12_Aug_2008_18_29_39_+1000_jBZ.NBGXZ2hlt5qG--
