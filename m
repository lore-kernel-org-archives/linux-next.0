From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: linux-next: manual merge of the gpio tree with the xtensa tree
Date: Wed, 8 Jan 2014 09:02:27 +0100
Message-ID: <CACRpkdaGArKx2WXkxrakFQ4vaJtytsbSW8mpA+FdyJxEROURvg@mail.gmail.com>
References: <20140108151459.d4743129d9cae88865774073@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-oa0-f51.google.com ([209.85.219.51]:53579 "EHLO
	mail-oa0-f51.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755332AbaAHIC2 (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 8 Jan 2014 03:02:28 -0500
Received: by mail-oa0-f51.google.com with SMTP id m1so1420387oag.38
        for <linux-next@vger.kernel.org>; Wed, 08 Jan 2014 00:02:27 -0800 (PST)
In-Reply-To: <20140108151459.d4743129d9cae88865774073@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>, Chris Zankel <chris@zankel.net>, Max Filippov <jcmvbkbc@gmail.com>
Cc: "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Baruch Siach <baruch@tkos.co.il>

On Wed, Jan 8, 2014 at 5:14 AM, Stephen Rothwell <sfr@canb.auug.org.au> wrote:

> Hi Linus,
>
> Today's linux-next merge of the gpio tree got a conflict in
> arch/xtensa/Kconfig between commit dbacef090841 ("xtensa: add SMP
> support") from the xtensa tree and commit a1a2bdec4772 ("gpio: xtensa:
> depend on HAVE_XTENSA_GPIO32") from the gpio tree.

Looks correct, thanks!

Yours,
Linus Walleij
