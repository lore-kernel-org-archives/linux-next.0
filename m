From: Will Deacon <will.deacon@arm.com>
Subject: Re: linux-next: manual merge of the uuid tree with the arm64 tree
Date: Tue, 20 Jun 2017 09:40:08 +0100
Message-ID: <20170620084007.GA30664@arm.com>
References: <20170616152136.161630bf@canb.auug.org.au>
 <20170619091942.GA2702@arm.com>
 <1497866790.22624.164.camel@linux.intel.com>
 <20170619102240.GC2702@arm.com>
 <afe3af71-36d4-df49-07a9-2e3fba3a5c16@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <afe3af71-36d4-df49-07a9-2e3fba3a5c16@codeaurora.org>
Sender: linux-kernel-owner@vger.kernel.org
To: "Baicar, Tyler" <tbaicar@codeaurora.org>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Stephen Rothwell <sfr@canb.auug.org.au>, Christoph Hellwig <hch@lst.de>, Catalin Marinas <catalin.marinas@arm.com>, Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

On Mon, Jun 19, 2017 at 12:41:38PM -0600, Baicar, Tyler wrote:
> On 6/19/2017 4:22 AM, Will Deacon wrote:
> >On Mon, Jun 19, 2017 at 01:06:30PM +0300, Andy Shevchenko wrote:
> >>On Mon, 2017-06-19 at 10:19 +0100, Will Deacon wrote:
> >>>Hi Stephen, Christoph, Tyler,
> >>>On Fri, Jun 16, 2017 at 03:21:36PM +1000, Stephen Rothwell wrote:
> >>>Apologies for this: I've just dropped the offending merge from the
> >>>arm64
> >>>tree so you can include the uuid tree in -next again.
> >>>
> >>>Tyler: please rebase your patches on top of Christoph's uuid-types
> >>>branch
> >>>and send me a new series.
> >>To have better coordination, please, look at my WIP branch regarding
> >>UUID stuff:
> >>http://bitbucket.org/andy-shev/linux/branch/topic%2Fuuid
> >That link doesn't work for me. Is there anything specific Tyler should be
> >paying attention to on that branch?
> That link doesn't work for me either, but I assume it is the topic/uuid
> branch here:
> 
> https://bitbucket.org/andy-shev/linux/branches/
> 
> I'll rebase my patches on top of this branch and send them to you Will.

The conflict in -next came from Christoph's tree:

  http://git.infradead.org/users/hch/uuid.git/heads

hence why I mentioned the uuid-types branch above. It's not clear to me
how Andy's branch fits in with this.

Will
