From: Jean Delvare <khali@linux-fr.org>
Subject: Re: linux-next: manual merge of the drm tree with the i2c tree
Date: Thu, 7 Oct 2010 09:41:29 +0200
Message-ID: <20101007094129.5038bc9e@endymion.delvare>
References: <20101007134220.d926a652.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from zone0.gcu-squad.org ([212.85.147.21]:15023 "EHLO
	services.gcu-squad.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751173Ab0JGHll (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 7 Oct 2010 03:41:41 -0400
In-Reply-To: <20101007134220.d926a652.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Dave Airlie <airlied@linux.ie>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Chris Wilson <chris@chris-wilson.co.uk>

Hi Stephen,

On Thu, 7 Oct 2010 13:42:20 +1100, Stephen Rothwell wrote:
> Today's linux-next merge of the drm tree got a conflict in
> drivers/gpu/drm/i915/intel_i2c.c between commit
> 2d3e8209c9d3abf6e831158e9814f50c57275487 ("i2c: Remove unneeded
> inclusions of <linux/i2c-id.h>") from the i2c tree and commit
> f899fc64cda8569d0529452aafc0da31c042df2e ("drm/i915: use GMBUS to manage
> i2c links") from the drm tree.
> 
> Again, both commits removed the inclusion of linux/i2.-id.h, so I used
> the drm tree verison.

Thanks for the heads up. I've stripped the removal in the two
conflicting files on my side, so it should be OK again. If there are
more similar cases in the future, the resolution will be the same.

-- 
Jean Delvare
