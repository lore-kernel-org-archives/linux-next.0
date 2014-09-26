From: Guenter Roeck <linux@roeck-us.net>
Subject: Re: linux-next: build failure after merge of the watchdog tree
Date: Thu, 25 Sep 2014 23:12:01 -0700
Message-ID: <542503B1.9090206@roeck-us.net>
References: <20140926154031.4bc4dc39@canb.auug.org.au> <5424FFF4.4010506@smartplayin.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <5424FFF4.4010506@smartplayin.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Pramod Gurav <pramod.gurav@smartplayin.com>, Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Wim Van Sebroeck <wim@iguana.be>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Carlo Caione <carlo@caione.org>, Andrew Morton <akpm@linux-foundation.org>
List-Id: linux-next.vger.kernel.org

On 09/25/2014 10:56 PM, Pramod Gurav wrote:
> On Friday 26 September 2014 11:10 AM, Stephen Rothwell wrote:
>> Hi Wim,
>>
>> After merging the watchdog tree, today's linux-next build (arm
>> multi_v7_defconfig) failed like this:
>>
>>
>> drivers/watchdog/meson_wdt.c: In function 'meson_wdt_probe':
>> drivers/watchdog/meson_wdt.c:178:2: error: implicit declaration of function 'register_restart_handler' [-Werror=implicit-function-declaration]
>>    err = register_restart_handler(&meson_wdt->restart_handler);
>>    ^
>> drivers/watchdog/meson_wdt.c: In function 'meson_wdt_remove':
>> drivers/watchdog/meson_wdt.c:193:2: error: implicit declaration of function 'unregister_restart_handler' [-Werror=implicit-function-declaration]
>>    unregister_restart_handler(&meson_wdt->restart_handler);
>>    ^
>>
> This is because Guenter Roeck's restart_notifier mechanism [1] has not
> yet made it to linux-next.
>
No, that isn't it; it is there, coming from Andrew Morton's tree.
I think the problem is that the functions are not in Wim's tree,
and neither is ARCH_MESON. For this reason, the driver does not
build in Wim's tree, nor in my tree, which in turn explains why
we don't see the error. Maybe Stephen merges Andrew's tree after the
watchdog tree, and builds the watchdog code immediately after pulling it.
If the MESON code is already merged at that time we would see that error.

Question is how to handle that kind of situation. An idea, anyone ?

Someone suggested that I should create an immutable tree with the
restart handler patchset, which everyone using the restart handlers
could merge. Is that an option ? I could technically do that,
but I would want to pick the patches from Andrew's tree to retain
his sign-off. Andrew, any thoughts/comments ?

Thanks,
Guenter
