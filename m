From: Tejun Heo <tj@kernel.org>
Subject: Re: linux-next: build failure after merge of the ext4 tree
Date: Thu, 23 Jul 2015 13:41:09 -0400
Message-ID: <20150723174109.GP15934@mtj.duckdns.org>
References: <20150723105623.2f8c9548@canb.auug.org.au>
 <20150723164953.GA15778@thunk.org>
 <20150723172343.GB15778@thunk.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20150723172343.GB15778@thunk.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Theodore Ts'o <tytso@mit.edu>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-next.vger.kernel.org

On Thu, Jul 23, 2015 at 01:23:43PM -0400, Theodore Ts'o wrote:
> On Thu, Jul 23, 2015 at 12:49:53PM -0400, Theodore Ts'o wrote:
> > > After merging the ext4 tree, today's linux-next build (x86_64
> > > allmodconfig) failed like this:
> > > 
> > > ERROR: "wbc_account_io" [fs/ext4/ext4.ko] undefined!
> > > ERROR: "bio_associate_blkcg" [fs/ext4/ext4.ko] undefined!
> > > 
> > > Caused by commit
> > > 
> > >   001e4a8775f6 ("ext4: implement cgroup writeback support")
> > > 
> > > I have used the ext4 tree from next-20150722 for today.
> > 
> > Ah, I see, we're missing the include files which define the inline
> > dummy functions.  I'll fix this in my tree, thanks.
> 
> Whoops, correction, the problem is that wbc_account_io() and
> bio_asociate_blkcg() need to be exported as symbols.
> 
> Tejun, how quickly get you get a fix into linux-next?  Or should I
> just drop that patch for now?

I'll send the patch to add EXPORT to Jens right away.

Thanks.

-- 
tejun
