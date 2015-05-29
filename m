From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build warnings after merge of the staging tree
Date: Fri, 29 May 2015 20:40:02 +1000
Message-ID: <20150529204002.1cd0cc0a@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/RgeqIXrDpyvc0gjGTupFn=Y"; protocol="application/pgp-signature"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:54034 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1755481AbbE2KkL (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Fri, 29 May 2015 06:40:11 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Greg KH <greg@kroah.com>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Johnny Kim <johnny.kim@atmel.com>, Guenter Roeck <linux@roeck-us.net>, Arnd Bergmann <arnd@arndb.de>

--Sig_/RgeqIXrDpyvc0gjGTupFn=Y
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Greg,

After merging the staging tree, today's linux-next build (x86_64
allmodconfig) produced a large number of warnings in
drivers/staging/wilc1000.

like:

drivers/staging/wilc1000/wilc_wfi_cfgoperations.c: At top level:
drivers/staging/wilc1000/wilc_wfi_cfgoperations.c:4184:2: warning: initiali=
zation from incompatible pointer type
  .add_station =3D WILC_WFI_add_station,
  ^
drivers/staging/wilc1000/linux_wlan.c: In function 'mac_open':
drivers/staging/wilc1000/linux_wlan.c:2140:51: warning: cast from pointer t=
o integer of different size [-Wpointer-to-int-cast]
    g_linux_wlan->strInterfaceInfo[i].drvHandler =3D (WILC_Uint32)priv->hWI=
LCWFIDrv;
                                                   ^
drivers/staging/wilc1000/host_interface.c:708:59: warning: cast from pointe=
r to integer of different size [-Wpointer-to-int-cast]
  s32Error =3D SendConfigPkt(SET_CFG, &strWID, 1, WILC_TRUE, (WILC_Uint32)p=
strWFIDrv);
                                                           ^

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

--Sig_/RgeqIXrDpyvc0gjGTupFn=Y
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJVaEIIAAoJEMDTa8Ir7ZwVvR4P/1M6H6igkxvWoQNDJsPXDEZd
7kPxqGxQSHEHcHU8Nf8HKzdzKLAg5jW4CgrcBKM1i/lj1vHu67RyIS3l6od+mAjT
4oG8ELxjnS2AsTweAb19GtQnHelUHUYkHiv45LECI4mp48aJH7oOYaWTANAzF2H2
c69XSH59bJNlmKT0PeSQVFoJAWTejGc01wbPbyNUzJmZEK7mf7zSD+kzwKZRySv0
hzM8pDV4XhwwjtCHc8DFky+0bMqKFYDIXivuxAV4F7uWYl3jg0f3LbjjYv5BmUfC
4dBiB6AHQL9UQXTA3cqm3kwr+0nMTOjDCH/dE2eE1sHoDcW+fREU/u+Z2Ypz5XXY
8QT9jeetUUWKPX6QVk0NQ4mTMmEqmwNAcsjqIVwqn09drQHa0h4j1+Xy1qFE+Q3F
o6n5HPJk/6/tPL+0rofTHaUc9tI7uieMjviaWIuTDj40lqA8U7EKcIZUGABwxqA6
B/SnRpjrSQaX20esSMbUYD3B9/l/9yTfp0koyAhDkw+hibi1BYu/RGcqi+pcvKoK
JV4PI6u7XEcMs318f5+n1mUI5FIy85jb1bdAnYtBRtUX4N42ZCdzSO7gGFbM6WIp
Ac7pFnNA+GqHWrFdm6CEBsqIhBKNG5LYE9K806LmDMaOpn73JQ0GLUHoXHKq6B+P
lp8kbaOkcqVZoJWC357m
=XI+g
-----END PGP SIGNATURE-----

--Sig_/RgeqIXrDpyvc0gjGTupFn=Y--
