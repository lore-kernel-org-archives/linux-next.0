From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build failure after merge of the akpm-current tree
Date: Fri, 17 Jul 2015 08:08:22 +1000
Message-ID: <20150717080822.2c4d8b7b@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:41674 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751927AbbGPWI2 (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 16 Jul 2015 18:08:28 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Oleg Nesterov <oleg@redhat.com>

Hi Andrew,

After merging the akpm-current tree, today's linux-next build (lots with
CONFIG_MMU not set) failed like this:

fs/built-in.o:(.rodata+0x1060): undefined reference to `filemap_page_mkwrite'

Caused by commit

  fb416a02f75c ("mm: move ->mremap() from file_operations to vm_operations_struct").

filemap_page_mkwrite only exists when CONFIG_MMU is set.

-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
