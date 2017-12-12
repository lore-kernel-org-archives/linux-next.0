From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: error while fetching the spi-nor tree
Date: Wed, 13 Dec 2017 07:58:45 +1100
Message-ID: <20171213075845.5923cc80@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:34727 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1752175AbdLLU6s (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 12 Dec 2017 15:58:48 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

Hi Cyrille,

Fetching the spi-nor tree
(git://git.infradead.org/l2-mtd.git#spi-nor/next) this morning, I get
theses errors:

remote: error: Could not read 6e408e3aa1643624ea7da50ad5b27a226a16a654
remote: fatal: bad tree object 6e408e3aa1643624ea7da50ad5b27a226a16a654
remote: aborting due to possible repository corruption on the remote side.
fatal: protocol error: bad pack header

I wil continue to use the previously fetched tree.

-- 
Cheers,
Stephen Rothwell
