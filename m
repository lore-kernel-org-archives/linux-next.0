From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: build failure after merge of the gpio tree
Date: Fri, 3 Nov 2017 19:13:16 +1100
Message-ID: <20171103191316.27a28dd9@canb.auug.org.au>
References: <20171102162038.339466ef@canb.auug.org.au>
        <CACRpkdY0rOxacH=kymWanruEgUcSsfXhy3CrogVUqg9WT_bjTg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:41971 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751960AbdKCINS (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Fri, 3 Nov 2017 04:13:18 -0400
In-Reply-To: <CACRpkdY0rOxacH=kymWanruEgUcSsfXhy3CrogVUqg9WT_bjTg@mail.gmail.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>, Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Masahiro Yamada <yamada.masahiro@socionext.com>

Hi Linus,

On Fri, 3 Nov 2017 08:50:31 +0100 Linus Walleij <linus.walleij@linaro.org> wrote:
>
> I applied this patch to the GPIO tree, I guess it is the right thing
> to do at this point.

Umm, you can't really validly apply my merge fix patch to the gpio tree
without merging in part of the tip tree (it will generate, at least,
warnings in your build testing of your tree) ...

> I suspect the IRQ infrastructure will be pulled to Torvald's tree
> first anyway.

You just need to let Linus know that this update is require (maybe
provide him with my merge fix patch) when you send your pull request.

-- 
Cheers,
Stephen Rothwell
