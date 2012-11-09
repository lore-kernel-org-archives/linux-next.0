From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: linux-next: manual merge of the arm-soc tree with the pinctrl tree
Date: Fri, 9 Nov 2012 11:10:53 +0100
Message-ID: <CACRpkdavH0hOWtC=T5iKLQ-BJ6h5CzROcYkZ7=nhHSR4hT6hpQ@mail.gmail.com>
References: <20121109133111.1070c1062889461152713978@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-ee0-f46.google.com ([74.125.83.46]:55869 "EHLO
	mail-ee0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751595Ab2KIKKy (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Fri, 9 Nov 2012 05:10:54 -0500
Received: by mail-ee0-f46.google.com with SMTP id b15so2055293eek.19
        for <linux-next@vger.kernel.org>; Fri, 09 Nov 2012 02:10:53 -0800 (PST)
In-Reply-To: <20121109133111.1070c1062889461152713978@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Olof Johansson <olof@lixom.net>, Arnd Bergmann <arnd@arndb.de>, linux-arm-kernel@lists.infradead.org, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Jonas Aaberg <jonas.aberg@stericsson.com>

On Fri, Nov 9, 2012 at 3:31 AM, Stephen Rothwell <sfr@canb.auug.org.au> wrote:

> Today's linux-next merge of the arm-soc tree got a conflict in
> drivers/pinctrl/pinctrl-nomadik.c between commit 241e51ebd3b2
> ("pinctrl/nomadik: make independent of prcmu driver") from the pinctrl
> tree and commit 44e47ccf8ab6 ("Merge branch 'next/multiplatform' into
> for-next") from the arm-soc tree.
>
> I fixed it up (see below) and can carry the fix as necessary (no action
> is required).

This looks like the correct fix, thanks a lot Stephen!

Yours,
Linus Walleij
