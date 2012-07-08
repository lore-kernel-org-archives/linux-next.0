From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: linux-next: build failure after merge of the gpio-lw tree
Date: Sun, 8 Jul 2012 21:14:37 +0200
Message-ID: <CACRpkdb=bg7fc1HEW5U2PBjs_hLDRgGUNP=O6BEJRmYfCiSWpA@mail.gmail.com>
References: <20120706161455.dd899154fbc8a79ee530572f@canb.auug.org.au>
	<CACRpkdbZddOBf0PXFJjr_aRD3TEa9hSvXjAjf3--8Ko_W0zZcg@mail.gmail.com>
	<w3psjd55kwl.wl%kuninori.morimoto.gx@renesas.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <w3psjd55kwl.wl%kuninori.morimoto.gx@renesas.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-next.vger.kernel.org

On Fri, Jul 6, 2012 at 10:55 AM, Kuninori Morimoto
<kuninori.morimoto.gx@renesas.com> wrote:
>
> Dear Linus
>
>> > After merging the gpio-lw tree, today's linux-next build (x86_64
>> > allmodconfig) failed like this:
>> >
>> > ERROR: "irq_set_chip_and_handler_name" [drivers/gpio/gpio-pcf857x.ko] undefined!
>> > ERROR: "dummy_irq_chip" [drivers/gpio/gpio-pcf857x.ko] undefined!
>>
>> Thanks, I've dropped the offending patch, Kuninori can you look into this and
>> provide a new patch? It's the second patch from your patch set.
>
> OK. I will, but it will be next week.
> And could you please show me where is your repository/branch ?

http://git.kernel.org/?p=linux/kernel/git/linusw/linux-gpio.git;a=summary
branch devel/for-next

Linus Walleij
