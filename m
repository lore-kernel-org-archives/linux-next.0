From: Guenter Roeck <linux@roeck-us.net>
Subject: Re: linux-next: build failure after merge of the watchdog tree
Date: Thu, 25 Sep 2014 22:51:28 -0700
Message-ID: <5424FEE0.2020806@roeck-us.net>
References: <20140926154031.4bc4dc39@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20140926154031.4bc4dc39@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>, Wim Van Sebroeck <wim@iguana.be>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Carlo Caione <carlo@caione.org>
List-Id: linux-next.vger.kernel.org

On 09/25/2014 10:40 PM, Stephen Rothwell wrote:
> Hi Wim,
>
> After merging the watchdog tree, today's linux-next build (arm
> multi_v7_defconfig) failed like this:
>
>
> drivers/watchdog/meson_wdt.c: In function 'meson_wdt_probe':
> drivers/watchdog/meson_wdt.c:178:2: error: implicit declaration of function 'register_restart_handler' [-Werror=implicit-function-declaration]
>    err = register_restart_handler(&meson_wdt->restart_handler);
>    ^
> drivers/watchdog/meson_wdt.c: In function 'meson_wdt_remove':
> drivers/watchdog/meson_wdt.c:193:2: error: implicit declaration of function 'unregister_restart_handler' [-Werror=implicit-function-declaration]
>    unregister_restart_handler(&meson_wdt->restart_handler);
>    ^
>
> Caused by commit 575f4153957b ("ARM: meson: add watchdog driver").
>
> I have reverted that commit for today.
>

Those functions are defined by patches which reside in Andrew's tree.
Is that merged later ?

Guenter
