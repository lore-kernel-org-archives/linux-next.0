From: Randy Dunlap <randy.dunlap@oracle.com>
Subject: Re: linux-next: Tree for July 7 (i915 + gma500)
Date: Thu, 7 Jul 2011 08:55:01 -0700
Message-ID: <20110707085501.61e86cd8.randy.dunlap@oracle.com>
References: <20110707172544.867b980a1196db005b577c14@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from acsinet15.oracle.com ([141.146.126.227]:49586 "EHLO
	acsinet15.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750939Ab1GGPzS (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 7 Jul 2011 11:55:18 -0400
In-Reply-To: <20110707172544.867b980a1196db005b577c14@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>, Alan Cox <alan@linux.intel.com>
Cc: linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>

On Thu, 7 Jul 2011 17:25:44 +1000 Stephen Rothwell wrote:

> Hi all,
> 
> The next linux-next release will (probably) be next-20110718.
> 
> Changes since 20110706:


when both CONFIG_DRM_I915=y and CONFIG_DRM_PSB=y:

drivers/staging/built-in.o: In function `intel_opregion_init':
(.text+0x47943): multiple definition of `intel_opregion_init'
drivers/gpu/built-in.o:(.text+0x17277a): first defined here

---
~Randy
*** Remember to use Documentation/SubmitChecklist when testing your code ***
