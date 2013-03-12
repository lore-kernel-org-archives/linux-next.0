From: Jason Cooper <jason@lakedaemon.net>
Subject: Re: linux-next: manual merge of the akpm tree with the arm-soc tree
Date: Tue, 12 Mar 2013 09:32:25 -0400
Message-ID: <20130312133225.GG12700@titan.lakedaemon.net>
References: <20130312144714.39749c5b0bd1aea14c4d2ff8@canb.auug.org.au>
 <CAOesGMgSzn+uCVEMKZgtorcNkdzzvntmnfoej5vN-AjF43pnyQ@mail.gmail.com>
 <20130312115339.GF12700@titan.lakedaemon.net>
 <201303121248.24736.arnd@arndb.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mho-04-ewr.mailhop.org ([204.13.248.74]:24035 "EHLO
	mho-02-ewr.mailhop.org" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
	with ESMTP id S1753611Ab3CLNcg (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 12 Mar 2013 09:32:36 -0400
Content-Disposition: inline
In-Reply-To: <201303121248.24736.arnd@arndb.de>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Arnd Bergmann <arnd@arndb.de>
Cc: Andrew Lunn <andrew@lunn.ch>, Stephen Rothwell <sfr@canb.auug.org.au>, Jingoo Han <jg1.han@samsung.com>, linux-kernel@vger.kernel.org, linux-next@vger.kernel.org, Olof Johansson <olof@lixom.net>, Andrew Morton <akpm@linux-foundation.org>, linux-arm-kernel@lists.infradead.org

On Tue, Mar 12, 2013 at 12:48:24PM +0000, Arnd Bergmann wrote:
> On Tuesday 12 March 2013, Jason Cooper wrote:
> > I chose to keep them together to maintain bisectability.  Either you
> > have all of the fix (you landed on this branch), or you don't.  Was this
> > the correct decision in this case, or did I miss something?
> 
> I think you don't need to worry about bisection in this case, especially
> as you mentioned that 3.8 is already broken.
> 
> From all I can tell, these are four separate fixes, and you want to have
> all of them get merged, but applying just one of them will not make the
> state of the kernel tree any worse than what it is before the patches.

Ok, thanks for the clarification.  I'll ease up on the bisectability
requirement for fixes in the future.

thx,

Jason.
