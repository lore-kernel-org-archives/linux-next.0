From: Randy Dunlap <randy.dunlap@oracle.com>
Subject: Re: linux-next: Tree for May 16 (net/ipv4/ping)
Date: Mon, 16 May 2011 12:35:34 -0700
Message-ID: <20110516123534.5d3a51b9.randy.dunlap@oracle.com>
References: <20110516151019.be338f1c.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from rcsinet10.oracle.com ([148.87.113.121]:23472 "EHLO
	rcsinet10.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751668Ab1EPTfu (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 16 May 2011 15:35:50 -0400
In-Reply-To: <20110516151019.be338f1c.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>, netdev <netdev@vger.kernel.org>
Cc: linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>

On Mon, 16 May 2011 15:10:19 +1000 Stephen Rothwell wrote:

> Hi all,
> 
> Changes since 20110513:


when CONFIG_PROC_SYSCTL is not enabled:

ping.c:(.text+0x52af3): undefined reference to `inet_get_ping_group_range_net'

---
~Randy
*** Remember to use Documentation/SubmitChecklist when testing your code ***
