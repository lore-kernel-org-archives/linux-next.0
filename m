From: Jason Gunthorpe <jgg@mellanox.com>
Subject: Re: linux-next: manual merge of the net-next tree with the
 rdma-fixes tree
Date: Thu, 22 Mar 2018 22:33:15 -0600
Message-ID: <20180323043315.GB13185@mellanox.com>
References: <20180316115610.3d7f232a@canb.auug.org.au>
 <1521163082.18703.191.camel@redhat.com>
 <20180323.001900.849305099701511845.davem@davemloft.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20180323.001900.849305099701511845.davem@davemloft.net>
Sender: linux-kernel-owner@vger.kernel.org
To: David Miller <davem@davemloft.net>
Cc: dledford@redhat.com, sfr@canb.auug.org.au, netdev@vger.kernel.org, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, markb@mellanox.com, leonro@mellanox.com
List-Id: linux-next.vger.kernel.org

On Fri, Mar 23, 2018 at 12:19:00AM -0400, David Miller wrote:
> From: Doug Ledford <dledford@redhat.com>
> Date: Thu, 15 Mar 2018 21:18:02 -0400
> 
> > Here's the commit (from the rdma git repo) with the proper merge fix
> > (although it also has other minor merge stuff that needs to be ignored):
> > 
> > 2d873449a202 (Merge branch 'k.o/wip/dl-for-rc' into k.o/wip/dl-for-next)
> 
> Really?
> 
> [davem@localhost GIT]$ git clone --reference linux/.git git://git.kernel.org/pub/scm/linux/kernel/git/dledford/rdma.git
> Cloning into 'rdma'...

Doug and I moved to a shared repo location when we started maintain it
as a team:

git://git.kernel.org/pub/scm/linux/kernel/git/rdma/rdma.git

The commit is here:

https://git.kernel.org/pub/scm/linux/kernel/git/rdma/rdma.git/commit/?h=for-next&id=2d873449a202d02e0c4d90009fb2beb7013ac575

Jason
