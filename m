From: "John W. Linville" <linville@tuxdriver.com>
Subject: coming conflicts between wireless-2.6 and wireless-next-2.6
Date: Tue, 17 Feb 2009 22:02:46 -0500
Message-ID: <20090218030246.GA551@tuxdriver.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from charlotte.tuxdriver.com ([70.61.120.58]:49732 "EHLO
	smtp.tuxdriver.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751008AbZBRDMX (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 17 Feb 2009 22:12:23 -0500
Received: from uucp by smtp.tuxdriver.com with local-rmail (Exim 4.63)
	(envelope-from <linville@tuxdriver.com>)
	id 1LZcrF-0006Rw-Nz
	for linux-next@vger.kernel.org; Tue, 17 Feb 2009 22:12:21 -0500
Received: from linville-t43.local (linville-t43.local [127.0.0.1])
	by linville-t43.local (8.14.2/8.14.2) with ESMTP id n1I32kxW003593
	for <linux-next@vger.kernel.org>; Tue, 17 Feb 2009 22:02:47 -0500
Received: (from linville@localhost)
	by linville-t43.local (8.14.2/8.14.2/Submit) id n1I32ksJ003592
	for linux-next@vger.kernel.org; Tue, 17 Feb 2009 22:02:46 -0500
Content-Disposition: inline
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: linux-next@vger.kernel.org

There are several conflicts in the latest rounds of the wireless trees.
Most of them are simple.  One of them involves transporting some
changes from "orinoco: do not resgister NULL pm_notifier function"
between drivers/net/orinoco/orinoco.c (which no longer exists in -next)
over to drivers/net/orinoco/main.c.

I have an example 'merge-test' branch in wireless-next-2.6 to show
how I think the conflicts should be resolved -- enjoy! :-)

Thanks,

John
-- 
John W. Linville		Someday the world will need a hero, and you
linville@tuxdriver.com			might be all we have.  Be ready.
