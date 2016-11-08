From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the kspp tree with Linus' tree
Date: Tue, 8 Nov 2016 13:31:30 +1100
Message-ID: <20161108133130.24c065f8@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:56155 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1752627AbcKHCcK (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 7 Nov 2016 21:32:10 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Kees Cook <keescook@google.com>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Emese Revfy <re.emese@gmail.com>

Hi Kees,

FIXME: Add owner of second tree to To:
       Add author(s)/SOB of conflicting commits.

Today's linux-next merge of the kspp tree got a conflict in:

  mm/page_alloc.c
  scripts/gcc-plugins/latent_entropy_plugin.c

between commits:

  38addce8b600 ("gcc-plugins: Add latent_entropy plugin")
  0766f788eb72 ("latent_entropy: Mark functions with __latent_entropy")
  58bea4144d23 ("latent_entropy: Fix wrong gcc code generation with 64 bit variables")

from Linus' tree and commits:

  2a5448668a3c ("gcc-plugins: Add latent_entropy plugin")
  09dd109d8241 ("latent_entropy: Mark functions with __latent_entropy")

from the kspp tree.

I fixed it up (I used the version from Linus' tree) and can carry the
fix as necessary. This is now fixed as far as linux-next is concerned,
but any non trivial conflicts should be mentioned to your upstream
maintainer when your tree is submitted for merging.  You may also want
to consider cooperating with the maintainer of the conflicting tree to
minimise any particularly complex conflicts.

Kees, maybe you could clean up the kspp tree.

-- 
Cheers,
Stephen Rothwell
