From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: [PATCH] modules: elide param_lock if !CONFIG_SYSFS
Date: Sat, 27 Jun 2015 10:21:34 +1000
Message-ID: <20150627102134.00e58047@canb.auug.org.au>
References: <CALZtONA4kOn2yciNYA2C9QdXuovdjFXBca4EU4CDs6XDiQtxJQ@mail.gmail.com>
	<1435237448-13684-1-git-send-email-ddstreet@ieee.org>
	<87616bsd02.fsf@rustcorp.com.au>
	<CALZtOND_-LahkJE5pD6eQOusT42M4-9ECKZ1cD+F_dPK4CVX8A@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/f_mLrvoysaG+3x+W0EIsHs9"; protocol="application/pgp-signature"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:57689 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752228AbbF0AVm (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Fri, 26 Jun 2015 20:21:42 -0400
In-Reply-To: <CALZtOND_-LahkJE5pD6eQOusT42M4-9ECKZ1cD+F_dPK4CVX8A@mail.gmail.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Rusty Russell <rusty@rustcorp.com.au>
Cc: Dan Streetman <ddstreet@ieee.org>, linux-next@vger.kernel.org, linux-kernel <linux-kernel@vger.kernel.org>

--Sig_/f_mLrvoysaG+3x+W0EIsHs9
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Rusty,

On Thu, 25 Jun 2015 17:34:31 -0400 Dan Streetman <ddstreet@ieee.org> wrote:
>
> On Thu, Jun 25, 2015 at 5:18 PM, Rusty Russell <rusty@rustcorp.com.au> wr=
ote:
> > Dan Streetman <ddstreet@ieee.org> writes:
> >> Only include the built-in and per-module param_lock, and corresponding
> >> lock/unlock functions, if sysfs is enabled.  If there is no sysfs there
> >> is no need for locking kernel params.
> >>
> >> This fixes a build break when CONFIG_SYSFS is not enabled, introduced
> >> by commit b51d23e.
> >
> > This doesn't even come close to applying to my tree?
>=20
> sorry, I had the !CONFIG_MODULES patch in my tree also, so this was on
> top of that one:
> https://lkml.org/lkml/2015/6/24/550
>=20
> I can resend that one, on top of this one, or you can fix it up.
>=20
> Sorry for not getting it right the first time ;-)

This is what I ended up applying to yesterday's linux-next:

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Fri, 26 Jun 2015 13:19:19 +1000
Subject: [PATCH] modules: only use mod->param_lock if CONFIG_MODULES

Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 kernel/params.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/kernel/params.c b/kernel/params.c
index faa461c16f12..adc0bbc06cc5 100644
--- a/kernel/params.c
+++ b/kernel/params.c
@@ -30,7 +30,11 @@
 static DEFINE_MUTEX(param_lock);
=20
 /* Use the module's mutex, or if built-in use the built-in mutex */
+#ifdef CONFIG_MODULES
 #define KPARAM_MUTEX(mod)	((mod) ? &(mod)->param_lock : &param_lock)
+#else
+#define KPARAM_MUTEX(mod)	(&param_lock)
+#endif
=20
 static inline void check_kparam_locked(struct module *mod)
 {
--=20
2.1.4


--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

--Sig_/f_mLrvoysaG+3x+W0EIsHs9
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJVjeyTAAoJEMDTa8Ir7ZwVIWUP/j9mO9l3lyi0qeMS8jcQZps+
FtZQTvKefasrAlSDbJ6wbOs456WsTRUiRdM4GMwuEznGfAe8xCCYaN/VIXf7pf9E
Rz/GcEgsCPjmTaxkDBoQDIq+rHnFz8Nn3ebjav/UpVwvuL5nDjCouOmx1Fait4X0
EChOTLLVWAJLkQFIThBnGMIwTPHKiX1lvC+UqcFFCvmBIme55RM55c+zDrX2m2/m
9BZf4OXDQR+nf5677iApWQMIQqB0OhKQ6z6TvybxORBA9Zapxc/GUROvDcPG5no4
Kl7ypwllcRFJcYxA6t6QuM1lJZfxfU5eeC/MS7sXLDAjl2wsoAOMhDfehIBalaM9
8c4U84U70gMhc/TrFzaux77egoj2DCYS2ZxfhRo2owUM0kpNKuxrvHTmOqFlWwuh
u2xMMRhTdWlv3YmtxLtoTcot05RdtE9XlJkqazG7R9WWTRGy6Q/lr6bqmofJ9b8o
ioi6pdEg2u1V0rDa/Qx0CH3TN9duM/6q3P/kLgXLQQzU6LEbAbO+jWRg4MAcjmV/
7BFoLTxyW2CHUf85OfUlQyGKHvjwv+9TZogKEG++Jl0xjFRw/HMOpR/VYrv0dAho
qO/15QgD3lqn5DZDwvVnyuFzzYb8B3LPj6rVtnzIpwrazg13UGUKOhqbBhujf6Cp
PjYz+ChRCyJ21C/8AzOo
=jGhG
-----END PGP SIGNATURE-----

--Sig_/f_mLrvoysaG+3x+W0EIsHs9--
