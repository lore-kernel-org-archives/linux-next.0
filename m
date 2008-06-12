From: Len Brown <lenb@kernel.org>
Subject: Re: linux-next: acpi/cpus4096 merge conflict
Date: Thu, 12 Jun 2008 00:46:15 -0400 (EDT)
Message-ID: <alpine.LFD.1.10.0806120045320.12191@localhost.localdomain>
References: <20080612135032.b5d0c684.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-next-owner@vger.kernel.org>
Received: from vms173005pub.verizon.net ([206.46.173.5]:33259 "EHLO
	vms173005pub.verizon.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750982AbYFLEqZ (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 12 Jun 2008 00:46:25 -0400
Received: from localhost.localdomain ([72.93.254.151])
 by vms173005.mailsrvcs.net
 (Sun Java System Messaging Server 6.2-6.01 (built Apr  3 2006))
 with ESMTPA id <0K2C00KH62A42AR3@vms173005.mailsrvcs.net> for
 linux-next@vger.kernel.org; Wed, 11 Jun 2008 23:39:41 -0500 (CDT)
In-reply-to: <20080612135032.b5d0c684.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>, Mike Travis <travis@sgi.com>



On Thu, 12 Jun 2008, Stephen Rothwell wrote:

> Hi Len,
> 
> Today's linux-next merge of the acpi tree got a trivial conflict in
> drivers/acpi/processor_throttling.c between commit
> 141ad0688adb53094d6f75b39b4b3b0625de0e07 ("acpi: use performance variant
> for_each_cpu_mask_nr") from the cpus4096 tree and commit
> 08a4ab4a5fd58438840524ce22199c6bbd05816f ("ACPI: change processors from
> array to per_cpu variable") from the acpi tree.
> 
> It is just a context conflict and I did the obvious fixup.

thanks.

it would be ideal if the cpus4096 tree didn't scribble on drivers/acpi --
though I don't know if partitioning those patches is practical.

-Len

