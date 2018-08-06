From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: build failure after merge of the vfs tree
Date: Mon, 6 Aug 2018 22:24:01 +1000
Message-ID: <20180806222401.3d68fb28@canb.auug.org.au>
References: <20180806103738.794c479d@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/6CvfW03m=a17=DIJ+O5sm=X"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180806103738.794c479d@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Al Viro <viro@ZenIV.linux.org.uk>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, David Howells <dhowells@redhat.com>
List-Id: linux-next.vger.kernel.org

--Sig_/6CvfW03m=a17=DIJ+O5sm=X
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Mon, 6 Aug 2018 10:37:38 +1000 Stephen Rothwell <sfr@canb.auug.org.au> w=
rote:
>
> After merging the vfs tree, today's linux-next build (x86_64 allmodconfig)
> failed like this:
>=20
> samples/statx/test-fsinfo.c:26:10: fatal error: linux/fsinfo.h: No such f=
ile or directory
>  #include <linux/fsinfo.h>
>           ^~~~~~~~~~~~~~~~
>=20
> Caused by commit
>=20
>   90b413cb970a ("vfs: syscall: Add fsinfo() to query filesystem informati=
on")
>=20
> I guess that headers_install (or whatever its called) has not bee run
> before the sample code is built.
>=20
> I have applied the following patch for today:
>=20
> From: Stephen Rothwell <sfr@canb.auug.org.au>
> Date: Mon, 6 Aug 2018 10:29:34 +1000
> Subject: [PATCH] vfs: don;t build new sample programs yet
>=20
> It seems that headers_install is not done before the samples
> are build so some needed include files are not in the right place.
>=20
> Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
> ---
>  samples/statx/Makefile | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/samples/statx/Makefile b/samples/statx/Makefile
> index 05b4d30cdd3c..0b4d01822eca 100644
> --- a/samples/statx/Makefile
> +++ b/samples/statx/Makefile
> @@ -1,5 +1,5 @@
>  # List of programs to build
> -hostprogs-$(CONFIG_SAMPLE_STATX) :=3D test-statx test-fsinfo test-fs-que=
ry
> +hostprogs-$(CONFIG_SAMPLE_STATX) :=3D test-statx
> =20
>  # Tell kbuild to always build the programs
>  always :=3D $(hostprogs-y)

It turns out that commit

  ba5214f7f40c ("vfs: Implement parameter value retrieval with fsinfo()")

removed the "depends on BROKEN" from CONFIG_SAMPLE_STATX and that
breaks other builds (at least allyesconfig on s390).

--=20
Cheers,
Stephen Rothwell

--Sig_/6CvfW03m=a17=DIJ+O5sm=X
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAltoPeEACgkQAVBC80lX
0GyGAgf9EiqWVhztm844gNppUc8FLnXknFhVw/yLSl3+rmvmlxiYtmdJn88PZS32
qJrkMafsYYV8mFWRYmR7lLBj3ROVMhzsqbjKgbS9O1eJiXGDte9jVMs0MvT4yvN7
L60fd5wXhp8iRS+bCnO7p9cZiW1qnIzjrJwDh+3E6vyx8HZueDUFKcVZzZuqNX/S
oGhXan+dZO1tyK/W9j7AZb8At6fs83Z9eGi1APScVrLVhBg1QevRoBs1GMdjCOxU
vC3kyvhx15d+18G882Q1XS9wjXvlelYg/EinehEWWLd0WQAHHcxI8RkrlsfMzEbi
nBtx39YZ09yHFudmtPkGgksHk1/V6A==
=RHQW
-----END PGP SIGNATURE-----

--Sig_/6CvfW03m=a17=DIJ+O5sm=X--
