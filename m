From: David Miller <davem@davemloft.net>
Subject: Re: linux-next: net tree build failure
Date: Mon, 12 Oct 2009 23:19:30 -0700 (PDT)
Message-ID: <20091012.231930.141968218.davem@davemloft.net>
References: <20091013153308.af56910a.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner+glk-linux-kernel-3=40m.gmane.org-S1758945AbZJMGTg@vger.kernel.org>
In-Reply-To: <20091013153308.af56910a.sfr@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: sfr@canb.auug.org.au
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, mchan@broadcom.com, shmulikr@broadcom.com
List-Id: linux-next.vger.kernel.org

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Tue, 13 Oct 2009 15:33:08 +1100

> Today's linux-next build (powerpc allyesconfig) failed like this:
> 
> drivers/net/cnic.c: In function 'cnic_init_storm_conn_bufs':
> drivers/net/cnic.c:1757: error: implicit declaration of functi
> on 'csum_ipv6_magic'
> 
> Caused by commit 71034ba845c9ff219373066f904286c0b7506922 ("cnic: Add
> main functions to support bnx2x devices") which I have reverted for today.

It's because x86 and sparc64 seem to get the ipv6 checksum header
implicitly somehow.

I'll fix this as follows, thanks for the report Stephen:

cnic: Need to include net/ip6_checksum.h

drivers/net/cnic.c: In function 'cnic_init_storm_conn_bufs':
drivers/net/cnic.c:1757: error: implicit declaration of function 'csum_ipv6_magic'

Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
Signed-off-by: David S. Miller <davem@davemloft.net>
---
 drivers/net/cnic.c |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/drivers/net/cnic.c b/drivers/net/cnic.c
index 6e7af7b..333b1d1 100644
--- a/drivers/net/cnic.c
+++ b/drivers/net/cnic.c
@@ -33,6 +33,7 @@
 #include <net/route.h>
 #include <net/ipv6.h>
 #include <net/ip6_route.h>
+#include <net/ip6_checksum.h>
 #include <scsi/iscsi_if.h>
 
 #include "cnic_if.h"
-- 
1.6.4.4
