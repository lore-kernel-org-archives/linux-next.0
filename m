From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: removal of the kgdb tree
Date: Wed, 9 Mar 2016 16:16:50 +1100
Message-ID: <20160309161650.2477ec9e@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:42822 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750710AbcCIFQw (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 9 Mar 2016 00:16:52 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Jason Wessel <jason.wessel@windriver.com>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

Hi Jason,

I noticed that the kgdb tree

  git://git.kernel.org/pub/scm/linux/kernel/git/jwessel/kgdb.git branch kgdb-next

has not been updated since March 2015.  I am going to remove it from
linux-next tomorrow unless I hear that it may be useful.  It can always
be easily added back if it proves useful in the future.

-- 
Cheers,
Stephen Rothwell
