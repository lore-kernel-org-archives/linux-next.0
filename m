From: Nico -telmich- Schottelius <nico-linux-next@schottelius.org>
Subject: Re: How to debug linux-next?
Date: Thu, 31 Jul 2008 18:09:52 +0200
Message-ID: <20080731160952.GB4291@denkbrett.schottelius.org>
References: <20080731125630.GB4201@denkbrett.schottelius.org> <20080731132344.GC4201@denkbrett.schottelius.org> <20080731233558.ba613f33.sfr@canb.auug.org.au> <20080731144111.GA4291@denkbrett.schottelius.org> <s5h7ib2kpu1.wl%tiwai@suse.de>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="rJwd6BRFiFCcLxzm"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mx2.schottelius.org ([62.65.138.77]:40076 "EHLO
	mx2.schottelius.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750828AbYGaQJx (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 31 Jul 2008 12:09:53 -0400
Content-Disposition: inline
In-Reply-To: <s5h7ib2kpu1.wl%tiwai@suse.de>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Takashi Iwai <tiwai@suse.de>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org


--rJwd6BRFiFCcLxzm
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Takashi Iwai [Thu, Jul 31, 2008 at 05:58:46PM +0200]:
> I also would love to have a continuous git tree, but I guess it's
> pretty hard for linux-next after some time.  git-merge doesn't always
> track rebased trees perfectly, and we have also quilt trees in
> addition.  Moreover, sometimes some subtrees have to be dropped
> temporarily for fatal conflicts.

Yes, imho rebase is something that must create pain, as it changes the
history (independent of git and linux).
For quilt, I did never use it -- not sure how those trees could be
integrated.

And dropping trees: Would not ignore those branches for
merging help? Or if stuff has to be removed, to revert changes?

> One thing I think sometimes useful is a record of HEAD of each merged
> tree in a file, say, Next/heads.  Then you can see what changes have
> been done in each subtree more easily.

Sounds a little bit like manual merge recording.

> BTW, you can try to merge the tree by yourself.=20

Well, yes, but that breaks my idea of having all trees based on the same
history: If I want to see, what the agp team did after v2.6.29 was
released and compare it to what I've -- I cannot do it, because their
v2.6.29 base is a different one than mine.

Maybe merging stuff from different people is really (not yet?)
practical, but imho something that really uses the commit ids and
messages that are already existent would be pretty useful, so we
can use the usual tools like git-log and git-bisect.

Nico

--=20
Think about Free and Open Source Software (FOSS).
http://nico.schottelius.org/documentations/foss/the-term-foss/

PGP: BFE4 C736 ABE5 406F 8F42  F7CF B8BE F92A 9885 188C

--rJwd6BRFiFCcLxzm
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkiR49AACgkQuL75KpiFGIyZlwCgymLzDfomUtII2HaMVxQ/Mm5L
UfMAnjRXaZO8Qn1JPES7J/gxuoXuM0aq
=2G0F
-----END PGP SIGNATURE-----

--rJwd6BRFiFCcLxzm--
