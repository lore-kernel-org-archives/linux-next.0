From: Jiri Kosina <jkosina@suse.cz>
Subject: Re: linux-next: Tree for December 3
Date: Thu, 3 Dec 2009 14:37:06 +0100 (CET)
Message-ID: <alpine.LRH.2.00.0912031435380.9567@twin.jikos.cz>
References: <20091203180214.16e452ed.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-kernel-owner+glk-linux-kernel-3=40m.gmane.org-S1755494AbZLCNhD@vger.kernel.org>
In-Reply-To: <20091203180214.16e452ed.sfr@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

On Thu, 3 Dec 2009, Stephen Rothwell wrote:

> Changes since 20091202:
> 
> New tree: kbuild-current
> 
> The powerpc tree lost its build failure.
> 
> The ext3 tree gained a build failure for which I reverted a commit.
> 
> The net tree lost a conflict.
> 
> The mtd tree gained a conflict against the mips tree.
> 
> The tip tree lost a conflict.
> 
> The workqueues tree lost its conflicts.
[ ... ]
> Below is a summary of the state of the merge.
[ ... ]
> Merging trivial/for-next
> CONFLICT (content): Merge conflict in Documentation/video4linux/gspca.txt

Hi Stephen,

have you been sending out e-mail about this conflict? I don't seem to have 
received any.

Thanks,

-- 
Jiri Kosina
SUSE Labs, Novell Inc.
