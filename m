From: Jason Cooper <jason@lakedaemon.net>
Subject: Re: linux-next: build failure after merge of the final tree
 (arm-soc tree related)
Date: Thu, 15 Mar 2012 13:22:13 -0400
Message-ID: <20120315172213.GC20243@titan.lakedaemon.net>
References: <20120315105901.7b10c9f4de9374a613436988@canb.auug.org.au>
 <20120315002020.GA16189@titan.lakedaemon.net>
 <201203151639.38223.arnd@arndb.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mho-02-ewr.mailhop.org ([204.13.248.72]:21382 "EHLO
	mho-02-ewr.mailhop.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752640Ab2CORWW (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 15 Mar 2012 13:22:22 -0400
Content-Disposition: inline
In-Reply-To: <201203151639.38223.arnd@arndb.de>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Arnd Bergmann <arnd@arndb.de>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Olof Johansson <olof@lixom.net>, linux-arm-kernel@lists.infradead.org, Michael Walle <michael@walle.cc>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

On Thu, Mar 15, 2012 at 04:39:38PM +0000, Arnd Bergmann wrote:
> On Thursday 15 March 2012, Jason Cooper wrote:
> > That's my mistake.  I did a pull request for the wrong branch.  Olof,
> > could you please drop the offending branch and I'll submit a new pull
> > request once I have a chance to test Arnd's irq patch?
> 
> I reverted this in the for-next branch for now. The two initial patches
> from the kirkwood/board branch are still present.

Okay, thanks.  I've rebased onto next/boards and merged the
depends/irqdomain branch.  I'm making progress, but not finished yet.

How is a pull-request done in the above scenario?  is my merge commit
included in the series?  what is the pull-request based on?
next/boards, or depends/irqdomain?

thx,

Jason.
