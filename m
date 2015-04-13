From: Stefan Agner <stefan@agner.ch>
Subject: Re: linux-next: build failure after merge of the irqchip tree
Date: Mon, 13 Apr 2015 11:10:21 +0200
Message-ID: <cc1a0f51a126557cd55f0f03d96bec25@agner.ch>
References: <20150413170539.2f20e0a8@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail.kmu-office.ch ([178.209.48.109]:38683 "EHLO
	mail.kmu-office.ch" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753429AbbDMJLT (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 13 Apr 2015 05:11:19 -0400
In-Reply-To: <20150413170539.2f20e0a8@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Jason Cooper <jason@lakedaemon.net>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Stephen Rothwell <sfr@canb.auug.org.au>

Hi Jason,

On 2015-04-13 09:05, Stephen Rothwell wrote:
> Hi Jason,
> 
> After merging the irqchip tree, today's linux-next build (x86_64
> allmodconfig) failed like this:
> 
> kernel/irq/generic-chip.c: In function 'irq_map_generic_chip':
> kernel/irq/generic-chip.c:408:2: error: implicit declaration of
> function 'irq_domain_set_info' [-Werror=implicit-function-declaration]
>   irq_domain_set_info(d, virq, hw_irq, chip, gc, ct->handler, NULL, NULL);
>   ^

Hm, sorry about that, I did not notice that this function is only
available with domain hierarchy. I guess making domain hierarchy a
dependency of genirq is a bit harsh...

--
Stefan

> 
> Caused by commit 3f6b2c298240 ("genirq: Generic chip: Support hierarchy
> domain").  The only declaration of irq_domain_set_info() depends on
> CONFIG_IRQ_DOMAIN_HIERARCHY.
> 
> I have used the irqchip tree from next-20150410 fot today.
