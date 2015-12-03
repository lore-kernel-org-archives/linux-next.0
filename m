From: Mark Brown <broonie@kernel.org>
Subject: linux-next: manual merge of the mac80211-next tree with the
 mac80211 tree
Date: Thu, 3 Dec 2015 11:28:31 +0000
Message-ID: <20151203112831.9800fd1675c04b69c1324cbb@kernel.org>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA256";
 boundary="Signature=_Thu__3_Dec_2015_11_28_31_+0000_3.hkvfikR6UTnRXr"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mezzanine.sirena.org.uk ([106.187.55.193]:58847 "EHLO
	mezzanine.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932971AbbLCL2n (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 3 Dec 2015 06:28:43 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Johannes Berg <johannes@sipsolutions.net>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

--Signature=_Thu__3_Dec_2015_11_28_31_+0000_3.hkvfikR6UTnRXr
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Johannes,

Today's linux-next merge of the mac80211-next tree got a conflict in
net/mac80211/cfg.c between commit c1df932c0574 ("mac80211: fix off-channel
mgmt-tx uninitialized variable usage") from the mac80211 tree and commit
a2aecd7d96ba ("mac80211: move off-channel/mgmt-tx code to offchannel.c") fr=
om
the mac80211-next tree.

I fixed it up resulting in an empty diff and can carry the fix as necessary=
 (no
action is required).

--Signature=_Thu__3_Dec_2015_11_28_31_+0000_3.hkvfikR6UTnRXr
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAEBCAAGBQJWYCdfAAoJECTWi3JdVIfQV4gH/1G5jKRnjmSKvCVOF3HWFOcU
BRU0MV9CEuCnFoPGypjsL5wo2ifDQt0L6ZpmiHsIP5LARzlxGurJgAgt+XxiZJYg
gYk7+InrICfkcKxSKjZWUNIvQy/ZC7KTvUNONQgDxUpoPLufSJiTRAI0ey/VUhGg
PvOBVGM6dFCi3aBz1yG05BgrLTElMjuRc28VIcKpuDC4ltDjWoDY1VGVatpKXBXz
+lCoYftm1RAoN8v3wHgJXZllDbTrrHMjLnbeaT2ab3sBU63EXmfLQ8lN8WwUqcg0
7+VcB3c1bGQrfqSuy17GOe3L/CD8iY8KLGxsFVBDY4/pUa5JbzSDuTEc3mqO6Y4=
=Ve1r
-----END PGP SIGNATURE-----

--Signature=_Thu__3_Dec_2015_11_28_31_+0000_3.hkvfikR6UTnRXr--
