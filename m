From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: build failure after merge of the modules tree
Date: Thu, 25 Jun 2015 11:50:17 +1000
Message-ID: <20150625115017.4ac34bb8@canb.auug.org.au>
References: <20150624113727.4f61ba18@canb.auug.org.au>
	<CALZtONAqdXeV0=Enjsw6YzuWFC-4ZqpeWfwxcEgBa+1CasqbGA@mail.gmail.com>
	<20150625085706.787b7100@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/gFEH1zi.0tJXoo7L8koX/0="; protocol="application/pgp-signature"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:59985 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751014AbbFYBuZ (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 24 Jun 2015 21:50:25 -0400
In-Reply-To: <20150625085706.787b7100@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Dan Streetman <ddstreet@ieee.org>
Cc: Rusty Russell <rusty@rustcorp.com.au>, linux-next@vger.kernel.org, linux-kernel <linux-kernel@vger.kernel.org>

--Sig_/gFEH1zi.0tJXoo7L8koX/0=
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Dan,

On Thu, 25 Jun 2015 08:57:06 +1000 Stephen Rothwell <sfr@canb.auug.org.au> =
wrote:
>
> On Wed, 24 Jun 2015 14:18:44 -0400 Dan Streetman <ddstreet@ieee.org> wrot=
e:
> >
> > On Tue, Jun 23, 2015 at 9:37 PM, Stephen Rothwell <sfr@canb.auug.org.au=
> wrote:
> > >
> > > After merging the modules tree, today's linux-next build (x86_64
> > > allmodconfig) failed like this:
> >=20
> > that's weird.  Are you sure it failed during allmodconfig?  I can see
> > why it would fail like that if CONFIG_MODULES ins't defined, which
> > I'll send a patch for...
>=20
> Pretty sure - and, in any case, I don't do any CONFIG_MODULES=3Dn builds
> between tree merges (only later in the day).  That is why I couldn't
> figure out what went wrong.
>=20
> I will apply your patch today and see if that helps.

I built without your patch and it failed again, but applying your patch fix=
es it.

Rusty, you can consider this

Tested-by: Stephen Rothwell <sfr@canb.auug.org.au>

for "[PATCH] modules: only use mod->param_lock if CONFIG_MODULES"
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

--Sig_/gFEH1zi.0tJXoo7L8koX/0=
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJVi15dAAoJEMDTa8Ir7ZwVpk0P/1ek4Z4EhGz1gMJIqwe2e6HI
HuIIo7MGBZuQcN9f+kft4kY7XgTVH6YfMRwW2GlPLBu5W0kC2Bd3i3JkE65oPUdp
lE/i7+hGUrWo5sVTKPIKGKsM//QK4zSxWmaOxzP/6SL64AitAn6W/sjpEN4aePvj
idYvO2peBrnPqrjUl79zxbbtl9yIagwY+cjZPFFHEbTIPMQFiomPjK4WOrUUcvHJ
9xOUzylhf54XjiUsbDSUx5y6EPURk3ZRyo/SzAFucGOQoVyvMMrQPhM2elnppWap
M+/miuKhyATdYk1C1zDmLhFDLibNAifsqekmfWZz7idpzgMl9q6tG1/4hQMl4vqc
u+CD6Z8UCjM1ONntfgfyR6hn6MuL4yoDNsT00BOtgY6DB213yhDO5pG8DrXVOJ2V
SNEHJ2EF78rEAXM0s69RFlS92UCZ5uNYFbdieSbGr9EHvoq0vI9IrE7jtJJPleds
HCoPbKF0IT8Oxvuz9ey4nCPiVOn50stp7BLZJJn6Z4+Rxq62f7PklnEtMYsFC7o4
Xhv/2oit8U+M1AHxEKXuA9ZT1TTHfTLHu6U0kL2eUkX8utpytDsh4L0ty0jr6g7u
Vm6JoerCm729lIMri1djJhi5jpcOLo1oHDaB03WMOH0mhR47JrowbwZGo0YKxLHw
1z5GZOqaISJKcKZZpryK
=DKdw
-----END PGP SIGNATURE-----

--Sig_/gFEH1zi.0tJXoo7L8koX/0=--
