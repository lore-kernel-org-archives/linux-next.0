From: Randy Dunlap <rdunlap@infradead.org>
Subject: Re: linux-next: Tree for Feb 6 (drivers/edac/skx* and i10nm)
Date: Wed, 6 Feb 2019 13:11:23 -0800
Message-ID: <3f095f3e-ace0-aadb-ead1-01908da5c08c@infradead.org>
References: <20190206170000.286b1f53@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190206170000.286b1f53@canb.auug.org.au>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>, Linux Next Mailing List <linux-next@vger.kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Tony Luck <tony.luck@intel.com>, Linux Edac Mailing List <linux-edac@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

On 2/5/19 10:00 PM, Stephen Rothwell wrote:
> Hi all,
> 
> Changes since 20190205:
> 
> The mips tree gained conflicts against the mips-fixes tree.
> 
> The opp tree gained a conflict against the pm tree.
> 
> The drm-intel tree gained a conflict against the drm tree.
> 
> The akpm-current tree gained a conflict against the powerpc-fixes tree.
> 
> Non-merge commits (relative to Linus' tree): 5801
>  6493 files changed, 242140 insertions(+), 152493 deletions(-)
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
> I am currently merging 296 trees (counting Linus' and 69 trees of bug
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

on x86_64:

ld: drivers/edac/skx_common.o: in function `skx_mce_check_error':
skx_common.c:(.text+0x982): undefined reference to `adxl_decode'
ld: drivers/edac/skx_common.o: in function `skx_adxl_get':
skx_common.c:(.init.text+0x11): undefined reference to `adxl_get_component_names'


CONFIG_EDAC_I10NM=y
but CONFIG_EDAC_SKX is not set.
since # CONFIG_ACPI is not set

Should EDAC_I10NM depend on ACPI also?


-- 
~Randy
