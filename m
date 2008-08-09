From: David Woodhouse <dwmw2@infradead.org>
Subject: Re: linux-next: mtd tree build failure
Date: Sat, 09 Aug 2008 22:33:19 +0100
Message-ID: <1218317599.5063.10.camel@pmac.infradead.org>
References: <20080807133005.d37ea7b8.sfr@canb.auug.org.au>
	 <20080808001939.574e7fad.sfr@canb.auug.org.au>
	 <alpine.LFD.1.10.0808092131550.3488@casper.infradead.org>
Mime-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([18.85.46.34]:60949 "EHLO
	bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751583AbYHIVda (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Sat, 9 Aug 2008 17:33:30 -0400
In-Reply-To: <alpine.LFD.1.10.0808092131550.3488@casper.infradead.org>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Alexey Korolev <akorolev@infradead.org>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, Russell King <rmk@arm.linux.org.uk>

On Sat, 2008-08-09 at 21:41 +0100, Alexey Korolev wrote:
> Hi Stephen,
> 
> Thanks for catching export symbol problem.  
> Hmm, it seems very strange why i2c_dev.c can't reference the exported symbols. 
> We are looking after of the problem. I believe it will be fixed ASAP.

http://git.infradead.org/mtd-2.6.git?a=commitdiff;h=c314dfdc

-- 
dwmw2
