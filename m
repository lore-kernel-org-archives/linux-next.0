From: Paul Gortmaker <paul.gortmaker@windriver.com>
Subject: Kconfig HID dependency error from roccat merge
Date: Tue, 3 Jul 2012 00:29:20 -0400
Message-ID: <20120703042920.GC7328@windriver.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail.windriver.com ([147.11.1.11]:57963 "EHLO
	mail.windriver.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750735Ab2GCE31 (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 3 Jul 2012 00:29:27 -0400
Content-Disposition: inline
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Jiri Kosina <jkosina@suse.cz>
Cc: linux-next@vger.kernel.org

Hi Jiri,

This is showing up in all the linux-next builds since Monday.

-------------
drivers/hid/Kconfig:7:error: recursive dependency detected!
drivers/hid/Kconfig:7:	symbol HID is selected by USB_HID
drivers/hid/usbhid/Kconfig:4:	symbol USB_HID depends on HID
------------

It can be easily reproduced by doing a simple x86-64 defconfig.
I've traced (bisected) it to this:

-------------
commit 71e9fd494490cdb7ae9b7f7c16ee5dd5760bbc23
Merge: ccfa24b 7392d73
Author: Jiri Kosina <jkosina@suse.cz>
Date:   Fri Jun 29 15:02:22 2012 +0200

    Merge branch 'roccat' into for-next

    Conflicts:
        drivers/hid/Kconfig
-------------

Please have a look at it when you have a chance.

Thanks,
Paul.
