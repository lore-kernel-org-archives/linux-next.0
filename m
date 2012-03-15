From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: linux-next: build failure after merge of the final tree (arm-soc tree related)
Date: Thu, 15 Mar 2012 17:32:12 +0000
Message-ID: <201203151732.12852.arnd@arndb.de>
References: <20120315105901.7b10c9f4de9374a613436988@canb.auug.org.au> <201203151639.38223.arnd@arndb.de> <20120315172213.GC20243@titan.lakedaemon.net>
Mime-Version: 1.0
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from moutng.kundenserver.de ([212.227.17.9]:59671 "EHLO
	moutng.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932396Ab2CORcT (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 15 Mar 2012 13:32:19 -0400
In-Reply-To: <20120315172213.GC20243@titan.lakedaemon.net>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Jason Cooper <jason@lakedaemon.net>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Olof Johansson <olof@lixom.net>, linux-arm-kernel@lists.infradead.org, Michael Walle <michael@walle.cc>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

On Thursday 15 March 2012, Jason Cooper wrote:
> On Thu, Mar 15, 2012 at 04:39:38PM +0000, Arnd Bergmann wrote:
> > On Thursday 15 March 2012, Jason Cooper wrote:
> > > That's my mistake.  I did a pull request for the wrong branch.  Olof,
> > > could you please drop the offending branch and I'll submit a new pull
> > > request once I have a chance to test Arnd's irq patch?
> > 
> > I reverted this in the for-next branch for now. The two initial patches
> > from the kirkwood/board branch are still present.
> 
> Okay, thanks.  I've rebased onto next/boards and merged the
> depends/irqdomain branch.  I'm making progress, but not finished yet.

Ok. I hope we can still make it for v3.4, but I think it won't be
much of a problem if not -- it will get merged into linux-next
just after v3.4-rc1 in case we don't make it, and then you have
plenty of time to improve it further.

> How is a pull-request done in the above scenario?  is my merge commit
> included in the series?  what is the pull-request based on?
> next/boards, or depends/irqdomain?

You should base it on depends/irqdomain.

	Arnd
