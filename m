From: Jean Delvare <khali@linux-fr.org>
Subject: Re: linux-next: failure importing the jdelvare-hwmon tree
Date: Mon, 18 Jul 2011 09:32:45 +0200
Message-ID: <20110718093245.70045e57@endymion.delvare>
References: <20110718104646.c6b59b75792a1688d079fa28@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from zone0.gcu-squad.org ([212.85.147.21]:29119 "EHLO
	services.gcu-squad.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751933Ab1GRHc4 (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 18 Jul 2011 03:32:56 -0400
In-Reply-To: <20110718104646.c6b59b75792a1688d079fa28@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

On Mon, 18 Jul 2011 10:46:46 +1000, Stephen Rothwell wrote:
> Importing the jdelvare-hwmon tree failed like this:
> 
> $ git am ../quilt/jdelvare-hwmon/hwmon-max1111-improve-memory-usage.patch
> Applying: hwmon: (max1111) Avoid extra memory allocations
> error: patch failed: drivers/hwmon/max1111.c:224
> error: drivers/hwmon/max1111.c: patch does not apply
> Patch failed at 0001 hwmon: (max1111) Avoid extra memory allocations
> 
> I fixed up the patch ('&' needed in call to mutex_destroy).

D'oh. Sorry again, fixed now.

It's about time that I take a long vacation break, apparently.

-- 
Jean Delvare
