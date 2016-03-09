From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: removal of the lblnet tree
Date: Wed, 9 Mar 2016 16:18:35 +1100
Message-ID: <20160309161835.1c57045d@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:35679 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750942AbcCIFSh (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 9 Mar 2016 00:18:37 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Paul Moore <paul@paul-moore.com>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

Hi Paul,

I noticed that the lblnet tree

  git://git.infradead.org/users/pcmoore/lblnet branch next

has not been updated since v3.18.  I am going to remove it from
linux-next tomorrow unless I hear that it may be useful.  It can always
be easily added back if it proves useful in the future.

-- 
Cheers,
Stephen Rothwell
