From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build warning after merge of the overlayfs tree
Date: Thu, 9 Nov 2017 09:33:06 +1100
Message-ID: <20171109093306.178c9ad2@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:52635 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1752694AbdKHWdJ (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Wed, 8 Nov 2017 17:33:09 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Miklos Szeredi <miklos@szeredi.hu>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Chandan Rajendra <chandan@linux.vnet.ibm.com>

Hi Miklos,

After merging the overlayfs tree, today's linux-next build (powerpc
ppc64_defconfig) produced this warning:

fs/overlayfs/super.c: In function 'ovl_fill_super':
fs/overlayfs/super.c:1070:25: warning: 'numlower' may be used uninitialized in this function [-Wmaybe-uninitialized]
  unsigned int stacklen, numlower, i;
                         ^
fs/overlayfs/super.c:1069:15: warning: 'stack' may be used uninitialized in this function [-Wmaybe-uninitialized]
  struct path *stack;
               ^

-- 
Cheers,
Stephen Rothwell
