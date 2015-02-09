From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build failure after merge of the sound-asoc tree
Date: Mon, 9 Feb 2015 14:36:29 +1100
Message-ID: <20150209143629.6fc92968@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/VtgnQgRMfo_TMKrqkbBDwLb"; protocol="application/pgp-signature"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:50238 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752975AbbBIDgg (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Sun, 8 Feb 2015 22:36:36 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Kenneth Westfield <kwestfie@codeaurora.org>, Banajit Goswami <bgoswami@codeaurora.org>

--Sig_/VtgnQgRMfo_TMKrqkbBDwLb
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the sound-asoc tree, today's linux-next build (x86_64
allmodconfig) failed like this:

In file included from sound/soc/codecs/max98357a.c:15:0:
include/linux/module.h:138:40: error: '__mod_of__max98357a_device_id_device=
_table' aliased to undefined symbol 'max98357a_device_id'
   extern const struct type##_device_id __mod_##type##__##name##_device_tab=
le \
                                        ^
sound/soc/codecs/max98357a.c:138:1: note: in expansion of macro 'MODULE_DEV=
ICE_TABLE'
 MODULE_DEVICE_TABLE(of, max98357a_device_id);
 ^

Caused by commit af5adf129369 ("ASoC: max98357a: Add MAX98357A codec driver=
").

I have added the following fix patch for today.

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Mon, 9 Feb 2015 14:34:40 +1100
Subject: [PATCH] ASoC: max98357a: fix !CONFIG_OF build

Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 sound/soc/codecs/max98357a.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/sound/soc/codecs/max98357a.c b/sound/soc/codecs/max98357a.c
index 98b915314d7a..ac169f9f4329 100644
--- a/sound/soc/codecs/max98357a.c
+++ b/sound/soc/codecs/max98357a.c
@@ -135,4 +135,6 @@ module_platform_driver(max98357a_platform_driver);
 MODULE_DESCRIPTION("Maxim MAX98357A Codec Driver");
 MODULE_LICENSE("GPL v2");
 MODULE_ALIAS("platform:" DRV_NAME);
+#ifdef CONFIG_OF
 MODULE_DEVICE_TABLE(of, max98357a_device_id);
+#endif
--=20
2.1.4

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

--Sig_/VtgnQgRMfo_TMKrqkbBDwLb
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJU2CtBAAoJEMDTa8Ir7ZwVL3IP/2jJ+fxYF4e1IxqmxvmWgXqv
p1yPTMixZoOhci3oeNGYdLTcGZilMFKz1lsrj4VL24je8el/p4CFy1SMzyR+UGeL
lLphna+tPEiiDqFo9tWa+LbWNB3yyc7yah483BxppJQFPyhmVulB9Xjo/5xo/Put
EjsaFxMBNsFdlAf44hzIp9ApC0EhhG8hisflEkuUqH4v5c9eHOzPKYXj0r8D3PvK
JdMe3vpTxGijlo0jQbIR5nLEmEGbVoWuwrOCsGhN+WU8M3hCkJUtX5Jd4rhcZb1L
4b1cqd3RjgHjbu+gQwy3auPkW3aXW8uzC34cawK/vEWni6MG8mqwB9k9wcCQnSCe
2kj05wxHZgM321XYGtTunnGdYY3hITjFrrocPI/+gmbZLWa5Za/FiHxHKZmAjK6K
+gGNbWi2n9wjGWuIyP6jV+syrSuCaAN8qFxdobK1XM0u4Tj99dIsYp/WrSAQPsFn
wLVdRV85JlLeE+p/aXA7l7Ewp4GCJfcf5mqp3vcv/w+A9wNQ2r0HJWJiB2ZOq/Qw
nt/6VTOoGpr+ewiA6nP9rKfDi2LebyP6U+Cl7ZTw1Lbj5a4WCfup5sxhnOr2YfAP
n5C7DjtAYJclFnEUZ2XvbO2Cv8CJwhwkwpmB/cuYyXdVsAdyy20i8ErIKJDR6pra
x8C12rVSK4DohzeWOcqy
=rHYS
-----END PGP SIGNATURE-----

--Sig_/VtgnQgRMfo_TMKrqkbBDwLb--
