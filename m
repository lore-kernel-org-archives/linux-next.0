From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: tip-core build failure
Date: Mon, 15 Sep 2008 05:45:08 +1000
Message-ID: <20080915054508.1a7f4a24.sfr@canb.auug.org.au>
References: <20080913111423.981554c3.sfr@canb.auug.org.au>
	<200809131144.36507.rui.p.m.sousa@gmail.com>
	<20080914124320.GG16097@elte.hu>
	<20080915040100.5a6f634f.sfr@canb.auug.org.au>
	<20080914183629.GA28010@elte.hu>
	<20080915050234.3519203a.sfr@canb.auug.org.au>
	<20080914191709.GA3246@elte.hu>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Mon__15_Sep_2008_05_45_08_+1000_SSQoxI04E0K_XITn"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:39088 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753590AbYINTpT (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Sun, 14 Sep 2008 15:45:19 -0400
In-Reply-To: <20080914191709.GA3246@elte.hu>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Ingo Molnar <mingo@elte.hu>
Cc: Rui Sousa <rui.p.m.sousa@gmail.com>, linux-next@vger.kernel.org

--Signature=_Mon__15_Sep_2008_05_45_08_+1000_SSQoxI04E0K_XITn
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Ingo,

On Sun, 14 Sep 2008 21:17:09 +0200 Ingo Molnar <mingo@elte.hu> wrote:
>
> * Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>=20
> > On Sun, 14 Sep 2008 20:36:29 +0200 Ingo Molnar <mingo@elte.hu> wrote:
> > >
> > > [ ... just used by 90%+ of our active testers/developers ;-) ... ]
> >=20
> > An irrelevant argument in this case.
>=20
> why is the actual usage distribution of Linux irrelevant? We make=20

Notice the "in this case"?  In this case the code being changed clearly
could affect other architectures, so checking that x86 is OK is clearly
not enough (and that does not mean building it for 20+ other
architectures, just using grep to see the consequences of the change and
maybe discussing it with the affected architecture maintainers or on
linux-arch).

> Well, having a bias towards the most popular code and most popular=20
> devices and platforms is not just acceptable and it is not just common=20
> sense - it's also a basic required skill from any Linux subsystem=20
> maintainer. Ignoring the most popular usage would be silly and=20
> counter-productive.

I agree with you whole heartedly, and if any other architecture
maintainer broke x86, I would be complaining as well. And that has
nothing to do with what I said.

> And that requirement can be turned around to a certain degree: having an=
=20
> unreasonable bias _against_ popular platforms is counterproductive. I.e.=
=20
> you should weigh whether forcing the unreasonable use of our testing and=
=20
> development resources is good for Linux.

And again, this has nothing to do with what I said.  In fact, I build
every merge of linux-next for x86_64 allmodconfig ... in no way do I have
a bias against any architecture and I am not trying to force everyone to
do lots of cross builds, just, when making changes that could affect
other architectures, to make a little effort to reduce the pain.

> > But doing at least a simple grep for usages of the thing you are=20
> > changing, that is not unreasonable ...  especially if you are changing=
=20
> > (usually not well defined in the first place) interfaces that the=20
> > architectures have had to implement (as was the case here).
>=20
> this assumes that the connection is realized. It was not realized in=20
> this case.

OK, then let move on.

> we cross-build them (and fix the bugs, if any are found), but it's all=20
> driven by demand really or when we suspect there might be cross-arch=20
> breakage (it wasnt in this case). If i have the choice between analysing=
=20
> and fixing a bug that was reported by a real user and spending hours on=20
> cross-builds i do chose the one that helps Linux more.

Good to know.

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Mon__15_Sep_2008_05_45_08_+1000_SSQoxI04E0K_XITn
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkjNacQACgkQjjKRsyhoI8wRHACgtd95D2w1r9JftviTNHxzpOcs
va4An1UBcfkYxvQ+EAMepcXGxJJ07wtw
=0xDY
-----END PGP SIGNATURE-----

--Signature=_Mon__15_Sep_2008_05_45_08_+1000_SSQoxI04E0K_XITn--
