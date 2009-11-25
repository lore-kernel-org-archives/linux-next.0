From: Rusty Russell <rusty@rustcorp.com.au>
Subject: Re: linux-next: percpu tree build warning
Date: Wed, 25 Nov 2009 21:44:08 +1030
Message-ID: <200911252144.08686.rusty@rustcorp.com.au>
References: <20091125214219.f37935e8.sfr@canb.auug.org.au> <20091125105004.GA18163@elte.hu>
Mime-Version: 1.0
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([203.10.76.45]:43873 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752148AbZKYLOF (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 25 Nov 2009 06:14:05 -0500
In-Reply-To: <20091125105004.GA18163@elte.hu>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Ingo Molnar <mingo@elte.hu>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Fr??d??ric Weisbecker <fweisbec@gmail.com>, Peter Zijlstra <a.p.zijlstra@chello.nl>, Tejun Heo <tj@kernel.org>, Christoph Lameter <cl@linux-foundation.org>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

On Wed, 25 Nov 2009 09:20:04 pm Ingo Molnar wrote:
> If yes then that needs to be fixed in the percpu tree. per-cpu variables 
> used to have a __per_cpu prefix and that should be maintained - the two 
> namespaces are obviously separate on the logical space, so they should 
> never overlap in the implementational space either.

No, we've been through this.

sparse annotations replace the per_cpu prefix now per-cpu vars can be used
withn other than per-cpu ops (ie. their address can be usefully taken).

The prefix crutch predated sparse.  And it was certainly never supposed to
let people write confusing and crap code like this.

Rusty.
