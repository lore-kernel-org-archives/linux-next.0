From: Martin Schwidefsky <schwidefsky@de.ibm.com>
Subject: Re: linux-next: s390/driver-core merge conflict
Date: Thu, 29 May 2008 14:22:55 +0200
Message-ID: <1212063775.16984.4.camel@localhost>
References: <20080529135839.aa17b44f.sfr@canb.auug.org.au>
Reply-To: schwidefsky@de.ibm.com
Mime-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mtagate3.de.ibm.com ([195.212.29.152]:62776 "EHLO
	mtagate3.de.ibm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752200AbYE2MZm (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 29 May 2008 08:25:42 -0400
Received: from d12nrmr1607.megacenter.de.ibm.com (d12nrmr1607.megacenter.de.ibm.com [9.149.167.49])
	by mtagate3.de.ibm.com (8.13.8/8.13.8) with ESMTP id m4TCPfDl182104
	for <linux-next@vger.kernel.org>; Thu, 29 May 2008 12:25:41 GMT
Received: from d12av02.megacenter.de.ibm.com (d12av02.megacenter.de.ibm.com [9.149.165.228])
	by d12nrmr1607.megacenter.de.ibm.com (8.13.8/8.13.8/NCO v8.7) with ESMTP id m4TCPeNn2568358
	for <linux-next@vger.kernel.org>; Thu, 29 May 2008 14:25:40 +0200
Received: from d12av02.megacenter.de.ibm.com (loopback [127.0.0.1])
	by d12av02.megacenter.de.ibm.com (8.12.11.20060308/8.13.3) with ESMTP id m4TCPepU018483
	for <linux-next@vger.kernel.org>; Thu, 29 May 2008 14:25:40 +0200
In-Reply-To: <20080529135839.aa17b44f.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Greg KH <greg@kroah.com>, linux-next@vger.kernel.org, Kay Sievers <kay.sievers@vrfy.org>, Peter Oberparleiter <peter.oberparleiter@de.ibm.com>

On Thu, 2008-05-29 at 13:58 +1000, Stephen Rothwell wrote:
> Hi Martin,
> 
> Today's linux-next merge of the s390 tree got conflicts in
> drivers/s390/block/dasd.c, drivers/s390/block/dasd_eckd.c,
> drivers/s390/block/dasd_fba.c, drivers/s390/char/tape_core.c,
> drivers/s390/cio/device_fsm.c, drivers/s390/net/claw.c,
> drivers/s390/net/ctcm_main.c and drivers/s390/net/lcs.c between commit
> bd24b944eb93549b1ca5becbf27c7373504f7eed ("driver-core: prepare for
> removal of 20 char limit from struct device") from the driver-core tree
> and commits 17ae2c0d4d27d73fb264e204e385bf5436349f36 ("[S390] cio:
> introduce fcx enabled scsw format") and
> 8e4dac6f0f36686984ed3f01b977259e3127433b ("[S390] cio: provide functions
> for fcx enabled I/O") from the s390 tree.
> 
> I merged all the dev_name changes from driver-core into the s390 changes.
> Someone might like to check it.

It builds fine and it boots. Not too bad I would say.

-- 
blue skies,
  Martin.

"Reality continues to ruin my life." - Calvin.


