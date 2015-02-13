From: Ralf Baechle <ralf@linux-mips.org>
Subject: Re: linux-next: manual merge of the mips tree with Linus'  tree
Date: Fri, 13 Feb 2015 11:28:47 +0100
Message-ID: <20150213102847.GA30322@linux-mips.org>
References: <20150213111150.528da7cf@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20150213111150.528da7cf@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, James Cowgill <James.Cowgill@imgtec.com>, Markos Chandras <markos.chandras@imgtec.com>
List-Id: linux-next.vger.kernel.org

On Fri, Feb 13, 2015 at 11:11:50AM +1100, Stephen Rothwell wrote:

> Today's linux-next merge of the mips tree got a conflict in
> arch/mips/kernel/elf.c between commit fd75a33e0002 ("MIPS: ELF: fix
> loading o32 binaries on 64-bit kernels") from Linus' tree and commit
> d8fb6537f1d4 ("MIPS: kernel: elf: Improve the overall ABI and FPU mode
> checks") from the mips tree.
> 
> I fixed it up (the latter seems to be a superset of the former) and can
> carry the fix as necessary (no action is required).

Due to an unrelated MIPS-specific issue I've yanked the merge that contained
this specific commit for the time being.

  Ralf
