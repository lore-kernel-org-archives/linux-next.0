From: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [BUILD-FAILURE] linux-next: Tree for June 30
Date: Mon, 30 Jun 2008 22:25:06 +0200
Message-ID: <20080630202506.GA28050@uranus.ravnborg.org>
References: <20080701001656.e156585c.sfr@canb.auug.org.au> <48690385.7030500@linux.vnet.ibm.com> <48690D3C.1060803@linux.vnet.ibm.com> <20080630185943.GA24692@uranus.ravnborg.org> <20080630192610.GA6584@elte.hu> <20080630194727.GA26682@uranus.ravnborg.org> <20080630200623.GE6584@elte.hu>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from pasmtpa.tele.dk ([80.160.77.114]:57098 "EHLO pasmtpA.tele.dk"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1755039AbYF3UYU (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 30 Jun 2008 16:24:20 -0400
Content-Disposition: inline
In-Reply-To: <20080630200623.GE6584@elte.hu>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Ingo Molnar <mingo@elte.hu>
Cc: Kamalesh Babulal <kamalesh@linux.vnet.ibm.com>, Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, Jens Axboe <jens.axboe@oracle.com>, Andy Whitcroft <apw@shadowen.org>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, "H. Peter Anvin" <hpa@zytor.com>

> 
> ah, ok. So the patch below should solve this for now?
> 
> is there any particular reason why we are limited to 100 sections? (is 
> there some ELF limitation here perhaps?)

I would still like to know if you see significant different numbers than Kamalesh.
If you see a number close to 100 then OK.
But if you see a number say in the range of below 80 then we should dive deeper into this.

I do not even know what the program does - never looked at it befoe
so why the original limit was 100 I dunno.

	Sam
