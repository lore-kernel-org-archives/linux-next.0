From: Len Brown <lenb@kernel.org>
Subject: Re: linux-next: Tree for May 6 (nouveau)
Date: Thu, 06 May 2010 16:37:46 -0400 (EDT)
Message-ID: <alpine.LFD.2.00.1005061636220.12696@localhost.localdomain>
References: <20100506151502.f97afe54.sfr@canb.auug.org.au>
 <20100506111856.ae15cd03.randy.dunlap@oracle.com>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-next-owner@vger.kernel.org>
Received: from vms173015pub.verizon.net ([206.46.173.15]:43609 "EHLO
	vms173015pub.verizon.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932239Ab0EFUiI (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 6 May 2010 16:38:08 -0400
In-reply-to: <20100506111856.ae15cd03.randy.dunlap@oracle.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Randy Dunlap <randy.dunlap@oracle.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, David Airlie <airlied@linux.ie>, linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, dri-devel@lists.freedesktop.org

> When CONFIG_ACPI_BUTTON=m:
> 
> drivers/built-in.o: In function `nouveau_connector_detect':
> nouveau_connector.c:(.text+0x1d81cf): undefined reference to `acpi_lid_open'
> 
> 
> #ifdef CONFIG_ACPI
> 		if (!nouveau_ignorelid && !acpi_lid_open())
> 			status = connector_status_unknown;
> #endif
> 
> 
> Do you want that to be
> #ifdef CONFIG_ACPI_BUTTON
> ?
> That will still only be built when CONFIG_ACPI_BUTTON=y (not =m).
> 

intel_lvds.c seems to handle this issue without #ifdefs
by including acpi/button.h

cheers,
Len Brown, Intel Open Source Technology Center
