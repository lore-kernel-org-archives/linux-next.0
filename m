From: Christoph Lameter <cl@linux-foundation.org>
Subject: Re: next-20081106: undefined reference to `__per_cpu_start'
Date: Fri, 7 Nov 2008 12:28:04 -0600 (CST)
Message-ID: <Pine.LNX.4.64.0811071227330.5387@quilx.com>
References: <20081106173645.e7e79071.sfr@canb.auug.org.au>
 <20081106183939.GA26925@x200.localdomain> <Pine.LNX.4.64.0811061310350.6009@quilx.com>
 <20081107162114.2a41c623.sfr@canb.auug.org.au> <20081107054437.GA21421@x200.localdomain>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-next-owner@vger.kernel.org>
Received: from nlpi053.sbcis.sbc.com ([207.115.36.82]:46872 "EHLO
	nlpi053.prodigy.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751119AbYKGS2e (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Fri, 7 Nov 2008 13:28:34 -0500
In-Reply-To: <20081107054437.GA21421@x200.localdomain>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Alexey Dobriyan <adobriyan@gmail.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, rusty@rustcorp.com.au, Haavard Skinnemoen <hskinnemoen@atmel.com>

On Fri, 7 Nov 2008, Alexey Dobriyan wrote:

> BTW, on alpha I get
>
> mm/cpu_alloc.c:146:1: error: pasting "per_cpu__" and "(" does not give a valid preprocessing token

That is discussed elsewhere. SHIFT_PERCPU_PTR macro is messed up on alpha.
