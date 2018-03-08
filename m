From: Jason Gunthorpe <jgg@mellanox.com>
Subject: Re: linux-next: Signed-off-by missing for commit in the rdma-fixes
 tree
Date: Thu, 8 Mar 2018 09:18:45 -0700
Message-ID: <20180308161845.GC6773@mellanox.com>
References: <20180308164058.2ad5a158@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20180308164058.2ad5a158@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>, Andy Whitcroft <apw@canonical.com>, Joe Perches <joe@perches.com>
Cc: Doug Ledford <dledford@redhat.com>, Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Leon Romanovsky <leonro@mellanox.com>
List-Id: linux-next.vger.kernel.org

On Thu, Mar 08, 2018 at 04:40:58PM +1100, Stephen Rothwell wrote:
> Hi all,
> 
> Commit
> 
>   aa0de36a40f4 ("RDMA/mlx5: Fix integer overflow while resizing CQ")
> 
> is missing a Signed-off-by from its author.

Thanks Stephen,

May I suggest to the checkpatch maintainers that checkpack should look
for this too?

Thanks,
Jason
