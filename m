From: Mike Snitzer <snitzer@redhat.com>
Subject: Re: linux-next: Fixes tag needs work in the device-mapper tree
Date: Tue, 15 Jan 2019 16:12:02 -0500
Message-ID: <20190115211201.GA10746@redhat.com>
References: <20190116080251.17ba9771@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190116080251.17ba9771@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Alasdair G Kergon <agk@redhat.com>, Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Paul Gortmaker <paul.gortmaker@windriver.com>, Joe Thornber <ejt@redhat.com>
List-Id: linux-next.vger.kernel.org

On Tue, Jan 15 2019 at  4:02pm -0500,
Stephen Rothwell <sfr@canb.auug.org.au> wrote:

> [I am experimenting with checking the Fixes tags in commits in linux-next.
> Please let me know if you think I am being too strict.]
> 
> Hi all,
> 
> Commit
> 
>   fc4d02aa0331 ("dm thin: fix passdown_double_checking_shared_status()")
> 
> has a malformed Fixes tag:
> 
>   Fixes: 00a0ea33b49 ("dm thin: do not queue freed thin mapping for next stage processing")
> 
> It should show at least 12 digits of the SHA1.

Fixed, thanks.
Mike
