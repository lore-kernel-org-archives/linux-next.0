From: Andrew Morton <akpm@linux-foundation.org>
Subject: Re: linux-next: build failure after merge of the final tree (akpm
 tree related)
Date: Thu, 8 Nov 2012 20:01:54 -0800
Message-ID: <20121108200154.03e507ed.akpm@linux-foundation.org>
References: <20121109145832.dfdc4985b490290f5e4f185c@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail.linuxfoundation.org ([140.211.169.12]:43589 "EHLO
	mail.linuxfoundation.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751435Ab2KIEB5 (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 8 Nov 2012 23:01:57 -0500
In-Reply-To: <20121109145832.dfdc4985b490290f5e4f185c@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Michel Lespinasse <walken@google.com>, Rik van Riel <riel@redhat.com>

On Fri, 9 Nov 2012 14:58:32 +1100 Stephen Rothwell <sfr@canb.auug.org.au> wrote:

> Hi all,
> 
> After merging the final tree, today's linux-next build (i386 defconfig)
> failed like this:
> 
> arch/x86/mm/hugetlbpage.c: In function 'hugetlb_get_unmapped_area_topdown':
> arch/x86/mm/hugetlbpage.c:299:20: error: 'mm' undeclared (first use in this function)
> arch/x86/mm/hugetlbpage.c:299:20: note: each undeclared identifier is reported only once for each function it appears in
> 
> Caused by commit "mm: use vm_unmapped_area() in hugetlbfs on i386
> architecture".
> 

oop, I fixed that but forgot to commit the changes, sorry.

	s/mm/current->mm/
