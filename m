From: Randy Dunlap <randy.dunlap@oracle.com>
Subject: Re: linux-next: net tree build failure (depca)
Date: Sat, 13 Sep 2008 08:04:38 -0700
Message-ID: <20080913080438.30a37469.randy.dunlap@oracle.com>
References: <20080913150326.245fbb6f.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from rgminet01.oracle.com ([148.87.113.118]:30968 "EHLO
	rgminet01.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750886AbYIMPGb (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Sat, 13 Sep 2008 11:06:31 -0400
In-Reply-To: <20080913150326.245fbb6f.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: David Miller <davem@davemloft.net>, linux-next@vger.kernel.org, Julius Volz <juliusv@google.com>, Simon Horman <horms@verge.net.au>


Also this one on i386:

drivers/net/depca.c:404: error: implicit declaration of function 'depca_common_remove'
drivers/net/depca.c:1602: error: static declaration of 'depca_common_remove' follows non-static declaration
drivers/net/depca.c:404: error: previous implicit declaration of 'depca_common_remove' was here
make[2]: *** [drivers/net/depca.o] Error 1



---
~Randy
Linux Plumbers Conference, 17-19 September 2008, Portland, Oregon USA
http://linuxplumbersconf.org/
