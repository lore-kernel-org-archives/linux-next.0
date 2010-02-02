From: Greg KH <greg@kroah.com>
Subject: Re: linux-next: usb tree build failure
Date: Tue, 2 Feb 2010 05:53:39 -0800
Message-ID: <20100202135339.GA13117@kroah.com>
References: <20100202171054.aaf86072.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from kroah.org ([198.145.64.141]:45848 "EHLO coco.kroah.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1755943Ab0BBNxP (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 2 Feb 2010 08:53:15 -0500
Content-Disposition: inline
In-Reply-To: <20100202171054.aaf86072.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Catalin Marinas <catalin.marinas@arm.com>

On Tue, Feb 02, 2010 at 05:10:54PM +1100, Stephen Rothwell wrote:
> Hi Greg,
> 
> Today's linux-next build (x86_64 allmodconfig) failed like this:
> 
> drivers/usb/host/isp1760-hcd.c:22:24: error: asm/memory.h: No such file or directory
> 
> Caused by commit 571da0df39107568bb137d928862121ddae6aad1 ("isp1760:
> Flush the D-cache for the pipe-in transfer buffers").
> 
> Only arm has an asm/memory.h ... so I guess it was only tested there?
> 
> I reverted that patch for today ...

I have already removed this patch, you are correct, it looks like this
was only tested on ARM :(

sorry for the problem, my tree is now updated.

greg k-h
