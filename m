From: Randy Dunlap <randy.dunlap@oracle.com>
Subject: Re: linux-next: Tree for December 11 (x86/mm/mmio-mod)
Date: Fri, 11 Dec 2009 09:37:55 -0800
Message-ID: <20091211093755.5d7a273c.randy.dunlap@oracle.com>
References: <20091211160151.6b71078e.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from rcsinet12.oracle.com ([148.87.113.124]:41496 "EHLO
	rcsinet12.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755919AbZLKRiU (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Fri, 11 Dec 2009 12:38:20 -0500
In-Reply-To: <20091211160151.6b71078e.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>

On Fri, 11 Dec 2009 16:01:51 +1100 Stephen Rothwell wrote:

> Hi all,
> 
> My usual call for calm: please do not put stuff destined for 2.6.34 into
> linux-next trees until after 2.6.33-rc1.
> 
> Changes since 20091210:


arch/x86/mm/mmio-mod.c:100: warning: too many arguments for format
arch/x86/mm/mmio-mod.c:106: warning: too many arguments for format
arch/x86/mm/mmio-mod.c:110: warning: too many arguments for format
arch/x86/mm/mmio-mod.c:123: warning: too many arguments for format
arch/x86/mm/mmio-mod.c:129: warning: too many arguments for format
arch/x86/mm/mmio-mod.c:131: warning: too many arguments for format
arch/x86/mm/mmio-mod.c:286: warning: too many arguments for format
arch/x86/mm/mmio-mod.c:305: warning: too many arguments for format
arch/x86/mm/mmio-mod.c:367: warning: too many arguments for format
arch/x86/mm/mmio-mod.c:404: warning: too many arguments for format
arch/x86/mm/mmio-mod.c:406: warning: too many arguments for format
arch/x86/mm/mmio-mod.c:426: warning: too many arguments for format
arch/x86/mm/mmio-mod.c:428: warning: too many arguments for format


on both i386 and x86_64

---
~Randy
