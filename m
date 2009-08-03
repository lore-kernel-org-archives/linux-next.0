From: "NeilBrown" <neilb@suse.de>
Subject: Re: linux-next:  tree build failure
Date: Mon, 3 Aug 2009 11:01:24 +1000 (EST)
Message-ID: <7f7d2d5828c15f1fe8221554f661903e.squirrel@neil.brown.name>
References: <20090803103550.9b28900a.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7BIT
Return-path: <linux-next-owner@vger.kernel.org>
Received: from cantor2.suse.de ([195.135.220.15]:37669 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751498AbZHCBBs (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Sun, 2 Aug 2009 21:01:48 -0400
In-Reply-To: <20090803103550.9b28900a.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Andre Noll <maan@systemlinux.org>

On Mon, August 3, 2009 10:35 am, Stephen Rothwell wrote:
> Hi Neil,
>
> Today's linux-next build (powerpc ppc64_defconfig) failed like this:
>
> ERROR: ".md_integrity_add_rdev" [drivers/md/multipath.ko] undefined!
>
> Caused by commit 66f4f3f41f5c334f399e920b2aaad9b82514acda ("md: Push down
> data integrity code to personalities") from the md-current and md trees.
> Looks like md_integrity_add_rdev needs an EXPORT_SYMBOL.

Yes, of course...
Thanks!
Fixed.

NeilBrown


>
> I have used the version of the md-current and md trees from next-20090731
> for today.
> --
> Cheers,
> Stephen Rothwell                    sfr@canb.auug.org.au
> http://www.canb.auug.org.au/~sfr/
>
