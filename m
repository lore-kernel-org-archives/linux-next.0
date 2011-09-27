From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: linux-next: manual merge of the arm-soc tree with the arm tree
Date: Tue, 27 Sep 2011 17:24:46 +0200
Message-ID: <201109271724.46371.arnd@arndb.de>
References: <20110927112524.fd0b8f1fe69bc63855ead2d7@canb.auug.org.au> <20110927072517.GB11359@flint.arm.linux.org.uk>
Mime-Version: 1.0
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from moutng.kundenserver.de ([212.227.126.187]:63762 "EHLO
	moutng.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750805Ab1I0PZB (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 27 Sep 2011 11:25:01 -0400
In-Reply-To: <20110927072517.GB11359@flint.arm.linux.org.uk>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Russell King <rmk@arm.linux.org.uk>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Catalin Marinas <catalin.marinas@arm.com>, Jon Medhurst <tixy@yxit.co.uk>

On Tuesday 27 September 2011, Russell King wrote:
> On Tue, Sep 27, 2011 at 11:25:24AM +1000, Stephen Rothwell wrote:
> > Hi Arnd,
> > 
> > [I have a feeling that I may have reported this previously]
> > 
> > Today's linux-next merge of the arm-soc tree got a conflict in
> > arch/arm/mm/dma-mapping.c between commit e73fc88e19d7 ("ARM: 7059/1:
> > LPAE: Use PMD_(SHIFT|SIZE|MASK) instead of PGDIR_*") from the arm tree
> > and commit 99d1717dd7fe ("ARM: Add init_consistent_dma_size()") from the
> > arm-soc tree.
> > 
> > I fixed it up (I think - see below) and can carry the fix as necessary.

Ok, looks good.

> This has happened because I've dropped a large chunk of my tree from the
> for-next branch due to some horrible conflicts and some bad workflow
> practice in a git tree I recently merged (so this merge which I'd
> normally do has been exposed.)

Since we have a few conflicts already, I think I'll wait for your
tree to go in first and then send my pull requests with the proper
fixups. I could already pull in some branches that I know I will
have to wait for.

Do you generally send one pull request for each branch you have
in the for-next branch, or do you send a single request for something
that roughly resembles the for-next branch at the time of the merge
window?

	Arnd
