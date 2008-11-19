From: Christoph Lameter <cl@linux-foundation.org>
Subject: Re: linux-next: cpu_alloc tree patch (Was: Re: next-20081106:
 undefined reference to `__per_cpu_start')
Date: Wed, 19 Nov 2008 13:18:17 -0600 (CST)
Message-ID: <Pine.LNX.4.64.0811191317120.23084@quilx.com>
References: <20081106173645.e7e79071.sfr@canb.auug.org.au>
 <20081106183939.GA26925@x200.localdomain> <Pine.LNX.4.64.0811061310350.6009@quilx.com>
 <20081107162114.2a41c623.sfr@canb.auug.org.au> <Pine.LNX.4.64.0811071235040.5387@quilx.com>
 <20081118153346.62bf9c11.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-next-owner@vger.kernel.org>
Received: from nlpi053.sbcis.sbc.com ([207.115.36.82]:39202 "EHLO
	nlpi053.prodigy.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755231AbYKSTSm (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 19 Nov 2008 14:18:42 -0500
In-Reply-To: <20081118153346.62bf9c11.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Alexey Dobriyan <adobriyan@gmail.com>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, rusty@rustcorp.com.au, Haavard Skinnemoen <hskinnemoen@atmel.com>

On Tue, 18 Nov 2008, Stephen Rothwell wrote:

> I have applied this to linux-next today.  It is not clear to me if this
> is a fix for the cpu_alloc tree or the zero-based per_cpu area patches or
> a combination of both.  If the first, please apply this to the cpu_alloc
> tree or I will have to drop the tree.  Otherwise, let me know where it
> belongs.

Its a fix to the cpu_alloc stuff.

> Also, considering the "discussions" between Rusty and yourself, I may
> need to drop the cpu_alloc tree until they are resolved.

Just came back from the conference. Hope I can catch up with email soon.
