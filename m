From: Tejun Heo <tj@kernel.org>
Subject: Re: [PATCH -next] kmemcheck: build failure after merge of the slabh
 tree
Date: Tue, 30 Mar 2010 03:11:27 +0900
Message-ID: <4BB0ED4F.2080102@kernel.org>
References: <20100329154208.009a8ae2.sfr@canb.auug.org.au> <20100329092513.6e6faf2a.randy.dunlap@oracle.com> <4BB0EAD0.2030807@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from hera.kernel.org ([140.211.167.34]:39486 "EHLO hera.kernel.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752770Ab0C2SI1 (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 29 Mar 2010 14:08:27 -0400
In-Reply-To: <4BB0EAD0.2030807@kernel.org>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Randy Dunlap <randy.dunlap@oracle.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Jon Masters <jcm@jonmasters.org>

On 03/30/2010 03:00 AM, Tejun Heo wrote:
>> mm/kmemcheck.c also needs slab.h added to it:
> 
> But this one is something I missed from the mainline (my script didn't
> check for isolated SLAB_* flag usages).  I'll take this one into the
> slabh tree.  Thanks for reporting this.  :-)

Applied to slabh branch.  Thanks.

-- 
tejun
