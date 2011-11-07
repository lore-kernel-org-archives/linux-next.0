From: Ralf Baechle <ralf@linux-mips.org>
Subject: Re: linux-next: manual merge of the mips tree with Linus' tree
Date: Mon, 7 Nov 2011 10:18:00 +0000
Message-ID: <20111107101800.GA28613@linux-mips.org>
References: <20111107110403.9fb12ceed80d07d9765031bb@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20111107110403.9fb12ceed80d07d9765031bb@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Yong Zhang <yong.zhang0@gmail.com>, David Daney <david.daney@cavium.com>
List-Id: linux-next.vger.kernel.org

On Mon, Nov 07, 2011 at 11:04:03AM +1100, Stephen Rothwell wrote:

> Today's linux-next merge of the mips tree got a conflict in
> arch/mips/kernel/perf_event.c between commit e5dcb58aa510 ("MIPS: perf:
> Reorganize contents of perf support files") from Linus' tree and commit
> 6e8722f887b2 ("MIPS: irq: Remove IRQF_DISABLED") from the mips tree.
> 
> The former moved the code that the latter modified and it appeasr to have
> been fixed up in its new position.  So I just used the version of this
> file that is in Linus' tree.

Time to rebase, I think.  I hope Linus is going to make an -rc1 soon.

  Ralf
