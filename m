From: Benjamin Herrenschmidt <benh@kernel.crashing.org>
Subject: Re: linux-next: build failure after merge of the final tree
Date: Tue, 07 Jan 2014 10:12:59 +1100
Message-ID: <1389049979.12906.11.camel@pasglop>
References: <20140106202856.5630590efc4bd6a466b7a668@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20140106202856.5630590efc4bd6a466b7a668@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linuxppc-dev@lists.ozlabs.org, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Mahesh Salgaonkar <mahesh@linux.vnet.ibm.com>
List-Id: linux-next.vger.kernel.org

On Mon, 2014-01-06 at 20:28 +1100, Stephen Rothwell wrote:
> Hi all,
> 
> After merging the final tree, today's linux-next build (powerpc
> allyesconfig) failed like this:
> 
> arch/powerpc/kernel/exceptions-64s.S: Assembler messages:
> arch/powerpc/kernel/exceptions-64s.S:1312: Error: attempt to move .org backwards
> 
> The last time I got this error, I needed to apply patch "powerpc: Fix
> "attempt to move .org backwards" error", but that has been included in
> the powerpc tree now, so I guess something else has added code in a
> critical place. :-(
> 
> I have just left this broken for today.

I had to modify that patch when applying it, it's possible that the
"new" version isn't making as much room. Without that change it would
fail the build on some of my configs due to some of the asm for the
maskable exception handling being too far from the conditional branches
that calls it.

I think it's time we do a bit of re-org of that file to figure out
precisely what has to be where and move things out more aggressively.

Cheers,
Ben.
