From: Randy Dunlap <randy.dunlap@oracle.com>
Subject: Re: linux-next: Tree for February 21 (usb/serial)
Date: Mon, 21 Feb 2011 09:57:32 -0800
Message-ID: <20110221095732.b3842652.randy.dunlap@oracle.com>
References: <20110221182134.09abd232.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from rcsinet10.oracle.com ([148.87.113.121]:59552 "EHLO
	rcsinet10.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751299Ab1BUR5o (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 21 Feb 2011 12:57:44 -0500
In-Reply-To: <20110221182134.09abd232.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>, lud <linux-usb@vger.kernel.org>
Cc: linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>

On Mon, 21 Feb 2011 18:21:34 +1100 Stephen Rothwell wrote:

> Hi all,
> 
> Changes since 20110218:


When CONFIG_PM_RUNTIME is not enabled:

drivers/usb/serial/usb_wwan.c:702: error: 'struct dev_pm_info' has no member named 'usage_count'

---
~Randy
*** Remember to use Documentation/SubmitChecklist when testing your code ***
