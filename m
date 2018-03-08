From: Jason Gunthorpe <jgg@mellanox.com>
Subject: Re: linux-next: Signed-off-by missing for commits in the rdma tree
Date: Thu, 8 Mar 2018 14:39:06 -0700
Message-ID: <20180308213906.GK6773@mellanox.com>
References: <20180309075119.7b536dcd@canb.auug.org.au>
 <1520542871.3126.116.camel@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1520542871.3126.116.camel@redhat.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Doug Ledford <dledford@redhat.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

On Thu, Mar 08, 2018 at 04:01:11PM -0500, Doug Ledford wrote:
> On Fri, 2018-03-09 at 07:51 +1100, Stephen Rothwell wrote:
> > Hi all,
> > 
> > Commits
> > 
> >   63cf1a902c9d ("IB/srpt: Add RDMA/CM support")
> >   86af61764151 ("IB/rxe: remove unnecessary skb_clone")
> >   31f1bd14cbfe ("IB/rxe: remove unnecessary rxe in rxe_send")
> >   befd8d98f230 ("IB/rxe: change the function rxe_init_device_param type")
> > 
> > are missing a Signed-off-by from their committer.
> 
> I originally committed all of these and my SOB is there.

This is my mistake, when I fixed the conflict in our tree the committer
was changed to me by accident.

There was no change to the diffs so I didn't add my SOB.

Jason
