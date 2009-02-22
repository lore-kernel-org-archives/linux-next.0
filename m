From: Richard Kennedy <richard@rsk.demon.co.uk>
Subject: staging/wlan-ng: please revert commit 2ba4564cd from
 linux-next-20090220
Date: Sun, 22 Feb 2009 11:42:15 +0000
Message-ID: <1235302935.2840.13.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from anchor-post-1.mail.demon.net ([195.173.77.132]:37166 "EHLO
	anchor-post-1.mail.demon.net" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1753471AbZBVLmR (ORCPT
	<rfc822;linux-next@vger.kernel.org>);
	Sun, 22 Feb 2009 06:42:17 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: jmm@debian.org
Cc: linux-next@vger.kernel.org

Hi guys,
this commit removes the do_ioctl function from p80211netdev.c which we
need as it's the only way to load the firmware right now!

can you revert it please ?

full commit details :-
commit 2ba4564cd29a502e79fae505c175470ace22b287
Author: Moritz Muehlenhoff <jmm@debian.org>
Date:   Wed Feb 18 19:50:08 2009 +0100

    Staging: wlan-ng: Remove more dead code from p80211netdev.c


BTW it would be a lot easier if these patches were posted to a list
somewhere so we could see what you are trying to do.

thanks
Richard
