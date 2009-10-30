From: Tejun Heo <tj@kernel.org>
Subject: Re: linux-next: manual merge of the percpu tree with the kgdb tree
Date: Fri, 30 Oct 2009 11:00:37 +0100
Message-ID: <4AEAB945.2000801@kernel.org>
References: <20091030192038.381eba2d.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from hera.kernel.org ([140.211.167.34]:55733 "EHLO hera.kernel.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1756796AbZJ3J7t (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Fri, 30 Oct 2009 05:59:49 -0400
In-Reply-To: <20091030192038.381eba2d.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Rusty Russell <rusty@rustcorp.com.au>, Christoph Lameter <cl@linux-foundation.org>, Ingo Molnar <mingo@elte.hu>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Jason Wessel <jason.wessel@windriver.com>

Hello,

Stephen Rothwell wrote:
> Just context changes.  I fixed it up (see below) and can carry the
> changes as necessary.
> 
> I do wonder if the local variable name changes in the percpu tree change
> were a good idea?

Yeap, I agree it's not pretty but I couldn't think of better way to do
it.  The changes are almost randomly spread over different subsystems
and coordinating pull/push between all those trees and the percpu tree
would be too painful logistically, so I think it would be better to
channel most of them through the percpu tree and react to clashes that
happen (there shouldn't be too many during single devel cycle and
resolution shouldn't be too hard).

percpu#for-next tree won't be rebased and pulling it into the
conflicting tree should resolve the situation.  Or if carrying the
fixup isn't too painful for you, doing it this way isn't too bad
either.  I can collect the conflict resolutions and send it together
with pull request when the next merge window opens.

> I also needed a further merge fixup (see further below).

Patch looks good to me.

Thanks.

-- 
tejun
