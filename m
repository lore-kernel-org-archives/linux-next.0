From: Thomas Meyer <thomas@m3y3r.de>
Subject: next-20080801: BUG in pktcdvd while mounting dvd
Date: Sun, 03 Aug 2008 14:18:04 +0200
Message-ID: <1217765884.9907.5.camel@dhcppc0>
Mime-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from www17.your-server.de ([213.133.104.17]:48616 "EHLO
	www17.your-server.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753572AbYHCMSB (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Sun, 3 Aug 2008 08:18:01 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Linux-Next <linux-next@vger.kernel.org>, Linux-Kernel <linux-kernel@vger.kernel.org>, alan@lxorguk.ukuu.org.uk, petero2@telia.com

Greetings.

Please have a look at this bug report:

http://kerneloops.org/raw.php?rawid=47211

reverting commit 5b6155ee70e9c4d2ad7e6f514c8eee06e2711c3a fixes the
problem

commit 5b6155ee70e9c4d2ad7e6f514c8eee06e2711c3a
Author: Alan Cox <alan@lxorguk.ukuu.org.uk>
Date:   Fri Jul 4 09:29:16 2008 +0200

    pktcdvd: push BKL down into driver
    
    Push the lock_kernel down into the driver and switch to
unlocked_ioctl
    
    [akpm@linux-foundation.org: build fix]
    Signed-off-by: Alan Cox <alan@redhat.com>
    Acked-by: Peter Osterlund <petero2@telia.com>
    Signed-off-by: Andrew Morton <akpm@linux-foundation.org>
    Signed-off-by: Jens Axboe <jens.axboe@oracle.com>
