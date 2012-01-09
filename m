From: David Miller <davem@davemloft.net>
Subject: Re: linux-next: build failure after merge of the final tree (net
 tree related)
Date: Sun, 08 Jan 2012 22:52:25 -0800 (PST)
Message-ID: <20120108.225225.1735038078666958154.davem@davemloft.net>
References: <20120109163812.4cb695944ea9716953afbfc9@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from shards.monkeyblade.net ([198.137.202.13]:58200 "EHLO
	shards.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751466Ab2AIGyg (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 9 Jan 2012 01:54:36 -0500
In-Reply-To: <20120109163812.4cb695944ea9716953afbfc9@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: sfr@canb.auug.org.au
Cc: netdev@vger.kernel.org, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, glommer@parallels.com

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Mon, 9 Jan 2012 16:38:12 +1100

> I applied the following patch for today:
> 
> From: Stephen Rothwell <sfr@canb.auug.org.au>
> Date: Mon, 9 Jan 2012 16:33:16 +1100
> Subject: [PATCH] net: sk_update_clone is only used in net/core/sock.c
> 
> so move it there.  Fixes build errors when CONFIG_INET is not defeined:
> 
> In file included from include/linux/tcp.h:211:0,
>                  from include/linux/ipv6.h:221,
>                  from include/net/ipv6.h:16,
>                  from include/linux/sunrpc/clnt.h:26,
>                  from include/linux/nfs_fs.h:50,
>                  from init/do_mounts.c:20:
> include/net/sock.h: In function 'sk_update_clone':
> include/net/sock.h:1109:3: error: implicit declaration of function 'sock_update_memcg' [-Werror=implicit-function-declaration]
> 
> Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>

Applied, thanks Stephen.
