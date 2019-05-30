From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build warning after merge of the userns tree
Date: Thu, 30 May 2019 15:33:16 +1000
Message-ID: <20190530153316.60907d8f@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/5kYuec8EBjVawDMYkqOfsSD"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: "Eric W. Biederman" <ebiederm@xmission.com>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

--Sig_/5kYuec8EBjVawDMYkqOfsSD
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Eric,

After merging the userns tree, today's linux-next build (i386 defconfig)
produced this warning:

arch/x86/mm/fault.c: In function 'do_sigbus':
arch/x86/mm/fault.c:1017:22: warning: unused variable 'tsk' [-Wunused-varia=
ble]
  struct task_struct *tsk =3D current;
                      ^~~

Introduced by commit

  351b6825b3a9 ("signal: Explicitly call force_sig_fault on current")

The remaining used of "tsk" are protected by CONFIG_MEMORY_FAILURE.

--=20
Cheers,
Stephen Rothwell

--Sig_/5kYuec8EBjVawDMYkqOfsSD
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlzvaxwACgkQAVBC80lX
0Gykxgf8DSGyhXKHKnG8MV3Iv/w2yd0SppFLsSAqvXWZHNtfPi8p/ftjtZ3Zp3Ja
y+o7czQJCz8kULN5kd1SG3caLCRxtF1YqCwYUlWo4z61X1ZSpWosV1Y6Rj5YgJF1
drX1BCu+nH0RX5D0YaKO9Z47fTGbBWregDEiPAaTDjqc5KeTX8YaHPaL8kZCicGz
QQ3h91LWfmumpE1BBJx6AverzIrC6ieKu2zt6VHcXx1wROrnTTpG6xkEbFRLZNUn
fGiCi3XGkYkHz0/wHgT5lFKCBoaVXYVhw6Rj0JNhMcEF1N9WIe9c/BFTKwbYFmgL
poT4KVuWp7I3mJkTydIbhRLMp4jEIw==
=xeiI
-----END PGP SIGNATURE-----

--Sig_/5kYuec8EBjVawDMYkqOfsSD--
