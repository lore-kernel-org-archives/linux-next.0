From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build warning after merge of the ext4 tree
Date: Wed, 10 Oct 2018 10:11:28 +1100
Message-ID: <20181010101128.2b151332@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/DqM3eeZDreT2TM4kopw+=rT"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Theodore Ts'o <tytso@mit.edu>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

--Sig_/DqM3eeZDreT2TM4kopw+=rT
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Theodore,

After merging the ext4 tree, today's linux-next build (arm
multi_v7_defconfig) produced this warning:

fs/ext4/super.c: In function 'parse_options':
fs/ext4/super.c:1976:26: warning: unused variable 'grp_qf_name' [-Wunused-v=
ariable]
  char *p, *usr_qf_name, *grp_qf_name;
                          ^~~~~~~~~~~
fs/ext4/super.c:1976:12: warning: unused variable 'usr_qf_name' [-Wunused-v=
ariable]
  char *p, *usr_qf_name, *grp_qf_name;
            ^~~~~~~~~~~

Introduced by commit

  20cefcdc2040 ("ext4: fix use-after-free race in ext4_remount()'s error pa=
th")

# CONFIG_QUOTA is not set

--=20
Cheers,
Stephen Rothwell

--Sig_/DqM3eeZDreT2TM4kopw+=rT
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlu9NaAACgkQAVBC80lX
0GwZ/ggAnvMcmjfwnTmIpzYWPfYNjt6ySmbmwUxMf9hOmE/IshrJEdpEicznKmGa
PyCioYcFaIb2M9Vam+0Z5V+DjIcik89liblsUkieqRMTNuaieFn+5dcu4e7NUnTR
UJ29OXilkaBeGTgewZF6G2d5uHVKjsjxiZmZJspZguzEdRlQ35ehnANytnhXV5yR
3Rgp6e0Dedu7dumZVxfQaFl8elZws90FFZm0ATxpUlUb3AviVTOAUloxcGzJL7Dd
As7/nJqfpX4TBwa90ZwAbSAnOJfLe1qJP5v7gfklSZ+rBIpbYt4KXrEK5Y+zJSgI
ILVaH/FaKfnO4NxlgJsVcHbpKxihwA==
=LAU4
-----END PGP SIGNATURE-----

--Sig_/DqM3eeZDreT2TM4kopw+=rT--
