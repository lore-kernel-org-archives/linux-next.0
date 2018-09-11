From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build failure after merge of the tty tree
Date: Tue, 11 Sep 2018 12:58:57 +1000
Message-ID: <20180911125857.5e5c34f4@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/foV0iHJk4HzcDLCu3i1sJD="; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Greg KH <greg@kroah.com>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Radu Pirea <radu.pirea@microchip.com>, Lee Jones <lee.jones@linaro.org>, Andy Shevchenko <andy.shevchenko@gmail.com>, Rob Herring <robh@kernel.org>, Nicolas Ferre <nicolas.ferre@microchip.com>
List-Id: linux-next.vger.kernel.org

--Sig_/foV0iHJk4HzcDLCu3i1sJD=
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Greg,

After merging the tty tree, today's linux-next build (arm
multi_v7_defconfig) failed like this:

drivers/mfd/at91-usart.c:51:34: error: array type has incomplete element ty=
pe 'struct of_device_id'
 static const struct of_device_id at91_usart_mode_of_match[] =3D {
                                  ^~~~~~~~~~~~~~~~~~~~~~~~
drivers/mfd/at91-usart.c:52:4: error: field name not in record or union ini=
tializer
  { .compatible =3D "atmel,at91rm9200-usart" },
    ^
drivers/mfd/at91-usart.c:52:4: note: (near initialization for 'at91_usart_m=
ode_of_match')
drivers/mfd/at91-usart.c:53:4: error: field name not in record or union ini=
tializer
  { .compatible =3D "atmel,at91sam9260-usart" },
    ^
drivers/mfd/at91-usart.c:53:4: note: (near initialization for 'at91_usart_m=
ode_of_match')
drivers/mfd/at91-usart.c:51:34: warning: 'at91_usart_mode_of_match' defined=
 but not used [-Wunused-variable]
 static const struct of_device_id at91_usart_mode_of_match[] =3D {
                                  ^~~~~~~~~~~~~~~~~~~~~~~~

Caused by commit

  7d3aa342cef7 ("mfd: at91-usart: Add MFD driver for USART")

Forgot to include <linux/mod_devicetable.h>?

I used the version of the tty tree from next-20180910 for today.



--=20
Cheers,
Stephen Rothwell

--Sig_/foV0iHJk4HzcDLCu3i1sJD=
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAluXL3EACgkQAVBC80lX
0Gy2YAgAgxXwbxfVK8DH4mWYZxJxwtGqwFh3ThCeR12IRkYr6NYT3IjfkpUimcS3
hYQ2tBG+FG2o4Q/i3UZUTOTdIKJqkT6d+PjrlpyrshRhfk6EU4J76mJ0CmYLcs1y
Yd6zPeRP+pPt6J788KmcQv/BfsQupMoB2OwvqbkZWWu7DUIDKCnwY81seRCCeze7
kiu+V5GPGf0bPDix003i8hsgM4XpDQbUjdQ5/t+vBxy5iZ4mPVKcW5MY8QTybetc
5q+Jl3nHoZ93Vf7xkLuLbULUgzinbdDvVE3m5aA2TsYCrZXGqsA3bmnlB8AcoohZ
3M7ZifxgenTYd6+fgE/6mkDtqTBOuw==
=zqln
-----END PGP SIGNATURE-----

--Sig_/foV0iHJk4HzcDLCu3i1sJD=--
