From: Wolfram Sang <wsa@the-dreams.de>
Subject: Re: linux-next: manual merge of the pm tree with the i2c tree
Date: Sun, 17 Jul 2016 20:14:48 +0200
Message-ID: <20160717181448.GC1814@katana>
References: <20160715121723.0f21f148@canb.auug.org.au>
 <2993186.kRkeiY7GfT@vostro.rjw.lan>
 <20160715123253.GB2620@tetsubishi>
 <2196027.ndrBocBl2R@vostro.rjw.lan>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="wxDdMuZNg1r63Hyj"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from sauhun.de ([89.238.76.85]:49821 "EHLO pokefinder.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751102AbcGQSO4 (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Sun, 17 Jul 2016 14:14:56 -0400
Content-Disposition: inline
In-Reply-To: <2196027.ndrBocBl2R@vostro.rjw.lan>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: "Rafael J. Wysocki" <rjw@rjwysocki.net>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Octavian Purdila <octavian.purdila@intel.com>, Jarkko Nikula <jarkko.nikula@linux.intel.com>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Mika Westerberg <mika.westerberg@linux.intel.com>


--wxDdMuZNg1r63Hyj
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


> > > > > I fixed it up (I think, but it needs more work - see below) and c=
an
> > > >=20
> > > > For a start, it generates this warning, now:
> > > >=20
> > > > drivers/i2c/i2c-core.c:269:20: warning: 'i2c_acpi_add_device' defin=
ed but not used [-Wunused-function]
> > > > static acpi_status i2c_acpi_add_device(acpi_handle handle, u32 leve=
l,
> > > >                    ^
> > >=20
> > > OK, thanks for the heads-up.
> >=20
> > Yes, thanks!
> >=20
> > >=20
> > > Wolfram, what about if I exposed my "acpi-tables" branch for you to p=
ull?
> > >=20
> > > You could resolve this in your tree then.
> >=20
> > I can pull it in, sure. For the fixup, I'd like a commitment from one of
> > the ACPI experts (Jarkko, Mika, Andy), though. Otherwise I'd need to
> > revert given that we are quite late in the cycle already.
>=20
> The branch is here:
>=20
>  git://git.kernel.org/pub/scm/linux/kernel/git/rafael/linux-pm.git acpi-t=
ables
>=20
> The top-most commit is:
>=20
> fafe5306f201 ACPI: Rename configfs.c to acpi_configfs.c to prevent link e=
rror
>=20
> I won't rebase this branch going forward, so it is safe to pull.
>=20
> Please let me know how I can help with the conflict resolution.

Well, not knowing much about ACPI, I just need the conflict resolution
for my latest i2c/for-next and your above branch. If you want to do it,
fine with me. But maybe Jarkko will be back to office on Monday, too.


--wxDdMuZNg1r63Hyj
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJXi8sYAAoJEBQN5MwUoCm2h6MP/24c4aKTpvO8OaGKtArPEbKc
g1RuKNLc4+7YCDNLlzecB7BslrzCk/NFWpwBke9t77YhNQSbGeOGcV06e3NSAxKh
J9iXQpM+XzsyzLureBE8S2ppEDdBcsbMbKi1DAMuqEepERe1pChOLRCvfVtbWpD4
vmyAem6JcoLTYa17+p+fRRHFy7MpQ3NYkK06UgmdsidQlXLW4aFEjR/qjrBJ4+dE
uiat5LKcIlMhNZ5IIQBdfab8wPJYHjTN9RwD2ZsLpJkfLI/kjU7VL5C5Uvp28rY9
NLFuwwuhI34/74FR2+Ub8i+zGTussEBNAI3Ldi8pTiKsZBlGYSCZTL+LSpl7FYPn
4q8JJBb2+vTO4/Uu4HiaDSLPGiW6ySJEP5sxH7+rWm7vs7IAUNG7Mf1fESoNRz+j
fHQwvMFbu3Koa48s5omPN2umD5GUq2KYeXywLAI9IqH/KURj/YdK6VocztGtbJBZ
9oTTiwF9ZC7QpdJuvrvsBSlxBV2yNi0ldB4I+fRVjvg/TWlTdwgjCxL/seHkF2rG
znaf2YfeWk15ckb6IhYzGoCUAgUh48QfjwggHxbQFLSp9rOOCvVLQgYWZIpHK6NN
mvIadICA9qPqVWETTJh+UgBH1GEyNLOIN4/r3xzsqTxEcbJ02QbjxQ7stLGj5yLf
44uMAennb/fydkb9W+ki
=yhmA
-----END PGP SIGNATURE-----

--wxDdMuZNg1r63Hyj--
