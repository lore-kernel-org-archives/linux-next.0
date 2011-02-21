From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the trivial tree with the
 jdelvare-hwmon tree
Date: Mon, 21 Feb 2011 14:43:00 +1100
Message-ID: <20110221144300.9509d241.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:35293 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1755671Ab1BUDnG (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Sun, 20 Feb 2011 22:43:06 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Jiri Kosina <jkosina@suse.cz>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Harry Wei <jiaweiwei.xiyou@gmail.com>, Jean Delvare <khali@linux-fr.org>

Hi Jiri,

Today's linux-next merge of the trivial tree got a conflict in
MAINTAINERS between commit d8f00f1b531b25ac96a39385617ff1718bc8474b
("Move lis3lv02d drivers to drivers/misc") from the jdelvare-hwmon tree
and commit a23ce6da9677d245aa0aadc99f4197030350ab54 ("MAINTAINERS: fix
sorting") from the trivial tree.

I fixed it up (see below) and can carry the fix as necessary.
-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

diff --cc MAINTAINERS
index af304df,b6d6d51..0000000
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@@ -3887,6 -3881,12 +3888,12 @@@ L:	linux-security-module@vger.kernel.or
  T:	git git://git.kernel.org/pub/scm/linux/kernel/git/chrisw/lsm-2.6.git
  S:	Supported
  
+ LIS3LV02D ACCELEROMETER DRIVER
+ M:	Eric Piel <eric.piel@tremplin-utc.net>
+ S:	Maintained
 -F:	Documentation/hwmon/lis3lv02d
 -F:	drivers/hwmon/lis3lv02d.*
++F:	Documentation/misc-devices/lis3lv02d
++F:	drivers/misc/lis3lv02d/
+ 
  LLC (802.2)
  M:	Arnaldo Carvalho de Melo <acme@ghostprotocols.net>
  S:	Maintained
