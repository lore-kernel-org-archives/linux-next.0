From: Tejun Heo <htejun@gmail.com>
Subject: Re: [PATCH 14/17] input: update gfp/slab.h includes
Date: Tue, 30 Mar 2010 22:29:19 +0900
Message-ID: <4BB1FCAF.6080409@gmail.com>
References: <1269885165-18617-1-git-send-email-tj@kernel.org>	<1269885165-18617-15-git-send-email-tj@kernel.org> <20100330142148.2ac3fc0e.sfr@canb.auug.org.au> <4BB1EBD4.9030707@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-pw0-f46.google.com ([209.85.160.46]:34098 "EHLO
	mail-pw0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752621Ab0C3N0W (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 30 Mar 2010 09:26:22 -0400
In-Reply-To: <4BB1EBD4.9030707@kernel.org>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Dmitry Torokhov <dmitry.torokhov@gmail.com>

Hello, again.

On 03/30/2010 09:17 PM, Tejun Heo wrote:
> Ah, I see.  sysrq.c's requirement changed between mainline and
> linux-next.  I'll update slabh tree such that it includes slab.h from
> there.

slabh updated such that...

* kmemcheck fix patch is placed before the patch to break implicit
  slab.h inclusion.

* sysrq.c now includes slab.h instead of gfp.h.

* Updated against the current mainline
  9623e5a23724d09283c238960946ec6f65733afe.  Conversion script was run
  again and outputs are compared.  No new dependency appeared since
  the last round.

So, it should now be safe to ignore this patch.

Thanks.

-- 
tejun
