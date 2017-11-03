From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: linux-next: build failure after merge of the gpio tree
Date: Fri, 3 Nov 2017 22:40:23 +0100
Message-ID: <CACRpkdZ+tvhq4X19LTb9tjE4v0J1qaTh-EtVOER3GmQw5xHN0w@mail.gmail.com>
References: <20171102162038.339466ef@canb.auug.org.au> <CACRpkdY0rOxacH=kymWanruEgUcSsfXhy3CrogVUqg9WT_bjTg@mail.gmail.com>
 <20171103191316.27a28dd9@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-io0-f180.google.com ([209.85.223.180]:47596 "EHLO
        mail-io0-f180.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752180AbdKCVkY (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 3 Nov 2017 17:40:24 -0400
Received: by mail-io0-f180.google.com with SMTP id h70so9237791ioi.4
        for <linux-next@vger.kernel.org>; Fri, 03 Nov 2017 14:40:24 -0700 (PDT)
In-Reply-To: <20171103191316.27a28dd9@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>, Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Masahiro Yamada <yamada.masahiro@socionext.com>

On Fri, Nov 3, 2017 at 9:13 AM, Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> Hi Linus,
>
> On Fri, 3 Nov 2017 08:50:31 +0100 Linus Walleij <linus.walleij@linaro.org> wrote:
>>
>> I applied this patch to the GPIO tree, I guess it is the right thing
>> to do at this point.
>
> Umm, you can't really validly apply my merge fix patch to the gpio tree
> without merging in part of the tip tree (it will generate, at least,
> warnings in your build testing of your tree) ...

OK I take it out again...

>> I suspect the IRQ infrastructure will be pulled to Torvald's tree
>> first anyway.
>
> You just need to let Linus know that this update is require (maybe
> provide him with my merge fix patch) when you send your pull request.

OK I will try to do that.

Yours,
Linus Walleij
