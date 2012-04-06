From: Jonas Bonn <jonas@southpole.se>
Subject: Re: [PATCH 11/11] asm-generic: add linux/types.h to cmpxchg.h
Date: Fri, 06 Apr 2012 08:28:14 +0200
Message-ID: <1333693694.2680.15.camel@satguru>
References: <1333312727-11428-1-git-send-email-paul.gortmaker@windriver.com>
	 <1333312727-11428-12-git-send-email-paul.gortmaker@windriver.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg="pgp-sha1"; protocol="application/pgp-signature";
	boundary="=-vBnaybuIvlOxcL7NSpm5"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1333312727-11428-12-git-send-email-paul.gortmaker@windriver.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Paul Gortmaker <paul.gortmaker@windriver.com>
Cc: dhowells@redhat.com, torvalds@linux-foundation.org, linux-kernel@vger.kernel.org, linux-next@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>
List-Id: linux-next.vger.kernel.org



--=-vBnaybuIvlOxcL7NSpm5
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Thanks, applied.
Will send this upstream via the openrisc tree.
/Jonas

On Sun, 2012-04-01 at 16:38 -0400, Paul Gortmaker wrote:
> Builds of the openrisc or1ksim_defconfig show the following:
>=20
>   In file included from arch/openrisc/include/generated/asm/cmpxchg.h:1:0=
,
>                    from include/asm-generic/atomic.h:18,
>                    from arch/openrisc/include/generated/asm/atomic.h:1,
>                    from include/linux/atomic.h:4,
>                    from include/linux/dcache.h:4,
>                    from fs/notify/fsnotify.c:19:
>   include/asm-generic/cmpxchg.h: In function '__xchg':
>   include/asm-generic/cmpxchg.h:34:20: error: expected ')' before 'u8'
>   include/asm-generic/cmpxchg.h:34:20: warning: type defaults to 'int' in=
 type name
>=20
> and many more lines of similar errors.  It seems specific to the or32
> because most other platforms have an arch specific component that would
> have already included types.h ahead of time, but the o32 does not.
>=20
> Cc: Arnd Bergmann <arnd@arndb.de>
> Cc: Jonas Bonn <jonas@southpole.se>
> Signed-off-by: Paul Gortmaker <paul.gortmaker@windriver.com>
> ---
>  include/asm-generic/cmpxchg.h |    1 +
>  1 files changed, 1 insertions(+), 0 deletions(-)
>=20
> diff --git a/include/asm-generic/cmpxchg.h b/include/asm-generic/cmpxchg.=
h
> index 8a36183..1488302 100644
> --- a/include/asm-generic/cmpxchg.h
> +++ b/include/asm-generic/cmpxchg.h
> @@ -10,6 +10,7 @@
>  #error "Cannot use generic cmpxchg on SMP"
>  #endif
> =20
> +#include <linux/types.h>
>  #include <linux/irqflags.h>
> =20
>  #ifndef xchg


--=-vBnaybuIvlOxcL7NSpm5
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iEYEABECAAYFAk9+jP4ACgkQ70gcjN2673OQJACeINyVWkWTuVLoCjNBi4jN9qu9
GhEAn2jlQao6h0cUYbO+rkpelvwS+0Pq
=xfyP
-----END PGP SIGNATURE-----

--=-vBnaybuIvlOxcL7NSpm5--
