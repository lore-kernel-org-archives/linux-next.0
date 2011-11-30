From: Andrew Morton <akpm@linux-foundation.org>
Subject: Re: linux-next: build failure after merge of the final tree (akpm
 tree related)
Date: Tue, 29 Nov 2011 21:16:30 -0800
Message-ID: <20111129211630.de8c0646.akpm@linux-foundation.org>
References: <20111130154231.42db05b2eb2baa11f3e7c561@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail.linuxfoundation.org ([140.211.169.12]:43656 "EHLO
	mail.linuxfoundation.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751718Ab1K3FP0 (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 30 Nov 2011 00:15:26 -0500
In-Reply-To: <20111130154231.42db05b2eb2baa11f3e7c561@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, David Rientjes <rientjes@google.com>

On Wed, 30 Nov 2011 15:42:31 +1100 Stephen Rothwell <sfr@canb.auug.org.au> wrote:

> Hi Andrew,
> 
> After merging the final tree, today's linux-next build (i386 defconfig)
> failed like this:
> 
> kernel/cpuset.c: In function 'cpuset_change_task_nodemask':
> kernel/cpuset.c:971:17: error: 'struct task_struct' has no member named 'mempolicy'
> 
> Caused by commit abf5d6d23d83 ("cpusets: stall when updating mems_allowed
> for mempolicy or disjoint nodemask") from the akpm tree.  The mempolicy
> member is only available when CONFIG_NUMA is set.
> 

This obviously can be hacked around, but one wonders whether we really
need to include things like cpuset_change_task_nodemask() in a
CONFIG_NUMA=n vmlinux?
