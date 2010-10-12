From: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?=
	<u.kleine-koenig@pengutronix.de>
Subject: Re: linux-next: manual merge of the arm tree with the arm-current
	tree
Date: Tue, 12 Oct 2010 12:02:35 +0200
Message-ID: <20101012100235.GH29673@pengutronix.de>
References: <20101012103314.41b00cbe.sfr@canb.auug.org.au> <20101012080354.GC29673@pengutronix.de> <20101012082814.GC12845@flint.arm.linux.org.uk> <20101012092357.GE29673@pengutronix.de> <20101012094208.GD12845@flint.arm.linux.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-next-owner@vger.kernel.org>
Received: from metis.ext.pengutronix.de ([92.198.50.35]:49276 "EHLO
	metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753929Ab0JLKCl (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 12 Oct 2010 06:02:41 -0400
Content-Disposition: inline
In-Reply-To: <20101012094208.GD12845@flint.arm.linux.org.uk>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Russell King <rmk@arm.linux.org.uk>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Sascha Hauer <s.hauer@pengutronix.de>, Eric =?iso-8859-1?Q?B=E9nard?= <eric@eukrea.com>

Hi Russell,

On Tue, Oct 12, 2010 at 10:42:08AM +0100, Russell King wrote:
> On Tue, Oct 12, 2010 at 11:23:57AM +0200, Uwe Kleine-K=F6nig wrote:
> > Hi Russell,
> >=20
> > On Tue, Oct 12, 2010 at 09:28:14AM +0100, Russell King wrote:
> > > On Tue, Oct 12, 2010 at 10:03:54AM +0200, Uwe Kleine-K=F6nig wrot=
e:
> > > > On Tue, Oct 12, 2010 at 10:33:14AM +1100, Stephen Rothwell wrot=
e:
> > > > > Hi Russell,
> > > > >=20
> > > > > Today's linux-next merge of the arm tree got a conflict in
> > > > > arch/arm/mach-imx/mach-cpuimx27.c between commit
> > > > > 4793ca4028e4dcdbf2740db50995c9378ded3cf8 ("cpuimx27: fix i2c =
bus
> > > > > selection") from the arm-current tree and commit
> > > > > 77a406da5a5b76445a816d5f043fc9aef4026ff1 ("ARM: imx: fix name=
 of macros
> > > > > to add imx-i2c devices") from the arm tree.
> > > A more concerning question is - these recent conflicts have been =
happening
> > > as a result of merging people's GIT trees, which tend to be sent =
close
> > > to the merge window.
> > >=20
> > > If the first time their changes become visible to linux-next is w=
hen
> > > they're merged into my tree, something is wrong...
> > I tried to reconstruct that.  I guess I cannot see yet that Russell=
 took
> > 4793ca4028e4dcdbf2740db50995c9378ded3cf8 because I have no access t=
o
> > Russell's kernel.org repo and his ftp.arm.linux.org.uk repo current=
ly
> > barfs for me and Stephen didn't push out a tree newer than 20101011=
 yet.
>=20
> What's up with it?  What URL are you using?

	http://ftp.arm.linux.org.uk/pub/linux/arm/kernel/git-cur/linux-2.6-arm=
=2Egit/

and it fails for me with

	ukl@octopus:~/gsrc/linux-2.6$ git fetch rmk
	error: Unable to find 81490fcdf406f42fff9d9f57d541788f90242885 under
	http://ftp.arm.linux.org.uk/pub/linux/arm/kernel/git-cur/linux-2.6-arm=
=2Egit
	Cannot obtain needed commit 81490fcdf406f42fff9d9f57d541788f90242885
	while processing commit d7840ed08bf6f74677a6b2b21b96269180be9eb6.
	error: Fetch failed.

I'm trying to reproduce with=20

	git clone --reference ~/gsrc/linux-2.6 git://git.kernel.org/pub/scm/li=
nux/kernel/git/torvalds/linux-2.6.git t
	cd t
	git remote add -f rmk http://ftp.arm.linux.org.uk/pub/linux/arm/kernel=
/git-cur/linux-2.6-arm.git/

=2E.. sometime later ...

works, so something in my repo seems to be the problem.  I assume a pac=
k
file is corrupt?!  Hmm, I'll try to remove all packs I got from your
repo ...

=2E.. wget ... sed $magic ... rm $(cat filelist)

	ukl@octopus:~/gsrc/linux-2.6$ git fetch rmk
	 + 86c4743...74a4333 devel      -> rmk/devel  (forced update)
	   aa30900..c9ee46a  devel-stable -> rmk/devel-stable
	   d907387..a581da1  master     -> rmk/master
	   151b6a5..85a3318  origin     -> rmk/origin

\o/

I guess the problem is that I "Ctrl-C"d an earlier git fetch.

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig        =
    |
Industrial Linux Solutions                 | http://www.pengutronix.de/=
  |
