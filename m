From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build warning after merge of the pinctrl tree
Date: Mon, 19 May 2014 16:59:47 +1000
Message-ID: <20140519165947.619886fc@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/IcpgeWNROA0=yrn6MrJlGWY"; protocol="application/pgp-signature"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:43222 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750929AbaESG75 (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 19 May 2014 02:59:57 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Maxime Ripard <maxime.ripard@free-electrons.com>

--Sig_/IcpgeWNROA0=yrn6MrJlGWY
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Linus,

After merging the pinctrl tree, today's linux-next build (x86_64
allmodconfig among others) produced this warning:

drivers/pinctrl/sunxi/Kconfig:3:error: recursive dependency detected!
drivers/pinctrl/sunxi/Kconfig:3:	symbol PINCTRL_SUNXI is selected by PINCTR=
L_SUN4I_A10
drivers/pinctrl/sunxi/Kconfig:9:	symbol PINCTRL_SUN4I_A10 default value con=
tains PINCTRL_SUNXI

Introduced by commit 3b582f7e1542 ("pinctrl: sunxi: Enable the pinctrl
Kconfig options by default").

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

--Sig_/IcpgeWNROA0=yrn6MrJlGWY
Content-Type: application/pgp-signature; name=signature.asc
Content-Disposition: attachment; filename=signature.asc

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iQIcBAEBCAAGBQJTeavqAAoJEMDTa8Ir7ZwVs+wP/24Gzjmh3pLSE9bzLrPTVfPF
aIzpEfUOpc+ibpFn4FW9hfLn10Q+pcb1F9ENtswBszxxR380re+1cP+NwGFdzb3M
AK9ITSoLMMOfzMiHyGJ/L8kFo+XSLfDFV1MLQkiuR0r9Qku1BwfNvbbA35DBTWPa
LkhvopLi5a9Ub9ZYtzYXm6YMLQye9U7AejvAQ3Vj/lEtzOuO3uG1I1DErz/M64tz
k+UtZtcfg80fpvR6lNfsUb30NtPIej6EI67GOL3WOmkg29OPZfZbpgDcgnK3BPbE
T2A8psGaJX+Oqy8yMZ2nHzDx6PGT0OuOX16l9i5z8f3RMmt7O37PIZ/atFF/ib3m
G8hmxBmk0pNNtHDraU74sjP4kCeCZuatMqLEEcuMoTG183uDn7M0KR7ZHBV4ORyd
7W+53vVo0WsE03ICnKRADoOm2cDlosrzDB8sSiPLohr3/EyEK1PJy9nGSyy6HK4J
Zum0Jmr/JYTiyds1xgnI07ihA3RJwEngaklHT2QIv2pJC55zdHsO6YZPzL+jk6Fs
jXuZvQtLEjYLsiGuKR0zymfUxrB2h6U03zSo6oC9IpiWdoO7fU3DXzksPdqSEWuM
Tj1qwF8L337jh0oMFORGkPToyiAMEWe6NYqjnCIA/hdyChHyZafL4hkOssLYkqUf
zI0RK7cXWZbXIc6Ij8oP
=x98i
-----END PGP SIGNATURE-----

--Sig_/IcpgeWNROA0=yrn6MrJlGWY--
