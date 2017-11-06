From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build failure after merge of the crypto tree
Date: Mon, 6 Nov 2017 11:25:21 +1100
Message-ID: <20171106112521.51e44f03@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:39075 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1750785AbdKFAZX (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Sun, 5 Nov 2017 19:25:23 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Herbert Xu <herbert@gondor.apana.org.au>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Boris BREZILLON <boris.brezillon@free-electrons.com>

Hi Herbert,

After merging the crypto tree, today's linux-next build (arm
multi_v7_defconfig) failed like this:

drivers/crypto/marvell/marvell-cesa: struct platform_device_id is 24 bytes.  The last of 1 is:
0x6d 0x76 0x5f 0x63 0x72 0x79 0x70 0x74 0x6f 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 
FATAL: drivers/crypto/marvell/marvell-cesa: struct platform_device_id is not terminated with a NULL entry!

Caused by commit

  7b0c3d693ce6 ("crypto: marvell - Add a platform_device_id table")

I have used the crypto tree from next-20171103 for today.

-- 
Cheers,
Stephen Rothwell
