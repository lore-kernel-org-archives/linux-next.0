From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the rdma tree with Linus' tree
Date: Tue, 22 Mar 2016 11:24:39 +1100
Message-ID: <20160322112439.1456e965@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:41976 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751941AbcCVAYl (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 21 Mar 2016 20:24:41 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Doug Ledford <dledford@redhat.com>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Dennis Dalessandro <dennis.dalessandro@intel.com>, Janani Ravichandran <janani.rvchndrn@gmail.com>, Amitoj Kaur Chawla <amitoj1606@gmail.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>

Hi Doug,

Today's linux-next merge of the rdma tree got conflicts in:

  drivers/staging/rdma/hfi1/keys.c
  drivers/staging/rdma/hfi1/mr.c

between commits:

  809487c70388 ("staging: rdma: hfi1: Use DIV_ROUND_UP")
  037f741673e0 ("staging: rdma: hfi1: Do not use | with a variable with value 0")

from Linus' tree and commit:

  895420ddc8b3 ("staging/rdma/hfi1: Remove hfi1 MR and hfi1 specific qp type")

from the rdma tree.

I fixed it up (I just removed the 2 files - the changes from Linus'
tree may need to be applied to some other files, now) and can carry the
fix as necessary. This is now fixed as far as linux-next is concerned,
but any non trivial conflicts should be mentioned to your upstream
maintainer when your tree is submitted for merging.  You may also want
to consider cooperating with the maintainer of the conflicting tree to
minimise any particularly complex conflicts.

-- 
Cheers,
Stephen Rothwell
