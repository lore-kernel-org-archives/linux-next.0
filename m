From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the sunxi tree with the samsung tree
Date: Wed, 20 May 2015 10:31:39 +1000
Message-ID: <20150520103139.14600def@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/p9kqnKVQqHPmy82mOsqo4Wz"; protocol="application/pgp-signature"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:48598 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751203AbbETAbq (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 19 May 2015 20:31:46 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Maxime Ripard <maxime.ripard@free-electrons.com>, Kukjin Kim <kgene.kim@samsung.com>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Timo Sigurdsson <public_timo.s@silentcreek.de>

--Sig_/p9kqnKVQqHPmy82mOsqo4Wz
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Maxime,

Today's linux-next merge of the sunxi tree got a conflict in
arch/arm/configs/multi_v7_defconfig between commit 6d718eeef2c9 ("ARM:
multi_v7_defconfig: make savedefconfig for removing useless configs")
from the samsung tree and commit 51d275281c06 ("ARM: Remove deprecated
symbol from defconfig files") from the sunxi tree.

I fixed it up (they both removed CONFIG_POWER_RESET_SUN6I) and can
carry the fix as necessary (no action is required).

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

--Sig_/p9kqnKVQqHPmy82mOsqo4Wz
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJVW9XvAAoJEMDTa8Ir7ZwVWsoP/0UBD2kl8pWnA5wZ+uCIvNUd
LVglALpyvMLHSrm0qixZTFRP6zfPPVHxmqMnGb/b1owveL1XlNMipO4+X715EktE
ulYmeLMxyBEAM6ei9kk1VjwVP9iFKhMNcOGVY273ikCw4j3pc+wr29QPHI6Gn+Y9
8dB3JovFwk2QOfHjU1CQgHu1VsdFip62JQDp7E9/iymcoe5I84aW/Zbr+FCoS3XU
sI77IoVqxHosYtCIV4loxbp94VMD9GZefQuN9sKcHOxiFJhyUimdeOWdzgfJmxJ2
r34vU/53M5Wbml+tufoH2+DGFPsGJ2bIsP7wE//df1cycjAhyDm420a9d6+jSJMr
/lBU8ozbxNHQCAppx05LXraRpm2T37XxgNPAWrJJo/m5E71w0g6lIyHUPj4Zwy+8
9ydWTrZ+Y4t8TBgpGE+3XtcOR0xooipJ1F6jiYsewKqfyEb61tR2hklIzHJMvsZ4
GrD5up+GDYtp/usW06ohzGz97QI/FDkLFZheemECSvudaJNO6pSHUchREEMGmaa9
xctSlhD04xJxihIzjF1ckATdiFNMQXriZ06JT9ppcSMZm3zZ0AU0NgmE1CCAE8ri
TCY7zwYrEPQuCRwpwf/1ZGwjntBG8a22afGkkpFooBDyaNi5BUJfOy7UhpKqP8La
Vcmx4kKO6on07DYLZq/R
=Ghho
-----END PGP SIGNATURE-----

--Sig_/p9kqnKVQqHPmy82mOsqo4Wz--
