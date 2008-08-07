From: Randy Dunlap <randy.dunlap@oracle.com>
Subject: Re: linux-next: Tree for August 6 (8390 et al)
Date: Wed, 6 Aug 2008 17:21:48 -0700
Message-ID: <20080806172148.7fac5999.randy.dunlap@oracle.com>
References: <20080806182828.6bfe0a16.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from rgminet01.oracle.com ([148.87.113.118]:53460 "EHLO
	rgminet01.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752931AbYHGAWB (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 6 Aug 2008 20:22:01 -0400
In-Reply-To: <20080806182828.6bfe0a16.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, netdev <netdev@vger.kernel.org>

One randconfig ends with:

drivers/built-in.o: In function `wd_probe1':
wd.c:(.init.text+0x6179): undefined reference to `NS8390p_init'
make[1]: *** [.tmp_vmlinux1] Error 1


and another one ends with:

ERROR: "ei_close" [drivers/net/hp-plus.ko] undefined!
ERROR: "ei_open" [drivers/net/hp-plus.ko] undefined!
ERROR: "ei_interrupt" [drivers/net/hp-plus.ko] undefined!
ERROR: "__alloc_ei_netdev" [drivers/net/hp-plus.ko] undefined!
make[2]: *** [__modpost] Error 1



---
~Randy
Linux Plumbers Conference, 17-19 September 2008, Portland, Oregon USA
http://linuxplumbersconf.org/
