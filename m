From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build failure after merge of the powerpc tree
Date: Tue, 22 Nov 2016 19:58:32 +1100
Message-ID: <20161122195832.0f031e62@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:32847 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1754549AbcKVI6i (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 22 Nov 2016 03:58:38 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Michael Ellerman <mpe@ellerman.id.au>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, PowerPC <linuxppc-dev@lists.ozlabs.org>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Nicholas Piggin <npiggin@gmail.com>

Hi all,

After merging the powerpc tree, today's linux-next build (powerpc
allyesconfig) failed like this:

Inconsistent kallsyms data
Try make KALLSYMS_EXTRA_PASS=1 as a workaround

Which is a vast improvement.  I'll try adding 'KALLSYMS_EXTRA_PASS=1'
later and see how it goes.  It would be nice not to need it, though.

-- 
Cheers,
Stephen Rothwell
