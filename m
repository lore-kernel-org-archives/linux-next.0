From: Mark Brown <broonie@opensource.wolfsonmicro.com>
Subject: Re: linux-next:  tree build failure
Date: Tue, 7 Apr 2009 11:00:27 +0100
Message-ID: <20090407100027.GB20499@rakim.wolfsonmicro.main>
References: <20090407134135.dc4e0e46.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from opensource.wolfsonmicro.com ([80.75.67.52]:44463 "EHLO
	opensource2.wolfsonmicro.com" rhost-flags-OK-OK-OK-FAIL)
	by vger.kernel.org with ESMTP id S1750977AbZDGKAa (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 7 Apr 2009 06:00:30 -0400
Content-Disposition: inline
In-Reply-To: <20090407134135.dc4e0e46.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Takashi Iwai <tiwai@suse.de>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, Peter Ujfalusi <peter.ujfalusi@nokia.com>, Linus <torvalds@linux-foundation.org>, Andrew Morton <akpm@linux-foundation.org>

The following changes since commit 5c15a6869a75000fecea61e9985f4753311ec534:
  Anton Vorontsov (1):
        ASoC: fsl_dma: Pass the proper device for dma mapping routines

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound-2.6.git for-2.6.30

Peter Ujfalusi (1):
      ASoC: TWL4030: Compillation error fix

 sound/soc/codecs/twl4030.c |   10 ++++++----
 1 files changed, 6 insertions(+), 4 deletions(-)
