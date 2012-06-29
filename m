From: Samuel Ortiz <sameo@linux.intel.com>
Subject: Re: [PATCH v2] MFD: twl6040: Update Kconfig to avoid build breakage
Date: Fri, 29 Jun 2012 18:30:24 +0200
Message-ID: <20120629163024.GU22806@sortiz-mobl>
References: <1339145661-25333-1-git-send-email-peter.ujfalusi@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mga14.intel.com ([143.182.124.37]:39444 "EHLO mga14.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1756180Ab2F2QTT (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Fri, 29 Jun 2012 12:19:19 -0400
Content-Disposition: inline
In-Reply-To: <1339145661-25333-1-git-send-email-peter.ujfalusi@ti.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Peter Ujfalusi <peter.ujfalusi@ti.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-kernel@vger.kernel.org, linux-next@vger.kernel.org, t-kristo@ti.com, Randy Dunlap <rdunlap@xenotime.net>

Hi Peter,

On Fri, Jun 08, 2012 at 11:54:21AM +0300, Peter Ujfalusi wrote:
> twl6040 needs CONFIG_IRQ_DOMAIN to compile, without this we have:
> drivers/mfd/twl6040-irq.c: In function 'twl6040_irq_init':
> drivers/mfd/twl6040-irq.c:164:2: error: implicit declaration of function 'irq_domain_add_legacy'
> drivers/mfd/twl6040-irq.c:165:11: error: 'irq_domain_simple_ops' undeclared (first use in this function)
> drivers/mfd/twl6040-irq.c:165:11: note: each undeclared identifier is reported only once for each function it appears in
> 
> Reported-by: Randy Dunlap <rdunlap@xenotime.net>
> Signed-off-by: Peter Ujfalusi <peter.ujfalusi@ti.com>
> ---
>  drivers/mfd/Kconfig |    1 +
>  1 files changed, 1 insertions(+), 0 deletions(-)
Patch applied to my for-linus branch, sorry for the delay.

Cheers,
Samuel.

-- 
Intel Open Source Technology Centre
http://oss.intel.com/
