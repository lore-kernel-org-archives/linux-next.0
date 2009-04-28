From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: voltage tree build failure
Date: Tue, 28 Apr 2009 21:42:07 +1000
Message-ID: <20090428214207.4a27d391.sfr@canb.auug.org.au>
References: <20090428162444.f7ee93f3.sfr@canb.auug.org.au>
	<1240916917.14165.117.camel@vega.slimlogic.co.uk>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Tue__28_Apr_2009_21_42_07_+1000_PQGcSfdqRltJeTu3"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:38016 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753650AbZD1Lm0 (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 28 Apr 2009 07:42:26 -0400
In-Reply-To: <1240916917.14165.117.camel@vega.slimlogic.co.uk>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Liam Girdwood <lrg@slimlogic.co.uk>
Cc: linux-next@vger.kernel.org, Mike Rapoport <mike@compulab.co.il>

--Signature=_Tue__28_Apr_2009_21_42_07_+1000_PQGcSfdqRltJeTu3
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Liam,

On Tue, 28 Apr 2009 12:08:37 +0100 Liam Girdwood <lrg@slimlogic.co.uk> wrot=
e:
>
> On Tue, 2009-04-28 at 16:24 +1000, Stephen Rothwell wrote:
> > Hi Liam,
> >=20
> > Today's linux-next build (powerpc allyesconfig) failed like this:
> >=20
> > drivers/regulator/userspace-consumer.c:43: error: conflicting types for=
 'show_state'
> > include/linux/sched.h:273: note: previous definition of 'show_state' wa=
s here
> >=20
> > Caused by commit 5defa2bce704ca4151cfe24e4297aa7797cafd22 ("regulator:
> > add userspace-consumer driver") which I have reverted for today.
>=20
> Sorry about this. I've now fixed in voltage next by renaming with a reg_
> prefix. Fwiw - I did test build for ARM and all was OK yesterday. I
> guess I need to build allyesconfig too.

More likely, sched.h is indirectly included on some platforms and not
others.  This is partly what linux-next is for: to find cross platform
and subsystem interactions.

Thanks for the fix.
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Tue__28_Apr_2009_21_42_07_+1000_PQGcSfdqRltJeTu3
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkn2648ACgkQjjKRsyhoI8xyagCfYeY/NNE18agQD76HqVMY1N+w
/bsAn3WWH+oBzQEKFasllv1wvQQGavKb
=8s+d
-----END PGP SIGNATURE-----

--Signature=_Tue__28_Apr_2009_21_42_07_+1000_PQGcSfdqRltJeTu3--
