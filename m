From: Andrew Morton <akpm@linux-foundation.org>
Subject: Re: + arc-convert-to-dma_map_ops.patch added to -mm tree
Date: Wed, 16 Dec 2015 21:43:26 -0800
Message-ID: <20151216214326.82515ce1.akpm@linux-foundation.org>
References: <564b9e3a.DaXj5xWV8Mzu1fPX%akpm@linux-foundation.org>
	<C2D7FE5348E1B147BCA15975FBA23075F44D2EEF@IN01WEMBXA.internal.synopsys.com>
	<20151124075047.GA29572@lst.de>
	<56724817.7090003@synopsys.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <owner-linux-mm@kvack.org>
In-Reply-To: <56724817.7090003@synopsys.com>
Sender: owner-linux-mm@kvack.org
To: Vineet Gupta <Vineet.Gupta1@synopsys.com>
Cc: "hch@lst.de" <hch@lst.de>, arcml <linux-snps-arc@lists.infradead.org>, "linux-mm@kvack.org" <linux-mm@kvack.org>, lkml <linux-kernel@vger.kernel.org>, linux-next <linux-next@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

On Thu, 17 Dec 2015 10:58:55 +0530 Vineet Gupta <Vineet.Gupta1@synopsys.com> wrote:

> On Tuesday 24 November 2015 01:20 PM, hch@lst.de wrote:
> > Hi Vineet,
> > 
> > the original version went through the buildbot, which succeeded.  It seems
> > like the official buildbot does not support arc, and might benefit from
> > helping to set up an arc environment.  However in the meantime Guenther
> > send me output from his buildbot and I sent a fix for arc.
> > 
> 
> Hi Andrew, Christoph
> 
> The dma mapping conversion build error fixlet (below) exists as a separate patch
> which will break bisectability. Will it be possible to squash it into the orig commit.
> 

That's the plan.  In http://ozlabs.org/~akpm/mmots/series you'll see

arc-convert-to-dma_map_ops.patch
arc-convert-to-dma_map_ops-fix.patch

I keep the base patch(es) and its fixes separate for various
tacking/history/bookkeeping reasons and fold them all together just
before sending things off to Linus.

--
To unsubscribe, send a message with 'unsubscribe linux-mm' in
the body to majordomo@kvack.org.  For more info on Linux MM,
see: http://www.linux-mm.org/ .
Don't email: <a href=mailto:"dont@kvack.org"> email@kvack.org </a>
