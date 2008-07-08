From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the net tree
Date: Tue, 8 Jul 2008 14:10:04 +1000
Message-ID: <20080708141004.4a0aef3c.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Tue__8_Jul_2008_14_10_04_+1000_8TLKUJHd496qFMcJ"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:40200 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750810AbYGHEKP (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 8 Jul 2008 00:10:15 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: David Miller <davem@davemloft.net>
Cc: linux-next@vger.kernel.org, Francois Romieu <romieu@fr.zoreil.com>, Jeff Garzik <jgarzik@redhat.com>, Ingo Molnar <mingo@elte.hu>, Cyrill Gorcunov <gorcunov@gmail.com>

--Signature=_Tue__8_Jul_2008_14_10_04_+1000_8TLKUJHd496qFMcJ
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi David,

Today's linux-next merge of the net tree got a conflict in
arch/x86/configs/x86_64_defconfig between commits
5cb04df8d3f03e37a19f2502591a84156be71772 ("x86: defconfig updates") and
622e3f28e50fe30cc199c735440cd7c75e0033b0 ("x86: 64-bit defconfig remake")
from the x86 tree and commit e84e1dcea0ead6cea0fc55b949a7f018727e93c3
("netdev: remove unused S2IO_NAPI") and
768cea593522d816b374149f3bf35e7c246fc8d0 ("amd8111e: delete non NAPI code
from the driver") from the net tree.

I thought we didn't do defconfig updates for things like this as just
running "make oldconfig" should have the same effect ... I used the
version from the x86 tree.

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Tue__8_Jul_2008_14_10_04_+1000_8TLKUJHd496qFMcJ
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkhy6JwACgkQjjKRsyhoI8xNiwCgjaQQjtQ8sWnDRynwMICikJMO
NlEAmwSiDD3BJiQAw/EMEjWJ84jt86SM
=H4KP
-----END PGP SIGNATURE-----

--Signature=_Tue__8_Jul_2008_14_10_04_+1000_8TLKUJHd496qFMcJ--
