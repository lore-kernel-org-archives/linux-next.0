From: Randy Dunlap <randy.dunlap@oracle.com>
Subject: Re: linux-next: Tree for June 3 (staging)
Date: Wed, 03 Jun 2009 08:24:49 -0700
Message-ID: <4A2695C1.2060104@oracle.com>
References: <20090603190952.2dd0cc70.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from rcsinet11.oracle.com ([148.87.113.123]:18694 "EHLO
	rgminet11.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756504AbZFCPVu (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 3 Jun 2009 11:21:50 -0400
In-Reply-To: <20090603190952.2dd0cc70.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, Greg KH <gregkh@suse.de>

Stephen Rothwell wrote:
> Hi all,
> 
> Looks like a real rush since -rc7 ...


drivers/staging/comedi/drivers/adq12b.c:328: error: implicit declaration of function 'udelay'


drivers/staging/mrst_nand/ffsport.c:360:error: 'struct request' has no member named 'sector'
drivers/staging/mrst_nand/ffsport.c:376:error: 'struct request' has no member named 'sector'
drivers/staging/mrst_nand/ffsport.c:376:error: 'struct request' has no member named 'current_nr_sectors'
drivers/staging/mrst_nand/ffsport.c:380:error: 'struct request' has no member named 'sector'
drivers/staging/mrst_nand/ffsport.c:381:error: 'struct request' has no member named 'current_nr_sectors'
drivers/staging/mrst_nand/ffsport.c:392:error: 'struct request' has no member named 'current_nr_sectors'
drivers/staging/mrst_nand/ffsport.c:499:error: implicit declaration of function 'elv_next_request'
drivers/staging/mrst_nand/ffsport.c:517:error: implicit declaration of function 'end_request'
drivers/staging/mrst_nand/ffsport.c:738:error: implicit declaration of function 'blk_queue_hardsect_size'


-- 
~Randy
LPC 2009, Sept. 23-25, Portland, Oregon
http://linuxplumbersconf.org/2009/
