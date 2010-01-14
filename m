From: Randy Dunlap <randy.dunlap@oracle.com>
Subject: Re: linux-next: Tree for January 14 (vmwgfx)
Date: Thu, 14 Jan 2010 10:58:40 -0800
Message-ID: <20100114105840.98972cbc.randy.dunlap@oracle.com>
References: <20100114172047.406ebda8.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from acsinet12.oracle.com ([141.146.126.234]:18026 "EHLO
	acsinet12.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1757229Ab0ANS66 (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 14 Jan 2010 13:58:58 -0500
In-Reply-To: <20100114172047.406ebda8.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>

On Thu, 14 Jan 2010 17:20:47 +1100 Stephen Rothwell wrote:

> Hi all,
> 
> Changes since 20100113:


When CONFIG_FB=m:

drivers/built-in.o: In function `vmw_fb_close':
(.text+0x9614a): undefined reference to `unregister_framebuffer'
drivers/built-in.o: In function `vmw_fb_close':
(.text+0x9616f): undefined reference to `framebuffer_release'
drivers/built-in.o: In function `vmw_fb_init':
(.text+0x965b6): undefined reference to `framebuffer_alloc'
drivers/built-in.o: In function `vmw_fb_init':
(.text+0x9692a): undefined reference to `register_framebuffer'
drivers/built-in.o: In function `vmw_fb_init':
(.text+0x9696a): undefined reference to `framebuffer_release'


so this driver needs to depend on FB (or select FB -- ugh, although
that's what nouveau does).

And these selects don't do anything when FB is not enabled:
	select FB_DEFERRED_IO
	select FB_CFB_FILLRECT
	select FB_CFB_COPYAREA
	select FB_CFB_IMAGEBLIT


---
~Randy
