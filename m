From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the trivial tree with the net tree
Date: Tue, 24 Nov 2009 17:14:59 +1100
Message-ID: <20091124171459.88cb0c0d.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner+glk-linux-kernel-3=40m.gmane.org-S1757493AbZKXGO6@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Jiri Kosina <jkosina@suse.cz>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, =?UTF-8?B?IkFuZHLDqSBHb2RkYXJkIFJvc2Ei?= <andre.goddard@gmail.com>, Bruce Allan <bruce.w.allan@intel.com>, "David S. Miller" <davem@davemloft.net>
List-Id: linux-next.vger.kernel.org

Hi Jiri,

Today's linux-next merge of the trivial tree got a conflict in
drivers/net/e1000e/lib.c between commit
3bb99fe226ead584a4db674dab546689f705201f ("e1000e: consolidate two dbug
macros into one simpler one") from the net tree and commit
52692d35d013e221137b2fbe800e3e6776111821 ("tree-wide: fix assorted typos
all over the place") from the trivial tree.

I fixed it up (see below) and can carry the fix as necessary.
-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

diff --cc drivers/net/e1000e/lib.c
index f690a10,b065ba4..0000000
--- a/drivers/net/e1000e/lib.c
+++ b/drivers/net/e1000e/lib.c
@@@ -563,11 -570,11 +563,11 @@@ s32 e1000e_check_for_serdes_link(struc
  			if (rxcw & E1000_RXCW_SYNCH) {
  				if (!(rxcw & E1000_RXCW_IV)) {
  					mac->serdes_has_link = true;
 -					hw_dbg(hw, "SERDES: Link up - autoneg "
 +					e_dbg("SERDES: Link up - autoneg "
- 					   "completed sucessfully.\n");
+ 					   "completed successfully.\n");
  				} else {
  					mac->serdes_has_link = false;
 -					hw_dbg(hw, "SERDES: Link down - invalid"
 +					e_dbg("SERDES: Link down - invalid"
  					   "codewords detected in autoneg.\n");
  				}
  			} else {
