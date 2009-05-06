From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: [PATCH] nfs: fix build error in nfsroot with initconst
Date: Wed, 6 May 2009 13:32:53 +1000
Message-ID: <20090506133253.43409da9.sfr@canb.auug.org.au>
References: <20090505111712.ae4649b3.sfr@canb.auug.org.au>
	<20090505111114.GA16497@uranus.ravnborg.org>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Wed__6_May_2009_13_32_53_+1000_Dwnrj9p/naqWTomB"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:56856 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751619AbZEFDc6 (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 5 May 2009 23:32:58 -0400
In-Reply-To: <20090505111114.GA16497@uranus.ravnborg.org>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Sam Ravnborg <sam@ravnborg.org>
Cc: Trond Myklebust <Trond.Myklebust@netapp.com>, linux-next@vger.kernel.org, Jan Beulich <jbeulich@novell.com>, Steven Whitehouse <swhiteho@redhat.com>

--Signature=_Wed__6_May_2009_13_32_53_+1000_Dwnrj9p/naqWTomB
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Sam,

On Tue, 5 May 2009 13:11:14 +0200 Sam Ravnborg <sam@ravnborg.org> wrote:
>
> fix build error with latest kbuild adjustments to initconst.
>=20
> The commit a447c0932445f92ce6f4c1bd020f62c5097a7842 ("vfs: Use
> const for kernel parser table") changed:
>=20
>     static match_table_t __initdata tokens =3D {
> to
>     static match_table_t __initconst tokens =3D {
>=20
> But the missing const causes popwerpc to fail with latest
> updates to __initconst like this:
>=20
> fs/nfs/nfsroot.c:400: error: __setup_str_nfs_root_setup causes a section =
type conflict
> fs/nfs/nfsroot.c:400: error: __setup_str_nfs_root_setup causes a section =
type conflict
>=20
> The bug is only present with kbuild-next.
> Following patch has been build tested.
>=20
> Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
> Cc: Steven Whitehouse <swhiteho@redhat.com>
> Cc: Stephen Rothwell <sfr@canb.auug.org.au>

I build tested this with the offending compilers, so

Tested-by: Stephen Rothwell <sfr@canb.auug.org.au>
Acked-by: Stephen Rothwell <sfr@canb.auug.org.au>

I also build tested with the updates to __initconst as well.

> Please apply this either to your -next tree or preferably upstream.

If you want to keep the __initconst changes in your tree, then you need
the above in your tree as well ... (preferably before the __initconst
changes).

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Wed__6_May_2009_13_32_53_+1000_Dwnrj9p/naqWTomB
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkoBBOUACgkQjjKRsyhoI8xNCQCdGWbsCE40Gln4AALxluyBTWF6
iLsAoJX4fao3ODhYgvNVI7lHsGeKTbBo
=sKHg
-----END PGP SIGNATURE-----

--Signature=_Wed__6_May_2009_13_32_53_+1000_Dwnrj9p/naqWTomB--
