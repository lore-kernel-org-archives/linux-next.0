From: Wim Van Sebroeck <wim@iguana.be>
Subject: Re: linux-next: build failure after merge of the final tree (watchdog tree related)
Date: Wed, 23 May 2012 18:48:35 +0200
Message-ID: <20120523164835.GL3074@spo001.leaseweb.com>
References: <20120523165548.8c706826ee94711bf3a913d8@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ns1.pc-advies.be ([83.149.101.17]:54089 "EHLO
	spo001.leaseweb.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
	with ESMTP id S1753818Ab2EWQsj (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 23 May 2012 12:48:39 -0400
Content-Disposition: inline
In-Reply-To: <20120523165548.8c706826ee94711bf3a913d8@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Alan Cox <alan@linux.intel.com>, Hans de Goede <hdegoede@redhat.com>

Hi Stephen,

> After merging the final tree, today's linux-next build (powerpc allyesconfig)
> failed like this:
> 
> drivers/watchdog/watchdog_core.c: In function 'watchdog_register_device':
> drivers/watchdog/watchdog_core.c:109:2: error: implicit declaration of function 'IS_ERR' [-Werror=implicit-function-declaration]
> drivers/watchdog/watchdog_core.c:112:3: error: implicit declaration of function 'PTR_ERR' [-Werror=implicit-function-declaration]
> 
> Caused by commit e3b97a7eb87d ("watchdog: create all the proper device
> files").

Fixed in the linux-watchdog-next tree now.

Thanks,
Wim.
