From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: removal of the apm tree
Date: Wed, 9 Mar 2016 16:11:07 +1100
Message-ID: <20160309161107.2bafcd2d@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:52135 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750710AbcCIFLJ (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 9 Mar 2016 00:11:09 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Jiri Kosina <jikos@kernel.org>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

Hi Jiri,

I noticed that the apm tree

  git://git.kernel.org/pub/scm/linux/kernel/git/jikos/apm.git branch for-next

has not been updtaed since July 2014.  I am going to remove it from
linux-next tomorrow unless I hear that it may be useful.  It can always
be easily added back if it proves useful in the future.

-- 
Cheers,
Stephen Rothwell
