From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: build failure after merge of the powerpc tree
Date: Tue, 22 Nov 2016 21:21:14 +1100
Message-ID: <20161122212114.45ba8b17@canb.auug.org.au>
References: <20161122195832.0f031e62@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20161122195832.0f031e62@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Michael Ellerman <mpe@ellerman.id.au>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, PowerPC <linuxppc-dev@lists.ozlabs.org>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Nicholas Piggin <npiggin@gmail.com>
List-Id: linux-next.vger.kernel.org

Hi all,

On Tue, 22 Nov 2016 19:58:32 +1100 Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>
> After merging the powerpc tree, today's linux-next build (powerpc
> allyesconfig) failed like this:
> 
> Inconsistent kallsyms data
> Try make KALLSYMS_EXTRA_PASS=1 as a workaround
> 
> Which is a vast improvement.  I'll try adding 'KALLSYMS_EXTRA_PASS=1'
> later and see how it goes.  It would be nice not to need it, though.

It build with KALLSYMS_EXTRA_PASS=1 on the command line.

-- 
Cheers,
Stephen Rothwell
