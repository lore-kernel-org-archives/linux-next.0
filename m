From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: manual merge of the trivial tree
Date: Wed, 27 Aug 2008 15:19:57 +1000
Message-ID: <20080827151957.341e79fa.sfr@canb.auug.org.au>
References: <20080728133707.087f1d73.sfr@canb.auug.org.au>
	<20080728094110.GA6278@mail.local.tull.net>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Wed__27_Aug_2008_15_19_57_+1000_qHUusmMpxj04+42n"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:43284 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751525AbYH0FUI (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 27 Aug 2008 01:20:08 -0400
In-Reply-To: <20080728094110.GA6278@mail.local.tull.net>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Nick Andrew <nick@nick-andrew.net>
Cc: Jesper Juhl <jesper.juhl@gmail.com>, linux-next@vger.kernel.org, Arthur Jones <ajones@riverbed.com>

--Signature=_Wed__27_Aug_2008_15_19_57_+1000_qHUusmMpxj04+42n
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Nick, Jesper,

On Mon, 28 Jul 2008 19:41:10 +1000 Nick Andrew <nick@nick-andrew.net> wrote:
>
> On Mon, Jul 28, 2008 at 01:37:07PM +1000, Stephen Rothwell wrote:
> > Today's linux-next merge of the trivial tree got a conflict in
> > Documentation/edac.txt between commit
> > 327dafb1c61c9da7b95ac6cc7634a2340cc9509c ("edac: core fix redundant sys=
fs
> > controls to parameters") from Linus' tree and commit
> > 0bb08241ce68aaa70b7b804b4d6319d8bad3ae24 ("Tighten up the use of loose")
> > from the trivial tree.
>=20
> Should we drop the patch or alternately split it into one patch
> per affected file? This must be at least the 3rd time this patch
> has conflicted with other changes.

Can you send all of the trivial tree (that is in -next) to Linus (asking
nicely if he will take it), please?  Doing that will require rebasing at
least the above patch (or merging Linus' tree (at least up to the commit
above)) and fixing the conflicts.  It has been in its current state since
May 20 ...

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Wed__27_Aug_2008_15_19_57_+1000_qHUusmMpxj04+42n
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAki04/0ACgkQjjKRsyhoI8whAQCfU2K3Rwg1KaqwUv1Z1K4q5Y/3
w9oAn0FBYRDf0kwdPGf3znVi5jPLGN0a
=aZoS
-----END PGP SIGNATURE-----

--Signature=_Wed__27_Aug_2008_15_19_57_+1000_qHUusmMpxj04+42n--
