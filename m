From: Tejun Heo <tj@kernel.org>
Subject: Re: linux-next: manual merge of the percpu tree with the tip tree
Date: Fri, 31 Dec 2010 12:17:12 +0100
Message-ID: <20101231111712.GF18831@htj.dyndns.org>
References: <20101231135546.73f318bc.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-bw0-f46.google.com ([209.85.214.46]:57059 "EHLO
	mail-bw0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752075Ab0LaLRT (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Fri, 31 Dec 2010 06:17:19 -0500
Content-Disposition: inline
In-Reply-To: <20101231135546.73f318bc.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Rusty Russell <rusty@rustcorp.com.au>, Christoph Lameter <cl@linux-foundation.org>, Ingo Molnar <mingo@elte.hu>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Jack Steiner <steiner@sgi.com>, Thomas Gleixner <tglx@linutronix.de>, "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>

On Fri, Dec 31, 2010 at 01:55:46PM +1100, Stephen Rothwell wrote:
> Hi all,
> 
> Today's linux-next merge of the percpu tree got a conflict in
> arch/x86/kernel/apic/x2apic_uv_x.c between commit
> d8850ba425d9823d3184bd52f065899dac4689f9 ("x86, UV: Fix the effect of
> extra bits in the hub nodeid register") from the tip tree and commit
> 0a3aee0da4402aa19b66e458038533c896fb80c6 ("x86: Use this_cpu_ops to
> optimize code") from the percpu tree.
> 
> I fixed it up (see below) and can carry the fix as necessary.

Thank you.  Looks good to me.

-- 
tejun
