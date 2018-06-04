From: "Darrick J. Wong" <darrick.wong@oracle.com>
Subject: Re: linux-next: Signed-off-by missing for commit in the xfs tree
Date: Mon, 4 Jun 2018 15:17:56 -0700
Message-ID: <20180604221756.GQ7825@magnolia>
References: <20180605080340.7e579d9d@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20180605080340.7e579d9d@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: David Chinner <david@fromorbit.com>, linux-xfs@vger.kernel.org, Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

On Tue, Jun 05, 2018 at 08:03:40AM +1000, Stephen Rothwell wrote:
> Hi all,
> 
> Commit
> 
>   1e7fb5893364 ("xfs_repair: check and repair quota metadata")
> 
> is missing a Signed-off-by from its committer.

Oops, yeah, I just backported that over from xfsprogs, will fix it up.

Thanks for catching this.

--D

> 
> -- 
> Cheers,
> Stephen Rothwell
