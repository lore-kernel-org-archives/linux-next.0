From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: linux-next: build failure after merge of the slave-dma tree
Date: Thu, 15 Oct 2015 16:07:51 +0200
Message-ID: <5852722.yfOrjUKMax@wuerfel>
References: <20151015115108.57c04f61@canb.auug.org.au> <1444880141.2926.28.camel@intel.com> <20151015145142.54e537a4@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mout.kundenserver.de ([212.227.17.24]:51608 "EHLO
	mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750807AbbJOOIB (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 15 Oct 2015 10:08:01 -0400
In-Reply-To: <20151015145142.54e537a4@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: "Koul, Vinod" <vinod.koul@intel.com>, "hch@lst.de" <hch@lst.de>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "andriy.shevchenko@linux.intel.com" <andriy.shevchenko@linux.intel.com>, "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>

On Thursday 15 October 2015 14:51:42 Stephen Rothwell wrote:
> Hi Vinod,
> 
> On Thu, 15 Oct 2015 03:35:42 +0000 "Koul, Vinod" <vinod.koul@intel.com> wrote:
> >
> > So should I ask Linus to apply this fix once merge window opens or you will send
> > this, how do we go about fixing this one 
> > 
> > Or should I merge the above commit from asm-generic tree?
> 
> Up to you.  Though you should only merge fro mthe asm-generic tree if
> the maintainer guarantees it will not be rebased.
> 
> You could just wait and tell Linus that this fixup is needed when the
> two trees are merged.  It really need to go into the merge commit to
> avoid bisection problems.
> 

I've added a workaround to the asm-generic tree, no need to worry about
it for now. We can change over the remaining users of
asm-generic/io-64-nonatomic-lo-hi.h for the following merge window and
then remove the wrapper.

	Arnd
