From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build failure after merge of the net-next tree
Date: Mon, 6 Aug 2018 12:10:26 +1000
Message-ID: <20180806121026.7c4b956b@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/nUutFw4bxDjgRFO=yUac+tY"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: David Miller <davem@davemloft.net>, Networking <netdev@vger.kernel.org>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Yangbo Lu <yangbo.lu@nxp.com>
List-Id: linux-next.vger.kernel.org

--Sig_/nUutFw4bxDjgRFO=yUac+tY
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the net-next tree, today's linux-next build (arm
multi_v7_defconfig) failed like this:

drivers/ptp/ptp_qoriq.o: In function `qoriq_ptp_probe':
ptp_qoriq.c:(.text+0xd0c): undefined reference to `__aeabi_uldivmod'

Caused by commit

  91305f281262 ("ptp_qoriq: support automatic configuration for ptp timer")

I just reverted that commit for today.

--=20
Cheers,
Stephen Rothwell

--Sig_/nUutFw4bxDjgRFO=yUac+tY
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAltnrhIACgkQAVBC80lX
0GzTgAf/U0HdKmV+qnw8Yf3Xuwx/7jubhhVRj/4gRBcp62G4pPEcTFfjHbHPqjsa
Vm4MDhzPsqlw+ldhBlxMQGfC8V+2bHfpNbk41HjdnBTXbwM9B3ZcLRNvJnI8ZTiW
2TqALUNnqF4aEpODQFaOQLTlenipWuWC00XuBPL9o1dewc70HP8hTaNeA7/Xh/T7
lRp4gUsQN+1F1ZjW62nHm+3BuwkeRebzWCBZi7lD58n87DDmjHm0tLXeUMVzJyQx
OWmgBk1xdzysEALE7+peT4S4/CjuFZQYmVqvm26Ysq8qcaGbAaeqb6zopu2cbNPr
0DsyCZWnZSwlAcxuAaEZxXAMusD8KQ==
=yMFq
-----END PGP SIGNATURE-----

--Sig_/nUutFw4bxDjgRFO=yUac+tY--
