From: Michael Neuling <mikey@neuling.org>
Subject: Re: Power machines fail to boot after build being successful
Date: Mon, 30 Aug 2010 16:49:47 +1000
Message-ID: <21473.1283150987@neuling.org>
References: <4C764F52.5050707@linux.vnet.ibm.com> <2311.1282871746@neuling.org> <20100827120144.1736a2f6.sfr@canb.auug.org.au> <4C7B4C1F.7010003@linux.vnet.ibm.com>
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([203.10.76.45]:50409 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751537Ab0H3Gtt (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 30 Aug 2010 02:49:49 -0400
In-reply-to: <4C7B4C1F.7010003@linux.vnet.ibm.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: divya <dipraksh@linux.vnet.ibm.com>
Cc: LKML <linux-kernel@vger.kernel.org>, linuxppc-dev@ozlabs.org, linux-next@vger.kernel.org

In message <4C7B4C1F.7010003@linux.vnet.ibm.com> you wrote:
> On Friday 27 August 2010 07:31 AM, Stephen Rothwell wrote:
> > Hi Mikey,
> >
> > On Fri, 27 Aug 2010 11:15:46 +1000 Michael Neuling<mikey@neuling.org>  wrot
e:
> >    
> >>      
> >>> After successfully building the kernel version
> >>> 2.6.36-rc2-git4(commitid d4348c678977c) with the config file
> >>> attached(used make oldconfig), P5 and P6 power machines fails to
> >>> reboot with the following logs
> >>>
> >>> Logs collected while rebooting into today next, same occurs with the
> >>> upstream kernel too.
> >>>        
> >> This will fix your problem:
> >> http://patchwork.ozlabs.org/patch/62757/
> >>      
> > I have seen something similar in my linux-next boot tests, so I will add
> > this patch to linux-next for today.
> >    
> Hi,
> 
> The same problem occurs on the linux-tree , now that since the patch
> is integrated into linux-next, im not able to find the problem with
> linux-next-20100827.
> 
> When will the patch be integrated with the linux-tree.

By "the linux-tree" do you mean Linus' tree?

If so, benh is likely to ask Linus to pull the fix in the next few days.

Mikey
