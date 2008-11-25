From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: ftrace tree build failure
Date: Tue, 25 Nov 2008 14:07:19 +1100
Message-ID: <20081125140719.03a8cdfb.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:60548 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752606AbYKYDHe (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 24 Nov 2008 22:07:34 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>
Cc: linux-next@vger.kernel.org, Steven Rostedt <srostedt@redhat.com>, "Luis R. Rodriguez" <lrodriguez@atheros.com>, "John W. Linville" <linville@tuxdriver.com>, "David S. Miller" <davem@davemloft.net>

Hi all,

Today's linux-next build (x86_64 allmodconfig) failed like this:

net/wireless/reg.c:348:29: error: macro "if" passed 2 arguments, but takes just 1
net/wireless/reg.c: In function 'ignore_request':
net/wireless/reg.c:349: error: expected '(' before 'return'

This is clearly a bug in in the above file and should be fixed there, so
I have applied the following patch for today.  I expect some patch to fix
this to appear in the wireless-current or net-current tree very soon.

-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

diff --git a/net/wireless/reg.c b/net/wireless/reg.c
index 626dbb6..648c765 100644
--- a/net/wireless/reg.c
+++ b/net/wireless/reg.c
@@ -343,9 +343,7 @@ static int ignore_request(struct wiphy *wiphy, enum reg_set_by set_by,
 				return 0;
 			return -EALREADY;
 		}
-		if (WARN_ON(!is_alpha2_set(alpha2) || !is_an_alpha2(alpha2)),
-				"Invalid Country IE regulatory hint passed "
-				"to the wireless core\n")
+		if (WARN_ON(!is_alpha2_set(alpha2) || !is_an_alpha2(alpha2)))
 			return -EINVAL;
 		/* We ignore Country IE hints for now, as we haven't yet
 		 * added the dot11MultiDomainCapabilityEnabled flag
