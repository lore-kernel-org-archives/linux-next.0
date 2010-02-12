From: Tejun Heo <tj@kernel.org>
Subject: Re: upcoming percpu changes
Date: Fri, 12 Feb 2010 17:21:20 +0900
Message-ID: <4B750F80.2030902@kernel.org>
References: <20100205161648.086375b9.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from hera.kernel.org ([140.211.167.34]:36223 "EHLO hera.kernel.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751161Ab0BLIOZ (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Fri, 12 Feb 2010 03:14:25 -0500
In-Reply-To: <20100205161648.086375b9.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Linus <torvalds@linux-foundation.org>, Andrew Morton <akpm@linux-foundation.org>, linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, Rusty Russell <rusty@rustcorp.com.au>, Christoph Lameter <cl@linux-foundation.org>, Ingo Molnar <mingo@elte.hu>

Hello, Stephen.

On 02/05/2010 02:16 PM, Stephen Rothwell wrote:
> From: Stephen Rothwell <sfr@canb.auug.org.au>
> Date: Fri, 5 Feb 2010 16:09:11 +1100
> Subject: [PATCH] percpu: add __percpu for sparse
> 
> This is to make the annotation of percpu variables during the next merge
> window less painfull.
> 
> Extracted from a patch by Rusty Russell.

I started doing this and it's a bit ridiculous.  If I split the
patches into separate trees with maintainers, I end up with a lot of
one or several liners and all that those patches do is adding __percpu
to a variable or field declaration which doesn't affect normal builds
at all.  The only conflicts I had against the current mainline is the
ones which got changed in the percpu tree by Christoph's patches.

Given the wide number of trees this will end up on and given the
triviality of each change, I think it would better to keep these in
the percpu tree.  It'll make things harder track without adding much
benefit.  If non-trivial confict ever happens, please feel free to
drop it from linux-next and let me know.

Thanks.

-- 
tejun
