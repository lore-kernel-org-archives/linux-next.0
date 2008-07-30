From: Benjamin Herrenschmidt <benh@kernel.crashing.org>
Subject: Re: [PATCH] add iommu_num_pages helper function
Date: Thu, 31 Jul 2008 08:44:14 +1000
Message-ID: <1217457854.11188.348.camel@pasglop>
References: <20080728.222439.176200666.davem@davemloft.net>
	 <20080729164523.bfd2d539.sfr@canb.auug.org.au>
	 <20080729095027.GA4851@amd.com>
	 <20080729185838W.fujita.tomonori@lab.ntt.co.jp>
	 <20080729100233.GB4851@amd.com>
Reply-To: benh@kernel.crashing.org
Mime-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from gate.crashing.org ([63.228.1.57]:53761 "EHLO gate.crashing.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753670AbYG3Wpa (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 30 Jul 2008 18:45:30 -0400
In-Reply-To: <20080729100233.GB4851@amd.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Joerg Roedel <joerg.roedel@amd.com>
Cc: FUJITA Tomonori <fujita.tomonori@lab.ntt.co.jp>, sfr@canb.auug.org.au, davem@davemloft.net, mingo@elte.hu, mingo@redhat.com, tglx@linutronix.de, linux-kernel@vger.kernel.org, iommu@lists.linux-foundation.org, bhavna.sarathy@amd.com, robert.richter@amd.com, torvalds@linux-foundation.org, akpm@linux-foundation.org, jbarnes@virtuousgeek.org, linux-next@vger.kernel.org

On Tue, 2008-07-29 at 12:02 +0200, Joerg Roedel wrote:
> On Tue, Jul 29, 2008 at 06:58:08PM +0900, FUJITA Tomonori wrote:
> > On Tue, 29 Jul 2008 11:50:27 +0200
> > Joerg Roedel <joerg.roedel@amd.com> wrote:
> > > do you want to work on that or should I try to do this and send it to
> > > you for review?
> > 
> > I've already sent a patch that fixes the breakages in such way:
> > 
> > http://marc.info/?l=linux-kernel&m=121730644704448&w=2
> 
> Yes I have seen this patch. I meant the patches that introduce something
> like IOMMU_PAGE_SIZE for all architectures so that we can make this
> function generic and move it back to lib/.

That will not work in the light of some new stuff coming on powerpc in
the future. The iommu page size may/will be dynamic per instance of
iommu. IE, it will be mostly decided at runtime, I don't expect machines
to have multiple iommus of different page sizes off hand but it -can-
happen.

Ben.
