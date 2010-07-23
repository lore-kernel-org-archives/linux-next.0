From: Randy Dunlap <randy.dunlap@oracle.com>
Subject: Re: linux-next: Tree for July 23 (fscache)
Date: Fri, 23 Jul 2010 09:08:31 -0700
Message-ID: <20100723090831.6af4a288.randy.dunlap@oracle.com>
References: <20100723164931.7bf2160f.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from rcsinet10.oracle.com ([148.87.113.121]:40482 "EHLO
	rcsinet10.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1759778Ab0GWQLU (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Fri, 23 Jul 2010 12:11:20 -0400
In-Reply-To: <20100723164931.7bf2160f.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>, tj@kernel.org
Cc: linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>

On Fri, 23 Jul 2010 16:49:31 +1000 Stephen Rothwell wrote:

> Hi all,
> 
> Changes since 20100722:


when CONFIG_SYSCTL is not enabled:

fs/fscache/main.c:189: error: 'fscache_sysctl_header' undeclared (first use in this function)


---
~Randy
*** Remember to use Documentation/SubmitChecklist when testing your code ***
