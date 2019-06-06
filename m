From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build warning after merge of the hwmon-staging tree
Date: Thu, 6 Jun 2019 10:34:30 +1000
Message-ID: <20190606103430.74fd20f2@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/9Cdgb7hx.tTijwoz1+CEvz9"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Guenter Roeck <linux@roeck-us.net>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Krzysztof Adamski <krzysztof.adamski@nokia.com>, Alexander Sverdlin <alexander.sverdlin@nokia.com>
List-Id: linux-next.vger.kernel.org

--Sig_/9Cdgb7hx.tTijwoz1+CEvz9
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the hwmon-staging tree, today's linux-next build (x86_64
allmodconfig) produced this warning:

drivers/hwmon/pmbus/adm1275.c: In function 'adm1275_write_pmon_config':
drivers/hwmon/pmbus/adm1275.c:179:23: warning: unused variable 'data' [-Wun=
used-variable]
  struct adm1275_data *data =3D to_adm1275_data(info);
                       ^~~~

Introduced by commit

  438318513375 ("hwmon: (pmbus/adm1275) support PMBUS_VIRT_*_SAMPLES")

--=20
Cheers,
Stephen Rothwell

--Sig_/9Cdgb7hx.tTijwoz1+CEvz9
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlz4X5YACgkQAVBC80lX
0Gy3pggAg48LSZEwJebd/U5f1t5qtcKCS8AFR0oh8ih2l9IH1GUJI06zuANxEsNO
i1dN13XbK74e5HbG+4WtG9ga3NZnLBmpHUAzKcPlsjN8UxFxwwuIvnzv3hpDo0Z6
ArPolFacivIY3T2suBIY2vBZ5pK9747ZSqpLs20ylgbsovN1x45c3c5sFlMPe77F
JJ5ahPFfkBwfppLqZlETugnAwIsQVELsx1ttC2uW2CC4HP9CdVp8JxqbisK5qGXR
6tYGGGwgwc0ZGclFSJWCXDuah/Bc3e+TRQmbmFTCxNupE3nLQvJdiKrZP0qUJUPq
E+BssmFMpTOyG7dTxxp8Di5WxpaULQ==
=jaZm
-----END PGP SIGNATURE-----

--Sig_/9Cdgb7hx.tTijwoz1+CEvz9--
