From: David Miller <davem@davemloft.net>
Subject: Re: linux-next: sparc/firmware build failure
Date: Wed, 12 Nov 2008 22:57:48 -0800 (PST)
Message-ID: <20081112.225748.255613824.davem@davemloft.net>
References: <20081105170256.5fef7e93.sfr@canb.auug.org.au>
	<20081106134444.c6b6ca5f.sfr@canb.auug.org.au>
	<20081113143535.847d5290.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from 74-93-104-97-Washington.hfc.comcastbusiness.net ([74.93.104.97]:34761
	"EHLO sunset.davemloft.net" rhost-flags-OK-FAIL-OK-OK)
	by vger.kernel.org with ESMTP id S1750920AbYKMG5s (ORCPT
	<rfc822;linux-next@vger.kernel.org>);
	Thu, 13 Nov 2008 01:57:48 -0500
In-Reply-To: <20081113143535.847d5290.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: sfr@canb.auug.org.au
Cc: dwmw2@infradead.org, linux-next@vger.kernel.org, jaswinder@infradead.org

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Thu, 13 Nov 2008 14:35:35 +1100

> On Thu, 6 Nov 2008 13:44:44 +1100 Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> >
> > On Wed, 5 Nov 2008 17:02:56 +1100 Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> > >
> > > I have reverted commit 229d9a03273684dc2175821be4104dbaa52f3ce0
> > > ("qlogicpti: use request_firmware") because the above build fix has not
> > > been applied.
> > 
> > And today I have dropped the firmware tree.
> 
> The firmware tree is still dropped.  Please do a merge with Linus' tree
> and fix the conflicts.

Yes, pretty please David :-)
