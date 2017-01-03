From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build failure after merge of the swiotlb tree
Date: Wed, 4 Jan 2017 10:57:49 +1100
Message-ID: <20170104105749.6f305c35@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:44971 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1752975AbdACX7i (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 3 Jan 2017 18:59:38 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

Hi Konrad,

After merging the swiotlb tree, today's linux-next build (powerpc
ppc64_defconfig) failed like this:

net/bridge/br_input.o: In function `.swiotlb_max_segment':
(.text+0x780): multiple definition of `.swiotlb_max_segment'
net/bridge/br.o:br.c:(.text+0x3c0): first defined here

and many, many more :-(

Caused by commit

  f196f1294fd2 ("swiotlb: Export swiotlb_max_segment to users")

Forgotten "static nline" in include/linux/swiotlb.h ...

I have used the swiotlb tree from next-20170103 for today.

-- 
Cheers,
Stephen Rothwell
