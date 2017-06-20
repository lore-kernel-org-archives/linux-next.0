From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: Re: linux-next: manual merge of the uuid tree with the arm64 tree
Date: Tue, 20 Jun 2017 11:47:45 +0300
Message-ID: <1497948465.22624.167.camel@linux.intel.com>
References: <20170616152136.161630bf@canb.auug.org.au>
         <20170619091942.GA2702@arm.com>
         <1497866790.22624.164.camel@linux.intel.com>
         <20170619102240.GC2702@arm.com>
         <afe3af71-36d4-df49-07a9-2e3fba3a5c16@codeaurora.org>
         <20170620084007.GA30664@arm.com> <20170620084307.GA9703@lst.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170620084307.GA9703@lst.de>
Sender: linux-kernel-owner@vger.kernel.org
To: Christoph Hellwig <hch@lst.de>, Will Deacon <will.deacon@arm.com>
Cc: "Baicar, Tyler" <tbaicar@codeaurora.org>, Stephen Rothwell <sfr@canb.auug.org.au>, Catalin Marinas <catalin.marinas@arm.com>, Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

On Tue, 2017-06-20 at 10:43 +0200, Christoph Hellwig wrote:
> On Tue, Jun 20, 2017 at 09:40:08AM +0100, Will Deacon wrote:
> > > > > To have better coordination, please, look at my WIP branch
> > > > > regarding
> > > > > UUID stuff:
> > > > > http://bitbucket.org/andy-shev/linux/branch/topic%2Fuuid
> > > > 
> > > > That link doesn't work for me. Is there anything specific Tyler
> > > > should be
> > > > paying attention to on that branch?
> > > 
> > > That link doesn't work for me either, but I assume it is the
> > > topic/uuid
> > > branch here:
> > > 
> > > https://bitbucket.org/andy-shev/linux/branches/
> > > 
> > > I'll rebase my patches on top of this branch and send them to you
> > > Will.
> > 
> > The conflict in -next came from Christoph's tree:
> > 
> >   http://git.infradead.org/users/hch/uuid.git/heads
> > 
> > hence why I mentioned the uuid-types branch above. It's not clear to
> > me
> > how Andy's branch fits in with this.
> 
> I think Andy is preparing various uuid conversion in it and wanted to
> make sure you don't do any work he already did or which conflicts with
> this work.

Thanks, Christoph, that's correct.

> 
> For now please just base it on my uuid-types tree.

Yeah, this is safest option for now.

-- 
Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Intel Finland Oy
