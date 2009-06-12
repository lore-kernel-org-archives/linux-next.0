From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: origin tree build failure
Date: Fri, 12 Jun 2009 10:46:07 +1000
Message-ID: <20090612104607.7eaf58dd.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Fri__12_Jun_2009_10_46_07_+1000_SE5ME+YAOy1rER_z"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:41847 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751605AbZFLAqO (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 11 Jun 2009 20:46:14 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Linus <torvalds@linux-foundation.org>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Catalin Marinas <catalin.marinas@arm.com>, Ingo Molnar <mingo@elte.hu>

--Signature=_Fri__12_Jun_2009_10_46_07_+1000_SE5ME+YAOy1rER_z
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next build (x86_64 allmodconfig) failed like this:

mm/built-in.o: In function `kmemleak_scan':
kmemleak.c:(.text+0x3ad27): undefined reference to `_sdata'

Caused by commit 3c7b4e6b8be4c16f1e6e5c558e33b7ff0db2dfaf ("kmemleak: Add
the base support").  It needs commit
4504c6d020fc5aec7659bf7746e71b1b904571f8 ("x86: Provide _sdata in the
vmlinux.lds.S file") from the tip/x86 tree.

I cherry-picked that commit for today.
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Fri__12_Jun_2009_10_46_07_+1000_SE5ME+YAOy1rER_z
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkoxpU8ACgkQjjKRsyhoI8wySACglsSwGKeYAVMZBJnm56Jsu2Y0
ojQAoIsSewlD4QTWcU8dYiIpgw9ql1uI
=EpjN
-----END PGP SIGNATURE-----

--Signature=_Fri__12_Jun_2009_10_46_07_+1000_SE5ME+YAOy1rER_z--
