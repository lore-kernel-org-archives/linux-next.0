From: Daniel Lezcano <daniel.lezcano@linaro.org>
Subject: Re: linux-next: Tree for May 2
Date: Thu, 2 May 2019 22:09:49 +0200
Message-ID: <0a28f5b8-296a-451c-c2f4-c0057833fb00@linaro.org>
References: <20190502201028.707453d8@canb.auug.org.au>
 <CADYN=9LHJpDyvA=3wkcqdS5f3kahD0vdXFY415k8UmLHMDzL+Q@mail.gmail.com>
 <20190502190845.GA19485@archlinux-i9>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190502190845.GA19485@archlinux-i9>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Nathan Chancellor <natechancellor@gmail.com>, Anders Roxell <anders.roxell@linaro.org>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, maxime.ripard@bootlin.com, andre.przywara@arm.com, samuel@sholland.org, Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

On 02/05/2019 21:08, Nathan Chancellor wrote:
> On Thu, May 02, 2019 at 09:00:58PM +0200, Anders Roxell wrote:
>> On Thu, 2 May 2019 at 12:10, Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>>>
>>> Hi all,
>>>
>>> Changes since 20190501:
>>>
>>> The kbuild tree gained a conflict against Linus' tree.
>>>
>>> The f2fs tree gained a build failure for which I applied a patch.
>>>
>>> The net-next tree gained a conflict against the net tree.
>>>
>>> The pidfd tree gained a conflict against the kbuild tree.
>>>
>>> The akpm-current tree gained a conflict against the parisc-hd tree.
>>>
>>> Non-merge commits (relative to Linus' tree): 10425
>>>  10206 files changed, 459072 insertions(+), 301989 deletions(-)
>>>
>>> ----------------------------------------------------------------------------
>>>
>>> I have created today's linux-next tree at
>>> git://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
>>> (patches at http://www.kernel.org/pub/linux/kernel/next/ ).  If you
>>> are tracking the linux-next tree using git, you should not use "git pull"
>>> to do so as that will try to merge the new linux-next release with the
>>> old one.  You should use "git fetch" and checkout or reset to the new
>>> master.
>>>
>>> You can see which trees have been included by looking in the Next/Trees
>>> file in the source.  There are also quilt-import.log and merge.log
>>> files in the Next directory.  Between each merge, the tree was built
>>> with a ppc64_defconfig for powerpc, an allmodconfig for x86_64, a
>>> multi_v7_defconfig for arm and a native build of tools/perf. After
>>> the final fixups (if any), I do an x86_64 modules_install followed by
>>> builds for x86_64 allnoconfig, powerpc allnoconfig (32 and 64 bit),
>>> ppc44x_defconfig, allyesconfig and pseries_le_defconfig and i386, sparc
>>> and sparc64 defconfig. And finally, a simple boot test of the powerpc
>>> pseries_le_defconfig kernel in qemu (with and without kvm enabled).
>>>
>>> Below is a summary of the state of the merge.
>>>
>>> I am currently merging 298 trees (counting Linus' and 69 trees of bug
>>> fix patches pending for the current merge release).
>>>
>>> Stats about the size of the tree over time can be seen at
>>> http://neuling.org/linux-next-size.html .
>>>
>>> Status of my local build tests will be at
>>> http://kisskb.ellerman.id.au/linux-next .  If maintainers want to give
>>> advice about cross compilers/configs that work, we are always open to add
>>> more builds.
>>>
>>> Thanks to Randy Dunlap for doing many randconfig builds.  And to Paul
>>> Gortmaker for triage and bug fixes.

[ ... ]

>> Hi, I've noticed a build error if CONFIG_50I_ERRATUM_UNKNOWN1=y is enabled:
>>
>> ../drivers/clocksource/arm_arch_timer.c:402:20: error: redefinition of
>> â€˜sun50i_a64_read_cntpct_el0â€™
>>  static u64 notrace sun50i_a64_read_cntpct_el0(void)
>>                     ^~~~~~~~~~~~~~~~~~~~~~~~~~
>> ../drivers/clocksource/arm_arch_timer.c:360:20: note: previous
>> definition of â€˜sun50i_a64_read_cntpct_el0â€™ was here
>>  static u64 notrace sun50i_a64_read_cntpct_el0(void)
>>                     ^~~~~~~~~~~~~~~~~~~~~~~~~~
>> ../drivers/clocksource/arm_arch_timer.c:407:20: error: redefinition of
>> â€˜sun50i_a64_read_cntvct_el0â€™
>>  static u64 notrace sun50i_a64_read_cntvct_el0(void)
>>                     ^~~~~~~~~~~~~~~~~~~~~~~~~~
>> ../drivers/clocksource/arm_arch_timer.c:365:20: note: previous
>> definition of â€˜sun50i_a64_read_cntvct_el0â€™ was here
>>  static u64 notrace sun50i_a64_read_cntvct_el0(void)
>>                     ^~~~~~~~~~~~~~~~~~~~~~~~~~
>> ../drivers/clocksource/arm_arch_timer.c:412:20: error: redefinition of
>> â€˜sun50i_a64_read_cntp_tval_el0â€™
>>  static u32 notrace sun50i_a64_read_cntp_tval_el0(void)
>>                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> ../drivers/clocksource/arm_arch_timer.c:370:20: note: previous
>> definition of â€˜sun50i_a64_read_cntp_tval_el0â€™ was here
>>  static u32 notrace sun50i_a64_read_cntp_tval_el0(void)
>>                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> ../drivers/clocksource/arm_arch_timer.c:417:20: error: redefinition of
>> â€˜sun50i_a64_read_cntv_tval_el0â€™
>>  static u32 notrace sun50i_a64_read_cntv_tval_el0(void)
>>                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> ../drivers/clocksource/arm_arch_timer.c:375:20: note: previous
>> definition of â€˜sun50i_a64_read_cntv_tval_el0â€™ was here
>>  static u32 notrace sun50i_a64_read_cntv_tval_el0(void)
>>                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> ../drivers/clocksource/arm_arch_timer.c:375:20: warning:
>> â€˜sun50i_a64_read_cntv_tval_el0â€™ defined but not used
>> [-Wunused-function]
>> ../drivers/clocksource/arm_arch_timer.c:370:20: warning:
>> â€˜sun50i_a64_read_cntp_tval_el0â€™ defined but not used
>> [-Wunused-function]
>>  static u32 notrace sun50i_a64_read_cntp_tval_el0(void)
>>                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> make[3]: *** [../scripts/Makefile.build:279:
>> drivers/clocksource/arm_arch_timer.o] Error 1
>> make[3]: Target '__build' not remade because of errors.
>> make[2]: *** [../scripts/Makefile.build:489: drivers/clocksource] Error 2
>>
>> I think commit c950ca8c35ee ("clocksource/drivers/arch_timer:
>> Workaround for Allwinner A64 timer instability") introduced the issue.
>>
>> Cheers,
>> Anders
> 
> It actually looks like it is the clocksource tree merge that causes it:
> 
> https://git.kernel.org/next/linux-next/c/5e70bc4029d33b14a6cee87707e7b402801ca310
> 
> Since that commit exists in two different trees.

Yes, I picked the patch and it was merged it via the tip tree [1] as
requested by Marc Zyngier [2] and notified [3].

In any case, this patch should have go through my tree initially, so if
it is found somewhere else that's wrong.

I did a respin of my branch and pushed it again in case there was
something wrong from it.

Thanks

  -- Daniel

[1] https://lkml.org/lkml/2019/3/5/274
[2] https://lkml.org/lkml/2019/1/14/122
[3] https://lkml.org/lkml/2019/1/14/381

-- 
 <http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog
