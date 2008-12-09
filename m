From: Jens Axboe <jens.axboe@oracle.com>
Subject: Re: next-2008-11-09: s390 vs ->ioctx_list
Date: Tue, 9 Dec 2008 08:13:06 +0100
Message-ID: <20081209071305.GO23742@kernel.dk>
References: <20081208205929.366a9a01.sfr@canb.auug.org.au> <20081209001113.GA6107@x200.localdomain>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from brick.kernel.dk ([93.163.65.50]:6383 "EHLO kernel.dk"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751950AbYLIHNU (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 9 Dec 2008 02:13:20 -0500
Content-Disposition: inline
In-Reply-To: <20081209001113.GA6107@x200.localdomain>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Alexey Dobriyan <adobriyan@gmail.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, jmoyer@redhat.com

On Tue, Dec 09 2008, Alexey Dobriyan wrote:
>   CC      arch/s390/mm/pgtable.o
> arch/s390/mm/pgtable.c: In function 's390_enable_sie':
> arch/s390/mm/pgtable.c:266: error: invalid operands to binary ||
> arch/s390/mm/pgtable.c:282: error: invalid operands to binary ||
> 
> This is because ->ioctx_list turned from pointer to a hlist, some more locking
> and different check required.

Already posted a patch for this on friday, the branches have now been
updated.

-- 
Jens Axboe
