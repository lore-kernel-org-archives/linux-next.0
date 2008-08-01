From: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Subject: Re: [PATCH] Introduce rculist.h
Date: Fri, 1 Aug 2008 14:09:07 -0700
Message-ID: <20080801210907.GB14851@linux.vnet.ibm.com>
References: <20080701125607.c5295759.sfr@canb.auug.org.au>
Reply-To: paulmck@linux.vnet.ibm.com
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from e2.ny.us.ibm.com ([32.97.182.142]:37340 "EHLO e2.ny.us.ibm.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1760723AbYHAVJL (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Fri, 1 Aug 2008 17:09:11 -0400
Content-Disposition: inline
In-Reply-To: <20080701125607.c5295759.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Linus <torvalds@linux-foundation.org>, Franck Bui-Huu <fbuihuu@gmail.com>, Josh Triplett <josh@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, Ingo Molnar <mingo@elte.hu>, LKML <linux-kernel@vger.kernel.org>, linux-next@vger.kernel.org

On Tue, Jul 01, 2008 at 12:56:07PM +1000, Stephen Rothwell wrote:
> In linux-next there is a commit ("rcu: split list.h and move rcu-protected
> lists into rculist.h") that moved the rcu related list iterators from
> list.h to rculist.h.  Add a trivial version of the file now so that
> various subsystem trees can start using it now for -next changes and so
> reduce the build errors caused by adding uses of the moved functions.

Works for me!

Acked-by: Paul E. McKenney <paulmck@linux.vnet.ibm.com>

> Cc: Franck Bui-Huu <fbuihuu@gmail.com>
> Cc: Paul E. McKenney <paulmck@linux.vnet.ibm.com>
> Cc: Josh Triplett <josh@kernel.org>
> Cc: Andrew Morton <akpm@linux-foundation.org>
> Cc: Ingo Molnar <mingo@elte.hu>
> Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
> ---
>  include/linux/rculist.h |    6 ++++++
>  1 files changed, 6 insertions(+), 0 deletions(-)
>  create mode 100644 include/linux/rculist.h
> 
> Linus, would you consider patches like this for 2.6.26 that have no
> effect on the current tree but help with conflicts in various subsystems
> during the next merge window?  I already have three build fixups for this
> one in particular.
> 
> diff --git a/include/linux/rculist.h b/include/linux/rculist.h
> new file mode 100644
> index 0000000..bde4586
> --- /dev/null
> +++ b/include/linux/rculist.h
> @@ -0,0 +1,6 @@
> +#ifndef _LINUX_RCULIST_H
> +#define _LINUX_RCULIST_H
> +
> +#include <linux/list.h>
> +
> +#endif	/* _LINUX_RCULIST_H */
> -- 
> 1.5.6
> 
> -- 
> Cheers,
> Stephen Rothwell                    sfr@canb.auug.org.au
> http://www.canb.auug.org.au/~sfr/
