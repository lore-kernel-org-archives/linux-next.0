From: Grant Likely <grant.likely@secretlab.ca>
Subject: Re: linux-next: Tree for Mar 5 (of/irqs)
Date: Mon, 5 Mar 2012 13:57:33 -0700
Message-ID: <CACxGe6vPnFcUQ0mNF4CU5LLLJj=F5A2=1m8u=v1KJDHZnXS4Tw@mail.gmail.com>
References: <20120305181024.d396adb4fefdf6d269657606@canb.auug.org.au> <4F54FBBC.5060809@xenotime.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <4F54FBBC.5060809@xenotime.net>
Sender: linux-kernel-owner@vger.kernel.org
To: Randy Dunlap <rdunlap@xenotime.net>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

On Mon, Mar 5, 2012 at 10:45 AM, Randy Dunlap <rdunlap@xenotime.net> wrote:
> On 03/04/2012 11:10 PM, Stephen Rothwell wrote:
>
>> Hi all,
>>
>> Changes since 20120302:
>
>
>
> Still have both of these build errors (on i386/X86_32;
> 2 different builds):
>
>
> drivers/mfd/twl-core.c:1262:2: error: implicit declaration of function 'irq_alloc_descs'
> drivers/mfd/twl-core.c:1357:3: error: implicit declaration of function 'of_platform_populate'

The fix didn't get pushed out until I received an ack from Benoit this
morning.  It will be fixed in tomorrow's linux-next.

> and:
>
> drivers/gpio/gpio-sodaville.c:130:2: error: unknown field 'dt_translate' specified in initializer
> drivers/gpio/gpio-sodaville.c:130:2: warning: initialization from incompatible pointer type
> drivers/gpio/gpio-sodaville.c:152:8: error: 'struct irq_domain' has no member named 'irq_base'
> drivers/gpio/gpio-sodaville.c:182:2: error: implicit declaration of function 'irq_domain_add'
> drivers/gpio/gpio-sodaville.c:263:2: error: implicit declaration of function 'irq_domain_del'

I don't have the fix ready yet.  It is coming.

g.
