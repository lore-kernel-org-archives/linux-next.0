From: Benjamin LaHaise <bcrl@kvack.org>
Subject: Re: linux-next: build failure after merge of the aio tree
Date: Fri, 15 Jan 2016 10:18:21 -0500
Message-ID: <20160115151821.GE6330@kvack.org>
References: <20160112164034.0fe945a7@canb.auug.org.au> <20160115073944.GA24382@infradead.org> <20160115202316.59601869@canb.auug.org.au> <20160115092531.GA3626@infradead.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20160115092531.GA3626@infradead.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Christoph Hellwig <hch@infradead.org>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-next.vger.kernel.org

On Fri, Jan 15, 2016 at 01:25:31AM -0800, Christoph Hellwig wrote:
> On Fri, Jan 15, 2016 at 08:23:16PM +1100, Stephen Rothwell wrote:
> > Via the aio tree (git://git.kvack.org/~bcrl/aio-next.git#master) added
> > in July 2013 at Ben's request.  The code was added to the aio tree in
> > Jan 12 (my time), but has never been in a published linux-next tree due
> > to the above build problem (I back out to the previous days version of
> > the aio tree).
> 
> Well, it's code Ben posted a few days ago, which to say it mildly is
> rather controversial.  It's cetainly not 4.5 material.

It still needs the exposure.

As for the build failure, it's a bug in the arch __get_user() implementation 
that needs to be fixed.  __get_user() should really be able to handle 64 bit 
types.

		-ben

> > -- 
> > Cheers,
> > Stephen Rothwell                    sfr@canb.auug.org.au
> ---end quoted text---

-- 
"Thought is the essence of where you are now."
