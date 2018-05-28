From: Jason Gunthorpe <jgg@mellanox.com>
Subject: Re: linux-next: Signed-off-by missing for commits in the rdma tree
Date: Mon, 28 May 2018 09:57:47 -0600
Message-ID: <20180528155747.GC17491@mellanox.com>
References: <20180526132829.0cbb8826@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20180526132829.0cbb8826@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Doug Ledford <dledford@redhat.com>, Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

On Sat, May 26, 2018 at 01:31:12PM +1000, Stephen Rothwell wrote:
> Hi all,
> 
> Commits
> 
>   116aeb887371 ("iw_cxgb4: provide detailed provider-specific CM_ID information")
> to
>   0252f73334f9 ("IB/qib: Fix DMA api warning with debug kernel")
> 
> are missing a Signed-off-by from their committer.  I presume they have
> been rebased?

Yes, there was a compilation problem and I rebased some of Doug's
commits before finalizing them.

Jason
