From: Harvey Harrison <harvey.harrison@gmail.com>
Subject: [PATCH] net: make __skb_splice_bits static
Date: Wed, 16 Jul 2008 12:51:20 -0700
Message-ID: <1216237880.28841.20.camel@brick>
Mime-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
Return-path: <netdev-owner@vger.kernel.org>
Sender: netdev-owner@vger.kernel.org
To: David Miller <davem@davemloft.net>
Cc: linux-next <linux-next@vger.kernel.org>, linux-netdev <netdev@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

net/core/skbuff.c:1335:5: warning: symbol '__skb_splice_bits' was not declared. Should it be static?

Signed-off-by: Harvey Harrison <harvey.harrison@gmail.com>
---
Appeared between next-20080715->next-20080716

 net/core/skbuff.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/net/core/skbuff.c b/net/core/skbuff.c
index 48a4372..e411567 100644
--- a/net/core/skbuff.c
+++ b/net/core/skbuff.c
@@ -1332,7 +1332,7 @@ static inline int __splice_segment(struct page *page, unsigned int poff,
  * Map linear and fragment data from the skb to spd. It reports failure if the
  * pipe is full or if we already spliced the requested length.
  */
-int __skb_splice_bits(struct sk_buff *skb, unsigned int *offset,
+static int __skb_splice_bits(struct sk_buff *skb, unsigned int *offset,
 		      unsigned int *len,
 		      struct splice_pipe_desc *spd)
 {
-- 
1.5.6.3.499.geae9



