From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the nfsd tree with Linus' tree
Date: Thu, 30 Jul 2015 11:23:25 +1000
Message-ID: <20150730112325.72240f81@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:33062 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1754278AbbG3BX1 (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 29 Jul 2015 21:23:27 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: "J. Bruce Fields" <bfields@fieldses.org>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Trond Myklebust <trond.myklebust@primarydata.com>

Hi all,

Today's linux-next merge of the nfsd tree got a conflict in:

  fs/nfs/nfs42proc.c

between commit:

  bdcc2cd14e4e ("NFSv4.2: handle NFS-specific llseek errors")

from Linus' tree and commit:

  0183ae17c741 ("NFSv4.2: handle NFS-specific llseek errors")

from the nfsd tree.

The only difference here is that _nfs42_proc_llseek is static in the
former, so I used that.

-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
