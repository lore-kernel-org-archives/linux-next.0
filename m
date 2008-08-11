From: Alexey Korolev <akorolev@infradead.org>
Subject: Re: linux-next: mtd tree build failure
Date: Mon, 11 Aug 2008 09:30:00 +0100 (BST)
Message-ID: <alpine.LFD.1.10.0808110928050.27251@casper.infradead.org>
References: <20080807133005.d37ea7b8.sfr@canb.auug.org.au>  <20080808001939.574e7fad.sfr@canb.auug.org.au>  <alpine.LFD.1.10.0808092131550.3488@casper.infradead.org> <1218317599.5063.10.camel@pmac.infradead.org>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-next-owner@vger.kernel.org>
Received: from casper.infradead.org ([85.118.1.10]:41030 "EHLO
	casper.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750989AbYHKIax (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 11 Aug 2008 04:30:53 -0400
In-Reply-To: <1218317599.5063.10.camel@pmac.infradead.org>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: David Woodhouse <dwmw2@infradead.org>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, Russell King <rmk@arm.linux.org.uk>

Hi David,

> > 
> > Thanks for catching export symbol problem.  
> > Hmm, it seems very strange why i2c_dev.c can't reference the exported symbols. 
> > We are looking after of the problem. I believe it will be fixed ASAP.
> 
> http://git.infradead.org/mtd-2.6.git?a=commitdiff;h=c314dfdc
>
Oh Great! Thank you very much! 

Alexey
