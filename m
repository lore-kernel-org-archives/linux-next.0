From: Randy Dunlap <rdunlap@xenotime.net>
Subject: Re: linux-next: Tree for Nov 28 (netlabel)
Date: Mon, 28 Nov 2011 10:16:23 -0800
Message-ID: <4ED3CFF7.9090502@xenotime.net>
References: <20111128162556.47758629406b638a99428049@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from oproxy4-pub.bluehost.com ([69.89.21.11]:45608 "HELO
	oproxy4-pub.bluehost.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with SMTP id S1753680Ab1K1RR4 (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 28 Nov 2011 12:17:56 -0500
In-Reply-To: <20111128162556.47758629406b638a99428049@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, Netdev <netdev@vger.kernel.org>, Paul Moore <paul@paul-moore.com>

On 11/27/2011 09:25 PM, Stephen Rothwell wrote:
> Hi all,
> 
> Changes since 20111125:

When IPV6 is not enabled:

net/netlabel/netlabel_kapi.c: In function 'netlbl_cfg_unlbl_map_add':
net/netlabel/netlabel_kapi.c:165:4: error: implicit declaration of function 'netlbl_af6list_add'


-- 
~Randy
*** Remember to use Documentation/SubmitChecklist when testing your code ***
