From: Leonard Crestez <leonard.crestez@nxp.com>
Subject: Re: linux-next: Tree for Mar 30
Date: Thu, 30 Mar 2017 16:39:22 +0300
Message-ID: <1490881162.30998.15.camel@nxp.com>
References: <20170330165537.603eed3d@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170330165537.603eed3d@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>, Linux-Next Mailing List <linux-next@vger.kernel.org>, Chris Wilson <chris@chris-wilson.co.uk>, Shawn Guo <shawnguo@kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, dri-devel@lists.freedesktop.org, Octavian Purdila <octavian.purdila@nxp.com>
List-Id: linux-next.vger.kernel.org

On Thu, 2017-03-30 at 16:55 +1100, Stephen Rothwell wrote:
> Hi all,
> 
> Changes since 20170329:
> 
> Undropped tree: xen-tip
> 
> The vfs tree gained a conflict against Linus' tree.
> 
> The drm tree gained conflicts against the drm-intel-fixes tree.
> 
> The mailbox tree lost its build failure.
> 
> The phy-next tree gained a build failure, so I used the version from
> next-20170329.
> 
> The vhost tree gained a build failure, so I used the version from
> next-20170329.
> 
> Non-merge commits (relative to Linus' tree): 5728
>  6122 files changed, 441716 insertions(+), 108564 deletions(-)
> 
> ----------------------------------------------------------------------------
> 
> I have created today's linux-next tree at
> git://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
> (patches at http://www.kernel.org/pub/linux/kernel/next/ ).  If you
> are tracking the linux-next tree using git, you should not use "git pull"
> to do so as that will try to merge the new linux-next release with the
> old one.  You should use "git fetch" and checkout or reset to the new
> master.
> 
> You can see which trees have been included by looking in the Next/Trees
> file in the source.  There are also quilt-import.log and merge.log
> files in the Next directory.  Between each merge, the tree was built
> with a ppc64_defconfig for powerpc and an allmodconfig (with
> CONFIG_BUILD_DOCSRC=n) for x86_64, a multi_v7_defconfig for arm and a
> native build of tools/perf. After the final fixups (if any), I do an
> x86_64 modules_install followed by builds for x86_64 allnoconfig,
> powerpc allnoconfig (32 and 64 bit), ppc44x_defconfig, allyesconfig
> and pseries_le_defconfig and i386, sparc and sparc64 defconfig.
> 
> Below is a summary of the state of the merge.
> 
> I am currently merging 255 trees (counting Linus' and 37 trees of bug
> fix patches pending for the current merge release).
> 
> Stats about the size of the tree over time can be seen at
> http://neuling.org/linux-next-size.html .
> 
> Status of my local build tests will be at
> http://kisskb.ellerman.id.au/linux-next .  If maintainers want to give
> advice about cross compilers/configs that work, we are always open to add
> more builds.

It seems there is a build error for imx_v6_v7_defconfig.

Link: http://kisskb.ellerman.id.au/kisskb/buildresult/12980252/
Error:
drivers/built-in.o: In function `vblank_disable_and_save':
imx-ocotp.c:(.text+0xb45e8): undefined reference to `__bad_cmpxchg'
Makefile:986: recipe for target 'vmlinux' failed

This seems to be caused by something from drm:
commit 43dc7fe2b211 ("drm: Mark up accesses of vblank->enabled outside of its spinlock")

It introduces a cmpxchg on a bool which is apparently not supported on
ARM v6 (it only supports 32-bit values). The error looks legit to me
(not caused by an infrastructure bug).

It seems the kbuild test robot also found a similar breakage on tilegx:
https://lists.freedesktop.org/archives/dri-devel/2017-March/137322.html

-- 
Regards,
Leonard
