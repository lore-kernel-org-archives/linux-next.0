From: Randy Dunlap <randy.dunlap@oracle.com>
Subject: Re: linux-next: build failure after merge of the final tree
 (jdelvare-hwmon tree related)
Date: Wed, 16 Mar 2011 09:16:44 -0700
Message-ID: <20110316091644.d050115e.randy.dunlap@oracle.com>
References: <20110315192428.ce74a177.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from rcsinet10.oracle.com ([148.87.113.121]:23824 "EHLO
	rcsinet10.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751441Ab1CPQRQ (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 16 Mar 2011 12:17:16 -0400
In-Reply-To: <20110315192428.ce74a177.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Jean Delvare <khali@linux-fr.org>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Hans de Goede <hdegoede@redhat.com>

On Tue, 15 Mar 2011 19:24:28 +1100 Stephen Rothwell wrote:

> Hi all,
> 
> After merging the final tree, today's linux-next build (powerpc
> allyesconfig) failed like this:
> 
> drivers/hwmon/sch5627.c: In function 'sch5627_read_virtual_reg':
> drivers/hwmon/sch5627.c:179: error: implicit declaration of function 'msleep'
> 
> Caused by commit 19803daeb145 ("hwmon: New driver for SMSC SCH5627").
> See Rule 1 in Documentation/SubmitChecklist.
> 
> I have reverted that commit for today.


linux-next-20110316/drivers/i2c/busses/i2c-designware-core.c:321: error: implicit declaration of function 'mdelay'

linux-next-20110316/drivers/staging/altera-stapl/altera-jtag.c:398: error: implicit declaration of function 'udelay'

patch has been posted for altera-jtag.c, but not merged.

---
~Randy
*** Remember to use Documentation/SubmitChecklist when testing your code ***
