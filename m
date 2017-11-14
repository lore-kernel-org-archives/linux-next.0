From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: Signed-off-by missing for commit in the powerpc tree
Date: Wed, 15 Nov 2017 07:26:43 +1100
Message-ID: <20171115072643.0c37fcb0@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:50443 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1756286AbdKNU0q (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 14 Nov 2017 15:26:46 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Michael Ellerman <mpe@ellerman.id.au>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, PowerPC <linuxppc-dev@lists.ozlabs.org>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

Hi all,

Commit

  f23ab3efb1b3 ("powerpc: Fix DABR match on hash based systems")

is missing a Signed-off-by from its committer.

-- 
Cheers,
Stephen Rothwell
