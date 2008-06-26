From: Len Brown <lenb@kernel.org>
Subject: Re: linux-next: manual merge of the acpi tree
Date: Thu, 26 Jun 2008 18:42:19 -0400 (EDT)
Message-ID: <alpine.LFD.1.10.0806261838560.2988@localhost.localdomain>
References: <20080625142034.59b343c7.sfr@canb.auug.org.au>
 <20080625071508.GA20454@elte.hu>
 <20080626015918.71a6b4d7.sfr@canb.auug.org.au> <20080625162923.GB6040@elte.hu>
 <alpine.LFD.1.10.0806251516460.3014@localhost.localdomain>
 <20080625195754.GA21689@elte.hu>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-next-owner@vger.kernel.org>
Received: from vms173005pub.verizon.net ([206.46.173.5]:62057 "EHLO
	vms173005pub.verizon.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751873AbYFZWm0 (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 26 Jun 2008 18:42:26 -0400
Received: from localhost.localdomain ([72.93.254.151])
 by vms173005.mailsrvcs.net
 (Sun Java System Messaging Server 6.2-6.01 (built Apr  3 2006))
 with ESMTPA id <0K330015WDFAALX8@vms173005.mailsrvcs.net> for
 linux-next@vger.kernel.org; Thu, 26 Jun 2008 17:35:35 -0500 (CDT)
In-reply-to: <20080625195754.GA21689@elte.hu>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Ingo Molnar <mingo@elte.hu>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, Bob Moore <robert.moore@intel.com>, Yinghai Lu <yhlu.kernel@gmail.com>



> I was thinking about these:
> 
>  acpi-acpi_numa_init-build-fix
>  ia64, acpi: fix Altix boot breakage in ACPI
>  acpi: fix boot breakage on Altix
> 
> note that this build failure does _not_ occur with current mainline, so 
> it's a linux-next issue.
> 
> i've prepared a tip/acpi-for-len branch for you so that you can have a 
> look at these, you can pull them from:
> 
>    git://git.kernel.org/pub/scm/linux/kernel/git/tip/linux-2.6-tip.git acpi-for-len

I can see these on the web, but i've got no idea how to traverse
your tip tree by actually pulling it.  It seems to be a maze of branches,
and it isn't clear how to find the one i want. 

are the 2nd and 3rd patches in response to the 1st patch?
is the 1st patch fixing something that happens in real life,
or a random build failuire that only a computer can find?

without understanding those, my impression is that i'm not
really excited about more config options and more ifdefs in C-code.
I'd prefer less of both.

-Len
