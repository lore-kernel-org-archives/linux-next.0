From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the net tree with the tip-core tree
Date: Wed, 25 Mar 2009 14:28:15 +1100
Message-ID: <20090325142815.1738f444.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:42320 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750768AbZCYD2Y (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 24 Mar 2009 23:28:24 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: David Miller <davem@davemloft.net>
Cc: linux-next@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>, Jan Engelhardt <jengelh@medozas.de>, Patrick McHardy <kaber@trash.net>

Hi David,

Today's linux-next merge of the net tree got conflicts in
include/linux/netfilter/xt_limit.h and
include/linux/netfilter/xt_statistic.h between commit
cf7ea4cbd015402cc6e7204962c978a3b052ecd2 ("make netfilter use strict
integer types") from the tip-core tree and commit
acc738fec03bdaa5b77340c32a82fbfedaaabef0 ("netfilter: xtables: avoid
pointer to self") from the net tree.

I fixed them up (see below) and can carry the fix as necessary.
-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

diff --cc include/linux/netfilter/xt_limit.h
index 190e98b,fda222c..0000000
--- a/include/linux/netfilter/xt_limit.h
+++ b/include/linux/netfilter/xt_limit.h
@@@ -9,15 -9,14 +11,14 @@@ struct xt_limit_priv
  /* 1/10,000 sec period => max of 10,000/sec.  Min rate is then 429490
     seconds, or one every 59 hours. */
  struct xt_rateinfo {
 -	u_int32_t avg;    /* Average secs between packets * scale */
 -	u_int32_t burst;  /* Period multiplier for upper limit. */
 +	__u32 avg;    /* Average secs between packets * scale */
 +	__u32 burst;  /* Period multiplier for upper limit. */
  
  	/* Used internally by the kernel */
- 	unsigned long prev;
- 	__u32 credit;
+ 	unsigned long prev; /* moved to xt_limit_priv */
 -	u_int32_t credit; /* moved to xt_limit_priv */
 -	u_int32_t credit_cap, cost;
++	__u32 credit; /* moved to xt_limit_priv */
 +	__u32 credit_cap, cost;
  
- 	/* Ugly, ugly fucker. */
- 	struct xt_rateinfo *master;
+ 	struct xt_limit_priv *master;
  };
  #endif /*_XT_RATE_H*/
diff --cc include/linux/netfilter/xt_statistic.h
index 095f3c6,8f521ab..0000000
--- a/include/linux/netfilter/xt_statistic.h
+++ b/include/linux/netfilter/xt_statistic.h
@@@ -15,21 -13,22 +15,22 @@@ enum xt_statistic_flags 
  };
  #define XT_STATISTIC_MASK		0x1
  
+ struct xt_statistic_priv;
+ 
  struct xt_statistic_info {
 -	u_int16_t			mode;
 -	u_int16_t			flags;
 +	__u16			mode;
 +	__u16			flags;
  	union {
  		struct {
 -			u_int32_t	probability;
 +			__u32	probability;
  		} random;
  		struct {
 -			u_int32_t	every;
 -			u_int32_t	packet;
 -			u_int32_t	count; /* unused */
 +			__u32	every;
 +			__u32	packet;
- 			/* Used internally by the kernel */
- 			__u32	count;
++			__u32	count; /* unused */
  		} nth;
  	} u;
- 	struct xt_statistic_info	*master __attribute__((aligned(8)));
+ 	struct xt_statistic_priv *master __attribute__((aligned(8)));
  };
  
  #endif /* _XT_STATISTIC_H */
