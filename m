From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build failure after merge of the akpm-current tree
Date: Mon, 19 Jun 2017 18:14:11 +1000
Message-ID: <20170619181411.1c0d30e5@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:42663 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1750757AbdFSIOO (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 19 Jun 2017 04:14:14 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Thomas Meyer <thomas@m3y3r.de>, "David S. Miller" <davem@davemloft.net>, Rich Felker <dalias@libc.org>

Hi Andrew,

After merging the akpm-current tree, today's linux-next build (sparc
defconfig) failed like this:

arch/sparc/mm/extable.c:16:1: error: conflicting types for 'search_extable'
 search_extable(const struct exception_table_entry *start,
 ^
In file included from arch/sparc/mm/extable.c:6:0:
include/linux/extable.h:11:1: note: previous declaration of 'search_extable' was here
 search_extable(const struct exception_table_entry *first,
 ^

Caused by commit

  222785199d50 ("lib/extable.c: use bsearch() library function in search_extable()")

This would also affect the sh architecture.  Grep is your friend.  I am
not sure why they have separate implementations.

I have reverted that commit (and its following fixup) for today.

-- 
Cheers,
Stephen Rothwell
