From: Randy Dunlap <rdunlap@infradead.org>
Subject: Re: linux-next: Tree for Mar 6 (mfd/tps65218)
Date: Thu, 06 Mar 2014 09:39:01 -0800
Message-ID: <5318B2B5.4030609@infradead.org>
References: <20140306194821.3715d0b6212cc10415374a68@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from merlin.infradead.org ([205.233.59.134]:33186 "EHLO
	merlin.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751673AbaCFRjE (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 6 Mar 2014 12:39:04 -0500
In-Reply-To: <20140306194821.3715d0b6212cc10415374a68@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, J Keerthy <j-keerthy@ti.com>, Samuel Ortiz <sameo@linux.intel.com>, lee.jones@linaro.org

On 03/06/2014 12:48 AM, Stephen Rothwell wrote:
> Hi all,
> 
> There may be build failures in this tree due to the percpu changes in the
> akpm tree.
> 
> This tree fails (more than usual) the powerpc allyesconfig build.
> 
> Changes since 20140305:
> 

In linux-next-20140305 and -20140306:

ERROR: "regmap_del_irq_chip" [drivers/mfd/tps65218.ko] undefined!

when CONFIG_REGMAP_IRQ is not enabled.


Driver's kconfig needs to select REGMAP_IRQ ?


-- 
~Randy
