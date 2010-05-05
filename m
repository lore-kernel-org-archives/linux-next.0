From: Tobias Klauser <tklauser@distanz.ch>
Subject: Re: linux-next: build failure after merge of the staging tree
Date: Wed, 5 May 2010 10:39:58 +0200
Message-ID: <20100505083958.GY9489@distanz.ch>
References: <20100427141224.834a102a.sfr@canb.auug.org.au> <20100427151305.GA7653@kroah.com> <20100428161425.eff4c40a.sfr@canb.auug.org.au> <20100428152809.GF4483@kroah.com> <20100503161721.GW9489@distanz.ch> <20100505123754.16228b09.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from symlink.to.noone.org ([85.10.207.172]:43570 "EHLO sym.noone.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S932189Ab0EEIj7 (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 5 May 2010 04:39:59 -0400
Content-Disposition: inline
In-Reply-To: <20100505123754.16228b09.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Greg KH <greg@kroah.com>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

Hi Stephen,

On 2010-05-05 at 04:37:54 +0200, Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> On Mon, 3 May 2010 18:17:21 +0200 Tobias Klauser <tklauser@distanz.ch> wrote:
> >
> > I just built the current linux-next (20100503) with the patches applied
> > (including Greg's Kconfig change) on x86_64 with allmodconfig and wasn't
> > able to reproduce the build failure.
> > 
> > Any pointers on how to reproduce and/or fix this would be appreciated.
> 
> Of course, if you force this driver to be built in (as Greg's Kconfig
> change presumably did), then you won't get these errors.
> 
> The real solution is that SERIAL_ALTERA_JTAGUART_CONSOLE needs to depend
> on SERIAL_ALTERA_JTAGUART=y (instead of just SERIAL_ALTERA_JTAGUART) and
> similarly for the other.

Thanks for your help! I resubmitted an updated version of the patches
([1], [2]) including the changes pointed out above (compile tested
against linux-next as of 20100505 with allmodconfig on x86_64).

[1] Message-Id:
095aab012b2a6b3bbf4c7bc04294bb9c19316318.1273048151.git.tklauser@distanz.ch
[2] Message-Id:
e83e74abd82079284d5c8f62b78f2417ebc9ee27.1273048151.git.tklauser@distanz.ch

Cheers,
Tobias
