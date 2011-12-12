From: Sjur BRENDELAND <sjur.brandeland@stericsson.com>
Subject: RE: [PATCH -next] xshm: fix build errors, depends on NET
Date: Mon, 12 Dec 2011 08:52:43 +0100
Message-ID: <81C3A93C17462B4BBD7E272753C105791FB0D6B96F@EXDCVYMBSTM005.EQ1STM.local>
References: <20111209163247.1de15dcb5b735ca5e1ad030b@canb.auug.org.au>
 <4EE289FE.90006@xenotime.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-next-owner@vger.kernel.org>
Received: from eu1sys200aog117.obsmtp.com ([207.126.144.143]:48402 "EHLO
	eu1sys200aog117.obsmtp.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1751259Ab1LLHxM convert rfc822-to-8bit
	(ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 12 Dec 2011 02:53:12 -0500
In-Reply-To: <4EE289FE.90006@xenotime.net>
Content-Language: en-US
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Randy Dunlap <rdunlap@xenotime.net>, Stephen Rothwell <sfr@canb.auug.org.au>
Cc: "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>

>From: Randy Dunlap <rdunlap@xenotime.net>
>
>Fix build errors in xshm.  xshm uses netlink, so it
>should depend on NET.
>
>ERROR: "genl_unregister_family" [drivers/xshm/xshm.ko] undefined!
>ERROR: "netlink_unicast" [drivers/xshm/xshm.ko] undefined!
>ERROR: "genl_register_family_with_ops" [drivers/xshm/xshm.ko] undefine=
d!
>ERROR: "init_net" [drivers/xshm/xshm.ko] undefined!
>ERROR: "__alloc_skb" [drivers/xshm/xshm.ko] undefined!
>ERROR: "kfree_skb" [drivers/xshm/xshm.ko] undefined!
>ERROR: "skb_put" [drivers/xshm/xshm.ko] undefined!

Thank you Randy,
Acked-by: Sjur Br=E6ndeland <sjur.brandeland@stericsson.com>

>Signed-off-by: Randy Dunlap <rdunlap@xenotime.net>
>Cc: Sjur Brendeland <sjur.brandeland@stericsson.com>
