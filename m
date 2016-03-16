From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build failure after merge of the rdma tree
Date: Wed, 16 Mar 2016 12:15:38 +1100
Message-ID: <20160316121538.6d5a773b@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:51752 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752756AbcCPBPl (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 15 Mar 2016 21:15:41 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Doug Ledford <dledford@redhat.com>, Herbert Xu <herbert@gondor.apana.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Faisal Latif <faisal.latif@intel.com>

Hi Doug,

After merging the rdma tree, today's linux-next build (x86_64
allmodconfig) failed like this:

In file included from drivers/infiniband/hw/i40iw/i40iw.h:57:0,
                 from drivers/infiniband/hw/i40iw/i40iw_cm.c:63:
drivers/infiniband/hw/i40iw/i40iw_osdep.h:175:12: warning: 'struct hash_desc' declared inside parameter list
            u32 length, u32 value);
            ^

And it went downhill badly after that.

Caused by commit

  896545098777 ("crypto: hash - Remove crypto_hash interface")

from the crypto tree interacting with commits

  786c6adb3a94 ("i40iw: add puda code")
  4e9042e647ff ("i40iw: add hw and utils files")

(at least) from the rdma tree.

Its a bit of a pain finding these conflicts now - it would have been
better a few weeks ago.

For now, all I can do is to use the rdma tree from next-20160315 for
today.

Herbert, any hints for Doug, Faisal?

-- 
Cheers,
Stephen Rothwell
