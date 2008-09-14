From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: tip-core build failure
Date: Mon, 15 Sep 2008 05:02:34 +1000
Message-ID: <20080915050234.3519203a.sfr@canb.auug.org.au>
References: <20080913111423.981554c3.sfr@canb.auug.org.au>
	<200809131144.36507.rui.p.m.sousa@gmail.com>
	<20080914124320.GG16097@elte.hu>
	<20080915040100.5a6f634f.sfr@canb.auug.org.au>
	<20080914183629.GA28010@elte.hu>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Mon__15_Sep_2008_05_02_34_+1000_KTjUXCw71U4xShS/"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:36958 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753950AbYINTCr (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Sun, 14 Sep 2008 15:02:47 -0400
In-Reply-To: <20080914183629.GA28010@elte.hu>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Ingo Molnar <mingo@elte.hu>
Cc: Rui Sousa <rui.p.m.sousa@gmail.com>, linux-next@vger.kernel.org

--Signature=_Mon__15_Sep_2008_05_02_34_+1000_KTjUXCw71U4xShS/
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Ingo,

On Sun, 14 Sep 2008 20:36:29 +0200 Ingo Molnar <mingo@elte.hu> wrote:
>
> * Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> >=20
> > Well, its not really that difficult, you just have to remember that x86
> > is not the whole world [...]
>=20
> [ ... just used by 90%+ of our active testers/developers ;-) ... ]

An irrelevant argument in this case.

> hm, you seem to have a bias for powerpc, but you should realize that=20

And you seem to have a bias for x86, so what!

> cross-building for 20+ architectures (i.e. increasing the testing=20
> overhead twenty-fold), to cover the remaining <10% of the test space is=20
> unreasonable: for many developers it's not just virtually impossible in=20
> practice but also often a serious waste of time.

I am not asking for that.

> We want to push unreasonable work to those who depend on the result of=20
> that unreasonable work - i.e. users/developers of those platforms - not=20
> everyone else. We dont want to hinder the progress of Linux with blindly=
=20
> requiring all patches that happen to touch common .c or .h files to=20
> successfully build on 20+ odd architectures.

But doing at least a simple grep for usages of the thing you are
changing, that is not unreasonable ...  especially if you are changing
(usually not well defined in the first place) interfaces that the
architectures have had to implement (as was the case here).

> ... anyway, no real arguments about this specific case, if a fix/report=20
> is available we'll integrate/fix the issue.

Thanks.

Besides, Ingo, many of the TIP trees (as I understand them) are not x86
specific, so expecting them to build on more than one architecture is
not unreasonable.  This is part of the job of the integrator ...

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Mon__15_Sep_2008_05_02_34_+1000_KTjUXCw71U4xShS/
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkjNX8oACgkQjjKRsyhoI8wddACgvPW0PiwTLG7eajttNUGDKr8n
cgsAmgMyMR1z1Qt/g+smrWT15GMjGUq9
=39ch
-----END PGP SIGNATURE-----

--Signature=_Mon__15_Sep_2008_05_02_34_+1000_KTjUXCw71U4xShS/--
