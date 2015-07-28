From: Thomas Gleixner <tglx@linutronix.de>
Subject: Re: [PATCH] genirq: Export irq_{get,set}_irqchip_state()
Date: Tue, 28 Jul 2015 20:49:56 +0200 (CEST)
Message-ID: <alpine.DEB.2.11.1507282049430.3825@nanos>
References: <20150722184015.GA11162@sirena.org.uk> <1437594184-22966-1-git-send-email-bjorn.andersson@sonymobile.com> <CACRpkdYEFK9gJETzw+ygQVZU0Y6BQwgw-LNqd3sjuOcvAJrr9g@mail.gmail.com>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-next-owner@vger.kernel.org>
Received: from www.linutronix.de ([62.245.132.108]:36880 "EHLO
	Galois.linutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751355AbbG1SuR (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 28 Jul 2015 14:50:17 -0400
In-Reply-To: <CACRpkdYEFK9gJETzw+ygQVZU0Y6BQwgw-LNqd3sjuOcvAJrr9g@mail.gmail.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Bjorn Andersson <bjorn.andersson@sonymobile.com>, Mark Brown <broonie@kernel.org>, Marc Zyngier <marc.zyngier@arm.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>, Kernel Build Reports Mailman List <kernel-build-reports@lists.linaro.org>, Linaro Kernel Mailman List <linaro-kernel@lists.linaro.org>, Srinivas Kandagatla <srinivas.kandagatla@linaro.org>

On Mon, 27 Jul 2015, Linus Walleij wrote:

> On Wed, Jul 22, 2015 at 9:43 PM, Bjorn Andersson
> <bjorn.andersson@sonymobile.com> wrote:
> 
> > Export these functions to be able to build the Qualcomm family A PMIC
> > gpio and mpp drivers as modules.
> >
> > Signed-off-by: Bjorn Andersson <bjorn.andersson@sonymobile.com>
> 
> Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
> 
> TGLX: please take this one, alternatively I can carry it with
> your ACK.

It's queued already.
