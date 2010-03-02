From: Randy Dunlap <randy.dunlap@oracle.com>
Subject: Re: linux-next: Tree for March 2 (watchdog)
Date: Tue, 02 Mar 2010 09:12:33 -0800
Message-ID: <4B8D4701.6060903@oracle.com>
References: <20100302180915.1388d3f3.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from rcsinet11.oracle.com ([148.87.113.123]:20192 "EHLO
	rcsinet11.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751577Ab0CBRM5 (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 2 Mar 2010 12:12:57 -0500
In-Reply-To: <20100302180915.1388d3f3.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, Wim Van Sebroeck <wim@iguana.be>

On 03/01/10 23:09, Stephen Rothwell wrote:
> Hi all,
> 
> Changes since 20100301:


linux-next-20100302/drivers/watchdog/wdt.c: In function 'wdt_ioctl':
linux-next-20100302/drivers/watchdog/wdt.c:370: error: assignment of read-only variable 'ident'
linux-next-20100302/drivers/watchdog/wdt.c:373: error: assignment of read-only variable 'ident'
linux-next-20100302/drivers/watchdog/wdt.c:375: error: assignment of read-only variable 'ident'
make[3]: *** [drivers/watchdog/wdt.o] Error 1



-- 
~Randy
