From: Guenter Roeck <linux@roeck-us.net>
Subject: Re: [PATCH] crypto: jitterentropy - avoid compiler warnings
Date: Tue, 23 Jun 2015 08:31:10 -0700
Message-ID: <20150623153110.GA10784@roeck-us.net>
References: <CAMuHMdXLDeqSU3WcVEh=jcGdS4z2YMejU_nZ2gDObDVjsm7vvw@mail.gmail.com>
 <33380936.3jDOACMRCz@tachyon.chronox.de>
 <CAMuHMdUw9FJE3kWEQf+TNTaLB9gMjdHEGt27bnD--qoGX22H7Q@mail.gmail.com>
 <1446731.BXdYRBoPhr@tachyon.chronox.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from bh-25.webhostbox.net ([208.91.199.152]:51237 "EHLO
	bh-25.webhostbox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754805AbbFWPbP (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 23 Jun 2015 11:31:15 -0400
Content-Disposition: inline
In-Reply-To: <1446731.BXdYRBoPhr@tachyon.chronox.de>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephan Mueller <smueller@chronox.de>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, Herbert Xu <herbert@gondor.apana.org.au>, Peter Zijlstra <public-peterz-wegcikhe2lqwvfeawa7xhq@plane.gmane.org>, Andy Shevchenko <andy.shevchenko@gmail.com>, Jim Davis <jim.epost@gmail.com>, Stephen Rothwell <sfr@canb.auug.org.au>, Linux-Next <linux-next@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "David S. Miller" <davem@davemloft.net>, linux-crypto@vger.kernel.org, Waiman Long <waiman.long@hp.com>, Ingo Molnar <mingo@kernel.org>, x86 <x86@kernel.org>

On Tue, Jun 23, 2015 at 04:18:54PM +0200, Stephan Mueller wrote:
> Hi Geert, Guenter,
> 
> may I ask that you check that the following patch compiles without errors or warnings on your systems?
> 
Stephan,

I applied your patch on top of the current mainline (which includes
the crypto updates for 4.2) and pushed it into my 'testing' branch.
You should be able to see the results in a couple of hours at
http://server.roeck-us.net:8010/builders, in the 'testing' column.

The build system doesn't log warnings, but this should give us an idea
if the build passes for all architectures.

I'll have a look myself later and let you know as well.

Guenter
