From: Randy Dunlap <randy.dunlap@oracle.com>
Subject: Re: linux-next: Tree for December 15 (mfd)
Date: Mon, 15 Dec 2008 11:26:34 -0800
Message-ID: <4946AF6A.8030107@oracle.com>
References: <20081216020642.fc1007d9.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from rcsinet12.oracle.com ([148.87.113.124]:48033 "EHLO
	rgminet12.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751678AbYLOT0d (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 15 Dec 2008 14:26:33 -0500
In-Reply-To: <20081216020642.fc1007d9.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, sameo@openedhand.com

Lots of mfd build failures like this:


build-r7123.out:/local/linsrc/linux-next-20081215/drivers/mfd/twl4030-irq.c:183: error: 'irq_desc' undeclared (first use in this function)
build-r7123.out:/local/linsrc/linux-next-20081215/drivers/mfd/twl4030-irq.c:455: error: 'irq_desc' undeclared (first use in this function)
build-r7123.out:/local/linsrc/linux-next-20081215/drivers/mfd/twl4030-irq.c:515: error: 'irq_desc' undeclared (first use in this function)
build-r7123.out:make[3]: *** [drivers/mfd/twl4030-irq.o] Error 1


~Randy
