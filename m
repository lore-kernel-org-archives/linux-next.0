From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build warning after merge of the mac80211 tree
Date: Fri, 29 Jan 2016 15:06:01 +1100
Message-ID: <20160129150601.16f80af5@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:38724 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751532AbcA2EGD (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 28 Jan 2016 23:06:03 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Johannes Berg <johannes@sipsolutions.net>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Johannes Berg <johannes.berg@intel.com>

Hi Johannes,

After merging the mac80211 tree, today's linux-next build (i386 defconfig)
produced this warning:

In file included from include/net/wext.h:4:0,
                 from net/socket.c:97:
include/net/iw_handler.h:446:13: warning: 'wireless_nlevent_flush' defined but not used [-Wunused-function]
 static void wireless_nlevent_flush(void) {}
             ^

Introduced by commit

  3730abeab65b ("cfg80211/wext: fix message ordering")

Missing inline :-(

-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
