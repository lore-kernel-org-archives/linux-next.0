From: Boaz Harrosh <bharrosh@panasas.com>
Subject: Re: linux-next: osd tree build failure
Date: Sun, 16 Nov 2008 12:14:18 +0200
Message-ID: <491FF27A.6090400@panasas.com>
References: <20081114175328.5120af70.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from gw-ca.panasas.com ([66.104.249.162]:32435 "EHLO
	laguna.int.panasas.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
	with ESMTP id S1751589AbYKPKOV (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Sun, 16 Nov 2008 05:14:21 -0500
In-Reply-To: <20081114175328.5120af70.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org

Stephen Rothwell wrote:
> Hi Boaz,
> 
> Today's linux-next build (x86_64 allmodconfig) failed like this:
> 
> In file included from drivers/scsi/osd/osd_initiator.c:43:
> include/scsi/osd_initiator.h: In function 'osd_dev_set_ver':
> include/scsi/osd_initiator.h:72: error: 'dev' undeclared (first use in this function)
> 
> Caused by commit 1bdb488972f83cccfcbdbf45f7653ebc07f47313 ("libosd: OSD
> version 2 Support").  I have dropped the osd tree for today.
> 
Hi Stephen, I'm so sorry. I accidentally pushed the wrong branch.

(Anything left to do by hand is an error to happen)

I have fix that just now.

Thanks
Boaz
