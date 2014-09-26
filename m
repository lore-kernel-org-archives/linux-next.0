From: Pramod Gurav <pramod.gurav@smartplayin.com>
Subject: Re: linux-next: build failure after merge of the watchdog tree
Date: Fri, 26 Sep 2014 11:26:04 +0530
Message-ID: <5424FFF4.4010506@smartplayin.com>
References: <20140926154031.4bc4dc39@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20140926154031.4bc4dc39@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Wim Van Sebroeck <wim@iguana.be>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Carlo Caione <carlo@caione.org>, Guenter Roeck <linux@roeck-us.net>
List-Id: linux-next.vger.kernel.org

On Friday 26 September 2014 11:10 AM, Stephen Rothwell wrote:
> Hi Wim,
> 
> After merging the watchdog tree, today's linux-next build (arm
> multi_v7_defconfig) failed like this:
> 
> 
> drivers/watchdog/meson_wdt.c: In function 'meson_wdt_probe':
> drivers/watchdog/meson_wdt.c:178:2: error: implicit declaration of function 'register_restart_handler' [-Werror=implicit-function-declaration]
>   err = register_restart_handler(&meson_wdt->restart_handler);
>   ^
> drivers/watchdog/meson_wdt.c: In function 'meson_wdt_remove':
> drivers/watchdog/meson_wdt.c:193:2: error: implicit declaration of function 'unregister_restart_handler' [-Werror=implicit-function-declaration]
>   unregister_restart_handler(&meson_wdt->restart_handler);
>   ^
>
This is because Guenter Roeck's restart_notifier mechanism [1] has not
yet made it to linux-next.

Oh yes, I checked it now its already pulled in master branch of linux-next.

> Caused by commit 575f4153957b ("ARM: meson: add watchdog driver").
> 
> I have reverted that commit for today.
> 
[1]: https://patchwork.kernel.org/patch/4746721/

Thanks
Pramod
