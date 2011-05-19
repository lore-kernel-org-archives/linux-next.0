From: Rusty Russell <rusty@rustcorp.com.au>
Subject: Re: linux-next: build warning after merge of the rr tree
Date: Thu, 19 May 2011 13:10:59 +0930
Message-ID: <87zkmj4at0.fsf@rustcorp.com.au>
References: <20110518134103.f99c75a4.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([203.10.76.45]:38597 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752638Ab1ESF1v (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 19 May 2011 01:27:51 -0400
In-Reply-To: <20110518134103.f99c75a4.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Alessio Igor Bogani <abogani@kernel.org>

On Wed, 18 May 2011 13:41:03 +1000, Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> Hi Rusty,
> 
> After merging the rr tree, today's linux-next build produced this warning:
> 
> kernel/module.c: In function 'lookup_symbol':
> kernel/module.c:2058: warning: unused variable 'ks'

Yep, fixed in updated version (by deletion)...

Thanks,
Rusty.
