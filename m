From: Nico -telmich- Schottelius <nico-linux-next@schottelius.org>
Subject: Re: How to debug linux-next?
Date: Thu, 31 Jul 2008 16:41:11 +0200
Message-ID: <20080731144111.GA4291@denkbrett.schottelius.org>
References: <20080731125630.GB4201@denkbrett.schottelius.org> <20080731132344.GC4201@denkbrett.schottelius.org> <20080731233558.ba613f33.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="WIyZ46R2i8wDzkSu"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mx2.schottelius.org ([62.65.138.77]:56506 "EHLO
	mx2.schottelius.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752439AbYGaOlO (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 31 Jul 2008 10:41:14 -0400
Content-Disposition: inline
In-Reply-To: <20080731233558.ba613f33.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org


--WIyZ46R2i8wDzkSu
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Stephen Rothwell [Thu, Jul 31, 2008 at 11:35:58PM +1000]:
> > - What's the normal way of finding out the source for a problem, if you=
 know
> >   a good commit (9bead9ae16728973cd31d9fd60c496e0e2fabbd1) and a
> >   bad commit (dcb80fdb8cffd3fa06cd322b3e8227632ec23597)?
>=20
> It is much easier to use "git bisect" within a single linux-next release
> than between releases.

Yep, that's the problem I am facing now.

> > - As far as I can see, you are doing rebase on linux-next. Why don't you
> >   continue to do git-merge?
>=20
> Because some of the trees that are merged into linux-next are rebased
> fairly often as well.

Argh, such a pain. Imho it would be much nicer for tracking down
problems, if people just continue their graph, without doing rebase.

Stephen, as you've more experience with the other maintainers:
Would it not be possible to retrieve a branch from most subsystems
that is never rebased?

Imho doing rebase breaks alot of possibilities with git, as you remove
commits and break the history (which is what makes git powerful for me).

> > - And would a non-rebased tree not make life much easier for debugging
> >   purposes?
>=20
> I don't know.  What it would do is produce a lot more merge conflicts as
> patches are moved around, changed, removed etc on a daily basis.

The only issue I see is with rewritten patches. Otherwise git-merge
should detect already applied patches and without git I see
git-format-patch and git-am as quite strong tools.

I must confess, that I _really_ like the idea of doing
git-fetch && git-merge linux-next, so git-bisect works
for all versions.

> > My motivation is to find out the reason why xorg crashes now together
> > with the xorg guys. But currently it seems to be impossible for me to
> > detect which commits have been between to snapshots of the master
> > branch of linux-next.
>=20
> Yeah, that is a pain.  Does Linus' tree work?

Just compiling..the dual core 1.83ghz cpu is just too slow...reboot...
works. I'm writing this E-Mail running 2.6.27-rc1-denkbrett-00156-g94ad374
under xorg.

Nico

--=20
Think about Free and Open Source Software (FOSS).
http://nico.schottelius.org/documentations/foss/the-term-foss/

PGP: BFE4 C736 ABE5 406F 8F42  F7CF B8BE F92A 9885 188C

--WIyZ46R2i8wDzkSu
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkiRzwYACgkQuL75KpiFGIwDigCg3ZCPPa3DD7fu9P+x7RNNSaXE
uPcAoLRP+LvfeDSPzs2a1tsqQrImEb16
=GXyU
-----END PGP SIGNATURE-----

--WIyZ46R2i8wDzkSu--
