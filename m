From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: removal of the llvmlinux tree
Date: Wed, 9 Mar 2016 15:20:52 +1100
Message-ID: <20160309152052.169836cf@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:60224 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750867AbcCIEUz (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 8 Mar 2016 23:20:55 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Behan Webster <behanw@converseincode.com>, llvmlinux@lists.linuxfoundation.org
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

Hi all,

I noticed that the llvmlinux tree:

  git://git.linuxfoundation.org/llvmlinux/kernel.git branch for-next

has not been updated since November 2014.  I am going to remove it from
linux-next tomorrow unless you think it should be retained.  It can
always be added again later if it is going to be used again.

-- 
Cheers,
Stephen Rothwell
