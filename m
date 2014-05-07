From: Jim Davis <jim.epost@gmail.com>
Subject: Re: linux-next: Tree for May 7 (argh)
Date: Wed, 7 May 2014 14:45:59 -0700
Message-ID: <CA+r1ZhiUj3G44MWoacLg6fWD-eDFZ=3L8QbwuBvOB2JWAURDqQ@mail.gmail.com>
References: <20140507173341.753d8ccf4fe033abd513f98f@canb.auug.org.au>
	<536A9CF2.90906@infradead.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-ie0-f169.google.com ([209.85.223.169]:54350 "EHLO
	mail-ie0-f169.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751351AbaEGVp7 (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 7 May 2014 17:45:59 -0400
Received: by mail-ie0-f169.google.com with SMTP id rl12so1720144iec.28
        for <linux-next@vger.kernel.org>; Wed, 07 May 2014 14:45:59 -0700 (PDT)
In-Reply-To: <536A9CF2.90906@infradead.org>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Randy Dunlap <rdunlap@infradead.org>, Stephen Rothwell <sfr@canb.auug.org.au>, linux-next <linux-next@vger.kernel.org>

On 5/7/14, Randy Dunlap <rdunlap@infradead.org> wrote:
> On 05/07/2014 12:33 AM, Stephen Rothwell wrote:
>> Hi all,
>>
>> This tree still fails (more than usual) the powerpc allyesconfig build
>> and also the celleb_defconfig.
>>
>> Changes since 20140506:
>>
>
> I was away for one week.  Did I miss some new instructions about
> building linux-next?
>
> I get a thousands of messages like these:
>
> WARNING: "system_wq" [drivers/misc/bh1770glc.ko] has no CRC!
> WARNING: "__wake_up" [drivers/misc/bh1770glc.ko] has no CRC!
> WARNING: "sysfs_notify" [drivers/misc/bh1770glc.ko] has no CRC!
> WARNING: "kfree" [drivers/misc/bh1770glc.ko] has no CRC!

I don't recognized those, but

>
>
> Also there hundreds of messages like these:
>
> ps2mult.c:(.exit.text+0x8f): multiple definition of `cleanup_module'
> ps2mult.c:(.init.text+0xbc8): multiple definition of `init_module'
> ipack.c:(.exit.text+0x0): multiple definition of `cleanup_module'
> ipack.c:(.init.text+0x0): multiple definition of `init_module'
> mcb-core.c:(.text+0x40d): multiple definition of `cleanup_module'
> mcb-core.c:(.text+0x3fb): multiple definition of `init_module'

I had to hardwire CONFIG_LTO_MENU=n to avoid lots of linker complaints
about standard library things (strcmp, etc.).  This is on a Ubuntu
14.04 system.
