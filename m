From: Russell King <rmk@arm.linux.org.uk>
Subject: Re: linux-next: manual merge of the sound tree with the arm tree
Date: Wed, 11 Mar 2009 10:40:49 +0000
Message-ID: <20090311104049.GA14668@flint.arm.linux.org.uk>
References: <20090310144528.0fa208dd.sfr@canb.auug.org.au> <20090311085254.GA30970@flint.arm.linux.org.uk> <s5h63igifin.wl%tiwai@suse.de> <20090311094126.GA4619@flint.arm.linux.org.uk> <s5hzlfsgywo.wl%tiwai@suse.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from caramon.arm.linux.org.uk ([78.32.30.218]:54621 "EHLO
	caramon.arm.linux.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755125AbZCKKlz (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 11 Mar 2009 06:41:55 -0400
Content-Disposition: inline
In-Reply-To: <s5hzlfsgywo.wl%tiwai@suse.de>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Takashi Iwai <tiwai@suse.de>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, Ben Dooks <ben@simtec.co.uk>, Mark Brown <broonie@opensource.wolfsonmicro.com>, Alexander Schulz <alex@shark-linux.de>

On Wed, Mar 11, 2009 at 11:02:47AM +0100, Takashi Iwai wrote:
> At Wed, 11 Mar 2009 09:41:27 +0000, Russell King wrote:
> > Why do I want to pull stuff that I consider broken into my tree?  Please
> > get rid of the use of __typesafe_io in the shark io.h header in your tree
> > or drop these patches entirely and ask the submitter to fix (whatever's
> > easier for you.)
> 
> It's not too big issue to revert the changes, but it'd be better to
> fix the spot as Mark suggested.  The continuous GIT tree history makes
> the life of others easier a lot.

Continuous git tree history is something that can be achieved if you're
either at the top of the submission tree, or if you're extremely good
at reviewing patches and throwing out anything which might be the
slightest bit controversial until such things have been agreed.

The issue here is that an inappropriate tree has accepted unreviewed
and questionable ARM specific changes as part of a different set of
patches.  That's partly the fault of the submitter for mixing up the
patch set with irrelevant changes for the tree to which he's submitting
his changes.

There used to be a mantra with the kernel community: one patch to make
one logical change.  That's very much the issue here - it sounds like
there was one patch making several changes, some of which were relevent
to the ALSA tree and others which weren't.

But, at the end of the day, these things have to be fixed one way or
other, whether that be by removing the offending commits, by reverting
the patches, or patching the specific bad changes back to how they
originally were.  I really don't mind which option is taken, just so
long as the final outcome is the right one.

-- 
Russell King
 Linux kernel    2.6 ARM Linux   - http://www.arm.linux.org.uk/
 maintainer of:
