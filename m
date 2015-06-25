From: Paul Gortmaker <paul.gortmaker@windriver.com>
Subject: [next] nfs update breaks build on sparc
Date: Thu, 25 Jun 2015 11:24:24 -0400
Message-ID: <20150625152424.GC3069@windriver.com>
References: <20150625145528.GA3069@windriver.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail.windriver.com ([147.11.1.11]:47579 "EHLO
	mail.windriver.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750786AbbFYPY0 (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 25 Jun 2015 11:24:26 -0400
Content-Disposition: inline
In-Reply-To: <20150625145528.GA3069@windriver.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Trond Myklebust <trond.myklebust@primarydata.com>
Cc: linux-next@vger.kernel.org, sparclinux@vger.kernel.org


New breakage seen in linux-next today:

ERROR: "__xchg_called_with_bad_pointer" [fs/nfs/flexfilelayout/nfs_layout_flexfiles.ko] undefined!
ERROR: "__cmpxchg_called_with_bad_pointer" [fs/nfs/flexfilelayout/nfs_layout_flexfiles.ko] undefined!
make[2]: *** [__modpost] Error 1
make[1]: *** [modules] Error 2

I tried to reproduce it locally so I could run a bisect,
but it must be toolchain specific because I don't see it.

Paul.
