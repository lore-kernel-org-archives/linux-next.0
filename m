From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build failure after merge of the arm-soc tree
Date: Tue, 7 Apr 2015 11:12:17 +1000
Message-ID: <20150407111217.2b2cf440@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/PR5PRFiUUZKX2dV3._aGRnc"; protocol="application/pgp-signature"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:33483 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752687AbbDGBM0 (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 6 Apr 2015 21:12:26 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Olof Johansson <olof@lixom.net>, Arnd Bergmann <arnd@arndb.de>, linux-arm-kernel@lists.infradead.org
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Hongzhou Yang <hongzhou.yang@mediatek.com>, Matthias Brugger <matthias.bgg@gmail.com>, Linus Walleij <linus.walleij@linaro.org>

--Sig_/PR5PRFiUUZKX2dV3._aGRnc
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the arm-soc tree, today's linux-next build (arm
multi_v7_defconfig) failed like this:

In file included from arch/arm/boot/dts/mt8135.dtsi:18:0,
                 from arch/arm/boot/dts/mt8135-evbp1.dts:16:
arch/arm/boot/dts/mt8135-pinfunc.h:18:40: fatal error: dt-bindings/pinctrl/=
mt65xx.h: No such file or directory
 #include <dt-bindings/pinctrl/mt65xx.h>
                                        ^

Caused by commit e6f219b8ec5e ("ARM: dts: mt8135: Add pinctrl/GPIO/EINT
node for mt8135").

I have reverted that commit for today.
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

--Sig_/PR5PRFiUUZKX2dV3._aGRnc
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJVIy72AAoJEMDTa8Ir7ZwVfNEP/2O5nvmPuvY2NZzXX7zQJBde
ANbsCCTepunDhv+WXF034Wh4ceZuIaZ9tauLx5EFCMna/jAk03h9/rlq8AYxMVHV
vC7ZWe7fzy6jjqzdhDwh27+IU+JaXY3nUR7xX16wLMes4bksCbFSya3GeM7v5mqz
33DzDIH83u3tPqP/s4W64+GSA6ihuv3uLtMGKi8djs8FMBELvq816Cql6m4dOa/W
9VGsM+YMzo3KoYOR2cdD5rOC7TYeWqCmWZ/PgicGbebJPw64gq+/2zXdoLl5QdQc
LWX9Qtmt796mOjZaPWWlKNxebTv021edZolWPcf4Zz3Eo2g7Xj7byL8J7YMLKknq
Ik/aIVVj5Y5H6VHCSjQTAaoHtS0YHT6GN47dJcGT/Z8f6rD0eKEruvhSPrZ8mpki
uDhKXpEwN1jcLQXfkBaPJOdABKCPeMMwVfTKbSgRpyS5zP2bOfOXdNAwZnU+40zU
pM59qtTui0d+go7wnmj0EHSaB3yG2IhitVP9dAY8k6dybFaf5IyLfaAzLVw8ur5P
jD4u6kw3/bH0MAVfMvufLQBX44iTMGreItEInCfBqSSkehJSx852hMLOBjgX49L6
+kucA2GpPkFe+Hi8aB1VYWvOm9hfiuzEXEkvSqR+WZKIBbotoKMxuQgOoY56BCli
GFFuq7ohYEORs+/cfCJ3
=7toV
-----END PGP SIGNATURE-----

--Sig_/PR5PRFiUUZKX2dV3._aGRnc--
