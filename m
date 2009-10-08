From: David Rientjes <rientjes@google.com>
Subject: Re: [PATCH] linux-next: 20090929 - android driver build breaks
Date: Thu, 8 Oct 2009 16:48:23 -0700 (PDT)
Message-ID: <alpine.DEB.1.00.0910081644200.14247@chino.kir.corp.google.com>
References: <20090929140404.dfb2c5f5.sfr@canb.auug.org.au> <20090929152027.GC4373@linux.vnet.ibm.com> <20091008224725.GA22949@kroah.com> <alpine.DEB.1.00.0910081621340.10613@chino.kir.corp.google.com> <20091008232825.GA540@suse.de>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-next-owner@vger.kernel.org>
Received: from smtp-out.google.com ([216.239.33.17]:45773 "EHLO
	smtp-out.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756855AbZJHXti (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 8 Oct 2009 19:49:38 -0400
In-Reply-To: <20091008232825.GA540@suse.de>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Greg KH <gregkh@suse.de>
Cc: Kamalesh Babulal <kamalesh@linux.vnet.ibm.com>, linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, sfr@canb.auug.org.au, Andrew Morton <akpm@linux-foundation.org>, Arve Hjonnevag <arve@android.com>, San Mehat <san@android.com>

On Thu, 8 Oct 2009, Greg KH wrote:

> > What are you specifically referring to?  Kamalesh provided a patch[*] that 
> > fixes this particular compile error, which you said you were queueing.
> 
> Hm, I did say I was queueing it, but I still can't figure out if this is
> needed for the 2.6.32 tree.  Is it?
> 

Yes, 28b83c5 was merged during the merge window for 2.6.32 so this needs 
to be pushed for the staging tree if it's not ripped out.

> > If it's a criticism of the staleness of the Android code within the 
> > staging tree or no recent activity, then we should probably loop in some 
> > Android developers to find our about their plans.  I've added them to the 
> > cc.
> 
> They know all about this and agreed that the code should be dropped for
> 2.6.33 if no one sends me patches.  If someone does, then I will remove
> my 'delete the android code' patch in the staging tree.
> 

I don't work with Android, but the "no support from Google" phrase caught 
my attention :)  It seems like this isn't necessarily about support or 
raised issues not being addressed, but rather about a lack of progress 
being made developmentally or a general lack of interest in upstream 
inclusion.  If it was agreed to simply remove it, that's fine, I just was 
curious about the rationale.
