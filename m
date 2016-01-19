From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the akpm tree with Linus' tree
Date: Tue, 19 Jan 2016 13:42:33 +1100
Message-ID: <20160119134233.6d1324e3@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:55901 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S932548AbcASCmf (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 18 Jan 2016 21:42:35 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Vladimir Davydov <vdavydov@virtuozzo.com>, Geert Uytterhoeven <geert@linux-m68k.org>, "David S. Miller" <davem@davemloft.net>

Hi Andrew,

Today's linux-next merge of the akpm tree got a conflict in:

  include/net/tcp_memcontrol.h

between commit:

  cdb00777ffad ("tcp_memcontrol: Forward declare cgroup_subsys and mem_cgroup stucts")

from Linus' tree and commit:

  "net: drop tcp_memcontrol.c"

from the akpm tree.

I fixed it up (the latter removed the file, so I did that) and can carry
the fix as necessary (no action is required).

-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
