From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: [PATCH 1/3] x86: suppress sparse returning void warnings
Date: Fri, 18 Jul 2008 16:13:42 +1000
Message-ID: <20080718161342.df47eafb.sfr@canb.auug.org.au>
References: <1216329754.6029.29.camel@brick>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Fri__18_Jul_2008_16_13_42_+1000_kK.T1hP7xkyftJD/"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:53720 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750763AbYGRGNv (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Fri, 18 Jul 2008 02:13:51 -0400
In-Reply-To: <1216329754.6029.29.camel@brick>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Harvey Harrison <harvey.harrison@gmail.com>
Cc: Ingo Molnar <mingo@elte.hu>, linux-next <linux-next@vger.kernel.org>, Jeremy Fitzhardinge <jeremy@goop.org>

--Signature=_Fri__18_Jul_2008_16_13_42_+1000_kK.T1hP7xkyftJD/
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

[ Added cc ]

On Thu, 17 Jul 2008 14:22:34 -0700 Harvey Harrison <harvey.harrison@gmail.c=
om> wrote:
>
> include/asm/paravirt.h:1404:2: warning: returning void-valued expression
> include/asm/paravirt.h:1414:2: warning: returning void-valued expression
>=20
> Signed-off-by: Harvey Harrison <harvey.harrison@gmail.com>
> ---
> Appeared between next-20080716 and next-20080717
>=20
>  include/asm-x86/paravirt.h |    4 ++--
>  1 files changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/include/asm-x86/paravirt.h b/include/asm-x86/paravirt.h
> index b2aba8f..27c9f22 100644
> --- a/include/asm-x86/paravirt.h
> +++ b/include/asm-x86/paravirt.h
> @@ -1401,7 +1401,7 @@ static inline int __raw_spin_is_contended(struct ra=
w_spinlock *lock)
> =20
>  static __always_inline void __raw_spin_lock(struct raw_spinlock *lock)
>  {
> -	return PVOP_VCALL1(pv_lock_ops.spin_lock, lock);
> +	PVOP_VCALL1(pv_lock_ops.spin_lock, lock);
>  }
> =20
>  static __always_inline int __raw_spin_trylock(struct raw_spinlock *lock)
> @@ -1411,7 +1411,7 @@ static __always_inline int __raw_spin_trylock(struc=
t raw_spinlock *lock)
> =20
>  static __always_inline void __raw_spin_unlock(struct raw_spinlock *lock)
>  {
> -	return PVOP_VCALL1(pv_lock_ops.spin_unlock, lock);
> +	PVOP_VCALL1(pv_lock_ops.spin_unlock, lock);
>  }
> =20
>  #endif

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Fri__18_Jul_2008_16_13_42_+1000_kK.T1hP7xkyftJD/
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkiANJYACgkQjjKRsyhoI8zwtgCgiH4n8Z/LIvsFpwc9Lqw8NOCC
Nz4AoJ1uRfmjrXE9VkKLh93P+KV6zlRr
=rMPn
-----END PGP SIGNATURE-----

--Signature=_Fri__18_Jul_2008_16_13_42_+1000_kK.T1hP7xkyftJD/--
