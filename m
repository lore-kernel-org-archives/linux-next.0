From: Ingo Molnar <mingo@elte.hu>
Subject: Re: [PATCH] powerpc: Fix cpufreq drivers after cpufreq core changes
Date: Mon, 12 Jan 2009 09:34:12 +0100
Message-ID: <20090112083412.GB19701@elte.hu>
References: <20090112104837.69feedec.sfr@canb.auug.org.au> <1231719015.22571.4.camel@pasglop> <1231719721.22571.9.camel@pasglop>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mx2.mail.elte.hu ([157.181.151.9]:33959 "EHLO mx2.mail.elte.hu"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751378AbZALIe7 (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 12 Jan 2009 03:34:59 -0500
Content-Disposition: inline
In-Reply-To: <1231719721.22571.9.camel@pasglop>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, Rusty Russell <rusty@rustcorp.com.au>, Mike Travis <travis@sgi.com>, Andrew Morton <akpm@linux-foundation.org>, "David S. Miller" <davem@davemloft.net>, LKML <linux-kernel@vger.kernel.org>, Paul Mackerras <paulus@samba.org>, linuxppc-dev@ozlabs.org, Olof Johansson <olof@lixom.net>, arndb <arndb@arndb.de>


* Benjamin Herrenschmidt <benh@kernel.crashing.org> wrote:

> This updates the cpufreq drivers in arch/powerpc so they build again
> after the core cpufreq changes that broke them in commit
> in835481d9bcd65720b473db6b38746a74a3964218.
> 
> Signed-off-by: Benjamin Herrenschmidt <benh@kernel.crashing.org>
> ---
> 
> Tested on a G5. Olof, Arnd, any chance you can test the cell and pasemi
> drivers still work ?
> 
> Linus, you can probably merge this now to fix the build problems.

Thanks Ben!

The powerpc defconfig built fine - you might wan to turn on cpufreq in the 
powerpc defconfig so that cross-build tests can catch problems like this.

	Ingo
