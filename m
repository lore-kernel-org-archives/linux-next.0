From: Stephen Rothwell <sfr-3FnU+UHB4dNDw9hX6IcOSA@public.gmane.org>
Subject: Re: linux-next: Tree for July 18: warning at kernel/lockdep.c:2068
 trace_hardirqs_on_caller
Date: Sat, 19 Jul 2008 23:22:56 +1000
Message-ID: <20080719232256.f0648c27.sfr@canb.auug.org.au>
References: <20080718195352.e562a00f.sfr@canb.auug.org.au>
	<200807190928.33978.m.kozlowski@tuxland.pl>
	<19f34abd0807190255x304173d4wf2bfabb2d5bce511@mail.gmail.com>
	<19f34abd0807190559y2fe5ebf9h7095793e82de3122@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Sat__19_Jul_2008_23_22_56_+1000_PquE/liHnRR9wW2v"
Return-path: <kernel-testers-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <19f34abd0807190559y2fe5ebf9h7095793e82de3122-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: kernel-testers-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Vegard Nossum <vegard.nossum-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Mariusz Kozlowski <m.kozlowski-NWF1p15JEu3VItvQsEIGlw@public.gmane.org>, Dave Hansen <haveblue-r/Jw6+rmf7HQT0dZR+AlfA@public.gmane.org>, Greg Kroah-Hartman <gregkh-l3A5Bk7waGM@public.gmane.org>, kernel-testers-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-next-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, LKML <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Pekka Enberg <penberg-bbCR+/B0CizivPeTLB3BmA@public.gmane.org>
List-Id: linux-next.vger.kernel.org

--Signature=_Sat__19_Jul_2008_23_22_56_+1000_PquE/liHnRR9wW2v
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Vegard,

On Sat, 19 Jul 2008 14:59:12 +0200 "Vegard Nossum" <vegard.nossum-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org=
> wrote:
>
> Ehe... and this is the reason why: The code was added by this patch:
>=20
> commit 0e3638d1e04040121af00195f7e4628078246489
> Author: Dave Hansen <haveblue-r/Jw6+rmf7HQT0dZR+AlfA@public.gmane.org>
> Date:   Thu Mar 16 17:30:16 2006 -0800
>=20
>     warn when statically-allocated kobjects are used
>=20
> ..which only exists in -next. Is that just a truly ancient patch, or
> did somebody forget to adjust their clock?
>=20
> (Stephen: Maybe this has been answered before, but what's the best way
> to figure out where it came from?)

The easiest way is to ask me to look in my source tree (since I have the
heads of all the branches I merge - at least until the next day and gitk
then makes it easy ...).

In this case, that commit comes from the driver-core tree.

--=20
Cheers,
Stephen Rothwell                    sfr-3FnU+UHB4dNDw9hX6IcOSA@public.gmane.org
http://www.canb.auug.org.au/~sfr/

--Signature=_Sat__19_Jul_2008_23_22_56_+1000_PquE/liHnRR9wW2v
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkiB6rAACgkQjjKRsyhoI8xIUwCfel20JjVMLVPcVQuvpKyoy2vR
yQwAnArVN9XMGpG0V+WkYpyjkLgPIYa4
=dHqf
-----END PGP SIGNATURE-----

--Signature=_Sat__19_Jul_2008_23_22_56_+1000_PquE/liHnRR9wW2v--
