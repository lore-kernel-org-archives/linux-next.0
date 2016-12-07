From: Randy Dunlap <rdunlap@infradead.org>
Subject: Re: linux-next: Tree for Dec 7 (kallsyms failure)
Date: Wed, 7 Dec 2016 15:42:32 -0800
Message-ID: <13d83759-40d3-593b-b53f-f3e75fb05b7a@infradead.org>
References: <20161207172432.184970d7@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([198.137.202.9]:57782 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S932400AbcLGXnL (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 7 Dec 2016 18:43:11 -0500
In-Reply-To: <20161207172432.184970d7@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org
Cc: linux-kernel@vger.kernel.org

On 12/06/16 22:24, Stephen Rothwell wrote:
> Hi all,
> 
> Changes since 20161206:
> 
> The powerpc allyesconfig build fails for this release.
> 
> The pinctrl tree still had its build failure so I used the version from
> next-20161202.
> 
> The sound-asoc tree lost its build failure.
> 
> The tip tree gained a perf build failure that went away when the build
> was repeated.
> 
> The staging tree gained a conflict against the net-next tree.
> 
> Non-merge commits (relative to Linus' tree): 10030
>  9322 files changed, 645214 insertions(+), 217700 deletions(-)
> 
> ----------------------------------------------------------------------------
> 
> I have created today's linux-next tree at
> git://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
> (patches at http://www.kernel.org/pub/linux/kernel/next/ ).  If you
> are tracking the linux-next tree using git, you should not use "git pull"
> to do so as that will try to merge the new linux-next release with the
> old one.  You should use "git fetch" and checkout or reset to the new
> master.
> 
> You can see which trees have been included by looking in the Next/Trees
> file in the source.  There are also quilt-import.log and merge.log
> files in the Next directory.  Between each merge, the tree was built
> with a ppc64_defconfig for powerpc and an allmodconfig (with
> CONFIG_BUILD_DOCSRC=n) for x86_64, a multi_v7_defconfig for arm and a
> native build of tools/perf. After the final fixups (if any), I do an
> x86_64 modules_install followed by builds for x86_64 allnoconfig,
> powerpc allnoconfig (32 and 64 bit), ppc44x_defconfig, allyesconfig
> (with KALLSYMS_EXTRA_PASS=1) and pseries_le_defconfig and i386, sparc
> and sparc64 defconfig.
> 
> Below is a summary of the state of the merge.
> 
> I am currently merging 245 trees (counting Linus' and 35 trees of bug
> fix patches pending for the current merge release).
> 
> Stats about the size of the tree over time can be seen at
> http://neuling.org/linux-next-size.html .
> 
> Status of my local build tests will be at
> http://kisskb.ellerman.id.au/linux-next .  If maintainers want to give
> advice about cross compilers/configs that work, we are always open to add
> more builds.
> 
> Thanks to Randy Dunlap for doing many randconfig builds.  And to Paul
> Gortmaker for triage and bug fixes.
> 

I started seeing this yesterday (2016-1206).
This is on x86_64.

Anybody know about it?

kallsyms failure: relative symbol value 0xffffffff81000000 out of range in relative mode


Thanks.

-- 
~Randy
