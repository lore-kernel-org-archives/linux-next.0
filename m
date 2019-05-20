From: Randy Dunlap <rdunlap@infradead.org>
Subject: Re: linux-next: Tree for May 20 (amdgpu)
Date: Mon, 20 May 2019 08:32:18 -0700
Message-ID: <9e9c29f2-bb6e-572e-5486-7ddde2982ba0@infradead.org>
References: <20190520115530.46cf100d@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190520115530.46cf100d@canb.auug.org.au>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>, Linux Next Mailing List <linux-next@vger.kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, dri-devel <dri-devel@lists.freedesktop.org>, Oded Gabbay <oded.gabbay@gmail.com>
List-Id: linux-next.vger.kernel.org

On 5/19/19 6:55 PM, Stephen Rothwell wrote:
> Hi all,
> 
> Changes since 20190517:
> 
> Non-merge commits (relative to Linus' tree): 553
>  519 files changed, 11723 insertions(+), 3396 deletions(-)
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
> with a ppc64_defconfig for powerpc, an allmodconfig for x86_64, a
> multi_v7_defconfig for arm and a native build of tools/perf. After
> the final fixups (if any), I do an x86_64 modules_install followed by
> builds for x86_64 allnoconfig, powerpc allnoconfig (32 and 64 bit),
> ppc44x_defconfig, allyesconfig and pseries_le_defconfig and i386, sparc
> and sparc64 defconfig. And finally, a simple boot test of the powerpc
> pseries_le_defconfig kernel in qemu (with and without kvm enabled).
> 
> Below is a summary of the state of the merge.
> 
> I am currently merging 298 trees (counting Linus' and 69 trees of bug
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

on i386, when built as loadable module:

in amdgpu_ras_sysfs_badpages_read():
ERROR: "__divdi3" [drivers/gpu/drm/amd/amdgpu/amdgpu.ko] undefined!

or when builtin:
ld: drivers/gpu/drm/amd/amdgpu/amdgpu_ras.o: in function `amdgpu_ras_sysfs_badpages_read':
amdgpu_ras.c:(.text+0x9ec): undefined reference to `__divdi3'
ld: amdgpu_ras.c:(.text+0xa0a): undefined reference to `__divdi3'



-- 
~Randy
