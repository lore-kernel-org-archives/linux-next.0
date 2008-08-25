From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the ttydev tree
Date: Mon, 25 Aug 2008 18:24:40 +1000
Message-ID: <20080825182440.7973dba6.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:52650 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753287AbYHYIYq (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 25 Aug 2008 04:24:46 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Alan Cox <alan@lxorguk.ukuu.org.uk>
Cc: linux-next@vger.kernel.org, Jiri Slaby <jirislaby@gmail.com>, Jiri Kosina <jikos@jikos.cz>

Hi Alan,

Today's linux-next merge of the ttydev tree got a conflict in
Documentation/feature-removal-schedule.txt between commit
9bfd67f96a92f8853e77e028acfa93e737ffe2ad ("HID: add compat support") from
the hid tree and commit 4895f0191a229a864c701c5f38a967fbdd15a0e0
("mcfserial-goes-byebye") from the ttydev tree.

Just an overlapping add/remove.  I fixed it up (see below) and can carry
it.
-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

diff --cc Documentation/feature-removal-schedule.txt
index 81fc817,7781bf8..0000000
--- a/Documentation/feature-removal-schedule.txt
+++ b/Documentation/feature-removal-schedule.txt
@@@ -265,22 -265,7 +265,14 @@@ Why:	replaced by allowdac and no dac co
  Who:	Glauber Costa <gcosta@redhat.com>
  
  ---------------------------
- 
- What:	old style serial driver for ColdFire (CONFIG_SERIAL_COLDFIRE)
- When:	2.6.28
- Why:	This driver still uses the old interface and has been replaced
- 	by CONFIG_SERIAL_MCF.
- Who:	Sebastian Siewior <sebastian@breakpoint.cc>
- 
- ---------------------------
  
 +What:	remove HID compat support
 +When:	2.6.29
 +Why:	needed only as a temporary solution until distros fix themselves up
 +Who:	Jiri Slaby <jirislaby@gmail.com>
 +
 +---------------------------
 +
  What:	/sys/o2cb symlink
  When:	January 2010
  Why:	/sys/fs/o2cb is the proper location for this information - /sys/o2cb
