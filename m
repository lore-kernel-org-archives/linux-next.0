From: Ulf Hansson <ulf.hansson@linaro.org>
Subject: Re: linux-next: build warning after merge of the mmc tree
Date: Thu, 2 Nov 2017 16:03:26 +0100
Message-ID: <CAPDyKFruW7-D5yWb5TH4DWtLTFdwcbFdMGfwSy7089t-7VJTdg@mail.gmail.com>
References: <20171102123617.56364a21@canb.auug.org.au> <CAD=FV=VD2mgZQLS7q=iKzZOZ1_-FN1XR=gN8+60w_=zZJObVfA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAD=FV=VD2mgZQLS7q=iKzZOZ1_-FN1XR=gN8+60w_=zZJObVfA@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Doug Anderson <dianders@chromium.org>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Shawn Lin <shawn.lin@rock-chips.com>
List-Id: linux-next.vger.kernel.org

On 2 November 2017 at 02:47, Doug Anderson <dianders@chromium.org> wrote:
> Hi,
>
> On Wed, Nov 1, 2017 at 6:36 PM, Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>> Hi Ulf,
>>
>> After merging the mmc tree, today's linux-next build (arm
>> multi_v7_defconfig) produced this warning:
>>
>> In file included from include/linux/irqflags.h:14:0,
>>                  from arch/arm/include/asm/bitops.h:27,
>>                  from include/linux/bitops.h:37,
>>                  from include/linux/kernel.h:10,
>>                  from include/asm-generic/bug.h:15,
>>                  from arch/arm/include/asm/bug.h:59,
>>                  from include/linux/bug.h:4,
>>                  from include/linux/thread_info.h:11,
>>                  from include/asm-generic/current.h:4,
>>                  from ./arch/arm/include/generated/asm/current.h:1,
>>                  from include/linux/sched.h:11,
>>                  from include/linux/blkdev.h:4,
>>                  from drivers/mmc/host/dw_mmc.c:14:
>> drivers/mmc/host/dw_mmc.c: In function 'dw_mci_set_drto':
>> include/linux/typecheck.h:11:18: warning: comparison of distinct pointer types lacks a cast
>>   (void)(&__dummy == &__dummy2); \
>>                   ^
>> include/linux/spinlock.h:221:3: note: in expansion of macro 'typecheck'
>>    typecheck(unsigned long, flags); \
>>    ^
>> include/linux/spinlock.h:346:2: note: in expansion of macro 'raw_spin_lock_irqsave'
>>   raw_spin_lock_irqsave(spinlock_check(lock), flags); \
>>   ^
>> drivers/mmc/host/dw_mmc.c:1953:2: note: in expansion of macro 'spin_lock_irqsave'
>>   spin_lock_irqsave(&host->irq_lock, irqflags);
>>   ^
>>
>> Introduced by commit
>>
>>   80a2a5a7745b ("mmc: dw_mmc: Cleanup the DTO timer like the CTO one")
>
> Yes, the 0-day bot already complained about this.  The short answer is
> that Ulf kindly volunteered to manually fix up my patch series where I
> had introduced a variable in the wrong patch.  ...but in doing so he
> introduced a small bug.
>
> It should be very easy to fix.  Just need to change irqflags from
> "unsigned int" to "unsigned long".

Yes, problem fixed!

Kind regards
Uffe
