From: Linus Torvalds <torvalds@linux-foundation.org>
Subject: Re: linux-next: origin tree build failure
Date: Tue, 14 Oct 2008 16:51:31 -0700 (PDT)
Message-ID: <alpine.LFD.2.00.0810141647420.3288@nehalem.linux-foundation.org>
References: <20081015095916.f30c0979.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-next-owner@vger.kernel.org>
Received: from smtp1.linux-foundation.org ([140.211.169.13]:48523 "EHLO
	smtp1.linux-foundation.org" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1752068AbYJNXvp (ORCPT
	<rfc822;linux-next@vger.kernel.org>);
	Tue, 14 Oct 2008 19:51:45 -0400
In-Reply-To: <20081015095916.f30c0979.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, Mark Brown <broonie@opensource.wolfsonmicro.com>, LKML <linux-kernel@vger.kernel.org>, Liam Girdwood <lrg@slimlogic.co.uk>



On Wed, 15 Oct 2008, Stephen Rothwell wrote:
>
> +#ifndef NO_IRQ
> +#define NO_IRQ	0
> +#endif

Btw, as to why not do this idiocy, just grep for it.

We have several drivers that try to do something this stupid. Don't take 
my word for it? Look for them. And see them do things like

 - drivers/scsi/arm/fas216.h:

	#ifndef NO_IRQ
	#define NO_IRQ 255
	#endif

 - drivers/pcmcia/pd6729.c (really interesting):

	#ifndef NO_IRQ
	#define NO_IRQ  ((unsigned int)(0))
	#endif

 - drivers/rtc/rtc-m48t59.c:

	#ifndef NO_IRQ
	#define NO_IRQ  (-1)
	#endif

so please don't add yet another version to the insanity. Just mark 
anything with NO_IRQ as BROKEN or ARM-specific, or something.

		Linus
