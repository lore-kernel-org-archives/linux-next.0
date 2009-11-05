From: Stephen Rothwell <sfr-3FnU+UHB4dNDw9hX6IcOSA@public.gmane.org>
Subject: Re: [PATCH] BUILD_BUG_ON: make it handle more cases
Date: Thu, 5 Nov 2009 11:20:20 +1100
Message-ID: <20091105112020.33f02552.sfr@canb.auug.org.au>
References: <4AC1E15502000078000516B5@vpn.id2.novell.com>
	<200910201142.34006.rusty@rustcorp.com.au>
	<1256002193.6546.2.camel@slab>
	<200910201415.34361.rusty@rustcorp.com.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Thu__5_Nov_2009_11_20_20_+1100_+dqOcjvsFQwyL1KA"
Return-path: <kvm-ppc-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <200910201415.34361.rusty-8n+1lVoiYb80n/F98K4Iww@public.gmane.org>
Sender: kvm-ppc-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rusty Russell <rusty-8n+1lVoiYb80n/F98K4Iww@public.gmane.org>
Cc: Hollis Blanchard <hollisb-r/Jw6+rmf7HQT0dZR+AlfA@public.gmane.org>, Jan Beulich <JBeulich-Et1tbQHTxzrQT0dZR+AlfA@public.gmane.org>, akpm-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org, linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, kvm-ppc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-next-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-next.vger.kernel.org

--Signature=_Thu__5_Nov_2009_11_20_20_+1100_+dqOcjvsFQwyL1KA
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Rusty,

On Tue, 20 Oct 2009 14:15:33 +1030 Rusty Russell <rusty-8n+1lVoiYb80n/F98K4Iww@public.gmane.org> wr=
ote:
>
> +#ifndef __OPTIMIZE__
> +#define BUILD_BUG_ON(condition) ((void)sizeof(char[1 - 2*!!(condition)]))
> +#else
> +extern int __build_bug_on_failed;
> +#define BUILD_BUG_ON(condition)					\
> +	do {							\
> +		((void)sizeof(char[1 - 2*!!(condition)]));	\
> +		if (condition) __build_bug_on_failed =3D 1;	\
> +	} while(0)
> +#endif
> +#define MAYBE_BUILD_BUG_ON(condition) BUILD_BUG_ON(condition)
> +

I decided to try this in linux-next, but an x86_64 allmodconfig build
gave this (gcc 4.4.0):

ERROR: "__build_bug_on_failed" [drivers/net/virtio_net.ko] undefined!
ERROR: "__build_bug_on_failed" [drivers/block/virtio_blk.ko] undefined!

I assume that this is caused by the "MAYBE_BUILD_BUG_ON(fbit >=3D 32)" in
virtio_has_feature() (in include/linux/virtio_config.h) which is called
all over the place.  Unfortunately, virtio_has_feature() gets uninlined
in those two files ...

I have taken the patch back out again for today.
--=20
Cheers,
Stephen Rothwell                    sfr-3FnU+UHB4dNDw9hX6IcOSA@public.gmane.org
http://www.canb.auug.org.au/~sfr/

--Signature=_Thu__5_Nov_2009_11_20_20_+1100_+dqOcjvsFQwyL1KA
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEARECAAYFAkryGkQACgkQjjKRsyhoI8yNnwCgqxtqC7HlRrQPSf2/86SIICQx
NNUAn0WTwWtUTvocyofSmByl1KGyiCwd
=1ISe
-----END PGP SIGNATURE-----

--Signature=_Thu__5_Nov_2009_11_20_20_+1100_+dqOcjvsFQwyL1KA--
