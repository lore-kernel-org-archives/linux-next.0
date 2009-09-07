From: Russell King <rmk+lkml@arm.linux.org.uk>
Subject: Re: linux-next: manual merge of the trivial tree with the arm tree
Date: Mon, 7 Sep 2009 16:17:27 +0100
Message-ID: <20090907151727.GD6538@flint.arm.linux.org.uk>
References: <20090907163201.72adc3f6.sfr@canb.auug.org.au> <alpine.LNX.2.00.0909071713210.23856@wotan.suse.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from caramon.arm.linux.org.uk ([78.32.30.218]:56275 "EHLO
	caramon.arm.linux.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751519AbZIGPRt (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 7 Sep 2009 11:17:49 -0400
Content-Disposition: inline
In-Reply-To: <alpine.LNX.2.00.0909071713210.23856@wotan.suse.de>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Jiri Kosina <jkosina@suse.cz>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Joe Perches <joe@perches.com>, wanzongshun <mcuos.com@gmail.com>

On Mon, Sep 07, 2009 at 05:14:38PM +0200, Jiri Kosina wrote:
> On Mon, 7 Sep 2009, Stephen Rothwell wrote:
> 
> > Today's linux-next merge of the trivial tree got a conflict in
> > arch/arm/mach-w90x900/w90p910.c between commit
> > 35c9221acb133ecc9abd701a1fb6fa909d177a77 ("ARM: 5682/1: Add cpu.c and
> > dev.c and modify some files of w90p910 platform") from the arm tree and
> > commit 6f8fadf4a5c43f9f10f1910c71d8d9ff0b0a26ca ("trivial: remove
> > unnecessary semicolons") from the trivial tree.
> > 
> > The former commit moved the code changed by the latter into a different
> > file (arch/arm/mach-w90x900/cpu.c - and removed the old file).  Its not
> > important enough to fix it there (so I just removed this file), but maybe
> > the part of the trivial commit touching this file could be sent to the
> > arm maintainer.
> 
> Sure, here we go. Russel, could you please apply this on top of your 
> current tree? (I have already dropped the bits touching arch/arm from 
> trivial queue). Thanks.

I'll have to split it up further, since I keep each platform class who
choses to send their stuff via me in separate branches.

-- 
Russell King
 Linux kernel    2.6 ARM Linux   - http://www.arm.linux.org.uk/
 maintainer of:
