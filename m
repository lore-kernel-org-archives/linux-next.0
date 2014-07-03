From: Kees Cook <kees@outflux.net>
Subject: Re: mmotm 2014-07-02-15-07 uploaded (stack protector)
Date: Wed, 2 Jul 2014 18:13:05 -0700
Message-ID: <20140703011305.GK5412@outflux.net>
References: <53b482d3.gR7nYB/K7hPREviI%akpm@linux-foundation.org>
 <53B493E2.2030905@infradead.org>
 <20140703002231.GR19781@tassilo.jf.intel.com>
 <20140703005100.GI5412@outflux.net>
 <20140703010019.GS19781@tassilo.jf.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from smtp.outflux.net ([198.145.64.163]:53664 "EHLO smtp.outflux.net"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750916AbaGCBNd (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 2 Jul 2014 21:13:33 -0400
Content-Disposition: inline
In-Reply-To: <20140703010019.GS19781@tassilo.jf.intel.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Andi Kleen <ak@linux.intel.com>
Cc: Randy Dunlap <rdunlap@infradead.org>, akpm@linux-foundation.org, linux-kernel@vger.kernel.org, linux-next@vger.kernel.org, sfr@canb.auug.org.au, mhocko@suse.cz

On Wed, Jul 02, 2014 at 06:00:19PM -0700, Andi Kleen wrote:
> > The problem is that if you make kbuild hard-fail when selecting this missing
> > compiler option, you can never switch it back because "make menuconfig" will
> > refuse to build since the compiler option would be missing. Being silent
> > about the missing option (and/or falling back to other options) means that
> > you could get two different kernel features selection with the same CONFIG_*
> > set, depending on the kernel, which is extremely bad ("I selected
> > stack-protector-strong but it built without it?!").
> 
> The assumption that every flag in a .config has been consciouscly 
> selected by a human is a quite dubious one ...

Sure; it was actually via automated config updates that I uncovered this
limitation of kbuild in the first place.

> LTO just turns itself off if the toolchain doesn't support it.

For this situation, it is more surprising to have this option fall back,
since it is a security feature selection. The build must fail in some way if
compiler doesn't match CONFIG.

> > So, the middle ground was to warn about it during the kbuild logic so
> > you could find the source of the problem, but ultimately fail the build
> > when the compiler doesn't support it so there weren't any silent failure
> > modes.
> 
> Longer term it would be of course best to move all the cc-options
> probing into Kconfig. I bet that would speed up builds too.

Absolutely. I presently lack the deep knowledge to figure this out. :)

-Kees

-- 
Kees Cook                                            @outflux.net
