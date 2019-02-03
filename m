From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build warning after merge of the vfs tree
Date: Mon, 4 Feb 2019 09:33:34 +1100
Message-ID: <20190204093334.0ccc42bb@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/Tw9z5EpDEqZrmD1hAD0N=Kv"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Al Viro <viro@ZenIV.linux.org.uk>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, David Howells <dhowells@redhat.com>
List-Id: linux-next.vger.kernel.org

--Sig_/Tw9z5EpDEqZrmD1hAD0N=Kv
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Al,

After merging the vfs tree, today's linux-next build (arm
multi_v7_defconfig) produced this warning:

In file included from include/linux/printk.h:7,
                 from include/linux/kernel.h:14,
                 from include/linux/fs_context.h:15,
                 from fs/fs_parser.c:13:
fs/fs_parser.c: In function 'fs_validate_description':
include/linux/kern_levels.h:5:18: warning: format '%lu' expects argument of=
 type 'long unsigned int', but argument 3 has type 'int' [-Wformat=3D]
 #define KERN_SOH "\001"  /* ASCII Start Of Header */
                  ^~~~~~
include/linux/kern_levels.h:11:18: note: in expansion of macro 'KERN_SOH'
 #define KERN_ERR KERN_SOH "3" /* error conditions */
                  ^~~~~~~~
include/linux/printk.h:303:9: note: in expansion of macro 'KERN_ERR'
  printk(KERN_ERR pr_fmt(fmt), ##__VA_ARGS__)
         ^~~~~~~~
fs/fs_parser.c:413:6: note: in expansion of macro 'pr_err'
      pr_err("VALIDATE %s: e[%lu] enum val for %s\n",
      ^~~~~~
fs/fs_parser.c:413:31: note: format string is defined here
      pr_err("VALIDATE %s: e[%lu] enum val for %s\n",
                             ~~^
                             %u

Introduced by commit

  f512b838c104 ("vfs: Add configuration parser helpers")

--=20
Cheers,
Stephen Rothwell

--Sig_/Tw9z5EpDEqZrmD1hAD0N=Kv
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlxXbD4ACgkQAVBC80lX
0GyGOggAojmSbNcpsWYJ22TFTQQm67eqpcLfVY9tyfjgJIPbjvukYi3LoHpLvgC1
Qz+Sf38QrPAjom/euzOivARZJBFyASIQ+Eff3Rr2ZH8gpLWLoOJzu7fWprc5M2f9
+OgOVbUm4xkG7pMplJBOhSct4711Es0Di/AVbZ/xFCgCmABbOOwVNSxx/LeG0fv4
V8Poe6it8YpZ/W3Q6f2YTfd0foDD+/ubXi+Obs7uMFTW+Te3X4ItzL2pO7qxECB9
pWIdP44BerCn3FJPL4b7g8nE3GXfgM20autI4Le8BgZdYyVWOzEc1vNyhBRVrmsu
aQXayUyGuCb3D5vnbhdfgsm8mIFoDw==
=juti
-----END PGP SIGNATURE-----

--Sig_/Tw9z5EpDEqZrmD1hAD0N=Kv--
