From: Randy Dunlap <rdunlap@infradead.org>
Subject: Re: linux-next: Tree for Mar 4 (platform/chrome)
Date: Wed, 04 Mar 2015 11:06:12 -0800
Message-ID: <54F757A4.4080700@infradead.org>
References: <20150304150341.2afe09fe@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from casper.infradead.org ([85.118.1.10]:34513 "EHLO
	casper.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1757967AbbCDTGR (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 4 Mar 2015 14:06:17 -0500
In-Reply-To: <20150304150341.2afe09fe@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, Olof Johansson <olof@lixom.net>

On 03/03/15 20:03, Stephen Rothwell wrote:
> Hi all,
> 
> Changes since 20150303:
> 

on i386 or x86_64:

  CC      drivers/platform/chrome/cros_ec_lpc.o
../drivers/platform/chrome/cros_ec_lpc.c: In function 'ec_response_timed_out':
../drivers/platform/chrome/cros_ec_lpc.c:40:3: error: implicit declaration of function 'inb' [-Werror=implicit-function-declaration]
   if (!(inb(EC_LPC_ADDR_HOST_CMD) & EC_LPC_STATUS_BUSY_MASK))
   ^
../drivers/platform/chrome/cros_ec_lpc.c: In function 'cros_ec_cmd_xfer_lpc':
../drivers/platform/chrome/cros_ec_lpc.c:75:3: error: implicit declaration of function 'outb' [-Werror=implicit-function-declaration]
   outb(msg->outdata[i], EC_LPC_ADDR_HOST_PARAM + i);
   ^



-- 
~Randy
