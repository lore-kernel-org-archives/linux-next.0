From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: linux-next: build warning after merge of the pinctrl tree
Date: Fri, 30 Jun 2017 15:48:10 +0200
Message-ID: <CACRpkdbNFJTodJT6Cu5cwKz-2ey5X67Bygr_j-mGTUYGCtBQjQ@mail.gmail.com>
References: <20170630145601.441b4994@canb.auug.org.au> <CAMuHMdVHkg3vs9XVthMoZzyV37KgNcWBj9RN3s6XATY3Eux0qw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-io0-f173.google.com ([209.85.223.173]:33876 "EHLO
        mail-io0-f173.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751964AbdF3NsM (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 30 Jun 2017 09:48:12 -0400
Received: by mail-io0-f173.google.com with SMTP id r36so24289972ioi.1
        for <linux-next@vger.kernel.org>; Fri, 30 Jun 2017 06:48:12 -0700 (PDT)
In-Reply-To: <CAMuHMdVHkg3vs9XVthMoZzyV37KgNcWBj9RN3s6XATY3Eux0qw@mail.gmail.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Jacopo Mondi <jacopo+renesas@jmondi.org>, Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

On Fri, Jun 30, 2017 at 8:59 AM, Geert Uytterhoeven
<geert@linux-m68k.org> wrote:
> On Fri, Jun 30, 2017 at 6:56 AM, Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>> After merging the pinctrl tree, today's linux-next build (x86_64
>> allmodconfig) produced this warning:
>>
>> drivers/pinctrl/pinctrl-rza1.c: In function 'rza1_pinctrl_probe':
>> drivers/pinctrl/pinctrl-rza1.c:1260:5: warning: 'ret' may be used uninitialized in this function [-Wmaybe-uninitialized]
>>   if (ret)
>>      ^
>>
>> Introduced by commit
>>
>>   5a49b644b307 ("pinctrl: Renesas RZ/A1 pin and gpio controller")
>
> Doh, 0day doesn't use compilers that report uninitialized variables?

The real problem is that 0day is not working right now.

I only get timeouts from it for the moment.

Yours,
Linus Walleij
