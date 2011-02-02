From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build failure after merge of the md-current tree
Date: Wed, 2 Feb 2011 11:25:19 +1100
Message-ID: <20110202112519.7a4d2bd3.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:57028 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751965Ab1BBAZX (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 1 Feb 2011 19:25:23 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Neil Brown <neilb@suse.de>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

Hi Neil,

After merging the md-current tree, today's linux-next build (powerpc
ppc64_defconfig) failed like this:

drivers/md/md.c: In function 'slot_store':
drivers/md/md.c:2466: error: 'mddev' undeclared (first use in this function)

Caused by commit 778f14598b2924e92790ddd8a167424d2894ffb0 ("md: Don't
allow slot_store while resync/recovery is happening").

Please build test your tree before publishing it.

I have used the md-current tree from next-20110201 for today.

-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/
