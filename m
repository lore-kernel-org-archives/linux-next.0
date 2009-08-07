From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the net tree with Linus' tree
Date: Fri, 7 Aug 2009 11:58:36 +1000
Message-ID: <20090807115836.f559986f.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Fri__7_Aug_2009_11_58_36_+1000_CcqVjbK827.Es2Tw"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:46353 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752485AbZHGB6s (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 6 Aug 2009 21:58:48 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: David Miller <davem@davemloft.net>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>, Jan Engelhardt <jengelh@medozas.de>, Michal Simek <monstr@monstr.eu>

--Signature=_Fri__7_Aug_2009_11_58_36_+1000_CcqVjbK827.Es2Tw
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Dave,

Today's linux-next merge of the net tree got a conflict in
arch/microblaze/include/asm/socket.h between commit
81d8279ea31a3fc6d4ffacd87119a04c561ca62e ("microblaze: fall back on
generic header files for the ABI") from Linus' tree and commits
49c794e94649020248e37b78db16cd25bad38b4f ("net: implement a SO_PROTOCOL
getsockoption") and 0d6038ee76f2e06b79d0465807f67e86bf4025de ("net:
implement a SO_DOMAIN getsockoption") from the net tree.

The former commit supercedes the latter ones, so I used that version.
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Fri__7_Aug_2009_11_58_36_+1000_CcqVjbK827.Es2Tw
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkp7ik0ACgkQjjKRsyhoI8yBLACggC+NU9XSRAL1kbns3b4BqB/D
DPUAnjIbTuqPQdHZEYmreWy6FG1ORh1S
=pjOV
-----END PGP SIGNATURE-----

--Signature=_Fri__7_Aug_2009_11_58_36_+1000_CcqVjbK827.Es2Tw--
