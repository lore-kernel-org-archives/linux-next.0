From: Randy Dunlap <randy.dunlap@oracle.com>
Subject: Re: linux-next: Tree for May 26 (drivers/base/node.c)
Date: Thu, 26 May 2011 12:01:21 -0700
Message-ID: <20110526120121.db0506de.randy.dunlap@oracle.com>
References: <20110526163941.7dfcad1a.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from rcsinet10.oracle.com ([148.87.113.121]:57536 "EHLO
	rcsinet10.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932472Ab1EZTBi (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 26 May 2011 15:01:38 -0400
In-Reply-To: <20110526163941.7dfcad1a.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>, gregkh <greg@kroah.com>
Cc: linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>

On Thu, 26 May 2011 16:39:41 +1000 Stephen Rothwell wrote:

> Hi all,
> 
> [The kernel.org mirroring is being slow today]


when CONFIG_PROC_FS is not enabled:

drivers/built-in.o: In function `node_read_vmstat':
node.c:(.text+0x56ffa): undefined reference to `vmstat_text'

---
~Randy
*** Remember to use Documentation/SubmitChecklist when testing your code ***
