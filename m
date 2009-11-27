From: Tejun Heo <htejun@gmail.com>
Subject: Re: linux-next: percpu tree build warning
Date: Fri, 27 Nov 2009 15:32:48 +0900
Message-ID: <4B0F7290.6000007@gmail.com>
References: <20091125214219.f37935e8.sfr@canb.auug.org.au> <4B0D23A6.8040902@kernel.org> <20091125134058.GA9097@elte.hu> <200911270846.02717.rusty@rustcorp.com.au> <20091127054128.GC13914@elte.hu> <4B0F6A67.9010706@kernel.org> <20091127062001.GA22149@elte.hu> <4B0F7224.9020509@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-px0-f180.google.com ([209.85.216.180]:57262 "EHLO
	mail-px0-f180.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751407AbZK0Gcs (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Fri, 27 Nov 2009 01:32:48 -0500
In-Reply-To: <4B0F7224.9020509@kernel.org>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Ingo Molnar <mingo@elte.hu>
Cc: Rusty Russell <rusty@rustcorp.com.au>, Stephen Rothwell <sfr@canb.auug.org.au>, Fr??d??ric Weisbecker <fweisbec@gmail.com>, Peter Zijlstra <a.p.zijlstra@chello.nl>, Christoph Lameter <cl@linux-foundation.org>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Linus Torvalds <torvalds@linux-foundation.org>, Andrew Morton <akpm@linux-foundation.org>

11/27/2009 03:31 PM, Tejun Heo wrote:
...
> __percpu sparse annotation has almost complete coverage over the issue
> including the visible queue telling that something is percpu.  So,
                        ^^^^^
			 cue, of course.  dang workqueues.

-- 
tejun
