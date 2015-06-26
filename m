From: "Suzuki K. Poulose" <Suzuki.Poulose@arm.com>
Subject: Re: linux-next: Tree for Jun 26
Date: Fri, 26 Jun 2015 11:55:47 +0100
Message-ID: <558D2FB3.1060209@arm.com>
References: <20150626190857.09cac9cb@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=WINDOWS-1252;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20150626190857.09cac9cb@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>, Paul Walmsley <paul@pwsan.com>
Cc: "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Thierry Reding <treding@nvidia.com>
List-Id: linux-next.vger.kernel.org

On 26/06/15 10:08, Stephen Rothwell wrote:
> Hi all,
>
> Changes since 20150625:
>
> Dropped tree: edac-amd (rebased and merged into Linus' tree)
>
> The arc tree gained a conflict against Linus' tree.
>
> The vfs tree gained a conflict against the ceph tree.
>
> The modules tree still had its build failure so I applied another pat=
ch.
>
> The edac-amd tree gained a conflict against Linus' tree so I dropped =
it.
>
> The akpm tree lost its build failure.
>
> Non-merge commits (relative to Linus' tree): 6974
>   6148 files changed, 782981 insertions(+), 153587 deletions(-)


I get build failures on ARM64:

$ git log | head
commit 043831b4a4e9a981c4ec6331b6d64b9f62285d5d
Author: Stephen Rothwell <sfr@canb.auug.org.au>
Date:   Fri Jun 26 18:59:50 2015 +1000


drivers/clk/tegra/clk-dfll.c: In function =91find_lut_index_for_rate=92=
:
drivers/clk/tegra/clk-dfll.c:691:3: error: implicit declaration of func=
tion =91regulator_list_voltage=92 [-Werror=3Dimplicit-function-declarat=
ion]
    if (regulator_list_voltage(td->vdd_reg, td->i2c_lut[i]) =3D=3D uv)
    ^
   CC      drivers/clocksource/mmio.o
   CC      fs/proc/softirqs.o
cc1: some warnings being treated as errors
make[3]: *** [drivers/clk/tegra/clk-dfll.o] Error 1
make[2]: *** [drivers/clk/tegra] Error 2
make[1]: *** [drivers/clk] Error 2
make[1]: *** Waiting for unfinished jobs....

This happens due to a missing dependency on CONFIG_REGULATOR by
CONFIG_ARCH_TEGRA

Not sure if the below is a proper fix, but that solves the problem
for me:


diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
index 0f6edb1..7fe2cc0 100644
--- a/arch/arm64/Kconfig
+++ b/arch/arm64/Kconfig
@@ -218,6 +218,7 @@ config ARCH_TEGRA
         select HAVE_CLK
         select PINCTRL
         select RESET_CONTROLLER
+       select REGULATOR
         help
           This enables support for the NVIDIA Tegra SoC family.



Thanks
Suzuki


>
> ---------------------------------------------------------------------=
-------
>
> I have created today's linux-next tree at
> git://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
> (patches at http://www.kernel.org/pub/linux/kernel/next/ ).  If you
> are tracking the linux-next tree using git, you should not use "git p=
ull"
> to do so as that will try to merge the new linux-next release with th=
e
> old one.  You should use "git fetch" and checkout or reset to the new
> master.
>
> You can see which trees have been included by looking in the Next/Tre=
es
> file in the source.  There are also quilt-import.log and merge.log fi=
les
> in the Next directory.  Between each merge, the tree was built with
> a ppc64_defconfig for powerpc and an allmodconfig for x86_64 and a
> multi_v7_defconfig for arm. After the final fixups (if any), it is al=
so
> built with powerpc allnoconfig (32 and 64 bit), ppc44x_defconfig and
> allyesconfig (this fails its final link) and i386, sparc, sparc64 and=
 arm
> defconfig.
>
> Below is a summary of the state of the merge.
>
> I am currently merging 221 trees (counting Linus' and 31 trees of pat=
ches
> pending for Linus' tree).
>
> Stats about the size of the tree over time can be seen at
> http://neuling.org/linux-next-size.html .
>
> Status of my local build tests will be at
> http://kisskb.ellerman.id.au/linux-next .  If maintainers want to giv=
e
> advice about cross compilers/configs that work, we are always open to=
 add
> more builds.
>
> Thanks to Randy Dunlap for doing many randconfig builds.  And to Paul
> Gortmaker for triage and bug fixes.
>
