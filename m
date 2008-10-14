From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the timers tree
Date: Tue, 14 Oct 2008 16:51:56 +1100
Message-ID: <20081014165156.7c24eecc.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Tue__14_Oct_2008_16_51_56_+1100_2xkz9721f5b6GOG1"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:46477 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1754660AbYJNHF2 (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 14 Oct 2008 03:05:28 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>
Cc: linux-next@vger.kernel.org, Jason Yeh <jason.yeh@amd.com>

--Signature=_Tue__14_Oct_2008_16_51_56_+1100_2xkz9721f5b6GOG1
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the timers tree got a conflict in
arch/x86/oprofile/nmi_int.c between commit
accba5f3965d6a9d1bf7c1e1a7995d17e9d521b6 ("Merge branch 'linus' into
oprofile-v2") from Linus' tree and commit
1a960b402a51d80abf54e3f8e4972374ffe5f22d ("Oprofile Multiplexing Patch")
from the timers tree.

Also, it looks like commit 0329693bf72584efd84dde19997ee4f0c54f8d57
("Merge branch 'linus' into irq/sparseirq") in the timers tree is a bad
merge and causes anothe conflict with Linus' tree.

I fixed them up using the obvious bits of each.
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Tue__14_Oct_2008_16_51_56_+1100_2xkz9721f5b6GOG1
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkj0M3wACgkQjjKRsyhoI8z3igCgsMclYa5GhFxcpZnl1GI+Rq81
CMIAni0vrmN+7ia9l8f5YBgvM1ws7Sl1
=E8mT
-----END PGP SIGNATURE-----

--Signature=_Tue__14_Oct_2008_16_51_56_+1100_2xkz9721f5b6GOG1--
