From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build failure after merge of the nfsd tree
Date: Tue, 21 Jul 2015 09:57:37 +1000
Message-ID: <20150721095737.7411eb05@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:46584 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752142AbbGTX5l (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 20 Jul 2015 19:57:41 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: "J. Bruce Fields" <bfields@fieldses.org>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Kinglong Mee <kinglongmee@gmail.com>

Hi,

After merging the nfsd tree, today's linux-next build (powerpc
ppc64_defconfig) failed like this:

fs/nfsd/nfs4state.c: In function 'client_has_state':
fs/nfsd/nfs4state.c:2249:22: error: 'struct nfs4_client' has no member named 'cl_lo_states'
   || !list_empty(&clp->cl_lo_states)
                      ^
fs/nfsd/nfs4state.c:2252:1: warning: control reaches end of non-void function [-Wreturn-type]
 }
 ^

Caused by commit

  395b297af7bf ("nfsd: Add layouts checking in client_has_state()")

cl_lo_states is only defined when CONFIG_NFSD_PNFS is set.

I have used the nsfd tree from next-20150720 for today.

-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
