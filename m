From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: linux-next: build warning after merge of the drivers-x86 tree
Date: Fri, 26 May 2017 10:25:36 +0200
Message-ID: <CAK8P3a15oS2wsw32b15fSHJ3QZB6guGdLahZoOBLJt=PBD++mw@mail.gmail.com>
References: <20170519132317.5dc47b24@canb.auug.org.au> <20170519220931.GA24990@fury>
 <CAHp75VcJ0eWgiRnsxqEVJjEtsNWzkH2+vRGuT6NmeHsH8NbyQQ@mail.gmail.com> <20170526093412.3af222e6@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-oi0-f68.google.com ([209.85.218.68]:33997 "EHLO
        mail-oi0-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1759661AbdEZIZh (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 26 May 2017 04:25:37 -0400
In-Reply-To: <20170526093412.3af222e6@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy.shevchenko@gmail.com>, Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Ritesh Raj Sarraf <rrs@debian.org>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>

On Fri, May 26, 2017 at 1:34 AM, Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> On Mon, 22 May 2017 21:03:06 +0300 Andy Shevchenko <andy.shevchenko@gmail.com> wrote:
>> On Sat, May 20, 2017 at 1:09 AM, Darren Hart <dvhart@infradead.org> wrote:
>> > On Fri, May 19, 2017 at 01:23:17PM +1000, Stephen Rothwell wrote:
>> >>
>> >> After merging the drivers-x86 tree, today's linux-next build (x86_64
>> >> allmodconfig) produced this warning:
>> >>
>> >> drivers/platform/x86/ideapad-laptop.c:438:16: warning: 'touchpad_store' defined but not used [-Wunused-function]
>> >>  static ssize_t touchpad_store(struct device *dev,
>> >>                 ^
>> >>
>> >> Introduced by commit
>> >>
>> >>   7f363145992c ("platform/x86: ideapad-laptop: Switch touchpad attribute to be RO")
>> >
>> >
>> > Andy, you warned me about this and I had forgotten before I included it in next.
>> >
>> > Would you like to drop this change, or drop the touchpad_store function?
>>
>> I would go with Arnd's patch if he respins one addressing my comment.
>
> Any progress on this?

Andy wrote that he committed an updated patch on May 23. The git tree
at git://git.infradead.org/users/dvhart/linux-platform-drivers-x86.git#for-next
appears to currently contain an older state from May 15.

        Arnd
