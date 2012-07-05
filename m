From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: Next: please switch the GPIO tree to mine
Date: Thu, 5 Jul 2012 16:55:43 +0200
Message-ID: <CACRpkda5-2zgq8UnGzJj2g15bbPMGgoW29vjZbASK9Q0+gRdtQ@mail.gmail.com>
References: <CACRpkdb+5ATkMQrW4jBDUyWn2cSRnvyoFyGnFEJQJAO9XkdM2A@mail.gmail.com>
	<CACxGe6s9moLj-zF9CnRS1R0rJ73JF+PeeXQ9_ntc0MJnnpu8Nw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-qc0-f174.google.com ([209.85.216.174]:48766 "EHLO
	mail-qc0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752448Ab2GEOzo (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 5 Jul 2012 10:55:44 -0400
Received: by qcro28 with SMTP id o28so4862772qcr.19
        for <linux-next@vger.kernel.org>; Thu, 05 Jul 2012 07:55:43 -0700 (PDT)
In-Reply-To: <CACxGe6s9moLj-zF9CnRS1R0rJ73JF+PeeXQ9_ntc0MJnnpu8Nw@mail.gmail.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Grant Likely <grant.likely@secretlab.ca>
Cc: linux-next <linux-next@vger.kernel.org>, Stephen Rothwell <sfr@canb.auug.org.au>

On Thu, Jul 5, 2012 at 4:42 PM, Grant Likely <grant.likely@secretlab.ca> wrote:
> On Jul 5, 2012 8:04 AM, "Linus Walleij" <linus.walleij@linaro.org> wrote:
>>
>> Hi Stephen,
>>
>> Grant asked me to take over the GPIO tree for a while.
>> (See: https://lkml.org/lkml/2012/7/1/220)
>>
>> Can you please replace Grants tree:
>> gpio-current    git     git://git.secretlab.ca/git/linux-2.6#gpio/merge
>>
>> With this one:
>> gpio git
>> git://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-gpio.git#for-next
>>
>> Until further notice.
>
> Actually, don't replace mine. Just add Linus' as another GPIO tree.

I pulled your gpio/merge tag into my tree so all is in one place though.

But git will cope I guess so no big deal.

Yours,
Linus Walleij
