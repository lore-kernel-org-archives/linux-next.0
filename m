From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the sysctl tree with the net tree
Date: Tue, 17 Nov 2009 19:04:01 +1100
Message-ID: <20091117190401.94f6b5cb.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:45914 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753311AbZKQID5 (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 17 Nov 2009 03:03:57 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: "Eric W. Biederman" <ebiederm@xmission.com>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Octavian Purdila <opurdila@ixiacom.com>, Cosmin Ratiu <cratiu@ixiacom.com>, "David S. Miller" <davem@davemloft.net>

Hi Eric,

Today's linux-next merge of the sysctl tree got a conflict in
net/ipv6/addrconf.c between commit
f7734fdf61ec6bb848e0bafc1fb8bad2c124bb50 ("make TLLAO option for NA
packets configurable") from the net tree and commit
f8572d8f2a2ba75408b97dc24ef47c83671795d7 ("sysctl net: Remove unused
binary sysctl code") from the sysctl tree.

I fixed it up (see below) including removing the new ctl_name (thanks for
the heads up, Eric).   I can carry this fixup as necessary.
-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

diff --cc net/ipv6/addrconf.c
index 522bdc7,f918399..0000000
--- a/net/ipv6/addrconf.c
+++ b/net/ipv6/addrconf.c
@@@ -4388,15 -4285,7 +4320,14 @@@ static struct addrconf_sysctl_tabl
  			.proc_handler	=	proc_dointvec,
  		},
  		{
- 			.ctl_name       = CTL_UNNUMBERED,
 +			.procname       = "force_tllao",
 +			.data           = &ipv6_devconf.force_tllao,
 +			.maxlen         = sizeof(int),
 +			.mode           = 0644,
 +			.proc_handler   = proc_dointvec
 +		},
 +		{
- 			.ctl_name	=	0,	/* sentinel */
+ 			/* sentinel */
  		}
  	},
  };
