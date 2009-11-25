From: Tejun Heo <tj@kernel.org>
Subject: Re: linux-next: percpu tree build failure
Date: Wed, 25 Nov 2009 21:58:01 +0900
Message-ID: <4B0D29D9.1090809@kernel.org>
References: <20091125234133.4d603f48.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from hera.kernel.org ([140.211.167.34]:47811 "EHLO hera.kernel.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1758746AbZKYM6b (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 25 Nov 2009 07:58:31 -0500
In-Reply-To: <20091125234133.4d603f48.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Rusty Russell <rusty@rustcorp.com.au>, Christoph Lameter <cl@linux-foundation.org>, Ingo Molnar <mingo@elte.hu>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, "David S. Miller" <davem@davemloft.net>, Vivek Goyal <vgoyal@redhat.com>

Hello,

11/25/2009 09:41 PM, Stephen Rothwell wrote:
> Caused by commit 9a453506c3503929654112851e27b8c64c693912 ("percpu: Fix
> kdump failure if booted with percpu_alloc=page").  I reverted the merge
> commit (due to dependencies) that merged the above
> (25b1a9ccfdd0e3dc306a1e3a354ba5480c4b0dd9 "Merge branch 'for-linus' into
> for-next to receive per_cpu_ptr_to_phys ().") for today.  The branch
> being merged had only that one commit in it.

The change was missing asm/io.h include and the fix commit was
incorrectly attributed to me.  Fixed both problems.

Thanks.

-- 
tejun
