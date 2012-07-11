From: Sedat Dilek <sedat.dilek@gmail.com>
Subject: Re: linux-next: Tree for July 10 (gpio/gpio-tps65910.c)
Date: Wed, 11 Jul 2012 14:29:10 +0200
Message-ID: <CA+icZUX565WsuJNHKsohXi=vp34Acn+2D-nj8mQQtCfi=Pw_Nw@mail.gmail.com>
Reply-To: sedat.dilek@gmail.com
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: LKML <linux-kernel@vger.kernel.org>, linux-next <linux-next@vger.kernel.org>, Randy Dunlap <rdunlap@xenotime.net>
List-Id: linux-next.vger.kernel.org

Hi,

I see the same build-error as Randy in latest linux.git
(055c9fa8874fa7261eec7a268366565db84af474).

Where is this patch queued up (see original posting)?
I do not see any patch in [2].
And please please please rename your repo... "linux-2.6" died many
months ago :-).

I also do not see any patch sent to LKML.

Should that all disabled?

CONFIG_GPIO_TPS65910=y
CONFIG_MFD_TPS65910=y
CONFIG_REGULATOR_TPS65910=m

...or is CONFIG_GPIO_TPS65910=n enough to workaround it?

- Sedat -

[1] http://marc.info/?l=linux-kernel&m=134199653428188&w=2
[2] http://git.secretlab.ca/?p=linux-2.6.git;a=summary
[3] http://git.kernel.org/?p=linux/kernel/git/next/linux-next.git;a=blob;f=Next/Trees;#l31
