From: Jason Gunthorpe <jgg@mellanox.com>
Subject: Re: linux-next: manual merge of the rdma tree with the rdma-fixes
 tree
Date: Wed, 2 May 2018 11:50:21 -0600
Message-ID: <20180502175021.GC5972@mellanox.com>
References: <20180501101017.517b38af@canb.auug.org.au>
 <1525136135.11756.94.camel@redhat.com>
 <20180502102237.GG20375@mtr-leonro.local>
 <1525269652.11756.134.camel@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1525269652.11756.134.camel@redhat.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Doug Ledford <dledford@redhat.com>
Cc: Leon Romanovsky <leon@kernel.org>, Stephen Rothwell <sfr@canb.auug.org.au>, Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Zhu Yanjun <yanjun.zhu@oracle.com>
List-Id: linux-next.vger.kernel.org

On Wed, May 02, 2018 at 10:00:52AM -0400, Doug Ledford wrote:
> On Wed, 2018-05-02 at 13:22 +0300, Leon Romanovsky wrote:
> > On Mon, Apr 30, 2018 at 08:55:35PM -0400, Doug Ledford wrote:
> > > On Tue, 2018-05-01 at 10:10 +1000, Stephen Rothwell wrote:
> > > > Hi all,
> > > > 
> > > > Today's linux-next merge of the rdma tree got a conflict in:
> > > > 
> > > >   drivers/infiniband/sw/rxe/rxe_resp.c
> > > > 
> > > > between commit:
> > > > 
> > > >   9fd4350ba895 ("B/rxe: avoid double kfree_skb")
> > > > 
> > > > from the rdma-fixes tree and commit:
> > > > 
> > > >   2e47350789eb ("IB/rxe: optimize the function duplicate_request")
> > > > 
> > > > from the rdma tree.
> > > > 
> > > > I fixed it up (I think - see below) and can carry the fix as necessary.
> > > > This is now fixed as far as linux-next is concerned, but any non trivial
> > > > conflicts should be mentioned to your upstream maintainer when your tree
> > > > is submitted for merging.  You may also want to consider cooperating
> > > > with the maintainer of the conflicting tree to minimise any particularly
> > > > complex conflicts.
> > > > 
> > > 
> > > We will probably merge the for-rc branch into the for-next branch in the
> > > next few days, at which point we will do the conflict resolution
> > > ourselves and your need to carry anything should drop out.
> > 
> > Isn't "rdma/wip/for-testing" branch intended for this?
> 
> Not really.  It's there to provide a pre-merged branch for people to
> test.  But, I've rarely seen a release cycle where, *sometime*, we
> didn't get a patch set in the for-next that depends on changes in the
> for-rc area, and in that case, you need to merge for-rc into for-next. 
> If we don't have that this cycle, then you're right, I won't merge for-
> rc into for-next and for-testing will be the throwaway merge branch.  On
> occasion, if the merge fixups needed between for-rc and for-next get too
> difficult for a non-RDMA person to sus out, then we will do a merge of
> for-rc into for-next simply so we can provide the right merge fixup, but
> I doubt this merge fixup rises to that level.

What I've been doing is storing the resolutions in for-testing and
then when the PR is made I create two branches
  merge for-testing, for-next, linus/master
  merge for-next, linus/master

Then I directly diff them to ensure the merge resolutions are all
matching properly.

ditto when merging for-rc and linus/master

Basically for-testing becomes a place to store the merge resolutions
that we can create when the conflict comes up and people still
remember what the right resolution is...

Jason
