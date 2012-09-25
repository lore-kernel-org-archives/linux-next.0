From: David Miller <davem@davemloft.net>
Subject: Re: [PATCH] ipconfig: fix trivial build error
Date: Tue, 25 Sep 2012 13:23:17 -0400 (EDT)
Message-ID: <20120925.132317.2132522444026609326.davem@davemloft.net>
References: <1348255713.12456.43.camel@mars>
	<1348560598-21233-1-git-send-email-andriy.shevchenko@linux.intel.com>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from shards.monkeyblade.net ([149.20.54.216]:35483 "EHLO
	shards.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1757247Ab2IYRXT (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 25 Sep 2012 13:23:19 -0400
In-Reply-To: <1348560598-21233-1-git-send-email-andriy.shevchenko@linux.intel.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: andriy.shevchenko@linux.intel.com
Cc: netdev@vger.kernel.org, linux-next@vger.kernel.org, chf.fritz@googlemail.com

From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Date: Tue, 25 Sep 2012 11:09:58 +0300

> The commit 5e953778a2aab04929a5e7b69f53dc26e39b079e ("ipconfig: add nameserver
> IPs to kernel-parameter ip=") introduces ic_nameservers_predef() that defined
> only for BOOTP. However it is used by ip_auto_config_setup() as well. This
> patch moves it outside of #ifdef BOOTP.
> 
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Applied, thanks.
