From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the tty tree with the bluetooth tree
Date: Thu, 13 Apr 2017 13:36:31 +1000
Message-ID: <20170413133631.2fcefdfa@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:48349 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1755400AbdDMDge (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Wed, 12 Apr 2017 23:36:34 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Greg KH <greg@kroah.com>, Gustavo Padovan <gustavo@padovan.org>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Sebastian Reichel <sre@kernel.org>, Marcel Holtmann <marcel@holtmann.org>, Andrey Smirnov <andrew.smirnov@gmail.com>

Hi Greg,

Today's linux-next merge of the tty tree got a conflict in:

  include/linux/serdev.h

between commits:

  b3f80c8f75ef ("serdev: add serdev_device_wait_until_sent")
  5659dab26f09 ("serdev: implement get/set tiocm")

from the bluetooth tree and commit:

  6fe729c4bdae ("serdev: Add serdev_device_write subroutine")

from the tty tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

-- 
Cheers,
Stephen Rothwell

diff --cc include/linux/serdev.h
index 37395b8eb8f1,0beaff886992..000000000000
--- a/include/linux/serdev.h
+++ b/include/linux/serdev.h
@@@ -191,10 -190,8 +195,11 @@@ int serdev_device_open(struct serdev_de
  void serdev_device_close(struct serdev_device *);
  unsigned int serdev_device_set_baudrate(struct serdev_device *, unsigned int);
  void serdev_device_set_flow_control(struct serdev_device *, bool);
 +void serdev_device_wait_until_sent(struct serdev_device *, long);
 +int serdev_device_get_tiocm(struct serdev_device *);
 +int serdev_device_set_tiocm(struct serdev_device *, int, int);
- int serdev_device_write_buf(struct serdev_device *, const unsigned char *, size_t);
+ void serdev_device_write_wakeup(struct serdev_device *);
+ int serdev_device_write(struct serdev_device *, const unsigned char *, size_t, unsigned long);
  void serdev_device_write_flush(struct serdev_device *);
  int serdev_device_write_room(struct serdev_device *);
  
@@@ -231,16 -228,8 +236,17 @@@ static inline unsigned int serdev_devic
  	return 0;
  }
  static inline void serdev_device_set_flow_control(struct serdev_device *sdev, bool enable) {}
 +static inline void serdev_device_wait_until_sent(struct serdev_device *sdev, long timeout) {}
 +static inline int serdev_device_get_tiocm(struct serdev_device *serdev)
 +{
 +	return -ENOTSUPP;
 +}
 +static inline int serdev_device_set_tiocm(struct serdev_device *serdev, int set, int clear)
 +{
 +	return -ENOTSUPP;
 +}
- static inline int serdev_device_write_buf(struct serdev_device *sdev, const unsigned char *buf, size_t count)
+ static inline int serdev_device_write(struct serdev_device *sdev, const unsigned char *buf,
+ 				      size_t count, unsigned long timeout)
  {
  	return -ENODEV;
  }
