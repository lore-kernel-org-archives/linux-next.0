From: Luciano Coelho <coelho@ti.com>
Subject: Re: [PATCH] wlcore: remove newly introduced alloc/OOM messages
Date: Mon, 11 Feb 2013 10:06:43 +0200
Message-ID: <1360570003.12803.51.camel@cumari.coelho.fi>
References: <1360569218.12803.50.camel@cumari.coelho.fi>
	 <1360569749-28372-1-git-send-email-coelho@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from comal.ext.ti.com ([198.47.26.152]:40440 "EHLO comal.ext.ti.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752751Ab3BKIH5 (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 11 Feb 2013 03:07:57 -0500
In-Reply-To: <1360569749-28372-1-git-send-email-coelho@ti.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: linville@tuxdriver.com
Cc: sfr@canb.auug.org.au, joe@perches.com, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, davem@davemloft.net, netdev@vger.kernel.org

On Mon, 2013-02-11 at 10:02 +0200, Luciano Coelho wrote:
> In commit 0d2e7a5c (wireless: Remove unnecessary alloc/OOM messages,
> alloc cleanups) OOM messages after alloc were removed from the wlcore
> modules.
> 
> Commit afb43e6d (wlcore: remove if_ops from platform_data)
> reintroduced a couple of those.  This patch removes them.
> 
> Signed-off-by: Luciano Coelho <coelho@ti.com>
> ---
> 
> John,
> 
> Can you apply this directly on wireless-next after you process my latest pull-request?
> 
> Thanks!

Ermm... obviously this is completely wrong.  I'll send v2 in a bit.

--
Luca.
