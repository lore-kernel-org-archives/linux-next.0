From: Guenter Roeck <linux@roeck-us.net>
Subject: Build errors in -next due to 'xfs: skip unallocated regions of inode
 chunks in xfs_ifree_cluster()'
Date: Fri, 05 Jun 2015 07:57:10 -0700
Message-ID: <5571B8C6.40109@roeck-us.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from bh-25.webhostbox.net ([208.91.199.152]:51817 "EHLO
	bh-25.webhostbox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751877AbbFEO5N (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Fri, 5 Jun 2015 10:57:13 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Brian Foster <bfoster@redhat.com>
Cc: "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Dave Chinner <david@fromorbit.com>

i386 builds (and probably others) fail in next-20150604 with:

fs/built-in.o: In function `xfs_ifree_cluster':
/opt/buildbot/slave/next-next/build/fs/xfs/xfs_inode.c:2268: undefined reference to `__umoddi3'

Guenter
