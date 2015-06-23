From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: manual merge of the rcu tree with the modules and
 tip trees
Date: Wed, 24 Jun 2015 09:23:44 +1000
Message-ID: <20150624092344.1814c761@canb.auug.org.au>
References: <20150528172507.31f6fc8c@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/KWyX7_YN5_+R.GL2R9zSyPd"; protocol="application/pgp-signature"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:36060 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752275AbbFWXXv (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 23 Jun 2015 19:23:51 -0400
In-Reply-To: <20150528172507.31f6fc8c@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Rusty Russell <rusty@rustcorp.com.au>
Cc: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Linus <torvalds@linux-foundation.org>

--Sig_/KWyX7_YN5_+R.GL2R9zSyPd
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Rusty,

On Thu, 28 May 2015 17:25:07 +1000 Stephen Rothwell <sfr@canb.auug.org.au> =
wrote:
>
> Today's linux-next merge of the rcu tree got a conflict in
> include/linux/rcupdate.h between commits 0a04b0166929 ("rcu: Move
> lockless_dereference() out of rcupdate.h") from the modules tree and
> c1ad348b452a ("tick: Nohz: Rework next timer evaluation") from the tip
> tree and commits 7d0ae8086b82 ("rcu: Convert ACCESS_ONCE() to
> READ_ONCE() and WRITE_ONCE()") and 3382adbc1bb8 ("rcu: Eliminate a few
> CONFIG_RCU_NOCB_CPU_ALL #ifdefs") from the rcu tree.
>=20
> I fixed it up (see below) and can carry the fix as necessary (no action
> is required).
>=20
> I also had to add this merge fix patch:
>=20
> From: Stephen Rothwell <sfr@canb.auug.org.au>
> Date: Thu, 28 May 2015 17:20:58 +1000
> Subject: [PATCH] rcu: merge fix for Convert ACCESS_ONCE() to READ_ONCE() =
and
>  WRITE_ONCE()
>=20
> Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
> ---
>  include/linux/compiler.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/include/linux/compiler.h b/include/linux/compiler.h
> index ba91e5c88a32..f7e7235f3a91 100644
> --- a/include/linux/compiler.h
> +++ b/include/linux/compiler.h
> @@ -483,7 +483,7 @@ static __always_inline void __write_once_size(volatil=
e void *p, void *res, int s
>   */
>  #define lockless_dereference(p) \
>  ({ \
> -	typeof(p) _________p1 =3D ACCESS_ONCE(p); \
> +	typeof(p) _________p1 =3D READ_ONCE(p); \
>  	smp_read_barrier_depends(); /* Dependency order vs. p above. */ \
>  	(_________p1); \
>  })
> --=20
> 2.1.4
>=20
> --=20
> Cheers,
> Stephen Rothwell                    sfr@canb.auug.org.au
>=20
> diff --cc include/linux/rcupdate.h
> index ed5f66464ab3,3a4d1bf430b1..000000000000
> --- a/include/linux/rcupdate.h
> +++ b/include/linux/rcupdate.h
> @@@ -1140,13 -1063,13 +1050,13 @@@ static inline notrace void rcu_read_unl
>   #define kfree_rcu(ptr, rcu_head)					\
>   	__kfree_rcu(&((ptr)->rcu_head), offsetof(typeof(*(ptr)), rcu_head))
>  =20
> - #if defined(CONFIG_TINY_RCU) || defined(CONFIG_RCU_NOCB_CPU_ALL)
> + #ifdef CONFIG_TINY_RCU
>  -static inline int rcu_needs_cpu(unsigned long *delta_jiffies)
>  +static inline int rcu_needs_cpu(u64 basemono, u64 *nextevt)
>   {
>  -	*delta_jiffies =3D ULONG_MAX;
>  +	*nextevt =3D KTIME_MAX;
>   	return 0;
>   }
> - #endif /* #if defined(CONFIG_TINY_RCU) || defined(CONFIG_RCU_NOCB_CPU_A=
LL) */
> + #endif /* #ifdef CONFIG_TINY_RCU */
>  =20
>   #if defined(CONFIG_RCU_NOCB_CPU_ALL)
>   static inline bool rcu_is_nocb_cpu(int cpu) { return true; }

The above resolutions are now needed when the modules tree is merged
into Linus' tree (as the tip and rcu parts have already been merged).

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

--Sig_/KWyX7_YN5_+R.GL2R9zSyPd
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJVieqFAAoJEMDTa8Ir7ZwVErsP/1R8c3EusaYKNxKHHixogD5l
BncvF5c7Zy3D52hdeuY0oyGBEjpR3V9TXZLct+qAEcIl/ew2gQ/LFkU2ja3gO2b4
2QCshyluQXInQRIcn4mZNJeBPYeAnzhdqBduDXl5GxkIScIUzvfvWDKtxkWjfHkM
3mmHy0qspMkcwAxIh7X5B8hb40Td9LiQQ6+m7j7jScZRLqfSJ8ATWuKKpvzBszXb
BV58GTVRLnUr+MSvxh319JeK4/9IBoeeUYxAu1+d/qfuoCb2qRFdUxbSGC16X45t
2V4eEsCDi2ktV9G+zcRNZYHi9kuuqtojPgwaFBtIn6zfEbIo5mbMpk6K4fVb7gaX
iks9Qoua9WrgsqtJKBq1mfRNgWsGoc9eWioM7hDGcO9I+X+x6lESW9IYW2VYawnf
hmFQwV0a3/DCvbTszb71bu5wWIofd/Y1MgJbyPuOLO7OHShaHHnsDdR/cTNWH+fC
97kYMxS7680BY//1IfL2x4cl3Z0dH4y0wxBBbistUfmO0gloeUOpvE7VbL7gIcCL
GVSAObeUyJgiUbDi+m9cs36k4TqA6Y3ZUbvTSGxSt+16QlCqAsxtrHldkqNfZoHh
ueZhfWFU18xqN4ErmV47rQBamgJG2xrgkgiHITIRtaa7qKW4bYGATtrn7PkNRajo
KDO6iPMYQApm6Xzq7RHw
=QDfS
-----END PGP SIGNATURE-----

--Sig_/KWyX7_YN5_+R.GL2R9zSyPd--
