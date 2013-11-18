From: David Miller <davem@davemloft.net>
Subject: Re: linux-next: build failure after merge of the final tree
Date: Mon, 18 Nov 2013 18:09:35 -0500 (EST)
Message-ID: <20131118.180935.73842675326744218.davem@davemloft.net>
References: <20131118141933.7314374b0157183e0613599d@canb.auug.org.au>
	<20131118084941.A9C76E0090@blue.fi.intel.com>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from shards.monkeyblade.net ([149.20.54.216]:50634 "EHLO
	shards.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751415Ab3KRXJg (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 18 Nov 2013 18:09:36 -0500
In-Reply-To: <20131118084941.A9C76E0090@blue.fi.intel.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: kirill.shutemov@linux.intel.com
Cc: sfr@canb.auug.org.au, torvalds@linux-foundation.org, akpm@linux-foundation.org, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

From: "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>
Date: Mon, 18 Nov 2013 10:49:41 +0200 (EET)

> Stephen Rothwell wrote:
>> Hi all,
>> 
>> After merging the final tree, today's linux-next build (sparc64 defconfig)
>> failed like this:
>> 
>> arch/sparc/mm/init_64.c: In function 'pte_alloc_one':
>> arch/sparc/mm/init_64.c:2568:9: error: unused variable 'pte' [-Werror=unused-variable]
>> 
>> Caused by the merge between commit 37b3a8ff3e08 ("sparc64: Move from 4MB
>> to 8MB huge pages") and commit 1ae9ae5f7df7 ("sparc: handle
>> pgtable_page_ctor() fail") (I had the following merge fix in linux-next,
>> but it didn't seem to propagate upstream - may have forgotten to point it
>> out :-().
>> 
>> From: Stephen Rothwell <sfr@canb.auug.org.au>
>> Date: Mon, 18 Nov 2013 14:16:40 +1100
>> Subject: [PATCH] sparc64: merge fix
>> 
>> Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
> 
> Acked-by: Kirill A. Shutemov <kirill.shutemov@linux.intel.com>

Applied, thanks everyone.
