From: Patrick McHardy <kaber@trash.net>
Subject: Re: linux-next: Tree for February 3 (netfilter)
Date: Wed, 09 Feb 2011 08:21:29 +0100
Message-ID: <4D524079.1000908@trash.net>
References: <20110203160034.44ae3247.sfr@canb.auug.org.au> <20110204111511.1f4d6706.randy.dunlap@oracle.com>
Mime-Version: 1.0
Content-Type: multipart/mixed;
 boundary="------------000406090609020601010303"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from stinky.trash.net ([213.144.137.162]:46021 "EHLO
	stinky.trash.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751162Ab1BIHVd (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 9 Feb 2011 02:21:33 -0500
In-Reply-To: <20110204111511.1f4d6706.randy.dunlap@oracle.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Randy Dunlap <randy.dunlap@oracle.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, netdev <netdev@vger.kernel.org>, linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, netfilter-devel@vger.kernel.org, Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>

This is a multi-part message in MIME format.
--------------000406090609020601010303
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Am 04.02.2011 20:15, schrieb Randy Dunlap:
> On Thu, 3 Feb 2011 16:00:34 +1100 Stephen Rothwell wrote:
> 
>> Hi all,
>>
>> Changes since 20110202:
> 
> When SYSCTL and PROC_FS and NETFILTER_NETLINK are not enabled:
> 
> net/built-in.o: In function `try_to_load_type':
> ip_set_core.c:(.text+0x3ab49): undefined reference to `nfnl_unlock'
> ip_set_core.c:(.text+0x3ab4e): undefined reference to `nfnl_lock'

Does this patch fix the problem?

--------------000406090609020601010303
Content-Type: text/plain;
 name="x"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="x"

diff --git a/net/netfilter/ipset/Kconfig b/net/netfilter/ipset/Kconfig
index 3b970d3..2c5b348 100644
--- a/net/netfilter/ipset/Kconfig
+++ b/net/netfilter/ipset/Kconfig
@@ -1,6 +1,7 @@
 menuconfig IP_SET
 	tristate "IP set support"
 	depends on INET && NETFILTER
+	depends on NETFILTER_NETLINK
 	help
 	  This option adds IP set support to the kernel.
 	  In order to define and use the sets, you need the userspace utility

--------------000406090609020601010303--
