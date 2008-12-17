From: Rusty Russell <rusty@rustcorp.com.au>
Subject: Re: linux-next: cpu_alloc tree
Date: Wed, 17 Dec 2008 22:36:19 +1030
Message-ID: <200812172236.20226.rusty@rustcorp.com.au>
References: <20081216170521.8453f7e4.sfr@canb.auug.org.au> <Pine.LNX.4.64.0812160851080.18671@quilx.com>
Mime-Version: 1.0
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([203.10.76.45]:50280 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751510AbYLQMGY (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 17 Dec 2008 07:06:24 -0500
In-Reply-To: <Pine.LNX.4.64.0812160851080.18671@quilx.com>
Content-Disposition: inline
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Christoph Lameter <cl@linux-foundation.org>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org

On Wednesday 17 December 2008 01:21:26 Christoph Lameter wrote:
> On Tue, 16 Dec 2008, Stephen Rothwell wrote:
> 
> > The cpu_alloc tree has not been included in linux-next since Nov 21.  Have
> > your discussions with Rusty come to any conclusions?  Should I remove
> > this tree permanently or will it be updated?
> 
> I thought Rusty would be doing something. If not then I will bring things
> up to snuff.

Thanks for the prod, I was distracted by cpumasks and local_t, the latter
tangentially related.

The current patches work, but introduce new limits on eg. number of
network devices.  Those have to be diverted to a lesser percpu allocator
until we get dynamic percpu sizing.  I do not want to block this work on
that: you've shown how useful even small allocs can be in key places.

Expect another set of patches this week.

Thanks,
Rusty.
