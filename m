From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: Fixes tags need some work in the cifs tree
Date: Tue, 9 Apr 2019 07:38:27 +1000
Message-ID: <20190409073827.0ac717ab@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/+Cxg+ESuN=N.06zze4DXxV8"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Steve French <smfrench@gmail.com>, CIFS <linux-cifs@vger.kernel.org>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, ZhangXiaoxu <zhangxiaoxu5@huawei.com>
List-Id: linux-next.vger.kernel.org

--Sig_/+Cxg+ESuN=N.06zze4DXxV8
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

In commit

  7d672725ba72 ("cifs: Fix lease buffer length error")

Fixes tags

  Fixes: 9764c02fcbad(SMB3: Add support for multidialect negotiate (SMB2.1 =
and later))
  Fixes: d5c7076b772a(smb3: add smb3.1.1 to default dialect list)

has these problem(s):

  - missing space between the SHA1 and the subject
  - missing quotes around the subject

In commit

  54492efdd6a2 ("cifs: Fix use-after-free in SMB2_read")

Fixes tag

  Fixes: eccb4422cf97(smb3: Add ftrace tracepoints for improved SMB3 debugg=
ing)

has these problem(s):

  - missing space between the SHA1 and the subject
  - missing quotes around the subject

In commit

  3cc71735cf9f ("cifs: Fix use-after-free in SMB2_write")

Fixes tag

  Fixes: eccb4422cf97(smb3: Add ftrace tracepoints for improved SMB3 debugg=
ing)

has these problem(s):

  - missing space between the SHA1 and the subject
  - missing quotes around the subject

--=20
Cheers,
Stephen Rothwell

--Sig_/+Cxg+ESuN=N.06zze4DXxV8
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlyrv1MACgkQAVBC80lX
0GxowAgAmWmMbbAKkYvsgWwAkJNtKonbxiRW3nk1aPjQXbQrLqDmc8SdjhMyKWVF
1jPLs6D1sm0wzpeY3Bc4SO69X0+EXWggFwDKbrYhBNSGdmR7iz5PWjWfg8cbrbYL
YL4tb6268WhFiyMvnPYdGPhbsI6bwTPyDecJQBc36p+oggsBzeXlb1UXbpAw4A7E
tf2lJheJqyh5yw59wGILvqiUK40hcOsCb2goJv1xsQR330IGQw/fd/YEcJ2S/O4o
Og5iB+Bs8oUmuLlf44ACX8U9rvGSvVPP9TearlnW2Tc9WL/yez+3UU8rdnC+EJtR
56qyY+xb/SkSloKbDOblt+WCYiIEjQ==
=gmhl
-----END PGP SIGNATURE-----

--Sig_/+Cxg+ESuN=N.06zze4DXxV8--
