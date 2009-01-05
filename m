From: Randy Dunlap <randy.dunlap@oracle.com>
Subject: Re: linux-next: Tree for January 5 (dm-target)
Date: Mon, 5 Jan 2009 09:45:37 -0800
Message-ID: <20090105094537.0718183d.randy.dunlap@oracle.com>
References: <20090105173517.deeff918.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from rcsinet12.oracle.com ([148.87.113.124]:26051 "EHLO
	rgminet12.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752436AbZAERqJ (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 5 Jan 2009 12:46:09 -0500
In-Reply-To: <20090105173517.deeff918.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>, dm-devel@redhat.com
Cc: linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>

On Mon, 5 Jan 2009 17:35:17 +1100 Stephen Rothwell wrote:

> Hi all,
> 
> This tree will not build a powerpc ppc4xx_defconfig due to a kvm problem.
> 
> Changes since 20090102:
> 
> Removed tree:
> 	rr_cpumask (served it purpose)
> 
> Undropped tree:
> 	driver-core
> 	kvm
> 
> Dropped trees (temporarily):
> 	usb (build problem)
> 	rr (complex conflicts)
> 	semaphore-removal (due to unfixed conflicts against Linus' tree)
> 	cpu_alloc (build problem)
> 	audit (difficult conflicts)
> 	staging (depends on usb)
> 
> The device-mapper tree lost its conflict.


When CONFIG_MODULE_UNLOAD=n (or CONFIG_MODULES=n):

linux-next-20090105/drivers/md/dm-target.c:106: error: implicit declaration of function 'module_refcount'



---
~Randy
