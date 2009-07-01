From: Sachin Sant <sachinp@in.ibm.com>
Subject: Re: linux-next: boot failure
Date: Wed, 01 Jul 2009 20:16:23 +0530
Message-ID: <4A4B76BF.60006@in.ibm.com>
References: <20090701160014.595e1338.sfr@canb.auug.org.au> <1246451712.22562.38.camel@dhcp235-23.rdu.redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from e28smtp06.in.ibm.com ([59.145.155.6]:45668 "EHLO
	e28smtp06.in.ibm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752117AbZGAOqW (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 1 Jul 2009 10:46:22 -0400
In-Reply-To: <1246451712.22562.38.camel@dhcp235-23.rdu.redhat.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Eric Paris <eparis@redhat.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>

Eric Paris wrote:
> I will check the makefiles to see if kernel/built-in.o is linked in
> before fs/buildin-in.o.  I don't see a reason why audit watches need to
> be that early in the kernel init process.  This isn't happening on my
> system so I'm asking if anyone hitting it can apply this patch and test?
>
> Audit: audit watch init should not be before fsnotify init
>
> From: Eric Paris <eparis@redhat.com>
With this patch i am able to boot today's next on my machines.

Tested-by : Sachin Sant <sachinp@in.ibm.com>

Thanks
-Sachin


-- 

---------------------------------
Sachin Sant
IBM Linux Technology Center
India Systems and Technology Labs
Bangalore, India
---------------------------------
