From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: build failure after merge of the aio tree
Date: Mon, 14 Mar 2016 15:49:15 +1100
Message-ID: <20160314154915.7d57cc32@canb.auug.org.au>
References: <20160112164034.0fe945a7@canb.auug.org.au>
	<20160115073944.GA24382@infradead.org>
	<20160115202316.59601869@canb.auug.org.au>
	<20160115092531.GA3626@infradead.org>
	<20160115151821.GE6330@kvack.org>
	<20160116095515.4d8a2e52@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20160116095515.4d8a2e52@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Benjamin LaHaise <bcrl@kvack.org>
Cc: Christoph Hellwig <hch@infradead.org>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Russell King - ARM Linux <linux@arm.linux.org.uk>, Al Viro <viro@ZenIV.linux.org.uk>
List-Id: linux-next.vger.kernel.org

Hi Ben,

On Sat, 16 Jan 2016 09:55:15 +1100 Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>
> On Fri, 15 Jan 2016 10:18:21 -0500 Benjamin LaHaise <bcrl@kvack.org> wrote:
> >
> > On Fri, Jan 15, 2016 at 01:25:31AM -0800, Christoph Hellwig wrote:  
> > > On Fri, Jan 15, 2016 at 08:23:16PM +1100, Stephen Rothwell wrote:    
> > > > Via the aio tree (git://git.kvack.org/~bcrl/aio-next.git#master) added
> > > > in July 2013 at Ben's request.  The code was added to the aio tree in
> > > > Jan 12 (my time), but has never been in a published linux-next tree due
> > > > to the above build problem (I back out to the previous days version of
> > > > the aio tree).    
> > > 
> > > Well, it's code Ben posted a few days ago, which to say it mildly is
> > > rather controversial.  It's cetainly not 4.5 material.    
> > 
> > It still needs the exposure.  
> 
> If it is not destined for v4.5, then it should not (yet) be in
> linux-next.  It should wait until after v4.5-rc1 is released (the merge
> window closes).  I would also argue that if the functionality itself is
> still under active review (and I haven't competely followed the
> discussion so I don't know where that is up to, but Christoph, at
> least, seems not completely convinced), then it should also not yet be
> in linux-next.

OK, so at this point (just to get rid of the build failure I have done this:

I have reset the aio tree head to commit

  b47275df9e1c ("aio: add support for aio poll via aio thread helper")

and then cherry-picked the following commits on top:

  fb2e69217129 ("aio: Fix compile error due to unexpected use of cmpxchg()")
  0964acffc614 ("aio: revert addition of io_send_sig() in generic_write_checks")

> > As for the build failure, it's a bug in the arch __get_user() implementation 
> > that needs to be fixed.  __get_user() should really be able to handle 64 bit 
> > types.  
> 
> Yeah, it is a bit weird.

Well, you need to negotiate that with the affected architectures.

-- 
Cheers,
Stephen Rothwell
