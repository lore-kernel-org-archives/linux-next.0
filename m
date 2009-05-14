From: Pekka Enberg <penberg@cs.helsinki.fi>
Subject: Re: Next May 11 : BUG during scsi initialization
Date: Thu, 14 May 2009 11:51:53 +0300
Message-ID: <1242291113.21646.6.camel@penberg-laptop>
References: <20090511161442.3e9d9cb9.sfr@canb.auug.org.au>
	 <4A081002.4050802@in.ibm.com> <20090511115233.GB8112@parisc-linux.org>
	 <4A081437.7000409@in.ibm.com> <20090511122135.GC8112@parisc-linux.org>
	 <20090512045716.GC32535@wotan.suse.de>  <4A0BD6BB.1050600@in.ibm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from courier.cs.helsinki.fi ([128.214.9.1]:39663 "EHLO
	mail.cs.helsinki.fi" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752423AbZENIvy (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 14 May 2009 04:51:54 -0400
In-Reply-To: <4A0BD6BB.1050600@in.ibm.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Sachin Sant <sachinp@in.ibm.com>
Cc: Nick Piggin <npiggin@suse.de>, Matthew Wilcox <matthew@wil.cx>, Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, linuxppc-dev@ozlabs.org

Hi Sachin,

On Thu, 2009-05-14 at 14:00 +0530, Sachin Sant wrote:
> Nick Piggin wrote:
> > This one possibly looks like a problem with remote memory allocation
> > or memory hotplug or something like that. I'll do a bit of code
> > review....
> Removed linux-scsi from the cc list.
> 
> I can recreate this issue with today's next tree. Nick let me know if 
> you need any other
> information on this. I have been able to recreate this issue consistently.

I wasn't able to find your .config in this thread. Can you please post
it?

			Pekka
