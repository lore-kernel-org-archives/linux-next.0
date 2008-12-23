From: Benjamin Herrenschmidt <benh@kernel.crashing.org>
Subject: Re: testing (Was: Re: linux-next: scsi-post-merge tree build
 failure)
Date: Tue, 23 Dec 2008 11:19:35 +1100
Message-ID: <1229991575.4360.31.camel@pasglop>
References: <20081223012545.5b1e7f5e.sfr@canb.auug.org.au>
	 <1229979392.4360.15.camel@pasglop>
	 <20081223100456.bb556b19.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from gate.crashing.org ([63.228.1.57]:49487 "EHLO gate.crashing.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750900AbYLWATz (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 22 Dec 2008 19:19:55 -0500
In-Reply-To: <20081223100456.bb556b19.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Paul Mackerras <paulus@samba.org>, linuxppc-dev@ozlabs.org, linux-next@vger.kernel.org, Kumar Gala <galak@kernel.crashing.org>, Hollis Blanchard <hollisb@us.ibm.com>

On Tue, 2008-12-23 at 10:04 +1100, Stephen Rothwell wrote:
> So, why is this series in powerpc/next at all if some of the modified
> files haven't even been compiled?  

Because nobody spotted the problem while the series was out for review ?

> A simple ppc44x_defconfig build of the
> powerpc/next tree fails - which I would have thought would be part of the
> testing since KVM is only implemented for 44x on powerpc.
> 
> (Sorry, I am annoyed - it was late when I finally found this build
> failure on top of everything else.)

I have about 3 44x configs in my build tests. KVM happens not to be
enabled in any of them :-( I'll add this ppc4xx_defconfig to the lot, I
didn't know it existed in fact.

Cheers,
Ben.
