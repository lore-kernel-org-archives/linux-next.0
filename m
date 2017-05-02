From: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: linux-next: manual merge of the drivers-x86 tree with the
 watchdog tree
Date: Tue, 2 May 2017 23:57:18 +0300
Message-ID: <CAHp75VeCGUh_AYFKWwm4riFBGC1dgifchUQSr_2dO3mo_pUx1Q@mail.gmail.com>
References: <20170502140403.24e315cf@canb.auug.org.au> <20170502180940.GB26866@fury>
 <20170502191217.GA11901@roeck-us.net> <20170502202159.GC26866@fury>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-qk0-f178.google.com ([209.85.220.178]:36408 "EHLO
        mail-qk0-f178.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751253AbdEBU5T (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 2 May 2017 16:57:19 -0400
In-Reply-To: <20170502202159.GC26866@fury>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Darren Hart <dvhart@infradead.org>
Cc: Guenter Roeck <linux@roeck-us.net>, Stephen Rothwell <sfr@canb.auug.org.au>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Wim Van Sebroeck <wim@iguana.be>, Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>

On Tue, May 2, 2017 at 11:21 PM, Darren Hart <dvhart@infradead.org> wrote:
> On Tue, May 02, 2017 at 12:12:17PM -0700, Guenter Roeck wrote:
>> On Tue, May 02, 2017 at 11:09:40AM -0700, Darren Hart wrote:
>> > On Tue, May 02, 2017 at 02:04:03PM +1000, Stephen Rothwell wrote:

> From my perspective, the most direct solution would be to drop these two patches
> from the watchdog tree and let them go through the platform driver x86 tree with
> Guenter's Acked-by. If you have additional patches which depend on these two,
> then if you will provide an immutable branch we can merge, we can do that too
> (but I try to keep the number of external merges to a minimum - which is
> becoming increasingly difficult lately for some reason).

Sorry for not being in doubt, I just decided that Ack from Guenter
means that default case is to go through PDx86 tree without any
additional agreement.

-- 
With Best Regards,
Andy Shevchenko
