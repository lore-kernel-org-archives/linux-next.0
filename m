From: Joerg Roedel <joerg.roedel@amd.com>
Subject: Re: linux-next: x86 tree build failure
Date: Fri, 12 Sep 2008 09:54:25 +0200
Message-ID: <20080912075425.GA22582@amd.com>
References: <20080912095618.728658a5.sfr@canb.auug.org.au> <20080912060527.GA22003@amd.com> <20080912173141.5b268bed.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from outbound-sin.frontbridge.com ([207.46.51.80]:53972 "EHLO
	SG2EHSOBE004.bigfish.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752163AbYILHyl (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Fri, 12 Sep 2008 03:54:41 -0400
Content-Disposition: inline
In-Reply-To: <20080912173141.5b268bed.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>, linux-next@vger.kernel.org

On Fri, Sep 12, 2008 at 05:31:41PM +1000, Stephen Rothwell wrote:
> Hi Joerg,
> 
> On Fri, 12 Sep 2008 08:05:27 +0200 Joerg Roedel <joerg.roedel@amd.com> wrote:
> >
> > do you have these commits in next/master already? I tried to find out
> 
> Not until tomorrow some time, sorry.
> 
> > why it fails (the build failure is weird because
> > PCI_DEVICE_ID_AMD_10H_NB_MISC and PCI_DEVICE_ID_AMD_11H_NB_MISC
> > are defined in the same place in tip/master).
> 
> tip/master has more trees merged than the x86 tree (and indeed
> PCI_DEVICE_ID_AMD_10H_NB_MISC turns up in the timers tree).

Ah ok, there is the problem, I see. Thanks.

Joerg



-- 
           |           AMD Saxony Limited Liability Company & Co. KG
 Operating |         Wilschdorfer Landstr. 101, 01109 Dresden, Germany
 System    |                  Register Court Dresden: HRA 4896
 Research  |              General Partner authorized to represent:
 Center    |             AMD Saxony LLC (Wilmington, Delaware, US)
           | General Manager of AMD Saxony LLC: Dr. Hans-R. Deppe, Thomas McCoy
