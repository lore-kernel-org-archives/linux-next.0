From: Randy Dunlap <randy.dunlap@oracle.com>
Subject: Re: next Feb 13 drivers/scsi/aha1542.ko build break
Date: Fri, 13 Feb 2009 10:22:03 -0800
Message-ID: <4995BA4B.9050209@oracle.com>
References: <20090213175526.d0590862.sfr@canb.auug.org.au> <49955D00.2020707@in.ibm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from rcsinet11.oracle.com ([148.87.113.123]:23892 "EHLO
	rgminet11.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751753AbZBMSVp (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Fri, 13 Feb 2009 13:21:45 -0500
In-Reply-To: <49955D00.2020707@in.ibm.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: "Sachin P. Sant" <sachinp@in.ibm.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, linux-scsi <linux-scsi@vger.kernel.org>

Sachin P. Sant wrote:
> Feb 13 next x86 allmodconfig build breaks with
> 
> ERROR: "__udivdi3" [drivers/scsi/aha1542.ko] undefined!
> 
> .config attached.


I'm seeing that also.  I think that it's this line in aha1542.c:

495:		mbo = (scsi2int(mb[mbi].ccbptr) - (SCSI_BUF_PA(&ccb[0]))) / sizeof(struct ccb);

since I can comment out the "/ sizeof(struct ccb)" and the driver builds successfully.

This may need a patch to use one of the div() macros (?).


-- 
~Randy
