From: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Subject: Re: linux-next: Tree for Sep 1
Date: Tue, 02 Sep 2014 15:16:22 +0200
Message-ID: <5224004.nKGc9rK3FN@amdc1032>
References: <20140901230728.GM29327@sirena.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7Bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-reply-to: <20140901230728.GM29327@sirena.org.uk>
Sender: linux-kernel-owner@vger.kernel.org
To: Mark Brown <broonie@kernel.org>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-next.vger.kernel.org


Hi,

On Tuesday, September 02, 2014 12:07:28 AM Mark Brown wrote:
> Changes since 20140829:
> 
> The akpm-current gained a conflict against Linus' tree.
> 
> Non-merge commits (relative to Linus' tree): 2553
>  2686 files changed, 98625 insertions(+), 79475 deletions(-)
> 
> I have created today's linux-next tree at
> git://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git .
> If you are tracking the linux-next tree using git, you should not use
> "git pull" to do so as that will try to merge the new linux-next release
> with the old one.  You should use "git fetch" and checkout or reset to
> the new master.
> 
> You can see which trees have been included by looking in the Next/Trees
> file in the source.  There are also quilt-import.log and merge.log files
> in the Next directory.  Between each merge, the tree was built with an
> allmodconfig for x86_64 and a multi_v7_defconfig for arm.
> 
> Below is a summary of the state of the merge.
> 
> I am currently merging 214 trees (counting Linus' and 30 trees of patches
> pending for Linus' tree).
> 
> Stats about the size of the tree over time can be seen at
> http://neuling.org/linux-next-size.html .
> 
> Status of Stephen's local build tests will be at
> http://kisskb.ellerman.id.au/linux-next .  If maintainers want to give
> advice about cross compilers/configs that work, we are always open to add
> more builds.

I need following patch to make it boot on ODROID U3 board
(ARM Exynos4412 SoC based).  next-20140825 was good, next-20140828
is bad (I haven't tried next-20140826 and next-20140827).
