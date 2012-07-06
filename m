From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: linux-next: build failure after merge of the gpio-lw tree
Date: Fri, 6 Jul 2012 09:01:05 +0200
Message-ID: <CACRpkdbZddOBf0PXFJjr_aRD3TEa9hSvXjAjf3--8Ko_W0zZcg@mail.gmail.com>
References: <20120706161455.dd899154fbc8a79ee530572f@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-qc0-f180.google.com ([209.85.216.180]:46730 "EHLO
	mail-qc0-f180.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754607Ab2GFHBG (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Fri, 6 Jul 2012 03:01:06 -0400
Received: by qcmv28 with SMTP id v28so5684904qcm.11
        for <linux-next@vger.kernel.org>; Fri, 06 Jul 2012 00:01:05 -0700 (PDT)
In-Reply-To: <20120706161455.dd899154fbc8a79ee530572f@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>

On Fri, Jul 6, 2012 at 8:14 AM, Stephen Rothwell <sfr@canb.auug.org.au> wrote:

> After merging the gpio-lw tree, today's linux-next build (x86_64
> allmodconfig) failed like this:
>
> ERROR: "irq_set_chip_and_handler_name" [drivers/gpio/gpio-pcf857x.ko] undefined!
> ERROR: "dummy_irq_chip" [drivers/gpio/gpio-pcf857x.ko] undefined!

Thanks, I've dropped the offending patch, Kuninori can you look into this and
provide a new patch? It's the second patch from your patch set.

Yours,
Linus Walleij
