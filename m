From: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
Subject: Replace in linux-next the xen, xen-two, xen-arm with xen/tip.git
 tree instead.
Date: Tue, 30 Jul 2013 15:53:16 -0400
Message-ID: <20130730195316.GA12124@phenom.dumpdata.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from userp1040.oracle.com ([156.151.31.81]:27464 "EHLO
	userp1040.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755219Ab3G3Txg (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 30 Jul 2013 15:53:36 -0400
Content-Disposition: inline
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: sfr@canb.auug.org.au, Jeremy Fitzhardinge <jeremy@goop.org>, xen-devel@lists.xensource.com, Stefano Stabellini <stefano.stabellini@eu.citrix.com>, david.vrabel@citrix.com, boris.ostrovsky@oracle.com
Cc: linux-kernel@vger.kernel.org, linux-next@vger.kernel.org

Hey,

I was wondering if it would be possible to remove from linux-next
the three xen trees and instead use a combined tree, similar to the
x86 tip (so the various maintainers share it)?

The ones that would be removed are:

xen		git	git://git.kernel.org/pub/scm/linux/kernel/git/jeremy/xen.git#upstream/xen
xen-two		git	git://git.kernel.org/pub/scm/linux/kernel/git/konrad/xen.git#linux-next
xen-arm		git	git://git.kernel.org/pub/scm/linux/kernel/git/sstabellini/xen.git#linux-next

And instead it would be pulled from:

xen-tip		git	git://git.kernel.org/pub/scm/linux/kernel/git/xen/tip.git#linux-next

I presume you need Ack's from all of us (so Jeremy and Stefano) so CC-ing them here.

And Acked-by: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
