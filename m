From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: build failure after merge of the akpm tree
Date: Mon, 15 Oct 2018 18:14:45 +1100
Message-ID: <20181015181445.19448cbc@canb.auug.org.au>
References: <20181008190341.5e396491@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/Kie1_XDqC619D.3pdwWGnec"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181008190341.5e396491@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Andrew Morton <akpm@linux-foundation.org>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Mike Rapoport <rppt@linux.vnet.ibm.com>, Borislav Petkov <bp@suse.de>
List-Id: linux-next.vger.kernel.org

--Sig_/Kie1_XDqC619D.3pdwWGnec
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Mon, 8 Oct 2018 19:03:41 +1100 Stephen Rothwell <sfr@canb.auug.org.au> w=
rote:
>
> After merging the akpm tree, today's linux-next build (x86_64
> allmodconfig) failed like this:
>=20
> arch/x86/mm/kaslr.c:26:10: fatal error: linux/bootmem.h: No such file or =
directory
>  #include <linux/bootmem.h>
>           ^~~~~~~~~~~~~~~~~
>=20
> Caused by patch
>=20
>   "mm: remove include/linux/bootmem.h"
>=20
> interacting with commit
>=20
>   3a387c6d96e6 ("x86/kaslr, ACPI/NUMA: Fix KASLR build error")
>=20
> from the tip tree.
>=20
> I have added the following patch for today:
>=20
> From: Stephen Rothwell <sfr@canb.auug.org.au>
> Date: Mon, 8 Oct 2018 18:57:00 +1100
> Subject: [PATCH] x86/kaslr, ACPI/NUMA: fix for linux/bootmem.h removal
>=20
> Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
> ---
>  arch/x86/mm/kaslr.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/arch/x86/mm/kaslr.c b/arch/x86/mm/kaslr.c
> index b3471388288d..ad80bdc690c1 100644
> --- a/arch/x86/mm/kaslr.c
> +++ b/arch/x86/mm/kaslr.c
> @@ -23,7 +23,7 @@
>  #include <linux/kernel.h>
>  #include <linux/init.h>
>  #include <linux/random.h>
> -#include <linux/bootmem.h>
> +#include <linux/memblock.h>
> =20
>  #include <asm/pgalloc.h>
>  #include <asm/pgtable.h>
> --=20

So the above tip tree patch no longer exists, so this one is also no
longer needed and I have removed it from the akpm tree today.

--=20
Cheers,
Stephen Rothwell

--Sig_/Kie1_XDqC619D.3pdwWGnec
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlvEPmUACgkQAVBC80lX
0GzNAAf/U0C8LEu3gm0I7KmpVBmGta0IdBWv3u0UBPxHQAY7ITs8RZGyuMtCGMVo
ViFxgQfCJiMVJSnJawtKG6tP84mcoS3vcouIt1+QdeTB4AQDnEx3KSGynfXonktl
Ql1zzciuHt9vVbEESJBHNwU+HHYYraH/Xk1C9KyzB7qjSp+pXXEDP1N6zfcfqNqQ
RWg+IfbFwEeusYs6LnwUMO4NuoQkmGaD1aAr5R5BMqultWoLC4lEY4EnEvXsWFYy
wMQ8TDwo07LoK4f2MPZ7ScqtwlfGqC/3eFg+bwHxZudGqYQ8IxJp6lSLhsTiGCAu
whkNTIQqjtn4GcU/+HijGplJqJOobA==
=Bexk
-----END PGP SIGNATURE-----

--Sig_/Kie1_XDqC619D.3pdwWGnec--
