From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the orangefs tree with Linus' tree
Date: Mon, 21 Dec 2015 10:31:06 +1100
Message-ID: <20151221103106.7d3b9e85@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:37241 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751135AbbLTXbJ (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Sun, 20 Dec 2015 18:31:09 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Mike Marshall <hubcap@omnibond.com>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

Hi Mike,

Today's linux-next merge of the orangefs tree got a conflict in:

  Makefile

between commit:

  1ec218373b8e ("Linux 4.4-rc2")

from Linus' tree and commit:

  575e946125f7 ("Orangefs: change pvfs2 filenames to orangefs")

from the orangefs tree.

You should really remove this EXTRAVERSION change from the patch.

I fixed it up (I use Linus' tree verison) and can carry the fix as
necessary (no action is required).

-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
