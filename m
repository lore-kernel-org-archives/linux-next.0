From: David Woodhouse <dwmw2@infradead.org>
Subject: Re: linux-next: firmware build failure
Date: Thu, 12 Jun 2008 09:54:10 +0100
Message-ID: <1213260850.26255.119.camel@pmac.infradead.org>
References: <20080612162817.c0a4e115.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([18.85.46.34]:57836 "EHLO
	bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753808AbYFLIyO (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 12 Jun 2008 04:54:14 -0400
In-Reply-To: <20080612162817.c0a4e115.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org

On Thu, 2008-06-12 at 16:28 +1000, Stephen Rothwell wrote:
> 
> 
> Today's linux-next build (x86_64 allmodconfig) failed like this:
> 
> drivers/char/ip2/ip2main.c: In function 'ip2_request_firmware':
> drivers/char/ip2/ip2main.c:483: error: implicit declaration of function 'platform_device_register_simple'
> drivers/char/ip2/ip2main.c:483: warning: assignment makes pointer from integer without a cast
> drivers/char/ip2/ip2main.c:486: error: dereferencing pointer to incomplete type
> drivers/char/ip2/ip2main.c:490: error: implicit declaration of function 'platform_device_unregister'
> 
> I applied the patch below.

Oops, sorry about that. We get <linux/platform_device.h> included for us
on PowerPC, it seems. Have fixed.

-- 
dwmw2

