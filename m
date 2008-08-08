From: Adrian Bunk <bunk@kernel.org>
Subject: Re: next-20080808: bash: fork: Resource temporarily unavailable
Date: Fri, 8 Aug 2008 20:21:41 +0300
Message-ID: <20080808172141.GY14495@cs181140183.pp.htv.fi>
References: <1218214935.3146.5.camel@dhcppc0>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Return-path: <linux-next-owner@vger.kernel.org>
Received: from smtp6.pp.htv.fi ([213.243.153.40]:50410 "EHLO smtp6.pp.htv.fi"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752689AbYHHRXQ (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Fri, 8 Aug 2008 13:23:16 -0400
Content-Disposition: inline
In-Reply-To: <1218214935.3146.5.camel@dhcppc0>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Thomas Meyer <thomas@m3y3r.de>, David Howells <dhowells@redhat.com>
Cc: Linux-Kernel <linux-kernel@vger.kernel.org>, Linux-Next <linux-next@vger.kernel.org>

On Fri, Aug 08, 2008 at 07:02:15PM +0200, Thomas Meyer wrote:
> Hi.
> 
> Beginning with next-20080808 after letting the system run for 5 minutes
> or so, I get an error from the fork call, e.g.:
> 
> "bash: fork: Resource temporarily unavailable"
> 
> Doing an "echo c > /proc/sysrq-trigger" I was able to get an vmcore dump
> of the running kernel using the kdump mechanism.
> 
> what should i do next?

The only commits that touched kernel/fork.c between next-20080807 and 
next-20080808 are David's CRED patches.

David, can you look at this?

> with kind regards
> thomas

cu
Adrian

-- 

       "Is there not promise of rain?" Ling Tan asked suddenly out
        of the darkness. There had been need of rain for many days.
       "Only a promise," Lao Er said.
                                       Pearl S. Buck - Dragon Seed
