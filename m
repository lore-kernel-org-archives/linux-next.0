From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the cgroup tree with Linus' tree
Date: Mon, 7 Dec 2015 17:36:05 +1100
Message-ID: <20151207173605.37fe583d@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:60164 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751857AbbLGGgI (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 7 Dec 2015 01:36:08 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Tejun Heo <tj@kernel.org>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Nina Schiff <ninasc@fb.com>, "David S. Miller" <davem@davemloft.net>

Hi Tejun,

Today's linux-next merge of the cgroup tree got a conflict in:

  net/core/netclassid_cgroup.c

between commit:

  3b13758f51de ("cgroups: Allow dynamically changing net_classid")

from Linus' tree and commit:

  1f7dd3e5a6e4 ("cgroup: fix handling of multi-destination migration from subtree_control enabling")

from the cgroup tree.

I couldn't figure out how to fix this up, so I have just dropped the
cgroup tree for today.

Tejun, maybe you could merge Linus' tree (probably -rc4?) and fix this
up yourself?

-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
