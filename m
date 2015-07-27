From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] genirq: Export irq_{get,set}_irqchip_state()
Date: Mon, 27 Jul 2015 15:23:07 +0200
Message-ID: <CACRpkdYEFK9gJETzw+ygQVZU0Y6BQwgw-LNqd3sjuOcvAJrr9g@mail.gmail.com>
References: <20150722184015.GA11162@sirena.org.uk>
	<1437594184-22966-1-git-send-email-bjorn.andersson@sonymobile.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-oi0-f47.google.com ([209.85.218.47]:32976 "EHLO
	mail-oi0-f47.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751308AbbG0NXI (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 27 Jul 2015 09:23:08 -0400
Received: by oige126 with SMTP id e126so51213256oig.0
        for <linux-next@vger.kernel.org>; Mon, 27 Jul 2015 06:23:07 -0700 (PDT)
In-Reply-To: <1437594184-22966-1-git-send-email-bjorn.andersson@sonymobile.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Bjorn Andersson <bjorn.andersson@sonymobile.com>, Thomas Gleixner <tglx@linutronix.de>
Cc: Mark Brown <broonie@kernel.org>, Marc Zyngier <marc.zyngier@arm.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>, Kernel Build Reports Mailman List <kernel-build-reports@lists.linaro.org>, Linaro Kernel Mailman List <linaro-kernel@lists.linaro.org>, Srinivas Kandagatla <srinivas.kandagatla@linaro.org>

On Wed, Jul 22, 2015 at 9:43 PM, Bjorn Andersson
<bjorn.andersson@sonymobile.com> wrote:

> Export these functions to be able to build the Qualcomm family A PMIC
> gpio and mpp drivers as modules.
>
> Signed-off-by: Bjorn Andersson <bjorn.andersson@sonymobile.com>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

TGLX: please take this one, alternatively I can carry it with
your ACK.

Yours,
Linus Walleij
