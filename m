From: Len Brown <lenb@kernel.org>
Subject: Re: linux-next: acpi tree build failure
Date: Fri, 24 Apr 2009 11:15:32 -0400 (EDT)
Message-ID: <alpine.LFD.2.00.0904241114420.10096@localhost.localdomain>
References: <20090424144635.9fd42a2e.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-next-owner@vger.kernel.org>
Received: from vms173017pub.verizon.net ([206.46.173.17]:46086 "EHLO
	vms173017pub.verizon.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754539AbZDXPPg (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Fri, 24 Apr 2009 11:15:36 -0400
Received: from localhost.localdomain ([96.237.168.40])
 by vms173017.mailsrvcs.net
 (Sun Java(tm) System Messaging Server 6.3-7.04 (built Sep 26 2008; 32bit))
 with ESMTPA id <0KIM00DP22DY6BQC@vms173017.mailsrvcs.net> for
 linux-next@vger.kernel.org; Fri, 24 Apr 2009 10:15:35 -0500 (CDT)
In-reply-to: <20090424144635.9fd42a2e.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, Matthew Garrett <mjg59@srcf.ucam.org>

On Fri, 24 Apr 2009, Stephen Rothwell wrote:

> Hi Len,
> 
> Today's linux-next build (i386 defconfig) failed like this:
> 
> drivers/built-in.o: In function `acpi_video_bus_put_devices':
> video.c:(.text+0x34319): undefined reference to `video_output_unregister'
> drivers/built-in.o: In function `acpi_video_bus_add':
> video.c:(.text+0x35995): undefined reference to `video_output_register'
> 
> Probably caused by commit 4b10fee2ec45eae912c2c81730f4eee82e61a247
> ("ACPI/i915: build fix").


> I reverted that commit for today.

Yes, i reverted it too.

thanks Stephen,
Len Brown, Intel Open Source Technolgy Center
