From: Tejun Heo <tj@kernel.org>
Subject: Re: [PATCH percpu/for-3.18-consistent-ops] Revert "powerpc: Replace
 __get_cpu_var uses"
Date: Wed, 27 Aug 2014 17:49:46 -0400
Message-ID: <20140827214946.GA21396@mtj.dyndns.org>
References: <20140827142243.6277eaff@canb.auug.org.au>
 <20140827152609.GA379@htj.dyndns.org>
 <20140828074349.10e86372@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-qg0-f47.google.com ([209.85.192.47]:47008 "EHLO
	mail-qg0-f47.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932246AbaH0Vtw (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 27 Aug 2014 17:49:52 -0400
Content-Disposition: inline
In-Reply-To: <20140828074349.10e86372@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Rusty Russell <rusty@rustcorp.com.au>, Christoph Lameter <cl@linux-foundation.org>, Ingo Molnar <mingo@elte.hu>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Christoph Lameter <cl@linux.com>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>

On Thu, Aug 28, 2014 at 07:43:49AM +1000, Stephen Rothwell wrote:
> Hi Tejun,
> 
> On Wed, 27 Aug 2014 11:26:09 -0400 Tejun Heo <tj@kernel.org> wrote:
> >
> > From 23f66e2d661b4d3226d16e25910a9e9472ce2410 Mon Sep 17 00:00:00 2001
> > From: Tejun Heo <tj@kernel.org>
> > Date: Wed, 27 Aug 2014 11:18:29 -0400
> > 
> > This reverts commit 5828f666c069af74e00db21559f1535103c9f79a due to
> > build failure after merging with pending powerpc changes.
> 
> I can't see any pending powerpc changes that would obviously affect
> this ...

Weird, the build-bot reported success on all powerpc configs on the
percpu branches w/o the revert.  I wonder what's going on.

Thanks.

-- 
tejun
