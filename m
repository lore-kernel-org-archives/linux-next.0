From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: build failure after merge of the clk tree
Date: Wed, 17 Dec 2014 14:47:14 +1100
Message-ID: <20141217144714.6702907a@canb.auug.org.au>
References: <20141216144536.594b50c0@canb.auug.org.au>
	<20141216072034.29014.12434@quantum>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/s/IuZt=TMX1r02ugI=FYujP"; protocol="application/pgp-signature"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:47585 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751108AbaLQDrW (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 16 Dec 2014 22:47:22 -0500
In-Reply-To: <20141216072034.29014.12434@quantum>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Mike Turquette <mturquette@linaro.org>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Stephen Boyd <sboyd@codeaurora.org>

--Sig_/s/IuZt=TMX1r02ugI=FYujP
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Mike,

On Mon, 15 Dec 2014 23:20:34 -0800 Mike Turquette <mturquette@linaro.org> w=
rote:
>
> Quoting Stephen Rothwell (2014-12-15 19:45:36)
> > Hi Mike,
> >=20
> > After merging the clk tree, today's linux-next build (x86_64
> > allmodconfig) failed like this:
> >=20
> > In file included from arch/x86/include/asm/bug.h:35:0,
> >                  from include/linux/bug.h:4,
> >                  from include/linux/cpumask.h:12,
> >                  from arch/x86/include/asm/cpumask.h:4,
> >                  from arch/x86/include/asm/msr.h:10,
> >                  from arch/x86/include/asm/processor.h:20,
> >                  from arch/x86/include/asm/atomic.h:6,
> >                  from include/linux/atomic.h:4,
> >                  from include/linux/debug_locks.h:5,
> >                  from include/linux/lockdep.h:23,
> >                  from include/linux/spinlock_types.h:18,
> >                  from include/linux/mutex.h:15,
> >                  from include/linux/notifier.h:13,
> >                  from include/linux/clk.h:17,
> >                  from include/linux/clk-provider.h:14,
> >                  from include/linux/clk-private.h:14,
> >                  from drivers/clk/clk.c:12:
> > drivers/clk/clk.c: In function 'clk_debug_create_one':
> > include/linux/lockdep.h:339:51: error: invalid type argument of '->' (h=
ave 'struct mutex')
> >  #define lockdep_is_held(lock) lock_is_held(&(lock)->dep_map)
> >                                                    ^
> > include/asm-generic/bug.h:86:25: note: in definition of macro 'WARN_ON'
> >   int __ret_warn_on =3D !!(condition);    \
> >                          ^
> > include/linux/lockdep.h:362:27: note: in expansion of macro 'lockdep_is=
_held'
> >    WARN_ON(debug_locks && !lockdep_is_held(l)); \
> >                            ^
> > drivers/clk/clk.c:248:2: note: in expansion of macro 'lockdep_assert_he=
ld'
> >   lockdep_assert_held(clk_debug_lock);
> >   ^
> >=20
> > Caused by commit 9a2027b99994 ("clk: Really fix deadlock with
> > mmap_sem").  I wonder how this ever built?
>=20
> This was fixed up earlier today. Next run through should be fine.

This is still broken ... and the diff from yesterday's version of the
clk tree was empty :-(
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

--Sig_/s/IuZt=TMX1r02ugI=FYujP
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJUkPzIAAoJEMDTa8Ir7ZwVDFQP/iVpvWzvKHMdlXe1lcptgAho
Bx7668LCO7leSCxfN51Jg56bB2E3gkSFjwHvLDF18/7wxUUXmYvxfP/xOzEcxFkh
C16SUaco+aMNZw64K5DWCcrZKIlDXcOMUx0jNmYTcQmjwg61vekuBGSl0uVdvOoV
qY0f5fQKXc731VXc6fb2jhefVHzRGLe+OpJ+y2+XIOULhY3OHzM2/4uLNBlN0qi0
soVOnnteBBeNfM5zDiKQYNVafjB9ptJNx+gLZtyG/YhW+zUBd5SGl8+bWSZuPz9S
V1x7HWjxIwK+hFSLyzZeO9UyOtBWICGKXC9XBUddIjnZ1Fl96BUceJl0a23/0uv2
p27i3W7hfbMeyWbLLr2C6J6fzP5EQiggFzBS10LSiFUFxmcMWp8TYW1Ht4KB+BtC
epbj1J05i7NYGGRLsS4ATzSEPVuD3rXz7/pjx2DMJ866HMYa61iGwLdW8NBhMfLF
Phh6lwDYHmnO15kxFKjihOU8UrL2zCRWGtbR6RjA0i+8bnlwDSHoRBRsCrbQBRjP
4izajBBZB1HJYYs1cGXa2RShmZI9ggczA5zgizc7754Z62kuhZqWQjwNQpCSfIOn
pdafZ4p5TWZIJi1xFPWqS/gsHDwybmKo+g+qjwjItH8KgFGdKC+n134mTU2z767V
sVQiNb1Pq1v4lh8XfOnP
=U4Tm
-----END PGP SIGNATURE-----

--Sig_/s/IuZt=TMX1r02ugI=FYujP--
