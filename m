From: Heiko =?utf-8?q?St=C3=BCbner?= <heiko@sntech.de>
Subject: Re: linux-next: build failure after merge of the final tree
Date: Tue, 17 Dec 2013 09:26:59 +0100
Message-ID: <201312170926.59893.heiko@sntech.de>
References: <20131217165956.b5c92af06a83392e8bfb5d46@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: Text/Plain;
  charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from gloria.sntech.de ([95.129.55.99]:59514 "EHLO gloria.sntech.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750760Ab3LQI1E (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 17 Dec 2013 03:27:04 -0500
In-Reply-To: <20131217165956.b5c92af06a83392e8bfb5d46@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Andrew Morton <akpm@linux-foundation.org>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

Hi,

Am Dienstag, 17. Dezember 2013, 06:59:56 schrieb Stephen Rothwell:
> Caused by commit 34ef6d7fe467 ("rtc: add hym8563 rtc-driver") from the
> akpm-current tree.  Probably some missing include(s).
> 
> I just reverted that commit for today.

The includes are fine, I just seem to have forgotten the dependency of 
COMMON_CLK, which enables the clk structs in clk-provider.h. Sorry about that.

Follow up patch coming shortly.


Heiko
