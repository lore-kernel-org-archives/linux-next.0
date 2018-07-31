From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build failure after merge of the block tree
Date: Tue, 31 Jul 2018 13:07:00 +1000
Message-ID: <20180731130700.3ff50dce@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/.jhLpF1cCZWW_8sMHa+0.c+"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Jens Axboe <axboe@kernel.dk>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Max Gurtovoy <maxg@mellanox.com>
List-Id: linux-next.vger.kernel.org

--Sig_/.jhLpF1cCZWW_8sMHa+0.c+
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Jens,

After merging the block tree, today's linux-next build (arm
multi_v7_defconfig) failed like this:

drivers/scsi/sd.o: In function `sd_done':
sd.c:(.text+0x1050): undefined reference to `t10_pi_complete'

Presuably caused by commit

  10c41ddd6132 ("block: move dif_prepare/dif_complete functions to block la=
yer")

# CONFIG_BLK_DEV_INTEGRITY is not set
CONFIG_BLK_DEV_SD=3Dy

I have used the block tree from next-20180730 for today.

--=20
Cheers,
Stephen Rothwell

--Sig_/.jhLpF1cCZWW_8sMHa+0.c+
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAltf0lQACgkQAVBC80lX
0Gwzpwf/X1pEYcETqY2fL0QFgQAhpmOPUON7wZpj6z13jGvyYZxnBNtcRbO27xzC
VQDdXosoalPiBbV9eEaAVZ+AH939rXbdiNExxswEaGki6Www3oPhu2JfaulgMZv9
Lw1Y1/RplTLqKLWo9RkyNwc1CoSL0ajP8+uRLwdVxpvNxa38wpWsb5Ejxo+omZfc
riXmy82x9mSyS7D4FadRugMJTQiUixNgvy490PGvuZuDvzs88LYsF4D0vo2KXtin
ZKBErWxcj9ewsUO5L/gXv8HCgBaEkpyJWLXwfXKAV8oUd9HypjEXQNEUKOWX8YT2
JVDWxh4F/RU0FpZV8VMHRvkTZmLRlg==
=7edz
-----END PGP SIGNATURE-----

--Sig_/.jhLpF1cCZWW_8sMHa+0.c+--
