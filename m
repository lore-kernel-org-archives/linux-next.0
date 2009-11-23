From: Randy Dunlap <randy.dunlap@oracle.com>
Subject: Re: linux-next: Tree for November 23
Date: Mon, 23 Nov 2009 11:15:10 -0800
Message-ID: <20091123111510.9b0c0714.randy.dunlap@oracle.com>
References: <20091123185232.1423c56b.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from acsinet12.oracle.com ([141.146.126.234]:56277 "EHLO
	acsinet12.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752758AbZKWTQf (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 23 Nov 2009 14:16:35 -0500
In-Reply-To: <20091123185232.1423c56b.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>, gregkh@suse.de, rusty@rustcorp.com.au
Cc: linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>

On Mon, 23 Nov 2009 18:52:32 +1100 Stephen Rothwell wrote:

> Hi all,
> 
> Changes since 20091120:


Hey rr,

This patch "param\:remove-useless-writable-charp.patch" has several typos
that cause build errors in drivers/staging/.  I sent patches for these errors
to gregkh but he couldn't apply them.  Please build STAGING (drivers/staging/)
crap along with other build testing when you make changes.


drivers/staging/rtl8187se/r8180_core.c:
+module_param_string(ifname, ifname, sizef(ifname), S_IRUGO|S_IWUSR);
                                     ^^^^^

drivers/staging/rtl8192e/r8192E_core.c:
+module_param_string(ifname, ifname, sizef(ifname), S_IRUGO|S_IWUSR);
                                     ^^^^^
and
+		strcpt(ifname, "wlan%d");
                ^^^^^^


Thanks.
---
~Randy
