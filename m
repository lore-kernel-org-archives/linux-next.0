From: Rusty Russell <rusty@rustcorp.com.au>
Subject: Re: linux-next build conflict between modules and metag trees (LOCKDEP_NOW_UNRELIABLE)
Date: Fri, 08 Feb 2013 13:47:49 +1030
Message-ID: <876223ijdu.fsf@rustcorp.com.au>
References: <51138CFC.9000508@imgtec.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([203.10.76.45]:55656 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1755363Ab3BHEMX (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 7 Feb 2013 23:12:23 -0500
In-Reply-To: <51138CFC.9000508@imgtec.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: James Hogan <james.hogan@imgtec.com>
Cc: linux-kernel <linux-kernel@vger.kernel.org>, linux-next <linux-next@vger.kernel.org>, Stephen Rothwell <sfr@canb.auug.org.au>

James Hogan <james.hogan@imgtec.com> writes:
> Hi Rusty,
>
> The metag architecture tree adds an add_taint(TAINT_DIE) like other
> architectures do, and the modules-next tree adds the
> LOCKDEP_NOW_UNRELIABLE flag to all uses of add_taint (but obviously
> misses arch/metag since it doesn't exist yet), causing a compile error
> on metag in -next when the two are merged together.
>
> Is it okay for me to merge your commit 373d4d0 ("taint: add explicit
> flag to show whether lock dep is still OK.") in modules-next into the
> base of the metag tree and expect it not to be rebased, so that I can
> then squash the fix into the metag tree?

This was my fault for taking a shortcut.  I should have changed the name
so the old add_taint worked still (set_taint?), then remove add_taint
after the merge.

But I won't be rebasing, so you should be fine to merge it.

Cheers,
Rusty.
