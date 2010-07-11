From: Randy Dunlap <randy.dunlap@oracle.com>
Subject: Re: linux-next: Tree for July 9 (staging/ti_st)
Date: Sun, 11 Jul 2010 15:33:16 -0700
Message-ID: <20100711153316.8f54c297.randy.dunlap@oracle.com>
References: <20100709150117.51612026.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from rcsinet10.oracle.com ([148.87.113.121]:53827 "EHLO
	rcsinet10.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755414Ab0GKWfI (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Sun, 11 Jul 2010 18:35:08 -0400
In-Reply-To: <20100709150117.51612026.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>, gregkh@suse.de
Cc: linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>

On Fri, 9 Jul 2010 15:01:17 +1000 Stephen Rothwell wrote:

> Hi all,
> 
> Changes since 20100708:
> 
> The infiniband tree gained a build failure so I used the version from
> next-20100708.
> 
> The wireless tree gained a conflict against the net tree.
> 
> The block tree gained a build failure for which I applied a patch.
> 
> The tty tree gained a conflict against the genesis tree.


Can't find this function in the linux-next source tree:

ERROR: "st_get_plat_device" [drivers/staging/ti-st/st_drv.ko] undefined!

---
~Randy
*** Remember to use Documentation/SubmitChecklist when testing your code ***
