From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build warning after merge of the vfs tree
Date: Tue, 19 Jun 2018 11:29:08 +1000
Message-ID: <20180619112908.421e512e@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/l609MokBjYqhXJ_4xGx.r/b"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Al Viro <viro@ZenIV.linux.org.uk>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

--Sig_/l609MokBjYqhXJ_4xGx.r/b
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Al,

After merging the vfs tree, today's linux-next build (arm
multi_v7_defconfig) produced this warning:

<stdin>:1338:2: warning: #warning syscall open_tree not implemented [-Wcpp]
<stdin>:1341:2: warning: #warning syscall move_mount not implemented [-Wcpp]
<stdin>:1344:2: warning: #warning syscall fsopen not implemented [-Wcpp]
<stdin>:1347:2: warning: #warning syscall fsmount not implemented [-Wcpp]
<stdin>:1350:2: warning: #warning syscall fspick not implemented [-Wcpp]
<stdin>:1353:2: warning: #warning syscall fsinfo not implemented [-Wcpp]

Not really suprising.

--=20
Cheers,
Stephen Rothwell

--Sig_/l609MokBjYqhXJ_4xGx.r/b
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlsoXGQACgkQAVBC80lX
0GzHxwf/a4/3VI5fh2YkvwaEN4x7xWpM0xkJ6GOqMKvgtZv0McL9Xar3mmIuhYC7
WxeLE+zTdpBTYgCvN22oOUku2nxckjA6vEFJo+iXzZZcjULvGem7mMNVBKswce5H
I+exVtpZ/QL7i74BPwIQyRK9O9cPw8nkO51xdssAmIBHkmXC8Q+oI7TTGOX9WOG/
pTg0l3bXboYPsHvLSNceU0OimwJCpdKShscQRwlbB4ip1wLa7pHA9YKM4p1lP5yp
dfrG/WHyLQtfGW7GP18zCWaULBM3YcB5U/hgUlyexk7dvDni3iwpjTkL8p6LMPK5
YmlPjFYJhU9cAViJPlcujyzI5p+M0Q==
=/olF
-----END PGP SIGNATURE-----

--Sig_/l609MokBjYqhXJ_4xGx.r/b--
