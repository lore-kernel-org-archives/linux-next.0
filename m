From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the net tree
Date: Mon, 8 Dec 2008 14:48:51 +1100
Message-ID: <20081208144851.c02cc7da.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Mon__8_Dec_2008_14_48_51_+1100_m3KKTNI+DZ1nPo9G"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:38023 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1754287AbYLHDtD (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Sun, 7 Dec 2008 22:49:03 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: David Miller <davem@davemloft.net>
Cc: linux-next@vger.kernel.org, Johannes Berg <johannes@sipsolutions.net>, Sam Ravnborg <sam@ravnborg.org>

--Signature=_Mon__8_Dec_2008_14_48_51_+1100_m3KKTNI+DZ1nPo9G
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Dave,

Today's linux-next merge of the net tree got a conflict in
arch/sparc64/kernel/idprom.c between commit
a88b5ba8bd8ac18aad65ee6c6a254e2e74876db3 (sparc,sparc64: unify kernel/"")
from the sparc tree and commit 7c510e4b730a92cecf94ada45c989d8be0200d47
("net: convert more to %pM") from the net tree.

The former renamed the file while the latter modified it.  I just deleted
the renamed file for now, the %pM conversion can be done later.
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Mon__8_Dec_2008_14_48_51_+1100_m3KKTNI+DZ1nPo9G
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkk8mSMACgkQjjKRsyhoI8znIQCggjdDxunjedGBJkFKf5/1Khi0
pHYAoKz+QH9F2tfEdbL0KRlioCHfyoi3
=Vtaz
-----END PGP SIGNATURE-----

--Signature=_Mon__8_Dec_2008_14_48_51_+1100_m3KKTNI+DZ1nPo9G--
