From: "Zhang, Yanmin" <yanmin.zhang@intel.com>
Subject: RE: linux-next: build failure after merge of the ia64 tree
Date: Mon, 31 Mar 2014 01:21:48 +0000
Message-ID: <144086DDB7BB6D429C79280EB1C804D40A79EB0C@SHSMSX104.ccr.corp.intel.com>
References: <20140331110756.c4f9b2e9f9f4874e0d90da11@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mga02.intel.com ([134.134.136.20]:21011 "EHLO mga02.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751866AbaCaBVx convert rfc822-to-8bit (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Sun, 30 Mar 2014 21:21:53 -0400
In-Reply-To: <20140331110756.c4f9b2e9f9f4874e0d90da11@canb.auug.org.au>
Content-Language: en-US
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>, "Luck, Tony" <tony.luck@intel.com>
Cc: "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "Liu, ShuoX" <shuox.liu@intel.com>

Sorry. We would fix it ASAP.

Yanmin

-----Original Message-----
From: Stephen Rothwell [mailto:sfr@canb.auug.org.au] 
Sent: Monday, March 31, 2014 8:08 AM
To: Luck, Tony
Cc: linux-next@vger.kernel.org; linux-kernel@vger.kernel.org; Liu, ShuoX; Zhang, Yanmin
Subject: linux-next: build failure after merge of the ia64 tree

Hi all,

After merging the ia64 tree, today's linux-next build (x86_64
allmodconfig) failed like this:

fs/built-in.o: In function `pstore_file_open':
inode.c:(.text+0xa29e9): undefined reference to `persistent_ram_size'

Caused by commit f5d7e81eda59 ("pstore: Support current records dump in ramoops").

I have used the ia64 tree from next-20140328 for today.

-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
