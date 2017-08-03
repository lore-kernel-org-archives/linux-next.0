From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: Signed-off-by missing for commit in the crypto tree
Date: Fri, 4 Aug 2017 07:50:22 +1000
Message-ID: <20170804075022.02c9ce09@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:57101 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751865AbdHCVuZ (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Thu, 3 Aug 2017 17:50:25 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Herbert Xu <herbert@gondor.apana.org.au>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Rabin Vincent <rabinv@axis.com>, Lars Persson <larper@axis.com>

Hi all,

Commit

  9577212cc0e2 ("crypto: hash - add crypto_(un)register_ahashes()")

is missing a Signed-off-by from its author.

-- 
Cheers,
Stephen Rothwell
