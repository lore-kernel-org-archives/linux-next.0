From: Oleg Nesterov <oleg@redhat.com>
Subject: Re: linux-next: build failure after merge of the akpm-current tree
Date: Fri, 17 Jul 2015 00:17:45 +0200
Message-ID: <20150716221745.GA21628@redhat.com>
References: <20150717080822.2c4d8b7b@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mx1.redhat.com ([209.132.183.28]:57369 "EHLO mx1.redhat.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751222AbbGPWT2 (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 16 Jul 2015 18:19:28 -0400
Content-Disposition: inline
In-Reply-To: <20150717080822.2c4d8b7b@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Andrew Morton <akpm@linux-foundation.org>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

On 07/17, Stephen Rothwell wrote:
>
> Hi Andrew,
>
> After merging the akpm-current tree, today's linux-next build (lots with
> CONFIG_MMU not set) failed like this:
>
> fs/built-in.o:(.rodata+0x1060): undefined reference to `filemap_page_mkwrite'
>
> Caused by commit
>
>   fb416a02f75c ("mm: move ->mremap() from file_operations to vm_operations_struct").

Yes, please see

	[mmotm:master 140/321] fs/built-in.o:undefined reference to `filemap_page_mkwrite'
	http://marc.info/?t=143700878100001

sorry. I'll send the fix soon.

> filemap_page_mkwrite only exists when CONFIG_MMU is set.

Yes, and I still think CONFGI_AIO makes no sense in this case.

Oleg.
