From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the userns tree with Linus' tree
Date: Tue, 22 Nov 2016 19:17:19 +1100
Message-ID: <20161122191719.3e438d1e@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:47519 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1755267AbcKVIRW (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 22 Nov 2016 03:17:22 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: "Eric W. Biederman" <ebiederm@xmission.com>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Lorenzo Stoakes <lstoakes@gmail.com>

Hi Eric,

Today's linux-next merge of the userns tree got conflicts in:

  arch/alpha/kernel/ptrace.c
  arch/blackfin/kernel/ptrace.c
  arch/cris/arch-v32/kernel/ptrace.c
  arch/ia64/kernel/ptrace.c
  arch/mips/kernel/ptrace32.c
  arch/powerpc/kernel/ptrace32.c
  include/linux/mm.h
  kernel/ptrace.c
  mm/memory.c
  mm/nommu.c

between commit:

  442486ec1096 ("mm: replace __access_remote_vm() write parameter with gup_flags")
(and others)

from Linus' tree and commit:

  0cabf9a438e1 ("ptrace: Don't allow accessing an undumpable mm")

from the userns tree.

I just used the version of the userns tree from next-20161117 for today.
Please merge v4.9-rc2 and fix up the conflicts (or just rebase onto
v4.9-rc2).

-- 
Cheers,
Stephen Rothwell
