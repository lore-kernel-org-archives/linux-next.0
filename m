From: Randy Dunlap <randy.dunlap@oracle.com>
Subject: Re: linux-next: Tree for January 22 (staging/altpcichdma)
Date: Thu, 22 Jan 2009 09:14:40 -0800
Message-ID: <4978A980.4040405@oracle.com>
References: <20090122180543.1ab0baa6.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from rcsinet11.oracle.com ([148.87.113.123]:61167 "EHLO
	rgminet11.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756889AbZAVROy (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 22 Jan 2009 12:14:54 -0500
In-Reply-To: <20090122180543.1ab0baa6.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, Greg KH <gregkh@suse.de>

Stephen Rothwell wrote:
> Hi all,
> 
> Changes since 20090121:


drivers/staging/altpciechdma/altpciechdma.c: In function 'ape_sg_to_chdma_table':
drivers/staging/altpciechdma/altpciechdma.c:429: warning: format '%08x' expects type 'unsigned int', but argument 3 has type 'dma_addr_t'
drivers/staging/altpciechdma/altpciechdma.c:433: warning: format '%08x' expects type 'unsigned int', but argument 3 has type 'dma_addr_t'
drivers/staging/altpciechdma/altpciechdma.c:449: warning: format '%08x' expects type 'unsigned int', but argument 3 has type 'dma_addr_t'
drivers/staging/altpciechdma/altpciechdma.c:450: warning: format '%08x' expects type 'unsigned int', but argument 3 has type 'dma_addr_t'
drivers/staging/altpciechdma/altpciechdma.c: In function 'dma_test':
drivers/staging/altpciechdma/altpciechdma.c:547: warning: assignment makes integer from pointer without a cast
drivers/staging/altpciechdma/altpciechdma.c: In function 'probe':
drivers/staging/altpciechdma/altpciechdma.c:930: warning: label 'err_rev' defined but not used
drivers/staging/altpciechdma/altpciechdma.c:913: warning: label 'err_cdev' defined but not used
drivers/staging/altpciechdma/altpciechdma.c: At top level:
drivers/staging/altpciechdma/altpciechdma.c:415: warning: 'ape_sg_to_chdma_table' defined but not used




-- 
~Randy
