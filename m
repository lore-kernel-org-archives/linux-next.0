From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the userns tree with the mips tree
Date: Tue, 8 Aug 2017 15:10:04 +1000
Message-ID: <20170808151004.071d5a6d@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:33201 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1750736AbdHHFKG (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 8 Aug 2017 01:10:06 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: "Eric W. Biederman" <ebiederm@xmission.com>, Ralf Baechle <ralf@linux-mips.org>, James Hogan <james.hogan@imgtec.com>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

Hi Eric,

Today's linux-next merge of the userns tree got a conflict in:

  arch/mips/kernel/traps.c

between commit:

  260a789828aa ("MIPS: signal: Remove unreachable code from force_fcr31_sig().")

from the mips tree and commit:

  ea1b75cf9138 ("signal/mips: Document a conflict with SI_USER with SIGFPE")

from the userns tree.

I fixed it up (the former removed the code updated by the latter) and
can carry the fix as necessary. This is now fixed as far as linux-next
is concerned, but any non trivial conflicts should be mentioned to your
upstream maintainer when your tree is submitted for merging.  You may
also want to consider cooperating with the maintainer of the conflicting
tree to minimise any particularly complex conflicts.

-- 
Cheers,
Stephen Rothwell
