From: Zhangshaokun <zhangshaokun@hisilicon.com>
Subject: Re: linux-next: Tree for Feb 20
Date: Wed, 20 Feb 2019 17:11:15 +0800
Message-ID: <1114b964-8ff8-5632-64d4-e94a9160b998@hisilicon.com>
References: <20190220184341.73bd2084@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190220184341.73bd2084@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>, Linux Next Mailing List <linux-next@vger.kernel.org>, Roberto Sassu <roberto.sassu@huawei.com>, Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

There is a compiler failure on arm64 platform, as follow:

  AS      arch/arm64/kvm/hyp.o
  CC      kernel/trace/ring_buffer.o
In file included from security/integrity/ima/ima_fs.c:30:0:
security/integrity/ima/ima.h:176:7: error: redeclaration of enumerator ‘NONE’
  hook(NONE)   \
       ^
security/integrity/ima/ima.h:188:34: note: in definition of macro ‘__ima_hook_enumify’
 #define __ima_hook_enumify(ENUM) ENUM,
                                  ^
security/integrity/ima/ima.h:191:2: note: in expansion of macro ‘__ima_hooks’
  __ima_hooks(__ima_hook_enumify)
  ^
In file included from ./arch/arm64/include/asm/acpi.h:15:0,
                 from ./include/acpi/acpi_io.h:7,
                 from ./include/linux/acpi.h:47,
                 from ./include/linux/tpm.h:26,
                 from security/integrity/ima/ima.h:25,
                 from security/integrity/ima/ima_fs.c:30:
./include/linux/efi.h:1716:2: note: previous definition of ‘NONE’ was here
  NONE,
  ^
scripts/Makefile.build:276: recipe for target 'security/integrity/ima/ima_fs.o' failed
make[3]: *** [security/integrity/ima/ima_fs.o] Error 1

I dug it and it is the commit 901615cb916d ("tpm: move tpm_chip definition to include/linux/tpm.h")

Thanks,
Shaokun

On 2019/2/20 15:43, Stephen Rothwell wrote:
> Hi all,
> 
> Changes since 20190219:
> 
> The asm-generic tree lost its build failure.
> 
> The v4l-dvb tree lost its build failure.
> 
> The net-next tree gained a conflict against the bpf tree.
> 
> The kvm tree still had its build failure so I used a supplied patch.
> 
> The akpm-current tree gained a build failure due to an interaction with
> the drm tree for which I applied a merge fix patch.
> 
> Non-merge commits (relative to Linus' tree): 8846
>  9249 files changed, 416125 insertions(+), 220692 deletions(-)
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
