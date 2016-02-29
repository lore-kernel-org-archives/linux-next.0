From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the target-merge tree with the net-next
 tree
Date: Mon, 29 Feb 2016 17:39:11 +1100
Message-ID: <20160229173911.4fabe3f8@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:52742 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750845AbcB2GjP (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 29 Feb 2016 01:39:15 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: "Nicholas A. Bellinger" <nab@linux-iscsi.org>, David Miller <davem@davemloft.net>, netdev@vger.kernel.org
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Hariprasad Shenai <hariprasad@chelsio.com>, Varun Prakash <varun@chelsio.com>

Hi Nicholas,

Today's linux-next merge of the target-merge tree got a conflict in:

  drivers/net/ethernet/chelsio/cxgb4/t4fw_api.h

between commit:

  ba9cee6aa67d ("cxgb4/iw_cxgb4: TOS support")

from the net-next tree and commit:

  c973e2a3ff1b ("cxgb4: add definitions for iSCSI target ULD")

from the target-merge tree.

I fixed it up (the latter was a superset of the former) and can carry
the fix as necessary (no action is required).

-- 
Cheers,
Stephen Rothwell
