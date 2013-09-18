From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: linux-next: build failure after merge of the gpio tree
Date: Wed, 18 Sep 2013 13:24:36 +0200
Message-ID: <CACRpkdY3Ox8fZPph-je5OvL9YFD1O2WVt6Ga-_UoAqokRdRiRA@mail.gmail.com>
References: <20130918131237.b8272e45ec6c4ebf360cb4e5@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-ob0-f182.google.com ([209.85.214.182]:47729 "EHLO
	mail-ob0-f182.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751904Ab3IRLYh (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 18 Sep 2013 07:24:37 -0400
Received: by mail-ob0-f182.google.com with SMTP id wo20so7407376obc.27
        for <linux-next@vger.kernel.org>; Wed, 18 Sep 2013 04:24:36 -0700 (PDT)
In-Reply-To: <20130918131237.b8272e45ec6c4ebf360cb4e5@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, George Cherian <george.cherian@ti.com>

On Wed, Sep 18, 2013 at 5:12 AM, Stephen Rothwell <sfr@canb.auug.org.au> wrote:

> After merging the gpio tree, today's linux-next build (x86_64
> allmodconfig) failed like this:
>
> drivers/gpio/gpio-pcf857x.c: In function 'pcf857x_irq_domain_map':
> drivers/gpio/gpio-pcf857x.c:206:2: error: implicit declaration of function 'set_irq_flags' [-Werror=implicit-function-declaration]
>   set_irq_flags(virq, IRQF_VALID);
>   ^

How typical to miss this. OK I've submitted a fix and pushed
to my tree.

Yours,
Linus Walleij
