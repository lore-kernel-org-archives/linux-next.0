From: Boaz Harrosh <bharrosh@panasas.com>
Subject: Re: linux-next: Tree for June 16 (osd)
Date: Wed, 17 Jun 2009 15:45:18 +0300
Message-ID: <4A38E55E.7050006@panasas.com>
References: <20090616165923.8ca4ddcb.sfr@canb.auug.org.au> <4A37CC79.5000907@oracle.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ip67-152-220-66.z220-152-67.customer.algx.net ([67.152.220.66]:4597
	"EHLO daytona.int.panasas.com" rhost-flags-OK-OK-OK-FAIL)
	by vger.kernel.org with ESMTP id S1751934AbZFQMpV (ORCPT
	<rfc822;linux-next@vger.kernel.org>);
	Wed, 17 Jun 2009 08:45:21 -0400
In-Reply-To: <4A37CC79.5000907@oracle.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Randy Dunlap <randy.dunlap@oracle.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, scsi <linux-scsi@vger.kernel.org>

On 06/16/2009 07:46 PM, Randy Dunlap wrote:
> Stephen Rothwell wrote:
>> Hi all,
>>
>> Changes since 20090615:
> 
> 
> When
> CONFIG_BLK_DEV_OSD=y
> CONFIG_SCSI_OSD_INITIATOR=y
> # CONFIG_SCSI_OSD_ULD is not set
> 
> build fails with
> 
> drivers/built-in.o: In function `class_osdblk_remove':
> osdblk.c:(.text+0x55376): undefined reference to `osduld_put_device'
> drivers/built-in.o: In function `class_osdblk_add':
> osdblk.c:(.text+0x5564d): undefined reference to `osduld_path_lookup'
> osdblk.c:(.text+0x5584d): undefined reference to `osduld_put_device'
> 
> 

Thanks, osdblk has the wrong dependency, I will fix it.

Boaz
