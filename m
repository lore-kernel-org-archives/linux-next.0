From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build warning after merge of the char-misc tree
Date: Tue, 12 Dec 2017 14:39:10 +1100
Message-ID: <20171212143910.146724d2@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:46303 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1752141AbdLLDjM (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 11 Dec 2017 22:39:12 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Greg KH <greg@kroah.com>, Arnd Bergmann <arnd@arndb.de>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Vasyl Gomonovych <gomonovych@gmail.com>

Hi all,

After merging the char-misc tree, today's linux-next build
(x86_64_allmodconfig) produced this warning:

drivers/misc/mic/vop/vop_vringh.c: In function 'vop_ioctl':
drivers/misc/mic/vop/vop_vringh.c:1001:1: warning: label 'done' defined but not used [-Wunused-label]
 done:
 ^

Introduced by commit

  30b7a2c19e29 ("misc: mic: Use memdup_user() as a cleanup")

-- 
Cheers,
Stephen Rothwell
