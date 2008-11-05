From: Ananth N Mavinakayanahalli <ananth@in.ibm.com>
Subject: Re: linux-next: manual merge of the tests tree
Date: Wed, 5 Nov 2008 19:41:37 +0530
Message-ID: <20081105141137.GA5216@in.ibm.com>
References: <20081015170503.1130c183.sfr@canb.auug.org.au> <20081105135211.52bbbd8d.sfr@canb.auug.org.au> <20081105060631.GA17079@uranus.ravnborg.org>
Reply-To: ananth@in.ibm.com
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from e2.ny.us.ibm.com ([32.97.182.142]:32971 "EHLO e2.ny.us.ibm.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751154AbYKEOMg (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 5 Nov 2008 09:12:36 -0500
Received: from d01relay02.pok.ibm.com (d01relay02.pok.ibm.com [9.56.227.234])
	by e2.ny.us.ibm.com (8.13.8/8.13.8) with ESMTP id mA5ECZLo001284
	for <linux-next@vger.kernel.org>; Wed, 5 Nov 2008 09:12:35 -0500
Received: from d01av02.pok.ibm.com (d01av02.pok.ibm.com [9.56.224.216])
	by d01relay02.pok.ibm.com (8.13.8/8.13.8/NCO v9.1) with ESMTP id mA5ECZQO063838
	for <linux-next@vger.kernel.org>; Wed, 5 Nov 2008 09:12:35 -0500
Received: from d01av02.pok.ibm.com (loopback [127.0.0.1])
	by d01av02.pok.ibm.com (8.12.11.20060308/8.13.3) with ESMTP id mA5ECN3I015531
	for <linux-next@vger.kernel.org>; Wed, 5 Nov 2008 09:12:24 -0500
Content-Disposition: inline
In-Reply-To: <20081105060631.GA17079@uranus.ravnborg.org>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Sam Ravnborg <sam@ravnborg.org>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org

On Wed, Nov 05, 2008 at 07:06:31AM +0100, Sam Ravnborg wrote:
> On Wed, Nov 05, 2008 at 01:52:11PM +1100, Stephen Rothwell wrote:
> > Hi Ananth,
> > 
> > On Wed, 15 Oct 2008 17:05:03 +1100 Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> > >
> > > Today's linux-next merge of the tests tree got a conflicts in lib/Kconfig.debug.
> > > 
> > > You need to determine if this tree is ever going to be merged into Linus'
> > > tree.  I am going to drop it until you decide.
> > 
> > Given the discussion, I am dropping the tests tree until something is
> > decided.  (in which case, I assume the tree will have its conflicts with
> > Linus' tree fixed up)
> 
> Agreed. We can revisit this when we have a proper framework to execute
> small user space test programs.
> 
> Ananth - thanks for your effort but I will drop the tree too.

OK by me :-)

Ananth
