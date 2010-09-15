From: Randy Dunlap <randy.dunlap@oracle.com>
Subject: Re: linux-next: Tree for September 15 (brcm80211)
Date: Wed, 15 Sep 2010 09:26:46 -0700
Message-ID: <20100915092646.63fe20fd.randy.dunlap@oracle.com>
References: <20100915142954.6a36f52d.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from rcsinet10.oracle.com ([148.87.113.121]:16709 "EHLO
	rcsinet10.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752475Ab0IOQ2Y (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 15 Sep 2010 12:28:24 -0400
In-Reply-To: <20100915142954.6a36f52d.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>, driverdevel <devel@driverdev.osuosl.org>
Cc: linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, gregkh@suse.de, Brett Rudley <brudley@broadcom.com>, Henry Ptasinski <henryp@broadcom.com>, Nohee Ko <noheek@broadcom.com>

On Wed, 15 Sep 2010 14:29:54 +1000 Stephen Rothwell wrote:

> Hi all,
> 
> Changes since 20100914:


When BRCM80211_PCI is not enabled:

make[4]: *** No rule to make target `drivers/staging/brcm80211/brcm80211.c', needed by `drivers/staging/brcm80211/brcm80211.o'.

---
~Randy
*** Remember to use Documentation/SubmitChecklist when testing your code ***
