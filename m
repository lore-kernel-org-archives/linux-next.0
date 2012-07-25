From: Andrew Morton <akpm@linux-foundation.org>
Subject: Re: linux-next: manual merge of the akpm tree with the tip tree
Date: Wed, 25 Jul 2012 12:26:13 -0700
Message-ID: <20120725122613.b971360b.akpm@linux-foundation.org>
References: <20120725140827.4332a5448e4d8d200164ea2e@canb.auug.org.au>
	<20120725071044.GA27535@gmail.com>
	<20120725073503.GB1112@cmpxchg.org>
	<20120725115713.e56239b5.akpm@linux-foundation.org>
	<20120725190351.GA4143@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20120725190351.GA4143@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Ingo Molnar <mingo@kernel.org>
Cc: Johannes Weiner <hannes@cmpxchg.org>, Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Lee Schermerhorn <lee.schermerhorn@hp.com>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>
List-Id: linux-next.vger.kernel.org

On Wed, 25 Jul 2012 21:03:51 +0200
Ingo Molnar <mingo@kernel.org> wrote:

> > This means that if the above code reappears in linux-next or 
> > mainline, the current copy of 
> > mm-memcg-fix-compaction-migration-failing-due-to-memcg-limits.patch 
> > will no longer update it, and I probably won't notice that 
> > omission.
> 
> Did you plan to send Johannes's memcg bits to Linus in this 
> merge window?

Yes.  I was kinda thinking of starting the bombing run on Monday but I
guess I could do the MM queue on Thursday.
