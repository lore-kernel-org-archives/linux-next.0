From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: [PATCH] nfs: fix build error in nfsroot with initconst
Date: Wed, 20 May 2009 11:30:15 +1000
Message-ID: <20090520113015.63334073.sfr@canb.auug.org.au>
References: <20090505111712.ae4649b3.sfr@canb.auug.org.au>
	<20090505111114.GA16497@uranus.ravnborg.org>
	<20090506133253.43409da9.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Wed__20_May_2009_11_30_15_+1000_Sk6W85PuRXZm433O"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:35737 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1755035AbZETBaZ (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 19 May 2009 21:30:25 -0400
In-Reply-To: <20090506133253.43409da9.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Trond Myklebust <Trond.Myklebust@netapp.com>
Cc: Sam Ravnborg <sam@ravnborg.org>, linux-next@vger.kernel.org, Jan Beulich <jbeulich@novell.com>, Steven Whitehouse <swhiteho@redhat.com>

--Signature=_Wed__20_May_2009_11_30_15_+1000_Sk6W85PuRXZm433O
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Trond,

On Wed, 6 May 2009 13:32:53 +1000 Stephen Rothwell <sfr@canb.auug.org.au> w=
rote:
>
> On Tue, 5 May 2009 13:11:14 +0200 Sam Ravnborg <sam@ravnborg.org> wrote:
> >
> > fix build error with latest kbuild adjustments to initconst.
> >=20
> > The commit a447c0932445f92ce6f4c1bd020f62c5097a7842 ("vfs: Use
> > const for kernel parser table") changed:
> >=20
> >     static match_table_t __initdata tokens =3D {
> > to
> >     static match_table_t __initconst tokens =3D {
> >=20
> > But the missing const causes popwerpc to fail with latest
> > updates to __initconst like this:
> >=20
> > fs/nfs/nfsroot.c:400: error: __setup_str_nfs_root_setup causes a sectio=
n type conflict
> > fs/nfs/nfsroot.c:400: error: __setup_str_nfs_root_setup causes a sectio=
n type conflict
> >=20
> > The bug is only present with kbuild-next.
> > Following patch has been build tested.
> >=20
> > Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
> > Cc: Steven Whitehouse <swhiteho@redhat.com>
> > Cc: Stephen Rothwell <sfr@canb.auug.org.au>
>=20
> I build tested this with the offending compilers, so
>=20
> Tested-by: Stephen Rothwell <sfr@canb.auug.org.au>
> Acked-by: Stephen Rothwell <sfr@canb.auug.org.au>

Any reason this has not appeared in the nfs (or Linus') tree yet?

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Wed__20_May_2009_11_30_15_+1000_Sk6W85PuRXZm433O
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkoTXScACgkQjjKRsyhoI8y3KACfYJ9CEPADKW3aBcADdjRSi86E
1b8AoJZmBs/zpak3lgmchCTVXdjYsO8N
=VZbw
-----END PGP SIGNATURE-----

--Signature=_Wed__20_May_2009_11_30_15_+1000_Sk6W85PuRXZm433O--
