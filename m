From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build failure after merge of the spi tree
Date: Tue, 7 Apr 2015 16:49:15 +1000
Message-ID: <20150407164915.6e2a88e0@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/mjoi=PlPEygq1LD3ian=4=u"; protocol="application/pgp-signature"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:35290 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751162AbbDGGtW (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 7 Apr 2015 02:49:22 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Mark Brown <broonie@kernel.org>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Aaron Brice <aaron.brice@datasoft.com>

--Sig_/mjoi=PlPEygq1LD3ian=4=u
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Mark,

After merging the spi tree, today's linux-next build (x86_64 allmodconfig)
failed like this:

drivers/spi/spi-fsl-dspi.c: In function 'dspi_setup':
drivers/spi/spi-fsl-dspi.c:395:2: error: implicit declaration of function '=
ns_delay_scale' [-Werror=3Dimplicit-function-declaration]
  ns_delay_scale(&pcssck, &cssck, cs_sck_delay, clkrate);
  ^

Caused by commit f9d9c83fcf09 ("Merge branch 'fix/fsl-dspi' of
git://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi into
spi-fsl-dspi") which removed the function that was added (and
referenced) in one of its parents.

I have used the spi tree from next-20150402 for today.
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

--Sig_/mjoi=PlPEygq1LD3ian=4=u
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJVI33wAAoJEMDTa8Ir7ZwVP6wP/1vWaKCyF3hsCKB6qRDsGVLf
5iSOgIFi2HxWF3VafvzjWaCUGF9JbO8JBEhuU7GLjlJniTtEMNc8FuTNR1nhhucu
l2UD3H24YAzqVtnHTaq1vGN8GVTs4bOg35Dk70+0+zEeZ+TbmMMIkHcqSIJXf98G
Y0fOosTLQYGreGouEFVAvVFmqw9ahuaty0anC5JzY2wREYH07LE3iFsVwMBnSTdb
6CHsgWxI6rI+jgRfgc0xHwpx6ZNyEb94dJ3oOsPk8OsuAMQY8Y0XyjT3eY9Yh4jP
QNTiCNbHLhAKeAV1m8PuRL9cf0LZZVsEWqjczLA+JrDuz1z0BqM9nP6eViYu9RTi
XIXsaN8esK97dXjcMo55qsv2G1X8YECQGJ4qFO+P4duGhMWEBBMZpIoAP5tVFCi2
qI3v1QrdoCBLgTn/twpuxNRwxMEkFOPG19d5bixnYXAk13bdYvwMtUKyUfPD/NRV
9qIdtw/+1nYZjPVNMPBdYm/PP/eu124vtgC0WDUFNQjWyVc0K8rMKFX6VklcyCOs
qiK//czKyC2H0680sZXWEV/t//Y8QgrOgzMSz93DaHK+saso1nP7C3DFPthRqFzr
tE3a0czWb7azqhtiQFQQ6kiGJUr2ol13O2M3hG5EKB7uGRv9tYyYgTUbLQbOe6bJ
uc3woOXbmd8S3ldBeIgn
=gadB
-----END PGP SIGNATURE-----

--Sig_/mjoi=PlPEygq1LD3ian=4=u--
