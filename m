From: Mark Brown <broonie@opensource.wolfsonmicro.com>
Subject: Re: linux-next: build failure after merge of the sound-asoc tree
Date: Mon, 18 Oct 2010 17:43:13 -0700
Message-ID: <20101019004312.GD27248@opensource.wolfsonmicro.com>
References: <20101018142934.65f5d0fa.sfr@canb.auug.org.au>
 <B2150E1E4418E1438554A300EA5040E40D47140D97@ITSVLEX06.it.maxim-ic.internal>
 <20101019000730.GA27248@opensource.wolfsonmicro.com>
 <B2150E1E4418E1438554A300EA5040E40D471A4297@ITSVLEX06.it.maxim-ic.internal>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from opensource.wolfsonmicro.com ([80.75.67.52]:53296 "EHLO
	opensource2.wolfsonmicro.com" rhost-flags-OK-OK-OK-FAIL)
	by vger.kernel.org with ESMTP id S1755005Ab0JSAnk (ORCPT
	<rfc822;linux-next@vger.kernel.org>);
	Mon, 18 Oct 2010 20:43:40 -0400
Content-Disposition: inline
In-Reply-To: <B2150E1E4418E1438554A300EA5040E40D471A4297@ITSVLEX06.it.maxim-ic.internal>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Peter Hsiang <Peter.Hsiang@maxim-ic.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Liam Girdwood <lrg@slimlogic.co.uk>, "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Mon, Oct 18, 2010 at 05:30:39PM -0700, Peter Hsiang wrote:
> On Mon, Oct 18, 2010, Mark Brown wrote:

> > Your patch was apparently not generated against the mainline Makefile or
> > Kconfig and the automated conflict resolution tool I used (which is
> > normally fairly reliable) appears to have misplaced the header.  I've
> > restored the driver with the readdition of the header.

> .../pub/scm/linux/kernel/git/next/linux-next.git  Right?

As previously advised several times you should be submitting against the
latest for-whatever branch of 

  git://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound-2.6.git

for ASoC.  That will *generally* be what's in -next but not always.
