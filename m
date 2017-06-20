From: Christoph Hellwig <hch@lst.de>
Subject: Re: linux-next: manual merge of the uuid tree with the arm64 tree
Date: Tue, 20 Jun 2017 10:43:07 +0200
Message-ID: <20170620084307.GA9703@lst.de>
References: <20170616152136.161630bf@canb.auug.org.au> <20170619091942.GA2702@arm.com> <1497866790.22624.164.camel@linux.intel.com> <20170619102240.GC2702@arm.com> <afe3af71-36d4-df49-07a9-2e3fba3a5c16@codeaurora.org> <20170620084007.GA30664@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from verein.lst.de ([213.95.11.211]:33729 "EHLO newverein.lst.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1750863AbdFTInJ (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 20 Jun 2017 04:43:09 -0400
Content-Disposition: inline
In-Reply-To: <20170620084007.GA30664@arm.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Will Deacon <will.deacon@arm.com>
Cc: "Baicar, Tyler" <tbaicar@codeaurora.org>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Stephen Rothwell <sfr@canb.auug.org.au>, Christoph Hellwig <hch@lst.de>, Catalin Marinas <catalin.marinas@arm.com>, Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

On Tue, Jun 20, 2017 at 09:40:08AM +0100, Will Deacon wrote:
> > >>To have better coordination, please, look at my WIP branch regarding
> > >>UUID stuff:
> > >>http://bitbucket.org/andy-shev/linux/branch/topic%2Fuuid
> > >That link doesn't work for me. Is there anything specific Tyler should be
> > >paying attention to on that branch?
> > That link doesn't work for me either, but I assume it is the topic/uuid
> > branch here:
> > 
> > https://bitbucket.org/andy-shev/linux/branches/
> > 
> > I'll rebase my patches on top of this branch and send them to you Will.
> 
> The conflict in -next came from Christoph's tree:
> 
>   http://git.infradead.org/users/hch/uuid.git/heads
> 
> hence why I mentioned the uuid-types branch above. It's not clear to me
> how Andy's branch fits in with this.

I think Andy is preparing various uuid conversion in it and wanted to
make sure you don't do any work he already did or which conflicts with
this work.

For now please just base it on my uuid-types tree.
