From: Andrew Morton <akpm@linux-foundation.org>
Subject: Re: linux-next: manual merge of the akpm tree with the wberr tree
Date: Tue, 1 Aug 2017 15:32:30 -0700
Message-ID: <20170801153230.4ac75584959f3f5391c2341c@linux-foundation.org>
References: <20170801154634.0a01acdc@canb.auug.org.au>
        <1501585159.4702.0.camel@poochiereds.net>
        <1501587093.4702.6.camel@poochiereds.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1501587093.4702.6.camel@poochiereds.net>
Sender: linux-kernel-owner@vger.kernel.org
To: Jeff Layton <jlayton@poochiereds.net>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

On Tue, 01 Aug 2017 07:31:33 -0400 Jeff Layton <jlayton@poochiereds.net> wrote:

> On Tue, 2017-08-01 at 06:59 -0400, Jeff Layton wrote:
> > On Tue, 2017-08-01 at 15:46 +1000, Stephen Rothwell wrote:
> > > Hi Andrew,
> > > 
> > > Today's linux-next merge of the akpm-current tree got a conflict in:
> > > 
> > >   include/linux/fs.h
> > > 
> > > between commit:
> > > 
> > >   9dcc0577f2a4 ("mm: remove optimizations based on i_size in mapping writeback waits")
> > > 
> > > from the wberr tree and patch:
> > > 
> > >   "mm: remove optimizations based on i_size in mapping writeback waits"
> > > 
> > > from the akpm tree.
> > > 
> > > I fixed it up (I just dropped the akpm tree patch) and can carry the
> > > fix as necessary. This is now fixed as far as linux-next is concerned,
> > > but any non trivial conflicts should be mentioned to your upstream
> > > maintainer when your tree is submitted for merging.  You may also want
> > > to consider cooperating with the maintainer of the conflicting tree to
> > > minimise any particularly complex conflicts.
> > > 
> > 
> > I didn't realize that Andrew was going to pick that one up. I'll drop it
> > from my tree.

Please don't do that.  When a patch turns up in linux-next I'll drop my
copy.  If you then drop your copy, the patch is lost.

> > Thanks!
> 
> Actually, I take it back. Jan had some comments about the commit message
> and I'd like to revise this. Andrew, do you mind dropping this patch
> instead?

Yes, do that ;)
