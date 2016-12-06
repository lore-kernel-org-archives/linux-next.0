From: Peter Rosin <peda@axentia.se>
Subject: Re: linux-next: build failure after merge of the pinctrl tree
Date: Wed, 7 Dec 2016 00:05:08 +0100
Message-ID: <f45de3c8-20d2-65ac-744d-108b122ef0a1@axentia.se>
References: <c7690265-1f26-ed63-48bf-0e4968e7c63c@axentia.se>
 <20161207094405.05e4e5c2@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20161207094405.05e4e5c2@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Linus Walleij <linus.walleij@linaro.org>, Andrew Lunn <andrew@lunn.ch>, linux-next@vger.kernel.org
List-Id: linux-next.vger.kernel.org

On 2016-12-06 23:46, Stephen Rothwell wrote:
> Hi Peter,
> 
> On Tue, 6 Dec 2016 23:27:48 +0100 Peter Rosin <peda@axentia.se> wrote:
>>
>> The bug you are referring to is in the gpio tree, not pinctrl.
>> That had me confused for a while, and is the reason I'm writing
>> this. Maybe the next person need not be confused...
> 
> Part of the gpio tree has been merged into the pinctrl tree (see commit
> 70afa835d2d7 ("Merge branch 'thread-irq-simpler' of /home/linus/linux-gpio
> into devel")), but when I merge the gpio tree later in my process, I do
> not get this error.

Right. *blush*

The reason appears that the gpio tree has updates to the pl061 driver
that is not present in pinctrl, specifically
009df9a02000 ("gpio: pl061: use local state for parent IRQ storage")

I guess you could merge gpio first, but you'd still hit the silly bug
in pinctrl that Andrew fixed so maybe that's not worth it...

>> But when I'm writing on this topic anyway, I'll add some more
>> info, in case anyone cares.
>>
>> I think fix for this bug is to use gc->irq_chained_parent instead
>> of gc->irq_parent, at least that changed as part of the indicated
>> commit. Completely untested...
>>
>> The fix for the bug in the pinctrl tree is to add a missing >
>> as posted by Andrew Lunn in [1] (with a slightly broken commit
>> message; two counts of s/chip-/client-/, an extra line after
>> the sob and I guess the subject is no longer true).
>>
>> Cheers,
>> Peter
>>
>> [1] http://marc.info/?l=linux-gpio&m=148088890030876&w=2
> 
> Thanks for the info ... this still needs fixing in the pinctrl tree.
> 
> P.S. Peter, your email had a bad header line:
> 
> Reply-To: 20161207083102.093fdf96@canb.auug.org.au
> 
> that should probably have been In-Reply-To ...

Right. *blush*

Off to bed I guess. After all, it's a new day tomorrow and I don't seem
very effective at the moment...

Cheers,
Peter
