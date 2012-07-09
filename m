From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: linux-next: build failure after merge of the gpio-lw tree
Date: Mon, 9 Jul 2012 22:34:23 +0200
Message-ID: <CACRpkdYSLRiAQd3kGGv8xktAvi+YbBSe1hGqMX2y7fFXQOHPXQ@mail.gmail.com>
References: <20120706161455.dd899154fbc8a79ee530572f@canb.auug.org.au>
	<CACRpkdbZddOBf0PXFJjr_aRD3TEa9hSvXjAjf3--8Ko_W0zZcg@mail.gmail.com>
	<w3psjd55kwl.wl%kuninori.morimoto.gx@renesas.com>
	<CACRpkdb=bg7fc1HEW5U2PBjs_hLDRgGUNP=O6BEJRmYfCiSWpA@mail.gmail.com>
	<87r4slg063.wl%kuninori.morimoto.gx@renesas.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-qa0-f53.google.com ([209.85.216.53]:43441 "EHLO
	mail-qa0-f53.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753205Ab2GIUeY (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 9 Jul 2012 16:34:24 -0400
Received: by qaas11 with SMTP id s11so1920047qaa.19
        for <linux-next@vger.kernel.org>; Mon, 09 Jul 2012 13:34:23 -0700 (PDT)
In-Reply-To: <87r4slg063.wl%kuninori.morimoto.gx@renesas.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: Thomas Gleixner <tglx@linutronix.de>, Stephen Rothwell <sfr@canb.auug.org.au>, Kuninori Morimoto <kuninori.morimoto.gx@gmail.com>, linux-kernel@vger.kernel.org, linux-next@vger.kernel.org

On Mon, Jul 9, 2012 at 4:04 AM, Kuninori Morimoto
<kuninori.morimoto.gx@renesas.com> wrote:

> Hi Linus Walleij, Stephen, and Thomas
>
>> >> > After merging the gpio-lw tree, today's linux-next build (x86_64
>> >> > allmodconfig) failed like this:
>> >> >
>> >> > ERROR: "irq_set_chip_and_handler_name" [drivers/gpio/gpio-pcf857x.ko] undefined!
>> >> > ERROR: "dummy_irq_chip" [drivers/gpio/gpio-pcf857x.ko] undefined!
>> >>
>> >> Thanks, I've dropped the offending patch, Kuninori can you look into this and
>> >> provide a new patch? It's the second patch from your patch set.
>> >
>> > OK. I will, but it will be next week.
>> > And could you please show me where is your repository/branch ?
>>
>> http://git.kernel.org/?p=linux/kernel/git/linusw/linux-gpio.git;a=summary
>> branch devel/for-next
>
> In my check, these are export symbol issue.
> I think above 2 function/struct were not exported for module.
>
> Is it poosible to solve this issue by these patches ?

Hm Thomas has to answer to that (and merge the patches, if he
likes them).

Yours,
Linus Walleij
