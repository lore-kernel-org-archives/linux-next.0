From: Len Brown <lenb@kernel.org>
Subject: Re: linux-next: manual merge of acpi tree
Date: Fri, 13 Jun 2008 01:09:31 -0400 (EDT)
Message-ID: <alpine.LFD.1.10.0806130107530.8340@localhost.localdomain>
References: <20080613145357.1ea9f643.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-next-owner@vger.kernel.org>
Received: from vms173003pub.verizon.net ([206.46.173.3]:56375 "EHLO
	vms173003pub.verizon.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752332AbYFMFJu (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Fri, 13 Jun 2008 01:09:50 -0400
Received: from localhost.localdomain ([72.93.254.151])
 by vms173003.mailsrvcs.net
 (Sun Java System Messaging Server 6.2-6.01 (built Apr  3 2006))
 with ESMTPA id <0K2D00D7IYBZY0WF@vms173003.mailsrvcs.net> for
 linux-next@vger.kernel.org; Fri, 13 Jun 2008 00:09:36 -0500 (CDT)
In-reply-to: <20080613145357.1ea9f643.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, "Rafael J. Wysocki" <rjw@sisk.pl>, Jesse Barnes <jbarnes@virtuousgeek.org>



On Fri, 13 Jun 2008, Stephen Rothwell wrote:

> Hi Len, Rafael,
> 
> Today's linux-next merge of the acpi tree got a context conflict in
> drivers/acpi/sleep/main.c between commit
> d8f3de0d2412bb91639cfefc5b3c79dbf3812212 ("Suspend-related patches for
> 2.6.27") from the pci tree and a couple of commits that are duplicate in
> the pci and acpi trees ("ACPI PM: acpi_pm_device_sleep_state() cleanup"
> and "ACPI PM: Remove obsolete Toshiba workaround").
> 
> I used the version from the pci tree.
> 

What do you use to merge?
Jesse pulled my suspend branch, so you should get the exact same commit 
id's for 3 patches in both his tree and mine.

-Len

