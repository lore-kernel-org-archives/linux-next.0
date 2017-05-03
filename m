From: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: linux-next: manual merge of the drivers-x86 tree with the
 watchdog tree
Date: Wed, 3 May 2017 17:43:43 +0300
Message-ID: <CAHp75Vc1TJ4W8m3TBGYq9FEQ5uM80jR4j2qRA6Oz6MRN3ErTsQ@mail.gmail.com>
References: <20170502140403.24e315cf@canb.auug.org.au> <20170502180940.GB26866@fury>
 <20170502191217.GA11901@roeck-us.net> <20170502202159.GC26866@fury>
 <CAHp75VeCGUh_AYFKWwm4riFBGC1dgifchUQSr_2dO3mo_pUx1Q@mail.gmail.com>
 <20170502213046.GD26866@fury> <20170502215822.GA18400@roeck-us.net>
 <20170502223518.GE26866@fury> <20170503142429.GA26229@spo001.leaseweb.nl>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-qt0-f179.google.com ([209.85.216.179]:34277 "EHLO
        mail-qt0-f179.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753871AbdECOnp (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 3 May 2017 10:43:45 -0400
In-Reply-To: <20170503142429.GA26229@spo001.leaseweb.nl>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Wim Van Sebroeck <wim@iguana.be>
Cc: Darren Hart <dvhart@infradead.org>, Guenter Roeck <linux@roeck-us.net>, Stephen Rothwell <sfr@canb.auug.org.au>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>

On Wed, May 3, 2017 at 5:24 PM, Wim Van Sebroeck <wim@iguana.be> wrote:
>> On Tue, May 02, 2017 at 02:58:22PM -0700, Guenter Roeck wrote:
>> > On Tue, May 02, 2017 at 02:30:46PM -0700, Darren Hart wrote:

>> > On a side note, it appears that I tagged "watchdog: iTCO_wdt: cleanup
>> > set/unset no_reboot_bit functions" with "Reviewed-by:", not with "Acked-by:".
>>
>> I noticed this as well. If Wim drops these, we'll correct that in our branch.
>
> It makes sence to keep the patches together. I will drop the patches from the watchdog tree.

Thanks, Wim.

-- 
With Best Regards,
Andy Shevchenko
