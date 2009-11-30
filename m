From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the sysctl tree with the net tree
Date: Mon, 30 Nov 2009 16:44:15 +1100
Message-ID: <20091130164415.f418834b.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:37410 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750727AbZK3FoI (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 30 Nov 2009 00:44:08 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: "Eric W. Biederman" <ebiederm@xmission.com>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Vlad Yasevich <vladislav.yasevich@hp.com>, "David S. Miller" <davem@davemloft.net>

Hi Eric,

Today's linux-next merge of the sysctl tree got a conflict in
net/sctp/sysctl.c between commit 90f2f5318b3a5b0898fef0fec9b91376c7de7a2c
("sctp: Update SWS avaoidance receiver side algorithm") from the net tree
and commit f8572d8f2a2ba75408b97dc24ef47c83671795d7 ("sysctl net: Remove
unused binary sysctl code") from the sysctl tree.

I fixed it up (see below) and can carry the fix as necessary.  I also
removed the strategy member from the new added ctl_table entry.
-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

diff --cc net/sctp/sysctl.c
index ae03ded,d50a042..0000000
--- a/net/sctp/sysctl.c
+++ b/net/sctp/sysctl.c
@@@ -285,19 -241,7 +242,17 @@@ static ctl_table sctp_table[] = 
  		.extra1		= &zero,
  		.extra2		= &addr_scope_max,
  	},
 +	{
- 		.ctl_name	= CTL_UNNUMBERED,
 +		.procname	= "rwnd_update_shift",
 +		.data		= &sctp_rwnd_upd_shift,
 +		.maxlen		= sizeof(int),
 +		.mode		= 0644,
- 		.proc_handler	= &proc_dointvec_minmax,
- 		.strategy	= &sysctl_intvec,
++		.proc_handler	= proc_dointvec_minmax,
 +		.extra1		= &one,
 +		.extra2		= &rwnd_scale_max,
 +	},
 +
- 	{ .ctl_name = 0 }
+ 	{ }
  };
  
  static struct ctl_path sctp_path[] = {
