From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build warning after merge of the crypto tree
Date: Fri, 19 Jan 2018 12:49:26 +1100
Message-ID: <20180119124926.1c22bb19@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:59463 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1754833AbeASBt2 (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Thu, 18 Jan 2018 20:49:28 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Herbert Xu <herbert@gondor.apana.org.au>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Harsh Jain <harsh@chelsio.com>

Hi Herbert,

After merging the crypto tree, today's linux-next build (x86_64
allmodconfig) produced this warning:

drivers/crypto/chelsio/chcr_algo.c: In function 'create_authenc_wr':
drivers/crypto/chelsio/chcr_algo.c:2113:2: warning: this 'if' clause does not guard... [-Wmisleading-indentation]
  if (error)
  ^~
drivers/crypto/chelsio/chcr_algo.c:2115:3: note: ...this statement, but the latter is misleadingly indented as if it were guarded by the 'if'
   dnents = sg_nents_xlen(req->dst, assoclen, CHCR_DST_SG_SIZE, 0);
   ^~~~~~

Introduced by commit

  e1a018e607a3 ("crypto: chelsio - Remove dst sg size zero check")

-- 
Cheers,
Stephen Rothwell
