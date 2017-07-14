From: Doug Ledford <dledford@redhat.com>
Subject: Re: linux-next: manual merge of the rdma tree with Linus' tree
Date: Fri, 14 Jul 2017 00:12:33 -0400
Message-ID: <1500005553.2936.14.camel@redhat.com>
References: <20170714111437.69a6b100@canb.auug.org.au>
         <1499995033.2936.12.camel@redhat.com>
         <20170714033416.GS1528@mtr-leonro.local>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170714033416.GS1528@mtr-leonro.local>
Sender: linux-kernel-owner@vger.kernel.org
To: Leon Romanovsky <leon@kernel.org>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Daniel Jurgens <danielj@mellanox.com>, Paul Moore <paul@paul-moore.com>, Parav Pandit <parav@mellanox.com>, Eli Cohen <eli@mellanox.com>
List-Id: linux-next.vger.kernel.org

On Fri, 2017-07-14 at 06:34 +0300, Leon Romanovsky wrote:
> On Thu, Jul 13, 2017 at 09:17:13PM -0400, Doug Ledford wrote:
> > On Fri, 2017-07-14 at 11:14 +1000, Stephen Rothwell wrote:
> > > Hi Doug,
> > > 
> > > Today's linux-next merge of the rdma tree got conflicts in:
> > > 
> > >   drivers/infiniband/core/uverbs_cmd.c
> > >   drivers/infiniband/core/verbs.c
> > > 
> > > between commit:
> > > 
> > >   d291f1a65232 ("IB/core: Enforce PKey security on QPs")
> > > 
> > > from Linus' tree and commits:
> > > 
> > >   c7c0fb974caa ("IB/core: Introduce modify QP operation with
> > > udata")
> > >   5f4bc420f35f ("IB/uverbs: Make use of ib_modify_qp variant to
> > > avoid
> > > resolving DMAC")
> > > 
> > > from the rdma tree.
> > > 
> > > I fixed it up (I used the latter version of uverbs_cmd.c and see
> > > below)
> > > and can carry the fix as necessary. This is now fixed as far as
> > > linux-next
> > > is concerned, but any non trivial conflicts should be mentioned
> > > to
> > > your
> > > upstream maintainer when your tree is submitted for merging.  You
> > > may
> > > also want to consider cooperating with the maintainer of the
> > > conflicting
> > > tree to minimise any particularly complex conflicts.
> > 
> > This was expected.  The SELinux changes went through the SELinux
> > tree
> > and the referenced patches touch the same code.  Your fix is
> > correct.
> 
> Sorry Doug, but it is not expected at all for the code which will go
> to 4.14.

Who said anything about 4.14?  The merge window is not closed, and a
current for-next tag need not represent code intended for 4.14.  That
switchover doesn't happen until the merge window closes (and for many
trees, a couple rc cycles past the merge window closing).

> Both patches in question were targeted for 4.13 and you was expected
> to
> see the merge conflicts during last month or so, prior to merge
> window of 4.13.
> 
> In 4.14, you should base your tree on Linus's tree and don't have ANY
> conflicts in your subsystem, between ANY subsystems and especially
> Linus, so we will be able to develop and test.

I'm sure for 4.14 that will be the issue.  I didn't put this tag on my
4.14 intended work.  I considered this patch series suitable as
possible -rc fixes, so it is under a for-next tag for now to get the
for-next testing (which is not much different than a local merge test
right now, what it does in addition to a local merge test is catch the
situation where some other pending patches and this conflict).

> For me, this merge conflict puts a large sign, that your tree is not
> ready for 4.14.
> 
> Please base your tree on Linus's tree.

Two things here.  First, no one, and I mean *NO ONE*, bases their for-
next branch on a middle of the merge window version of Linus' tree. 
Second, I would be happy to base my work on a suitable base kernel
version from Linus' tree from now on (such as -rc2).  Please do *NOT*
send me another patch set that requires I sync up from net-next in
order to make things work, because, as you say, I should sync up to
Linus' tree.

-- 
Doug Ledford <dledford@redhat.com>
    GPG KeyID: B826A3330E572FDD
    Key fingerprint = AE6B 1BDA 122B 23B4 265B  1274 B826 A333 0E57 2FDD
