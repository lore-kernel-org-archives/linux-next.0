From: Jason Gunthorpe <jgg@mellanox.com>
Subject: Re: linux-next: manual merge of the net-next tree with the
 rdma-fixes tree
Date: Thu, 15 Mar 2018 20:05:28 -0600
Message-ID: <20180316020528.GA27212@mellanox.com>
References: <20180316115610.3d7f232a@canb.auug.org.au>
 <1521163082.18703.191.camel@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1521163082.18703.191.camel@redhat.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Doug Ledford <dledford@redhat.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, David Miller <davem@davemloft.net>, Networking <netdev@vger.kernel.org>, Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Mark Bloch <markb@mellanox.com>, Leon Romanovsky <leonro@mellanox.com>
List-Id: linux-next.vger.kernel.org

On Thu, Mar 15, 2018 at 09:18:02PM -0400, Doug Ledford wrote:
 
> Here's the commit (from the rdma git repo) with the proper merge fix
> (although it also has other minor merge stuff that needs to be ignored):
> 
> 2d873449a202 (Merge branch 'k.o/wip/dl-for-rc' into k.o/wip/dl-for-next)

Stephen,

If you merge the branches in the order:
  rdma for-next, rdma for-rc, then net-next
you should not see a merge conflict as rdma for-next already has the
correct resolution.

Jason
