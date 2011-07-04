From: Randy Dunlap <randy.dunlap@oracle.com>
Subject: Re: linux-next: Tree for July 4 (misc/pti)
Date: Mon, 4 Jul 2011 13:45:41 -0700
Message-ID: <20110704134541.9adfd4f1.randy.dunlap@oracle.com>
References: <20110704170952.1024e89b.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from rcsinet15.oracle.com ([148.87.113.117]:53811 "EHLO
	rcsinet15.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751529Ab1GDUp4 (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 4 Jul 2011 16:45:56 -0400
In-Reply-To: <20110704170952.1024e89b.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>, james_p_freyensee@linux.intel.com
Cc: linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>

On Mon, 4 Jul 2011 17:09:52 +1000 Stephen Rothwell wrote:

> Hi all,
> 
> Changes since 20110701:


when CONFIG_PCI is not enabled:

drivers/misc/pti.c:410: error: implicit declaration of function 'pci_release_region'
drivers/misc/pti.c:859: error: implicit declaration of function 'pci_request_region'


Stubs for these 2 functions could be added to include/linux/pci.h, but it would
make more sense to me just to make the driver depend on PCI since it seems to rely
on so many PCI functions.  or are the PCI pieces optional?

---
~Randy
*** Remember to use Documentation/SubmitChecklist when testing your code ***
