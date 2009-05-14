From: Pekka Enberg <penberg@cs.helsinki.fi>
Subject: Re: Next May 11 : BUG during scsi initialization
Date: Thu, 14 May 2009 12:59:10 +0300
Message-ID: <1242295150.21646.10.camel@penberg-laptop>
References: <20090511161442.3e9d9cb9.sfr@canb.auug.org.au>
	 <4A081002.4050802@in.ibm.com> <20090511115233.GB8112@parisc-linux.org>
	 <4A081437.7000409@in.ibm.com> <20090511122135.GC8112@parisc-linux.org>
	 <20090512045716.GC32535@wotan.suse.de>  <4A0BD6BB.1050600@in.ibm.com>
	 <1242291113.21646.6.camel@penberg-laptop>  <4A0BEA44.2050908@in.ibm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from courier.cs.helsinki.fi ([128.214.9.1]:34389 "EHLO
	mail.cs.helsinki.fi" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752870AbZENJ7L (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 14 May 2009 05:59:11 -0400
In-Reply-To: <4A0BEA44.2050908@in.ibm.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Sachin Sant <sachinp@in.ibm.com>
Cc: Nick Piggin <npiggin@suse.de>, Matthew Wilcox <matthew@wil.cx>, Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, linuxppc-dev@ozlabs.org

On Thu, 2009-05-14 at 15:24 +0530, Sachin Sant wrote:
> Pekka Enberg wrote:
> > I wasn't able to find your .config in this thread. Can you please post
> > it?
> >   
> Config attached.

Thanks! Can you please enable CONFIG_DEBUG_VM, CONFIG_DEBUG_LIST, and
decrease CONFIG_NR_CPUS=1024 to, say, 32 and retest? Perhaps we'll get a
some clues to what's going on here.

			Pekka
