From: Greg KH <greg@kroah.com>
Subject: Re: linux-next: s390 build failure
Date: Mon, 12 May 2008 09:49:19 -0700
Message-ID: <20080512164919.GA7721@kroah.com>
References: <20080512180335.6a2e8474.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from pentafluge.infradead.org ([213.146.154.40]:42170 "EHLO
	pentafluge.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752985AbYELQx4 (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 12 May 2008 12:53:56 -0400
Content-Disposition: inline
In-Reply-To: <20080512180335.6a2e8474.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, Kay Sievers <kay.sievers@vrfy.org>, Martin Schwidefsky <schwidefsky@de.ibm.com>

On Mon, May 12, 2008 at 06:03:35PM +1000, Stephen Rothwell wrote:
> Hi Greg,
> 
> Today's linux-next build (s390 defconfig) fails like this:
> 
> drivers/s390/cio/device_fsm.c:53: error: syntax error before ';' token
> drivers/s390/cio/device_fsm.c:54: error: syntax error before ';' token
> 
> Caused by commit 67da378c80848bb778ee8caecadcdf17e1e310e0 ("driver-core:
> prepare for removal of 20 char limit from struct device") from the
> driver-core tree. Missing close parentheses on added dev_name() calls.
> 
> A touch more care, please.

I have updated version of this in my to-apply queue, I've dropped this
now so linux-next tomorrow should be just fine.  I'll add it back in
when I have the cross-build system set up here so that I can test things
to prevent this kind of mess from happening in the future.

Sorry about that.

greg k-h
