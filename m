From: Randy Dunlap <randy.dunlap@oracle.com>
Subject: Re: linux-next: Tree for November 19 (sched_fair)
Date: Fri, 19 Nov 2010 09:15:50 -0800
Message-ID: <20101119091550.83c8149a.randy.dunlap@oracle.com>
References: <20101119143207.b2d5731e.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from rcsinet10.oracle.com ([148.87.113.121]:38592 "EHLO
	rcsinet10.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755309Ab0KSRRh (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Fri, 19 Nov 2010 12:17:37 -0500
In-Reply-To: <20101119143207.b2d5731e.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>

On Fri, 19 Nov 2010 14:32:07 +1100 Stephen Rothwell wrote:

> Hi all,
> 
> Changes since 20101118:


when CONFIG_SMP is not enabled:

kernel/sched_fair.c:566: error: 'struct cfs_rq' has no member named 'load_unacc_exec_time'
kernel/sched_fair.c:567: error: 'struct cfs_rq' has no member named 'load_unacc_exec_time'

---
~Randy
*** Remember to use Documentation/SubmitChecklist when testing your code ***
