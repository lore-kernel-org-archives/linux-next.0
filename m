From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build warnings after merge of the regmap tree
Date: Wed, 27 Mar 2013 15:47:37 +1100
Message-ID: <20130327154737.bdcc835ec2ea56409fa0c7e8@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA256";
 boundary="Signature=_Wed__27_Mar_2013_15_47_37_+1100_w9yPwZvw3.f_c=qC"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from haggis.pcug.org.au ([203.10.76.10]:41899 "EHLO
	members.tip.net.au" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752484Ab3C0Ers (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 27 Mar 2013 00:47:48 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Mark Brown <broonie@opensource.wolfsonmicro.com>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

--Signature=_Wed__27_Mar_2013_15_47_37_+1100_w9yPwZvw3.f_c=qC
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Mark,

After merging the regmap tree, today's linux-next build (x86_64
allmodconfig) produced these warnings:

In file included from drivers/base/regmap/regmap.c:24:0:
drivers/base/regmap/internal.h: In function 'regcache_get_val_addr':
drivers/base/regmap/internal.h:196:2: warning: return discards 'const' qual=
ifier from pointer target type [enabled by default]
In file included from drivers/base/regmap/regcache.c:20:0:
drivers/base/regmap/internal.h: In function 'regcache_get_val_addr':
drivers/base/regmap/internal.h:196:2: warning: return discards 'const' qual=
ifier from pointer target type [enabled by default]
In file included from drivers/base/regmap/regcache-rbtree.c:19:0:
drivers/base/regmap/internal.h: In function 'regcache_get_val_addr':
drivers/base/regmap/internal.h:196:2: warning: return discards 'const' qual=
ifier from pointer target type [enabled by default]
In file included from drivers/base/regmap/regcache-lzo.c:17:0:
drivers/base/regmap/internal.h: In function 'regcache_get_val_addr':
drivers/base/regmap/internal.h:196:2: warning: return discards 'const' qual=
ifier from pointer target type [enabled by default]
In file included from drivers/base/regmap/regcache-flat.c:17:0:
drivers/base/regmap/internal.h: In function 'regcache_get_val_addr':
drivers/base/regmap/internal.h:196:2: warning: return discards 'const' qual=
ifier from pointer target type [enabled by default]
In file included from drivers/base/regmap/regmap-debugfs.c:19:0:
drivers/base/regmap/internal.h: In function 'regcache_get_val_addr':
drivers/base/regmap/internal.h:196:2: warning: return discards 'const' qual=
ifier from pointer target type [enabled by default]
In file included from drivers/base/regmap/regmap-spi.c:18:0:
drivers/base/regmap/internal.h: In function 'regcache_get_val_addr':
drivers/base/regmap/internal.h:196:2: warning: return discards 'const' qual=
ifier from pointer target type [enabled by default]
In file included from drivers/base/regmap/regmap-irq.c:22:0:
drivers/base/regmap/internal.h: In function 'regcache_get_val_addr':
drivers/base/regmap/internal.h:196:2: warning: return discards 'const' qual=
ifier from pointer target type [enabled by default]

Introduced by commit 45c6a3e449ea ("regmap: cache: Provide a get address
of value operation").

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

--Signature=_Wed__27_Mar_2013_15_47_37_+1100_w9yPwZvw3.f_c=qC
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAEBCAAGBQJRUnnpAAoJEECxmPOUX5FESsUP/jOsu2qTSrFgV5HdUgyBCBG0
c6c1/d0sh6sj6+jAQNgZidzkEJaZZngDdBM+jcVugP6UrYGapX0x/fqiv0C7KRG6
wXifEVL41mR/9EVA2HYb+EAWgbCsGILUDvIC0HUhFfPyBifRTb3EpWv/IQfn9I9N
mkU5XHLbHytc/3tisJg9FNJ5/90Y4+aB0GZNReo/G8YS0bdof4PtYBXEsKKG5jQ9
2brHCFlBvSZX+ijgktiU2sZ7ZCvhjGbryo1USRMaKF6tUSNScd7SOnbNvHm/4K9m
fv1qHaBu3FcMMu/xH0KKrUma3uesOkzzV9AahOXmNcazfb+glpvppnVp2MKsCQiQ
53RtCXlEy3IugMbkExZ3l4JrM63DqFFSgdNAcAufRyNca/b0m4c4BM4+OOietLNZ
HlCDLJ/anfI29xnlpZf2Zg+84Gy2bXFTVL41+84X5HBBuVGrqtvVZTUD7UA7bppw
0YKw6JoAld4mhJW+kSTT+9IO2f2aTnJ/p9kYbZ24gyktogItoieuEeUmGoTRHQCN
DSH2lD38NROpouGlWdJkQKNSeuiam0AkPYoJ0SIKj2gdHr33yZP8dIAM9GddOPgO
SnemvAvHRadeXBYciicadI1oDjsADK2vCQeJDQzTubKjJPg3dO+b06//UgBLSe00
p8zKZlT9bdamUwWfleRE
=sojs
-----END PGP SIGNATURE-----

--Signature=_Wed__27_Mar_2013_15_47_37_+1100_w9yPwZvw3.f_c=qC--
