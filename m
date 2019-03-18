From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: build warning after merge of the vfs tree
Date: Mon, 18 Mar 2019 11:00:50 +1100
Message-ID: <20190318110050.2bf8d87b@canb.auug.org.au>
References: <20190204093334.0ccc42bb@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/F1JYpB8UULc1V+hLNijIqJf"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190204093334.0ccc42bb@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Al Viro <viro@ZenIV.linux.org.uk>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, David Howells <dhowells@redhat.com>
List-Id: linux-next.vger.kernel.org

--Sig_/F1JYpB8UULc1V+hLNijIqJf
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Mon, 4 Feb 2019 09:33:34 +1100 Stephen Rothwell <sfr@canb.auug.org.au> w=
rote:
>
> After merging the vfs tree, today's linux-next build (arm
> multi_v7_defconfig) produced this warning:
>=20
> In file included from include/linux/printk.h:7,
>                  from include/linux/kernel.h:14,
>                  from include/linux/fs_context.h:15,
>                  from fs/fs_parser.c:13:
> fs/fs_parser.c: In function 'fs_validate_description':
> include/linux/kern_levels.h:5:18: warning: format '%lu' expects argument =
of type 'long unsigned int', but argument 3 has type 'int' [-Wformat=3D]
>  #define KERN_SOH "\001"  /* ASCII Start Of Header */
>                   ^~~~~~
> include/linux/kern_levels.h:11:18: note: in expansion of macro 'KERN_SOH'
>  #define KERN_ERR KERN_SOH "3" /* error conditions */
>                   ^~~~~~~~
> include/linux/printk.h:303:9: note: in expansion of macro 'KERN_ERR'
>   printk(KERN_ERR pr_fmt(fmt), ##__VA_ARGS__)
>          ^~~~~~~~
> fs/fs_parser.c:413:6: note: in expansion of macro 'pr_err'
>       pr_err("VALIDATE %s: e[%lu] enum val for %s\n",
>       ^~~~~~
> fs/fs_parser.c:413:31: note: format string is defined here
>       pr_err("VALIDATE %s: e[%lu] enum val for %s\n",
>                              ~~^
>                              %u
>=20
> Introduced by commit
>=20
>   f512b838c104 ("vfs: Add configuration parser helpers")

We are now seeing that warning in Linus' tree :-(

--=20
Cheers,
Stephen Rothwell

--Sig_/F1JYpB8UULc1V+hLNijIqJf
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlyO37IACgkQAVBC80lX
0GwxgQf8CMu4EwT6LxSYySpGZwl1cX3aYR6kiH3T93SSmVghkk5WRT0tMxgfUT2X
WQVCt1+wb3j6mit76kr/yoZxr25exNUL3C+XjShG2ehN3AdQ3C7pTYttLhXpa4G6
VrPStTLm15MinIOL0hiPLpY3h0pSUzX9vLBqdS6E1D4lvjL1as3VV+FHtWxCqqv7
7QSto0oaE7s2UB0nJPdjt/wl4TJJYVukypvvvmk00GLtfXufwr+Uk42PUMtY9vJ4
DZhFiUGEcH274bARIqWdjP9Oy5O903d7lukLBCknBn/Y0cOxeLEduHJhurrDC1WQ
7bBZQoE8zZ1IaHh8wSpZN5jrRtOvvw==
=86Mr
-----END PGP SIGNATURE-----

--Sig_/F1JYpB8UULc1V+hLNijIqJf--
