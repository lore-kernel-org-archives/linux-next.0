From: Randy Dunlap <randy.dunlap@oracle.com>
Subject: Re: [PATCH] add reverse dependency of CONFIG_SGI_XP upon
 CONFIG_SGI_GRU
Date: Fri, 1 Aug 2008 10:50:28 -0700
Message-ID: <20080801105028.3411f703.randy.dunlap@oracle.com>
References: <20080731175854.09ea35c8.sfr@canb.auug.org.au>
	<20080731223758.b5985dd7.randy.dunlap@oracle.com>
	<20080801145526.GA29354@sgi.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from rgminet01.oracle.com ([148.87.113.118]:10531 "EHLO
	rgminet01.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751361AbYHAR43 (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Fri, 1 Aug 2008 13:56:29 -0400
In-Reply-To: <20080801145526.GA29354@sgi.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Dean Nelson <dcn@sgi.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Stephen Rothwell <sfr@canb.auug.org.au>, Jack Steiner <steiner@sgi.com>, linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>

On Fri, 1 Aug 2008 09:55:26 -0500 Dean Nelson wrote:

> Add a reverse dependency of CONFIG_SGI_XP upon CONFIG_SGI_GRU to Kconfig.
> 
> Signed-off-by: Dean Nelson <dcn@sgi.com>

Yes, this helps, but there is another problem.  When CONFIG_NET=n, these
build errors happen:

drivers/built-in.o: In function `xpnet_connection_activity':
xpnet.c:(.text+0x114442): undefined reference to `netif_carrier_on'
xpnet.c:(.text+0x114458): undefined reference to `dev_alloc_skb'
xpnet.c:(.text+0x1144b0): undefined reference to `skb_put'
xpnet.c:(.text+0x11451b): undefined reference to `eth_type_trans'
xpnet.c:(.text+0x11455f): undefined reference to `netif_rx_ni'
xpnet.c:(.text+0x11457f): undefined reference to `netif_carrier_off'
drivers/built-in.o: In function `xpnet_send_completed':
xpnet.c:(.text+0x114614): undefined reference to `dev_kfree_skb_any'
drivers/built-in.o: In function `xpnet_dev_hard_start_xmit':
xpnet.c:(.text+0x1147c4): undefined reference to `kfree_skb'
xpnet.c:(.text+0x114871): undefined reference to `kfree_skb'
drivers/built-in.o: In function `xpnet_init':
xpnet.c:(.init.text+0xa818): undefined reference to `ether_setup'
xpnet.c:(.init.text+0xa829): undefined reference to `alloc_netdev_mq'
xpnet.c:(.init.text+0xa841): undefined reference to `netif_carrier_off'
xpnet.c:(.init.text+0xa930): undefined reference to `register_netdev'
xpnet.c:(.init.text+0xa946): undefined reference to `free_netdev'
drivers/built-in.o: In function `xpnet_exit':
xpnet.c:(.exit.text+0xcbd): undefined reference to `unregister_netdev'
xpnet.c:(.exit.text+0xcc9): undefined reference to `free_netdev'
make[1]: *** [.tmp_vmlinux1] Error 1


> ---
> 
>  drivers/misc/Kconfig |    1 +
>  1 file changed, 1 insertion(+)
> 
> Index: linux/drivers/misc/Kconfig
> ===================================================================
> --- linux.orig/drivers/misc/Kconfig	2008-07-31 12:34:08.000000000 -0500
> +++ linux/drivers/misc/Kconfig	2008-08-01 09:16:53.000000000 -0500
> @@ -429,6 +429,7 @@ config SGI_XP
>  	depends on IA64_GENERIC || IA64_SGI_SN2 || IA64_SGI_UV || (X86_64 && SMP)
>  	select IA64_UNCACHED_ALLOCATOR if IA64_GENERIC || IA64_SGI_SN2
>  	select GENERIC_ALLOCATOR if IA64_GENERIC || IA64_SGI_SN2
> +	select SGI_GRU if IA64_GENERIC || IA64_SGI_UV || (X86_64 && SMP)
>  	---help---
>  	  An SGI machine can be divided into multiple Single System
>  	  Images which act independently of each other and have


---
~Randy
Linux Plumbers Conference, 17-19 September 2008, Portland, Oregon USA
http://linuxplumbersconf.org/
