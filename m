From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: build failure after merge of the aio tree
Date: Sat, 16 Jan 2016 09:55:15 +1100
Message-ID: <20160116095515.4d8a2e52@canb.auug.org.au>
References: <20160112164034.0fe945a7@canb.auug.org.au>
	<20160115073944.GA24382@infradead.org>
	<20160115202316.59601869@canb.auug.org.au>
	<20160115092531.GA3626@infradead.org>
	<20160115151821.GE6330@kvack.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:48239 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750834AbcAOWzR (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Fri, 15 Jan 2016 17:55:17 -0500
In-Reply-To: <20160115151821.GE6330@kvack.org>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Benjamin LaHaise <bcrl@kvack.org>
Cc: Christoph Hellwig <hch@infradead.org>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

Hi Ben,

On Fri, 15 Jan 2016 10:18:21 -0500 Benjamin LaHaise <bcrl@kvack.org> wrote:
>
> On Fri, Jan 15, 2016 at 01:25:31AM -0800, Christoph Hellwig wrote:
> > On Fri, Jan 15, 2016 at 08:23:16PM +1100, Stephen Rothwell wrote:  
> > > Via the aio tree (git://git.kvack.org/~bcrl/aio-next.git#master) added
> > > in July 2013 at Ben's request.  The code was added to the aio tree in
> > > Jan 12 (my time), but has never been in a published linux-next tree due
> > > to the above build problem (I back out to the previous days version of
> > > the aio tree).  
> > 
> > Well, it's code Ben posted a few days ago, which to say it mildly is
> > rather controversial.  It's cetainly not 4.5 material.  
> 
> It still needs the exposure.

If it is not destined for v4.5, then it should not (yet) be in
linux-next.  It should wait until after v4.5-rc1 is released (the merge
window closes).  I would also argue that if the functionality itself is
still under active review (and I haven't competely followed the
discussion so I don't know where that is up to, but Christoph, at
least, seems not completely convinced), then it should also not yet be
in linux-next.

> As for the build failure, it's a bug in the arch __get_user() implementation 
> that needs to be fixed.  __get_user() should really be able to handle 64 bit 
> types.

Yeah, it is a bit weird.

-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
