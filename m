From: Olof Johansson <olof@lixom.net>
Subject: Re: [PATCH] powerpc: Fix cpufreq drivers after cpufreq core changes
Date: Mon, 12 Jan 2009 11:44:38 -0600
Message-ID: <20090112174438.GA19318__4972.05015640265$1231782777$gmane$org@lixom.net>
References: <20090112104837.69feedec.sfr@canb.auug.org.au> <1231719015.22571.4.camel@pasglop> <1231719721.22571.9.camel@pasglop>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner+glk-linux-kernel-3=40m.gmane.org-S1755818AbZALRvK@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1231719721.22571.9.camel@pasglop>
Sender: linux-kernel-owner@vger.kernel.org
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, Rusty Russell <rusty@rustcorp.com.au>, Mike Travis <travis@sgi.com>, Ingo Molnar <mingo@elte.hu>, Andrew Morton <akpm@linux-foundation.org>, "David S. Miller" <davem@davemloft.net>, LKML <linux-kernel@vger.kernel.org>, Paul Mackerras <paulus@samba.org>, linuxppc-dev@ozlabs.org, arndb <arndb@arndb.de>
List-Id: linux-next.vger.kernel.org

On Mon, Jan 12, 2009 at 11:22:01AM +1100, Benjamin Herrenschmidt wrote:
> This updates the cpufreq drivers in arch/powerpc so they build again
> after the core cpufreq changes that broke them in commit
> in835481d9bcd65720b473db6b38746a74a3964218.
> 
> Signed-off-by: Benjamin Herrenschmidt <benh@kernel.crashing.org>
> ---
> 
> Tested on a G5. Olof, Arnd, any chance you can test the cell and pasemi
> drivers still work ?

Tested fine on pasemi.


-Olof
