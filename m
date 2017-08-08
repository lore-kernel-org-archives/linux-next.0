From: Ralf Baechle <ralf@linux-mips.org>
Subject: Re: linux-next: manual merge of the userns tree with the mips tree
Date: Tue, 8 Aug 2017 07:58:22 +0200
Message-ID: <20170808055822.GI3509@linux-mips.org>
References: <20170808151004.071d5a6d@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from eddie.linux-mips.org ([148.251.95.138]:55746 "EHLO
        cvs.linux-mips.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751958AbdHHF63 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 8 Aug 2017 01:58:29 -0400
Content-Disposition: inline
In-Reply-To: <20170808151004.071d5a6d@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: "Eric W. Biederman" <ebiederm@xmission.com>, James Hogan <james.hogan@imgtec.com>, Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, "Maciej W. Rozycki" <macro@linux-mips.org>

On Tue, Aug 08, 2017 at 03:10:04PM +1000, Stephen Rothwell wrote:

(Maciej added to cc.)

> Hi Eric,
> 
> Today's linux-next merge of the userns tree got a conflict in:
> 
>   arch/mips/kernel/traps.c
> 
> between commit:
> 
>   260a789828aa ("MIPS: signal: Remove unreachable code from force_fcr31_sig().")
> 
> from the mips tree and commit:
> 
>   ea1b75cf9138 ("signal/mips: Document a conflict with SI_USER with SIGFPE")
> 
> from the userns tree.
> 
> I fixed it up (the former removed the code updated by the latter) and
> can carry the fix as necessary. This is now fixed as far as linux-next
> is concerned, but any non trivial conflicts should be mentioned to your
> upstream maintainer when your tree is submitted for merging.  You may
> also want to consider cooperating with the maintainer of the conflicting
> tree to minimise any particularly complex conflicts.

Eric,

after yesterday's emails on the topic I think commit ea1b75cf9138 ("signal/
mips: Document a conflict with SI_USER with SIGFPE") should be dropped.

  Ralf
