From: Randy Dunlap <randy.dunlap@oracle.com>
Subject: Re: linux-next: Tree for November 14 (staging)
Date: Fri, 14 Nov 2008 09:52:47 -0800
Message-ID: <20081114095247.6b195091.randy.dunlap@oracle.com>
References: <20081114184021.ed198f4b.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from rcsinet12.oracle.com ([148.87.113.124]:56560 "EHLO
	rgminet12.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752077AbYKNRxD (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Fri, 14 Nov 2008 12:53:03 -0500
In-Reply-To: <20081114184021.ed198f4b.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>, gregkh <greg@kroah.com>
Cc: linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>

On Fri, 14 Nov 2008 18:40:21 +1100 Stephen Rothwell wrote:

> Hi all,
> 
> Changes since 20081113:
> 
> New tree:
> 	staging


drivers/staging/benet/mpu.c:146: error: implicit declaration of function 'udelay'

drivers/staging/comedi/proc.c:89: error: redefinition of 'comedi_proc_init'
drivers/staging/comedi/comedidev.h:359: error: previous definition of 'comedi_proc_init' was here
drivers/staging/comedi/proc.c:98: error: redefinition of 'comedi_proc_cleanup'
drivers/staging/comedi/comedidev.h:362: error: previous definition of 'comedi_proc_cleanup' was here


---
~Randy
