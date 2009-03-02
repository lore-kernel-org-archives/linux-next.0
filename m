From: David Miller <davem@davemloft.net>
Subject: Re: linux-next: net tree build failure
Date: Mon, 02 Mar 2009 01:49:58 -0800 (PST)
Message-ID: <20090302.014958.31955182.davem@davemloft.net>
References: <20090302180514.9b07c7d9.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from 74-93-104-97-Washington.hfc.comcastbusiness.net ([74.93.104.97]:39862
	"EHLO sunset.davemloft.net" rhost-flags-OK-FAIL-OK-OK)
	by vger.kernel.org with ESMTP id S1754195AbZCBJuO (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 2 Mar 2009 04:50:14 -0500
In-Reply-To: <20090302180514.9b07c7d9.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: sfr@canb.auug.org.au
Cc: linux-next@vger.kernel.org, andy.grover@oracle.com

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Mon, 2 Mar 2009 18:05:14 +1100

> Today's linux-next build (powerpc allyesconfig) failed like this:
> 
> net/rds/cong.c: In function 'rds_cong_set_bit':
> net/rds/cong.c:284: error: implicit declaration of function 'generic___set_le_bit'
> net/rds/cong.c: In function 'rds_cong_clear_bit':
> net/rds/cong.c:298: error: implicit declaration of function 'generic___clear_le_bit'
> net/rds/cong.c: In function 'rds_cong_test_bit':
> net/rds/cong.c:309: error: implicit declaration of function 'generic_test_le_bit'

I've fixed this up as follows:

rds: Fix build on powerpc.

As reported by Stephen Rothwell.

> Today's linux-next build (powerpc allyesconfig) failed like this:
>
> net/rds/cong.c: In function 'rds_cong_set_bit':
> net/rds/cong.c:284: error: implicit declaration of function 'generic___set_le_bit'
> net/rds/cong.c: In function 'rds_cong_clear_bit':
> net/rds/cong.c:298: error: implicit declaration of function 'generic___clear_le_bit'
> net/rds/cong.c: In function 'rds_cong_test_bit':
> net/rds/cong.c:309: error: implicit declaration of function 'generic_test_le_bit'

Signed-off-by: David S. Miller <davem@davemloft.net>
---
 net/rds/cong.c |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/net/rds/cong.c b/net/rds/cong.c
index 90e6b31..710e459 100644
--- a/net/rds/cong.c
+++ b/net/rds/cong.c
@@ -33,6 +33,8 @@
 #include <linux/types.h>
 #include <linux/rbtree.h>
 
+#include <asm-generic/bitops/le.h>
+
 #include "rds.h"
 
 /*
-- 
1.6.1.2.253.ga34a
