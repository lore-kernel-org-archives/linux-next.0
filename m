From: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?=
	<u.kleine-koenig@pengutronix.de>
Subject: Re: linux-next: manual merge of the arm tree with the arm-current
	tree
Date: Tue, 12 Oct 2010 11:23:57 +0200
Message-ID: <20101012092357.GE29673@pengutronix.de>
References: <20101012103314.41b00cbe.sfr@canb.auug.org.au> <20101012080354.GC29673@pengutronix.de> <20101012082814.GC12845@flint.arm.linux.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-next-owner@vger.kernel.org>
Received: from metis.ext.pengutronix.de ([92.198.50.35]:37753 "EHLO
	metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755155Ab0JLJYD (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 12 Oct 2010 05:24:03 -0400
Content-Disposition: inline
In-Reply-To: <20101012082814.GC12845@flint.arm.linux.org.uk>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Russell King <rmk@arm.linux.org.uk>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Sascha Hauer <s.hauer@pengutronix.de>, Eric =?iso-8859-1?Q?B=E9nard?= <eric@eukrea.com>

Hi Russell,

On Tue, Oct 12, 2010 at 09:28:14AM +0100, Russell King wrote:
> On Tue, Oct 12, 2010 at 10:03:54AM +0200, Uwe Kleine-K=F6nig wrote:
> > On Tue, Oct 12, 2010 at 10:33:14AM +1100, Stephen Rothwell wrote:
> > > Hi Russell,
> > >=20
> > > Today's linux-next merge of the arm tree got a conflict in
> > > arch/arm/mach-imx/mach-cpuimx27.c between commit
> > > 4793ca4028e4dcdbf2740db50995c9378ded3cf8 ("cpuimx27: fix i2c bus
> > > selection") from the arm-current tree and commit
> > > 77a406da5a5b76445a816d5f043fc9aef4026ff1 ("ARM: imx: fix name of =
macros
> > > to add imx-i2c devices") from the arm tree.
> A more concerning question is - these recent conflicts have been happ=
ening
> as a result of merging people's GIT trees, which tend to be sent clos=
e
> to the merge window.
>=20
> If the first time their changes become visible to linux-next is when
> they're merged into my tree, something is wrong...
I tried to reconstruct that.  I guess I cannot see yet that Russell too=
k
4793ca4028e4dcdbf2740db50995c9378ded3cf8 because I have no access to
Russell's kernel.org repo and his ftp.arm.linux.org.uk repo currently
barfs for me and Stephen didn't push out a tree newer than 20101011 yet=
=2E

4793ca4028e4dc is a regression fix that should go into .36, so this is
OK, isn't it.  77a406da5a5b76445a816d5f043fc9aef4026ff1 is already some
time in Sascha's tree, and so in next.  But 4793ca4028e4dc is new and
only these two together conflict.

Stephen, note that Sascha fixed the same conflict already in his tree.

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig        =
    |
Industrial Linux Solutions                 | http://www.pengutronix.de/=
  |
