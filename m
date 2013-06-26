From: Benjamin Herrenschmidt <benh@kernel.crashing.org>
Subject: Re: linux-next: manual merge of the akpm tree with the powerpc tree
Date: Wed, 26 Jun 2013 18:10:31 +1000
Message-ID: <1372234231.18612.6.camel@pasglop>
References: <20130626165642.8740ecb6d5d5882b06f173c8@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20130626165642.8740ecb6d5d5882b06f173c8@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Andrew Morton <akpm@linux-foundation.org>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Michael Neuling <mikey@neuling.org>, linuxppc-dev@lists.ozlabs.org, Oleg Nesterov <oleg@redhat.com>
List-Id: linux-next.vger.kernel.org

On Wed, 2013-06-26 at 16:56 +1000, Stephen Rothwell wrote:
> Today's linux-next merge of the akpm tree got a conflict in
> arch/powerpc/kernel/ptrace.c between commit b0b0aa9c7faf
> ("powerpc/hw_brk: Fix setting of length for exact mode breakpoints") from
> the powerpc tree and commit "ptrace/powerpc: revert "hw_breakpoints: Fix
> racy access to ptrace breakpoints"" from the akpm tree.
> 
> I fixed it up (see below) and can carry the fix as necessary (no action
> is required).

Where does the latter come from ? Why didn't it go through the powerpc tree ?

Cheers,
Ben.
