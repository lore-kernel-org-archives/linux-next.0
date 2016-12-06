From: Peter Rosin <peda@axentia.se>
Subject: Re: linux-next: build failure after merge of the pinctrl tree
Date: Tue, 6 Dec 2016 23:27:48 +0100
Message-ID: <c7690265-1f26-ed63-48bf-0e4968e7c63c@axentia.se>
Reply-To: 20161207083102.093fdf96@canb.auug.org.au
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Linus Walleij <linus.walleij@linaro.org>, Stephen Rothwell <sfr@canb.auug.org.au>, Andrew Lunn <andrew@lunn.ch>, linux-next@vger.kernel.org
List-Id: linux-next.vger.kernel.org

> Hi Linus,
> 
> On Mon, 5 Dec 2016 10:00:38 +1100 Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>>
>> After merging the pinctrl tree, today's linux-next build (arm
>> multi_v7_defconfig) failed like this:
>> 
>> drivers/gpio/gpio-pl061.c: In function 'pl061_irq_set_wake':
>> drivers/gpio/gpio-pl061.c:280:28: error: 'struct gpio_chip' has no member named 'irq_parent'
>>   return irq_set_irq_wake(gc->irq_parent, state);
>>                             ^
>> drivers/gpio/gpio-pl061.c:281:1: warning: control reaches end of non-void function [-Wreturn-type]
>>  }
>>  ^
>> 
>> Caused by commit
>> 
>>   d245b3f9bd36 ("gpio: simplify adding threaded interrupts")
>> 
>> I have used the pinctrl tree from next-20161202 for today.
> 
> I am still getting this.

The bug you are referring to is in the gpio tree, not pinctrl.
That had me confused for a while, and is the reason I'm writing
this. Maybe the next person need not be confused...

But when I'm writing on this topic anyway, I'll add some more
info, in case anyone cares.

I think fix for this bug is to use gc->irq_chained_parent instead
of gc->irq_parent, at least that changed as part of the indicated
commit. Completely untested...

The fix for the bug in the pinctrl tree is to add a missing >
as posted by Andrew Lunn in [1] (with a slightly broken commit
message; two counts of s/chip-/client-/, an extra line after
the sob and I guess the subject is no longer true).

Cheers,
Peter

[1] http://marc.info/?l=linux-gpio&m=148088890030876&w=2
