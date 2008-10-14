From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the x86 tree
Date: Tue, 14 Oct 2008 13:23:15 +1100
Message-ID: <20081014132315.aac4a97a.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Tue__14_Oct_2008_13_23_15_+1100_1yqOurF77ny/jXTi"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:40583 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1755496AbYJNC1N (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 13 Oct 2008 22:27:13 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>
Cc: linux-next@vger.kernel.org, Suresh Siddha <suresh.b.siddha@intel.com>

--Signature=_Tue__14_Oct_2008_13_23_15_+1100_1yqOurF77ny/jXTi
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the x86 tree got a conflict in
arch/x86/mm/init_64.c between commit
b27a43c1e90582facad44de67d02bc9e9f900289 ("x86, cpa: make the kernel
physical mapping initialization a two pass sequence") from Linus' tree
and commit 065ae73c5462d42e9761afb76f2b52965ff45bd6 ("x86, cpa: make the
kernel physical mapping initialization a two pass sequence") from the x86
tree.

The former is clearly a fixed version of the latter, but I cannot easily
see how to resolve them given other changes to this file in both trees.
I think my only option (given time constraints) is to drop the x86 tree
for today in the hope that it will be fixed by those who understand the
code.

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Tue__14_Oct_2008_13_23_15_+1100_1yqOurF77ny/jXTi
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkj0ApMACgkQjjKRsyhoI8yDGgCgpCyQwnRq3DRmykWHiI/npxYN
sw8AoLuPs11sX76zYOWlv6NURvEWt3cS
=V+/R
-----END PGP SIGNATURE-----

--Signature=_Tue__14_Oct_2008_13_23_15_+1100_1yqOurF77ny/jXTi--
