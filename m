From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: removal of the bcm2835 tree
Date: Wed, 9 Mar 2016 16:14:56 +1100
Message-ID: <20160309161456.0ae14e0f@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:48645 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751124AbcCIFO6 (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 9 Mar 2016 00:14:58 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Warren <swarren@wwwdotorg.org>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

Hi Stephen,

I noticed that the bcm2835 tree

  git://git.kernel.org/pub/scm/linux/kernel/git/rpi/linux-rpi.git branch for-next

has not been updated since v3.18.  I am going to remove it from
linux-next tomorrow unless I hear that it may be useful.  It can always
be easily added back if it proves useful in the future.

-- 
Cheers,
Stephen Rothwell
