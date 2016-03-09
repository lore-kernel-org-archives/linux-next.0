From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: removal of the tiny tree
Date: Wed, 9 Mar 2016 16:32:39 +1100
Message-ID: <20160309163239.080dfa57@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:43301 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751003AbcCIFcl (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 9 Mar 2016 00:32:41 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Josh Triplett <josh@joshtriplett.org>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

Hi Josh,

I noticed that the tiny tree

  git://git.kernel.org/pub/scm/linux/kernel/git/josh/linux.git branch tiny/next

has not been updated since v3.18-rc1.  I am going to remove it from
linux-next tomorrow unless I hear that it may be useful.  It can always
be easily added back if it proves useful in the future.

-- 
Cheers,
Stephen Rothwell
