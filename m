From: Eduardo Valentin <edubezval@gmail.com>
Subject: Re: linux-next: Signed-off-by missing for commits in the thermal tree
Date: Wed, 9 May 2018 19:10:13 -0700
Message-ID: <20180510021011.GA3765@localhost.localdomain>
References: <20180509214341.1d490677@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20180509214341.1d490677@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Zhang Rui <rui.zhang@intel.com>, Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
List-Id: linux-next.vger.kernel.org

Hey Rui,

On Wed, May 09, 2018 at 09:43:41PM +1000, Stephen Rothwell wrote:
> Hi Zhang,
> 
> Commits
> 
>   a2ace598c00a ("thermal: exynos: Reading temperature makes sense only when TMU is turned on")
>   f9cd6a904e6e ("thermal: exynos: Propagate error value from tmu_read()")
> 
> are missing a Signed-off-by from their committer.

Did you cherry-pick them instead of merging? If cherry-picking you have
to add your Signed-off-by..

> 
> -- 
> Cheers,
> Stephen Rothwell
