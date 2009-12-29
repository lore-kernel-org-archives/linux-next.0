From: Randy Dunlap <randy.dunlap@oracle.com>
Subject: Re: linux-next: Tree for December 29 (staging/winbond)
Date: Tue, 29 Dec 2009 11:50:20 -0800
Message-ID: <20091229115020.b20adfdb.randy.dunlap@oracle.com>
References: <20091229112810.24b461c2.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from rcsinet12.oracle.com ([148.87.113.124]:18089 "EHLO
	rcsinet12.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751906AbZL2UWl (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 29 Dec 2009 15:22:41 -0500
In-Reply-To: <20091229112810.24b461c2.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>, gregkh@suse.de
Cc: linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>

On Tue, 29 Dec 2009 11:28:10 +1100 Stephen Rothwell wrote:

> Hi all,
> 
> This one has also not had the build testing *between* merges, but has had
> all the normal build testing at the end.There may be more unbisectable
> points in the tree then usual.
> 
> Changes since 20091228:
> 
> My fixes tree contains this origin tree build fix:
> 
> 	kfifo: include linux/fifo.h in libsrp.h for definition of stuct kfifo
> 
> The net tree gained a conflict against the wireless-current tree.


drivers/staging/winbond/wbusb.c:68: warning: 'struct ieee80211_if_init_conf' declared inside parameter list
drivers/staging/winbond/wbusb.c:68: warning: its scope is only this definition or declaration, which is probably not what you want
drivers/staging/winbond/wbusb.c:72: error: dereferencing pointer to incomplete type
drivers/staging/winbond/wbusb.c:78: warning: 'struct ieee80211_if_init_conf' declared inside parameter list

I can't find this struct in the kernel tree.

---
~Randy
