From: Jim Davis <jim.epost@gmail.com>
Subject: Re: linux-next: Tree for May 7 (argh)
Date: Wed, 7 May 2014 15:17:11 -0700
Message-ID: <CA+r1Zhg4TKBkV8fZ+uUj9yy_0fWYNrrSLuL9ZEYppQBUKRm6jQ@mail.gmail.com>
References: <20140507173341.753d8ccf4fe033abd513f98f@canb.auug.org.au>
	<536A9CF2.90906@infradead.org>
	<CA+r1ZhiUj3G44MWoacLg6fWD-eDFZ=3L8QbwuBvOB2JWAURDqQ@mail.gmail.com>
	<20140508080251.64eed8b579e307c25c46e27f@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-ig0-f169.google.com ([209.85.213.169]:50400 "EHLO
	mail-ig0-f169.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751862AbaEGWRM (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 7 May 2014 18:17:12 -0400
Received: by mail-ig0-f169.google.com with SMTP id hl10so111835igb.0
        for <linux-next@vger.kernel.org>; Wed, 07 May 2014 15:17:12 -0700 (PDT)
In-Reply-To: <20140508080251.64eed8b579e307c25c46e27f@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Randy Dunlap <rdunlap@infradead.org>, linux-next <linux-next@vger.kernel.org>, Rusty Russell <rusty@rustcorp.com.au>, Andi Kleen <ak@linux.intel.com>, Michal Marek <mmarek@suse.cz>

On 5/7/14, Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> Hi Jim,
>
> On Wed, 7 May 2014 14:45:59 -0700 Jim Davis <jim.epost@gmail.com> wrote:
>>
>> On 5/7/14, Randy Dunlap <rdunlap@infradead.org> wrote:
>> >
>> > I was away for one week.  Did I miss some new instructions about
>> > building linux-next?
>> >
>> > I get a thousands of messages like these:
>> >
>> > WARNING: "system_wq" [drivers/misc/bh1770glc.ko] has no CRC!
>> > WARNING: "__wake_up" [drivers/misc/bh1770glc.ko] has no CRC!
>> > WARNING: "sysfs_notify" [drivers/misc/bh1770glc.ko] has no CRC!
>> > WARNING: "kfree" [drivers/misc/bh1770glc.ko] has no CRC!
>>
>> I don't recognized those, but
>>
>> >
>> >
>> > Also there hundreds of messages like these:
>> >
>> > ps2mult.c:(.exit.text+0x8f): multiple definition of `cleanup_module'
>> > ps2mult.c:(.init.text+0xbc8): multiple definition of `init_module'
>> > ipack.c:(.exit.text+0x0): multiple definition of `cleanup_module'
>> > ipack.c:(.init.text+0x0): multiple definition of `init_module'
>> > mcb-core.c:(.text+0x40d): multiple definition of `cleanup_module'
>> > mcb-core.c:(.text+0x3fb): multiple definition of `init_module'
>>
>> I had to hardwire CONFIG_LTO_MENU=n to avoid lots of linker complaints
>> about standard library things (strcmp, etc.).  This is on a Ubuntu
>> 14.04 system.
>
> The CONFIG_LTO... stuff has been in linux-next since (at least)
> next-20140408, so maybe something else has impacted on it?  Or have you
> had to do the above since then?  If so, what config, what arch?

That would be about when I noticed the problem, and it showed up with
the randconfig testing -- it took me a while to figure out that the
LTO bits seemed to be the common thing when things went south.  I'll
pull the CONFIG_LTO_MENU=n out of the setup and see what happens with
next-2014508.
