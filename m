From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the lblnet tree
Date: Mon, 8 Dec 2008 18:49:57 +1100
Message-ID: <20081208184957.ae6f1726.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:56151 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750848AbYLHHuD (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 8 Dec 2008 02:50:03 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Paul Moore <paul.moore@hp.com>
Cc: linux-next@vger.kernel.org, Hans de Goede <hdegoede@redhat.com>, Jean Delvare <khali@linux-fr.org>

Hi Paul,

Today's linux-next merge of the lblnet tree got a conflict in
Documentation/feature-removal-schedule.txt between commit
839361440c4cf848dddc5705fa4ac7c25d00dddf ("hwmon: Deprecate the fscher
and fscpos drivers") from the jdelvare-hwmon tree and commit
d45075ffb96a78c0f7137cfcec9fe816a6d23cfb ("selinux: Deprecate and
schedule the removal of the the compat_net functionality") from the
lblnet tree.

Just overlapping additions.  I fixed it up (see below) and can carry it
as necessary.
-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

diff --cc Documentation/feature-removal-schedule.txt
index ba66f38,6ae3e9b..0000000
--- a/Documentation/feature-removal-schedule.txt
+++ b/Documentation/feature-removal-schedule.txt
@@@ -339,8 -346,12 +339,20 @@@ Who:	Jean Delvare <khali@linux-fr.org
  
  ---------------------------
  
 +What:	fscher and fscpos drivers
 +When:	June 2009
 +Why:	Deprecated by the new fschmd driver.
 +Who:	Hans de Goede <hdegoede@redhat.com>
 +	Jean Delvare <khali@linux-fr.org>
++
++---------------------------
++
+ What:	SELinux "compat_net" functionality
+ When:	2.6.30 at the earliest
+ Why:	In 2.6.18 the Secmark concept was introduced to replace the "compat_net"
+ 	network access control functionality of SELinux.  Secmark offers both
+ 	better performance and greater flexibility than the "compat_net"
+ 	mechanism.  Now that the major Linux distributions have moved to
+ 	Secmark, it is time to deprecate the older mechanism and start the
+ 	process of removing the old code.
+ Who:	Paul Moore <paul.moore@hp.com>
