From: Robert Richter <robert.richter@amd.com>
Subject: Re: [PATCH next&mainline] oprofile: fix build when CONFIG_PM is
 disabled
Date: Wed, 1 Sep 2010 21:33:48 +0200
Message-ID: <20100901193348.GP22783@erda.amd.com>
References: <20100901133614.2580f238.sfr@canb.auug.org.au>
 <20100901094132.e734ad94.randy.dunlap@oracle.com>
 <20100901165002.GN22783@erda.amd.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from va3ehsobe006.messaging.microsoft.com ([216.32.180.16]:27321
	"EHLO VA3EHSOBE008.bigfish.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1752756Ab0IATie (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 1 Sep 2010 15:38:34 -0400
Content-Disposition: inline
In-Reply-To: <20100901165002.GN22783@erda.amd.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Randy Dunlap <randy.dunlap@oracle.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, Ingo Molnar <mingo@elte.hu>

On 01.09.10 18:50:02, Robert Richter wrote:
> On 01.09.10 12:41:32, Randy Dunlap wrote:
> > From: Randy Dunlap <randy.dunlap@oracle.com>
> > 
> > Using do/while for a function-returning-a-value does not
> > make gcc happy, so change it to a static inline function.
> > (happens when CONFIG_PM is not enabled)
> > 
> > arch/x86/oprofile/nmi_int.c:784: error: expected expression before 'do'
> > 
> > Signed-off-by: Randy Dunlap <randy.dunlap@oracle.com>
> 
> I already sent a fix to Ingo that fixes this.
> 
> Will update my for-next branch as soon as it is applied in tip.

The patch is now upstream in urgent of the oprofile tree. For-next is
also updated.

Sorry for the trouble.

-Robert

-- 
Advanced Micro Devices, Inc.
Operating System Research Center
