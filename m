From: Randy Dunlap <randy.dunlap@oracle.com>
Subject: Re: linux-next: Tree for September 24 (block/blk-throttle)
Date: Fri, 24 Sep 2010 08:54:00 -0700
Message-ID: <20100924085400.eb4f0ac4.randy.dunlap@oracle.com>
References: <20100924145537.bd092bfb.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from rcsinet10.oracle.com ([148.87.113.121]:56276 "EHLO
	rcsinet10.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756032Ab0IXPzB (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Fri, 24 Sep 2010 11:55:01 -0400
In-Reply-To: <20100924145537.bd092bfb.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>

On Fri, 24 Sep 2010 14:55:37 +1000 Stephen Rothwell wrote:

> Hi all,
> 
> Changes since 20100923:


on i386:

blk-throttle.c:(.text+0x1abb8): undefined reference to `__udivdi3'
blk-throttle.c:(.text+0x1b1dc): undefined reference to `__udivdi3'

---
~Randy
*** Remember to use Documentation/SubmitChecklist when testing your code ***
