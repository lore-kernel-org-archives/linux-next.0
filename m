From: Frederic Weisbecker <fweisbec@gmail.com>
Subject: Re: A few tree inclusion update requests
Date: Tue, 27 Apr 2010 04:55:32 +0200
Message-ID: <20100427025530.GE5695@nowhere>
References: <20100410134221.GC5204@nowhere> <20100413094618.76ac20a8.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-ww0-f46.google.com ([74.125.82.46]:57297 "EHLO
	mail-ww0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752187Ab0D0Czf (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 26 Apr 2010 22:55:35 -0400
Content-Disposition: inline
In-Reply-To: <20100413094618.76ac20a8.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: LKML <linux-kernel@vger.kernel.org>, Linux Next <linux-next@vger.kernel.org>, Arnd Bergmann <arnd@arndb.de>

On Tue, Apr 13, 2010 at 09:46:18AM +1000, Stephen Rothwell wrote:
> You will need to ensure that the patches/commits in your tree/series have
> been:
>      * submitted under GPL v2 (or later) and include the Contributor's
> 	Signed-off-by,
>      * posted to the relevant mailing list,
>      * reviewed by you (or another maintainer of your subsystem tree),
>      * successfully unit tested, and 
>      * destined for the current or next Linux merge window.
> 
> Basically, this should be just what you would send to Linus (or ask him
> to fetch).  It is allowed to be rebased if you deem it necessary.


Hi Stephen,

Could you please integrate the following new tree in linux-next?

git://git.kernel.org/pub/scm/linux/kernel/git/frederic/random-tracing.git
	bkl/ioctl

Thanks!
