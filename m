From: Randy Dunlap <rdunlap@infradead.org>
Subject: Re: linux-next: Tree for Dec 1
Date: Thu, 1 Dec 2016 12:17:30 -0800
Message-ID: <c8120142-ec74-c866-f1b2-cafc3d109574@infradead.org>
References: <20161201174235.21689436@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([198.137.202.9]:47908 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751686AbcLAURc (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 1 Dec 2016 15:17:32 -0500
In-Reply-To: <20161201174235.21689436@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org
Cc: linux-kernel@vger.kernel.org

On 11/30/16 22:42, Stephen Rothwell wrote:
> Hi all,
> 
> Changes since 20161130:
> 
> New tree: openrisc
> 
> The cifs tree lost its build failure.
> 
> The net-next tree gained conflicts against the net and arm-soc trees.
> 
> The block tree gained a build failure for which I applied a merge
> fix patch.
> 
> The tip tree gained a conflict against the net-next tree.
> 
> The akpm-current tree lost its build failure.
> 
> The akpm tree lost several patches that turned up in the powerpc tree.
> 
> Non-merge commits (relative to Linus' tree): 9134
>  8734 files changed, 530030 insertions(+), 199813 deletions(-)
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
> I am currently merging 246 trees (counting Linus' and 35 trees of bug
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

on i386:

WARNING: EXPORT symbol "__sw_hweight32" [arch/x86/lib/built-in.ko] version generation failed, symbol will not be versioned.
WARNING: EXPORT symbol "___preempt_schedule" [arch/x86/entry/built-in.ko] version generation failed, symbol will not be versioned.
WARNING: EXPORT symbol "___preempt_schedule" [arch/x86/built-in.ko] version generation failed, symbol will not be versioned.
WARNING: EXPORT symbol "___preempt_schedule" [vmlinux] version generation failed, symbol will not be versioned.
WARNING: EXPORT symbol "__put_user_2" [vmlinux] version generation failed, symbol will not be versioned.
WARNING: EXPORT symbol "__get_user_2" [vmlinux] version generation failed, symbol will not be versioned.
WARNING: EXPORT symbol "__put_user_1" [vmlinux] version generation failed, symbol will not be versioned.
WARNING: EXPORT symbol "__get_user_1" [vmlinux] version generation failed, symbol will not be versioned.
WARNING: EXPORT symbol "__sw_hweight32" [vmlinux] version generation failed, symbol will not be versioned.
WARNING: EXPORT symbol "empty_zero_page" [vmlinux] version generation failed, symbol will not be versioned.
WARNING: EXPORT symbol "__put_user_8" [vmlinux] version generation failed, symbol will not be versioned.
WARNING: EXPORT symbol "__put_user_4" [vmlinux] version generation failed, symbol will not be versioned.
WARNING: EXPORT symbol "__get_user_4" [vmlinux] version generation failed, symbol will not be versioned.

Do I have a tools problem?

thanks,
-- 
~Randy
