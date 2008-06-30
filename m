From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: build failure
Date: Tue, 1 Jul 2008 09:30:22 +1000
Message-ID: <20080701093022.bea0cfdf.sfr@canb.auug.org.au>
References: <20080630232248.8d993f1d.sfr@canb.auug.org.au>
	<20080630081239.f62aec40.randy.dunlap@oracle.com>
	<20080630084912.df038c30.randy.dunlap@oracle.com>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Tue__1_Jul_2008_09_30_22_+1000_fP1jbhnAqXnTDzsT"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:55977 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752877AbYF3Xa1 (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 30 Jun 2008 19:30:27 -0400
In-Reply-To: <20080630084912.df038c30.randy.dunlap@oracle.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Randy Dunlap <randy.dunlap@oracle.com>
Cc: Sam Ravnborg <sam@ravnborg.org>, linux-next@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>

--Signature=_Tue__1_Jul_2008_09_30_22_+1000_fP1jbhnAqXnTDzsT
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Randy,

On Mon, 30 Jun 2008 08:49:12 -0700 Randy Dunlap <randy.dunlap@oracle.com> w=
rote:
>
> On Mon, 30 Jun 2008 08:12:39 -0700 Randy Dunlap wrote:
>=20
> > All (ALL) of my randconfig builds on i386 and x86_64 are failing like t=
his.
>=20
> I should have said:
>=20
> I'm using the daily patch*bz2 file, not git.
> And I'm using O=3D for output.
> When not using O=3D, the build does not have this problem.

Thanks for the report.  The patches are generated from the git tree so
should give you a tree with identical content.

I also use O=3D for all my builds.  Though my x86_64 allmodconfig builds
worked.

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Tue__1_Jul_2008_09_30_22_+1000_fP1jbhnAqXnTDzsT
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkhpbI4ACgkQjjKRsyhoI8xmdQCfUp7AEY+g1/ASEQSpigGckDOw
cSIAoIMpf+PigVHBi/oEcxmTYk28jeSV
=c909
-----END PGP SIGNATURE-----

--Signature=_Tue__1_Jul_2008_09_30_22_+1000_fP1jbhnAqXnTDzsT--
