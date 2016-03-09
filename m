From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: removal of the rpmsg tree
Date: Wed, 9 Mar 2016 16:28:26 +1100
Message-ID: <20160309162826.60d6b72b@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:41701 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751017AbcCIF22 (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 9 Mar 2016 00:28:28 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Ohad Ben-Cohen <ohad@wizery.com>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

Hi Ohad,

I noticed that the rpmsg tree

  git://git.kernel.org/pub/scm/linux/kernel/git/ohad/rpmsg.git branch for-next

has not been updated since November 2014.  I am going to remove it from
linux-next tomorrow unless I hear that it may be useful.  It can always
be easily added back if it proves useful in the future.

-- 
Cheers,
Stephen Rothwell
