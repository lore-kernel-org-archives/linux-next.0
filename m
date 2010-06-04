From: Randy Dunlap <randy.dunlap@oracle.com>
Subject: Re: linux-next: Tree for June 4 (kernel/module.c)
Date: Fri, 4 Jun 2010 09:54:45 -0700
Message-ID: <20100604095445.2169b9ed.randy.dunlap@oracle.com>
References: <20100604153006.fa15c770.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from rcsinet10.oracle.com ([148.87.113.121]:38104 "EHLO
	rcsinet10.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753381Ab0FDQzU (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Fri, 4 Jun 2010 12:55:20 -0400
In-Reply-To: <20100604153006.fa15c770.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>, Rusty Russell <rusty@rustcorp.com.au>
Cc: linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>

On Fri, 4 Jun 2010 15:30:06 +1000 Stephen Rothwell wrote:

> Hi all,
> 
> Changes since 20100603:
> 
> My fixes tree contains:
>       v4l-dvb: update gfp/slab.h includes
>       arm: update gfp/slab.h includes
>       davinci: update gfp/slab.h includes
>       ocfs2: update gfp/slab.h includes
>       acpi: update gfp/slab.h includes
> 
> The wireless tree gained a conflict against the net tree.
> 
> The rr tree gained a build failure for which I applied a patch.


when CONFIG_SYSFS is not enabled:

kernel/module.c:1526: error: implicit declaration of function 'module_remove_modinfo_attrs'

---
~Randy
*** Remember to use Documentation/SubmitChecklist when testing your code ***
