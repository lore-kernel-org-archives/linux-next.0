From: Randy Dunlap <randy.dunlap@oracle.com>
Subject: Re: linux-next: Tree for June 30 (power: PM_SLEEP not enabled)
Date: Wed, 30 Jun 2010 09:24:42 -0700
Message-ID: <20100630092442.fe91ea2f.randy.dunlap@oracle.com>
References: <20100630154401.88c9aad1.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from rcsinet10.oracle.com ([148.87.113.121]:62899 "EHLO
	rcsinet10.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752348Ab0F3QZj (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 30 Jun 2010 12:25:39 -0400
In-Reply-To: <20100630154401.88c9aad1.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>

On Wed, 30 Jun 2010 15:44:01 +1000 Stephen Rothwell wrote:

> Hi all,
> 
> Changes since 20100629:
> 
> The device-mapper tree gained a build failure for which I applied a merge
> fix patch.
> 
> The spi tree lost its build failure.
> 
> ----------------------------------------------------------------------------


when CONFIG_PM_SLEEP is not enabled:

kernel/power/main.c:241: error: implicit declaration of function 'pm_get_wakeup_count'
kernel/power/main.c:251: error: implicit declaration of function 'pm_save_wakeup_count'
drivers/base/power/sysfs.c:152: error: 'struct dev_pm_info' has no member named 'wakeup_count'


---
~Randy
*** Remember to use Documentation/SubmitChecklist when testing your code ***
