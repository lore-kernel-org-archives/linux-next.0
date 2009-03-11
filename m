From: Mark Brown <broonie@opensource.wolfsonmicro.com>
Subject: Re: linux-next: manual merge of the sound tree with the arm tree
Date: Wed, 11 Mar 2009 11:24:43 +0000
Message-ID: <20090311112443.GA7939@rakim.wolfsonmicro.main>
References: <20090310144528.0fa208dd.sfr@canb.auug.org.au> <20090311085254.GA30970@flint.arm.linux.org.uk> <s5h63igifin.wl%tiwai@suse.de> <20090311094126.GA4619@flint.arm.linux.org.uk> <s5hzlfsgywo.wl%tiwai@suse.de> <20090311104049.GA14668@flint.arm.linux.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from opensource.wolfsonmicro.com ([80.75.67.52]:37174 "EHLO
	opensource2.wolfsonmicro.com" rhost-flags-OK-OK-OK-FAIL)
	by vger.kernel.org with ESMTP id S1751324AbZCKLYq (ORCPT
	<rfc822;linux-next@vger.kernel.org>);
	Wed, 11 Mar 2009 07:24:46 -0400
Content-Disposition: inline
In-Reply-To: <20090311104049.GA14668@flint.arm.linux.org.uk>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Russell King <rmk@arm.linux.org.uk>
Cc: Takashi Iwai <tiwai@suse.de>, Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, Ben Dooks <ben@simtec.co.uk>, Alexander Schulz <alex@shark-linux.de>

On Wed, Mar 11, 2009 at 10:40:49AM +0000, Russell King wrote:

> But, at the end of the day, these things have to be fixed one way or
> other, whether that be by removing the offending commits, by reverting
> the patches, or patching the specific bad changes back to how they
> originally were.  I really don't mind which option is taken, just so
> long as the final outcome is the right one.

Let's go with reverting things, then - that avoids having to drop the
audio drivers and the subsequent work that was done on them.

Takashi, here's an initial revert of the two hunks I mentioned
previously - I've not checked the other two hunks yet.

The following changes since commit f455dfb106916d855d59686fe16575c2ceb2cb2a:
  Mark Brown (1):
        ASoC: Fix up merge with the ARM tree

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound-2.6.git for-2.6.30

Mark Brown (2):
      [ARM] Revert extraneous changes from the S3C audio header move
      Merge branch 's3c-iis-header' into for-2.6.30

 arch/arm/mach-s3c2410/include/mach/hardware.h |    3 +++
 arch/arm/mach-shark/include/mach/io.h         |    3 +--
 2 files changed, 4 insertions(+), 2 deletions(-)
