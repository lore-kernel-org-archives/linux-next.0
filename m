From: Will Deacon <will.deacon@arm.com>
Subject: Re: linux-next: manual merge of the uuid tree with the arm64 tree
Date: Mon, 19 Jun 2017 11:22:41 +0100
Message-ID: <20170619102240.GC2702@arm.com>
References: <20170616152136.161630bf@canb.auug.org.au>
 <20170619091942.GA2702@arm.com>
 <1497866790.22624.164.camel@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from foss.arm.com ([217.140.101.70]:48210 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751897AbdFSKW3 (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 19 Jun 2017 06:22:29 -0400
Content-Disposition: inline
In-Reply-To: <1497866790.22624.164.camel@linux.intel.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Christoph Hellwig <hch@lst.de>, Catalin Marinas <catalin.marinas@arm.com>, Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Tyler Baicar <tbaicar@codeaurora.org>

On Mon, Jun 19, 2017 at 01:06:30PM +0300, Andy Shevchenko wrote:
> On Mon, 2017-06-19 at 10:19 +0100, Will Deacon wrote:
> > Hi Stephen, Christoph, Tyler,
> > On Fri, Jun 16, 2017 at 03:21:36PM +1000, Stephen Rothwell wrote:
> > > 
> 
> > Apologies for this: I've just dropped the offending merge from the
> > arm64
> > tree so you can include the uuid tree in -next again.
> > 
> > Tyler: please rebase your patches on top of Christoph's uuid-types
> > branch
> > and send me a new series.
> 
> To have better coordination, please, look at my WIP branch regarding
> UUID stuff:
> http://bitbucket.org/andy-shev/linux/branch/topic%2Fuuid

That link doesn't work for me. Is there anything specific Tyler should be
paying attention to on that branch?

Will
