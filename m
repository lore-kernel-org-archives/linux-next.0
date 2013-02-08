From: James Hogan <james.hogan@imgtec.com>
Subject: Re: linux-next build conflict between modules and metag trees (LOCKDEP_NOW_UNRELIABLE)
Date: Fri, 8 Feb 2013 09:32:02 +0000
Message-ID: <5114C612.1060506@imgtec.com>
References: <51138CFC.9000508@imgtec.com> <876223ijdu.fsf@rustcorp.com.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from multi.imgtec.com ([194.200.65.239]:61199 "EHLO multi.imgtec.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1946102Ab3BHJdQ (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Fri, 8 Feb 2013 04:33:16 -0500
In-Reply-To: <876223ijdu.fsf@rustcorp.com.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Rusty Russell <rusty@rustcorp.com.au>
Cc: linux-kernel <linux-kernel@vger.kernel.org>, linux-next <linux-next@vger.kernel.org>, Stephen Rothwell <sfr@canb.auug.org.au>

On 08/02/13 03:17, Rusty Russell wrote:
> James Hogan <james.hogan@imgtec.com> writes:
>> Hi Rusty,
>>
>> The metag architecture tree adds an add_taint(TAINT_DIE) like other
>> architectures do, and the modules-next tree adds the
>> LOCKDEP_NOW_UNRELIABLE flag to all uses of add_taint (but obviously
>> misses arch/metag since it doesn't exist yet), causing a compile error
>> on metag in -next when the two are merged together.
>>
>> Is it okay for me to merge your commit 373d4d0 ("taint: add explicit
>> flag to show whether lock dep is still OK.") in modules-next into the
>> base of the metag tree and expect it not to be rebased, so that I can
>> then squash the fix into the metag tree?
> 
> This was my fault for taking a shortcut.  I should have changed the name
> so the old add_taint worked still (set_taint?), then remove add_taint
> after the merge.
> 
> But I won't be rebasing, so you should be fine to merge it.

No worries.

Thanks
James
