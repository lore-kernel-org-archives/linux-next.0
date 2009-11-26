From: Rusty Russell <rusty@rustcorp.com.au>
Subject: Re: linux-next: percpu tree build warning
Date: Fri, 27 Nov 2009 08:46:02 +1030
Message-ID: <200911270846.02717.rusty@rustcorp.com.au>
References: <20091125214219.f37935e8.sfr@canb.auug.org.au> <4B0D23A6.8040902@kernel.org> <20091125134058.GA9097@elte.hu>
Mime-Version: 1.0
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([203.10.76.45]:55314 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752884AbZKZWV1 (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 26 Nov 2009 17:21:27 -0500
In-Reply-To: <20091125134058.GA9097@elte.hu>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Ingo Molnar <mingo@elte.hu>
Cc: Tejun Heo <tj@kernel.org>, Stephen Rothwell <sfr@canb.auug.org.au>, Fr??d??ric Weisbecker <fweisbec@gmail.com>, Peter Zijlstra <a.p.zijlstra@chello.nl>, Christoph Lameter <cl@linux-foundation.org>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

On Thu, 26 Nov 2009 12:10:58 am Ingo Molnar wrote:
> While a percpu variable is defined and used in completely different 
> ways:
> 
>   DEFINE_PER_CPU(unsigned long, dr7);
> 
> and is used via:
> 
>   __get_cpu_var(dr7);  [[Fixed -- RR]]

The entire point of Tejun's per-cpu work is that &dr7 is now valid.  A per-cpu
pointer as if it were allocated by the dynamic per-cpu allocator.

Your arguments are fine, but out-of-date.

Rusty.
