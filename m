From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build warning after merge of the tty tree
Date: Wed, 19 Sep 2018 13:12:08 +1000
Message-ID: <20180919131208.07aa9c6b@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/zHN7EXP/_IdCDN5DGkikm+j"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Greg KH <greg@kroah.com>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Laura Abbott <labbott@redhat.com>, Daniel Thompson <daniel.thompson@linaro.org>
List-Id: linux-next.vger.kernel.org

--Sig_/zHN7EXP/_IdCDN5DGkikm+j
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Greg,

After merging the tty tree, today's linux-next build (x86_64 allmodconfig)
produced this warning:

drivers/tty/serial/kgdboc.c:134:12: warning: 'kgdboc_option_setup' defined =
but not used [-Wunused-function]
 static int kgdboc_option_setup(char *opt)
            ^~~~~~~~~~~~~~~~~~~

Introduced by commit

  2dd453168643 ("kgdboc: Fix restrict error")

--=20
Cheers,
Stephen Rothwell

--Sig_/zHN7EXP/_IdCDN5DGkikm+j
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAluhvokACgkQAVBC80lX
0Gykxgf9ERNFk3BLsqosftgmVPn56QDxAL/5rL/bCg771tenzM1q1ewI9R4AIUS5
3ma6RMRhNHjuxDEVICXvJ7VdJt9XSnIZrMWXlm55L8H2fP02GtKk1AR5xgjMsNae
uLW5nNX14lFRAcYwq2HrEZy5aEX6S9Tvqg/9TATsNRGPpfE5LJzEvp64gXXDcCIM
bz4ggu1MizDrkvHH5+wSeK0At6f2S6JXZQFQOwu0NhVKQNLvABCTaAjTcvhxw8Gu
CkQuf/ljaAqhXt8A1ixciAU/AWOXZFC5LxuhcdMZQb0Ra8ikJgU4NIwdAD0N97Xo
ZlFRMeqyubOzM07rxVip5IdxvbG0Sg==
=5BlO
-----END PGP SIGNATURE-----

--Sig_/zHN7EXP/_IdCDN5DGkikm+j--
