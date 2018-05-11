From: Zhang Rui <rui.zhang@intel.com>
Subject: Re: linux-next: Signed-off-by missing for commits in the thermal
 tree
Date: Fri, 11 May 2018 09:53:30 +0800
Message-ID: <1526003610.19343.1.camel@intel.com>
References: <20180509214341.1d490677@canb.auug.org.au>
         <20180510021011.GA3765@localhost.localdomain>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180510021011.GA3765@localhost.localdomain>
Sender: linux-kernel-owner@vger.kernel.org
To: Eduardo Valentin <edubezval@gmail.com>, Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
List-Id: linux-next.vger.kernel.org

On 三, 2018-05-09 at 19:10 -0700, Eduardo Valentin wrote:
> Hey Rui,
> 
> On Wed, May 09, 2018 at 09:43:41PM +1000, Stephen Rothwell wrote:
> > 
> > Hi Zhang,
> > 
> > Commits
> > 
> >   a2ace598c00a ("thermal: exynos: Reading temperature makes sense
> > only when TMU is turned on")
> >   f9cd6a904e6e ("thermal: exynos: Propagate error value from
> > tmu_read()")
> > 
> > are missing a Signed-off-by from their committer.
> Did you cherry-pick them instead of merging? If cherry-picking you
> have
> to add your Signed-off-by..
> 
I merged them, and then did a rebase to drop some of the patch, hmmm,
could that be the problem?
Anyway, I will re-merge your tree and push them out sometime tomorrow.

thanks,
rui
