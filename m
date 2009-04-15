From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: [PATCH -next] modules: Fix up build when
 CONFIG_MODULE_UNLOAD=n.
Date: Wed, 15 Apr 2009 11:28:29 +1000
Message-ID: <20090415112829.1125b9bf.sfr@canb.auug.org.au>
References: <20090409154944.GC7789@linux-sh.org>
	<20090414062647.GA28905@linux-sh.org>
	<20090414172718.0ad4572c.sfr@canb.auug.org.au>
	<alpine.LRH.2.00.0904150819460.12563@tundra.namei.org>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Wed__15_Apr_2009_11_28_29_+1000_c/5yQzCObD3isbn4"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:51848 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751300AbZDOB2l (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 14 Apr 2009 21:28:41 -0400
In-Reply-To: <alpine.LRH.2.00.0904150819460.12563@tundra.namei.org>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: James Morris <jmorris@namei.org>
Cc: linux-next@vger.kernel.org, Paul Mundt <lethal@linux-sh.org>, Kees Cook <kees@ubuntu.com>, Rusty Russell <rusty@rustcorp.com.au>

--Signature=_Wed__15_Apr_2009_11_28_29_+1000_c/5yQzCObD3isbn4
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi James,

On Wed, 15 Apr 2009 08:19:59 +1000 (EST) James Morris <jmorris@namei.org> w=
rote:
>
> On Tue, 14 Apr 2009, Stephen Rothwell wrote:
>=20
> > On Tue, 14 Apr 2009 15:26:47 +0900 Paul Mundt <lethal@linux-sh.org> wro=
te:
> > >
> > > This is still broken in today's -next..
> >=20
> > James, can we have this fixed, please?
>=20
> Applied to=20
> git://git.kernel.org/pub/scm/linux/kernel/git/jmorris/security-testing-2.=
6#next

Thanks.

Unfortunately, you applied it with me as the author instead of Paul ...

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Wed__15_Apr_2009_11_28_29_+1000_c/5yQzCObD3isbn4
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAknlOD0ACgkQjjKRsyhoI8zyUgCgkCJ9/PtZQuyan/GB5QYsqk8b
z/UAn3j+4y0sIq1Gynbf0rp1nP10yrw9
=grtM
-----END PGP SIGNATURE-----

--Signature=_Wed__15_Apr_2009_11_28_29_+1000_c/5yQzCObD3isbn4--
