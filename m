From: Randy Dunlap <randy.dunlap@oracle.com>
Subject: Re: linux-next: Tree for December 15 (mfd)
Date: Wed, 17 Dec 2008 11:43:00 -0800
Message-ID: <20081217114300.9476f8da.randy.dunlap@oracle.com>
References: <20081216020642.fc1007d9.sfr@canb.auug.org.au>
	<4946AF6A.8030107@oracle.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from rcsinet11.oracle.com ([148.87.113.123]:40797 "EHLO
	rgminet11.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752551AbYLQTnR (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 17 Dec 2008 14:43:17 -0500
In-Reply-To: <4946AF6A.8030107@oracle.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, sameo@openedhand.com

On Mon, 15 Dec 2008 11:26:34 -0800 Randy Dunlap wrote:

> Lots of mfd build failures like this:
> 
> 
> build-r7123.out:/local/linsrc/linux-next-20081215/drivers/mfd/twl4030-irq.c:183: error: 'irq_desc' undeclared (first use in this function)
> build-r7123.out:/local/linsrc/linux-next-20081215/drivers/mfd/twl4030-irq.c:455: error: 'irq_desc' undeclared (first use in this function)
> build-r7123.out:/local/linsrc/linux-next-20081215/drivers/mfd/twl4030-irq.c:515: error: 'irq_desc' undeclared (first use in this function)
> build-r7123.out:make[3]: *** [drivers/mfd/twl4030-irq.o] Error 1


This build error still happens in linux-next-20081217.

It only occurs when I2C=y (see drivers/mfd/Kconfig).

Stephen, doing an allyesconfig i386 or x86_64 build will catch this,
then you can drop the mfd tree and hopefully prod someone into fixing this...

---
~Randy
