From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: linux-next: Tree for July 17 (mfd: AB3100 - ab3100_probe:
 undefined reference to `rand_initialize_irq')
Date: Tue, 17 Jul 2012 20:40:54 +0200
Message-ID: <CACRpkdbAnBza0Nd4Qw_LinRDa4XVuzUdJFX==YeML2z7H6gzwg@mail.gmail.com>
References: <CA+icZUXjc+13YjoJ6FjDFboX20j3mqHNtvV2Av2-H0My8V2Mgg@mail.gmail.com>
	<CA+icZUW4gNqspcJ1sjBD-3GCVee2VWVV5NPAr6Eo-aZHjp3y+Q@mail.gmail.com>
	<CA+icZUW+Gp9HK-6dzHjtTwSc9RaLD3sV+WPMM-vO3A6fj6frwQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-qa0-f53.google.com ([209.85.216.53]:61632 "EHLO
	mail-qa0-f53.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753532Ab2GQSkz (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 17 Jul 2012 14:40:55 -0400
Received: by qaas11 with SMTP id s11so529348qaa.19
        for <linux-next@vger.kernel.org>; Tue, 17 Jul 2012 11:40:54 -0700 (PDT)
In-Reply-To: <CA+icZUW+Gp9HK-6dzHjtTwSc9RaLD3sV+WPMM-vO3A6fj6frwQ@mail.gmail.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: sedat.dilek@gmail.com
Cc: Theodore Ts'o <tytso@mit.edu>, linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, Linus Walleij <linus.walleij@stericsson.com>, Samuel Ortiz <sameo@linux.intel.com>, linux-arm-kernel@lists.infradead.org, Stephen Rothwell <sfr@canb.auug.org.au>

On Tue, Jul 17, 2012 at 12:39 PM, Sedat Dilek <sedat.dilek@gmail.com> wrote:
> On Tue, Jul 17, 2012 at 12:21 PM, Sedat Dilek <sedat.dilek@gmail.com> wrote:
>> ...looks like AB3100 is the *only* driver still using rand_initialize_irq()...
>>
>> drivers/mfd/ab3100-core.c:939:  rand_initialize_irq(client->irq);
>>
>> ...but why has random.h still this...?
>>
>> include/linux/random.h:51:extern void rand_initialize_irq(int irq);
>>
>> Just thinking "loud"...
>>
>> - Sedat -
>
> Is this attached patch OK, Ted?

You're just deleting a line from the AB3100 driver, so I guess you're
regressing the system since that IRQ will no longer contribute
to the entropy pool?

How do we simultaneously make sure that this IRQ is still
contributing to the entropy?

Yours,
Linus Walleij
