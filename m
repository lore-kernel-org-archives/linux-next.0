From: Sage Weil <sage@inktank.com>
Subject: ceph in linux-next
Date: Tue, 18 Jun 2013 10:12:30 -0700 (PDT)
Message-ID: <alpine.DEB.2.00.1306181009140.31132@cobra.newdream.net>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-next-owner@vger.kernel.org>
Received: from cobra.newdream.net ([66.33.216.30]:40728 "EHLO
	cobra.newdream.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751301Ab3FRRMb (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 18 Jun 2013 13:12:31 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: sfr@canb.auug.org.au
Cc: linux-next@vger.kernel.org, ceph-devel@vger.kernel.org

Hi Stephen,

A while back I asked to switch the ceph branch in linux-next from master 
to testing, but upon further reflection I'd like to switch it back: we're 
hitting various cases where we want to carry patches that we're running 
through our QA that aren't destined for the next merge window.

That is,

  git://github.com/ceph/ceph-client.git master

Thanks!
sage
