From: Randy Dunlap <randy.dunlap@oracle.com>
Subject: Re: [PATCH next&mainline] oprofile: fix build when CONFIG_PM is
 disabled
Date: Wed, 1 Sep 2010 09:57:08 -0700
Message-ID: <20100901095708.c1027a98.randy.dunlap@oracle.com>
References: <20100901133614.2580f238.sfr@canb.auug.org.au>
	<20100901094132.e734ad94.randy.dunlap@oracle.com>
	<20100901165002.GN22783@erda.amd.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from rcsinet10.oracle.com ([148.87.113.121]:21896 "EHLO
	rcsinet10.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752244Ab0IAQ57 (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 1 Sep 2010 12:57:59 -0400
In-Reply-To: <20100901165002.GN22783@erda.amd.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Robert Richter <robert.richter@amd.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, Ingo Molnar <mingo@elte.hu>

On Wed, 1 Sep 2010 18:50:02 +0200 Robert Richter wrote:

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

Good.

But I looked at oprofile.git and didn't see any such patch.
Did I miss it there?  Can you point me to it, please?

---
~Randy
*** Remember to use Documentation/SubmitChecklist when testing your code ***
