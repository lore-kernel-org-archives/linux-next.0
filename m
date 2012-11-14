From: David Miller <davem@davemloft.net>
Subject: Re: linux-next: build failure after merge of the final tree (akpm
 tree related)
Date: Wed, 14 Nov 2012 18:10:19 -0500 (EST)
Message-ID: <20121114.181019.152264317780389205.davem@davemloft.net>
References: <20121114141847.fab752c2.akpm@linux-foundation.org>
	<20121114.173059.2152995770988231211.davem@davemloft.net>
	<20121114150919.19c1633a.akpm@linux-foundation.org>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from shards.monkeyblade.net ([149.20.54.216]:36474 "EHLO
	shards.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1945923Ab2KNXKV (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 14 Nov 2012 18:10:21 -0500
In-Reply-To: <20121114150919.19c1633a.akpm@linux-foundation.org>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: akpm@linux-foundation.org
Cc: sfr@canb.auug.org.au, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, walken@google.com, riel@redhat.com

From: Andrew Morton <akpm@linux-foundation.org>
Date: Wed, 14 Nov 2012 15:09:19 -0800

> I suspect that most people expect "color".  And given that this
> patchset removes COLOUR_ALIGN_DOWN (and should have removed
> arch/sparc/kernel/sys_sparc_32.c:COLOR_ALIGN), we end up with

That's fine.
