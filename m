From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: removal of the mips-fixes tree
Date: Wed, 9 Mar 2016 16:20:35 +1100
Message-ID: <20160309162035.43c40a2d@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:41858 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750710AbcCIFUh (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 9 Mar 2016 00:20:37 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: James Hogan <james.hogan@imgtec.com>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

Hi James,

I noticed that the mips-fixes tree

  git://git.kernel.org/pub/scm/linux/kernel/git/jhogan/mips.git branch mips-fixes

has not been updated since v3.16-rc5.  I am going to remove it from
linux-next tomorrow unless I hear that it may be useful.  It can always
be easily added back if it proves useful in the future.

-- 
Cheers,
Stephen Rothwell
