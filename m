From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build warning after merge of the crypto tree
Date: Mon, 31 Jul 2017 12:17:56 +1000
Message-ID: <20170731121756.6f54cadf@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:51115 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751585AbdGaCR6 (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Sun, 30 Jul 2017 22:17:58 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Herbert Xu <herbert@gondor.apana.org.au>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Gary R Hook <gary.hook@amd.com>

Hi Herbert,

After merging the crypto tree, today's linux-next build (x86_64
allmodconfig) produced this warning:

drivers/crypto/ccp/ccp-ops.c: In function 'ccp_run_rsa_cmd':
drivers/crypto/ccp/ccp-ops.c:1856:3: warning: 'sb_count' may be used uninitialized in this function [-Wmaybe-uninitialized]
   cmd_q->ccp->vdata->perform->sbfree(cmd_q, op.sb_key, sb_count);
   ^

Maybe introduced by commit

  6ba46c7d4d7e ("crypto: ccp - Fix base RSA function for version 5 CCPs")

-- 
Cheers,
Stephen Rothwell
