From: Guenter Roeck <linux@roeck-us.net>
Subject: Re: linux-next: build failure after merge of the watchdog tree
Date: Thu, 25 Sep 2014 23:49:31 -0700
Message-ID: <54250C7B.6070101@roeck-us.net>
References: <20140926154031.4bc4dc39@canb.auug.org.au>	<5424FEE0.2020806@roeck-us.net> <20140926162942.161863df@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20140926162942.161863df@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Wim Van Sebroeck <wim@iguana.be>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Carlo Caione <carlo@caione.org>, Andrew Morton <akpm@linux-foundation.org>
List-Id: linux-next.vger.kernel.org

On 09/25/2014 11:29 PM, Stephen Rothwell wrote:
> Hi Guenter,
>
> On Thu, 25 Sep 2014 22:51:28 -0700 Guenter Roeck <linux@roeck-us.net> wrote:
>>
>> On 09/25/2014 10:40 PM, Stephen Rothwell wrote:
>>> Hi Wim,
>>>
>>> After merging the watchdog tree, today's linux-next build (arm
>>> multi_v7_defconfig) failed like this:
>>>
>>>
>>> drivers/watchdog/meson_wdt.c: In function 'meson_wdt_probe':
>>> drivers/watchdog/meson_wdt.c:178:2: error: implicit declaration of function 'register_restart_handler' [-Werror=implicit-function-declaration]
>>>     err = register_restart_handler(&meson_wdt->restart_handler);
>>>     ^
>>> drivers/watchdog/meson_wdt.c: In function 'meson_wdt_remove':
>>> drivers/watchdog/meson_wdt.c:193:2: error: implicit declaration of function 'unregister_restart_handler' [-Werror=implicit-function-declaration]
>>>     unregister_restart_handler(&meson_wdt->restart_handler);
>>>     ^
>>>
>>> Caused by commit 575f4153957b ("ARM: meson: add watchdog driver").
>>>
>>> I have reverted that commit for today.
>>>
>>
>> Those functions are defined by patches which reside in Andrew's tree.
>> Is that merged later ?
>
> Yes, Andrew's tree is merged last and part of it depends on linux-next
> itself ...
>
> We really don't want these inter tree dependencies (especially with
> Andrew's tree).
>
Me not either. Question was how to get the restart handler patch set upstream.
Pushing it indirectly through merges of an immutable branch sounds like a good
idea, especially since there are by now patches in at least three subsystems
pending which depend on it.

Guenter
