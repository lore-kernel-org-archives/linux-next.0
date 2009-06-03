From: Randy Dunlap <randy.dunlap@oracle.com>
Subject: Re: linux-next: Tree for June 3 (rfkill)
Date: Wed, 03 Jun 2009 08:22:33 -0700
Message-ID: <4A269539.8020607@oracle.com>
References: <20090603190952.2dd0cc70.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from acsinet11.oracle.com ([141.146.126.233]:33225 "EHLO
	acsinet11.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1757352AbZFCPUw (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 3 Jun 2009 11:20:52 -0400
In-Reply-To: <20090603190952.2dd0cc70.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, johannes@sipsolutions.net, "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>

Stephen Rothwell wrote:
> Hi all,
> 
> Looks like a real rush since -rc7 ...


CFG80211=y
MAC80211=y
RFKILL=m

net/built-in.o: In function `cfg80211_netdev_notifier_call':
core.c:(.text+0xa678b): undefined reference to `rfkill_blocked'
net/built-in.o: In function `cfg80211_dev_free':
(.text+0xa67e2): undefined reference to `rfkill_destroy'
net/built-in.o: In function `cfg80211_rfkill_sync_work':
core.c:(.text+0xa686e): undefined reference to `rfkill_blocked'
net/built-in.o: In function `wiphy_new':
(.text+0xa69f2): undefined reference to `rfkill_alloc'
net/built-in.o: In function `wiphy_rfkill_start_polling':
(.text+0xa6bd2): undefined reference to `rfkill_resume_polling'
net/built-in.o: In function `wiphy_rfkill_stop_polling':
(.text+0xa6bdf): undefined reference to `rfkill_pause_polling'
net/built-in.o: In function `wiphy_unregister':
(.text+0xa6bf4): undefined reference to `rfkill_unregister'
net/built-in.o: In function `wiphy_rfkill_set_hw_state':
(.text+0xa6c64): undefined reference to `rfkill_set_hw_state'
net/built-in.o: In function `wiphy_register':
(.text+0xa6db4): undefined reference to `rfkill_register'
net/built-in.o: In function `cfg80211_wext_giwtxpower':
(.text+0xb01e9): undefined reference to `rfkill_blocked'
net/built-in.o: In function `cfg80211_wext_siwtxpower':
(.text+0xb0cf3): undefined reference to `rfkill_set_sw_state'
net/built-in.o: In function `cfg80211_wext_siwtxpower':
(.text+0xb0d1f): undefined reference to `rfkill_set_sw_state'


-- 
~Randy
LPC 2009, Sept. 23-25, Portland, Oregon
http://linuxplumbersconf.org/2009/
