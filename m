From: "Michael S. Tsirkin" <mst@redhat.com>
Subject: vhost tree for linux-next
Date: Thu, 24 Nov 2011 22:38:44 +0200
Message-ID: <20111124203843.GC4873@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mx1.redhat.com ([209.132.183.28]:53279 "EHLO mx1.redhat.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753108Ab1KXUhN (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 24 Nov 2011 15:37:13 -0500
Content-Disposition: inline
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: linux-next@vger.kernel.org
Cc: sfr@canb.auug.org.au

I normally merge things through Dave, Rusty, Jesse or Jens,
not directly to Linus. However, sometimes there's a large change
(for example, my recent RFC for pci_iomap changes)
where estimating how it interacts with other platforms and planned
changes in the next kernel would be beneficial.

For this purpose, it would be helpful if my tree were added to linux-next.
The tree is:
git://git.kernel.org/pub/scm/linux/kernel/git/mst/vhost.git linux-next

Could you do this please?

Thanks!

-- 
MST
