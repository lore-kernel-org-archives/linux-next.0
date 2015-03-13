From: Mike Snitzer <snitzer@redhat.com>
Subject: next-20150313's block is broken, but fix available [was: Re: block:
 fully initialize queue in blk_mq_init_allocated_queue]
Date: Fri, 13 Mar 2015 10:17:22 -0400
Message-ID: <20150313141722.GA13425@redhat.com>
References: <1426239050-2528-1-git-send-email-sergey.senozhatsky@gmail.com>
 <20150313122436.GB7312@redhat.com>
 <20150313123709.GA430@swordfish>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20150313123709.GA430@swordfish>
Sender: linux-kernel-owner@vger.kernel.org
To: sfr@canb.auug.org.au, linux-next@vger.kernel.org
Cc: Ming Lei <ming.lei@canonical.com>, Jens Axboe <axboe@kernel.dk>, linux-kernel@vger.kernel.org, Sergey Senozhatsky <sergey.senozhatsky@gmail.com>
List-Id: linux-next.vger.kernel.org

On Fri, Mar 13 2015 at  8:37am -0400,
Sergey Senozhatsky <sergey.senozhatsky@gmail.com> wrote:

> On (03/13/15 08:24), Mike Snitzer wrote:
> > Thanks, but I already fixed these 2 patches and pushed them to
> > linux-dm.git's for-next branch last night (I also posted v3 of the
> > corresponding patches to LKML at that time).
> 
> oh, I see. didn't know that.
> 
> > Sorry to waste your time, I've learned my lesson:
> > 
> 
> no problem.
> 
> > Hopefully linux-next was able to pick up my new 'for-next' and we don't
> > have an entire weekend of linux-next crashes due to my idiocy.
> 
> nope, this is how I spot it -- next-20150313 doesn't boot.

Hi Stephen,

Is there any opportunity to get the tree fixed by re-pulling
linux-dm.git's 'for-next'?  I'd hate to kill linux-next productivity
this weekend!  Sorry about this.

Please advise, thanks.
Mike
