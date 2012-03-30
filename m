From: David Miller <davem@davemloft.net>
Subject: Re: linux-next: build failure after merge of the final tree
 (Linus' tree related)
Date: Fri, 30 Mar 2012 01:45:00 -0400 (EDT)
Message-ID: <20120330.014500.609615234139434409.davem@davemloft.net>
References: <20120330143156.6c55bd32d207a074f65d1b16@canb.auug.org.au>
	<20120329.233937.885408108371285308.davem@davemloft.net>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from shards.monkeyblade.net ([198.137.202.13]:46947 "EHLO
	shards.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751239Ab2C3FrL (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Fri, 30 Mar 2012 01:47:11 -0400
In-Reply-To: <20120329.233937.885408108371285308.davem@davemloft.net>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: sfr@canb.auug.org.au
Cc: dhowells@redhat.com, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, torvalds@linux-foundation.org

From: David Miller <davem@davemloft.net>
Date: Thu, 29 Mar 2012 23:39:37 -0400 (EDT)

>> From: Stephen Rothwell <sfr@canb.auug.org.au>
>> Date: Fri, 30 Mar 2012 14:26:24 +1100
>> Subject: [PATCH] sparc: fix fallout from system.h split
>> 
>> Fixes this build error:
>> 
>> kernel/signal.c: In function 'ptrace_stop':
>> kernel/signal.c:1860:3: error: implicit declaration of function 'synchronize_user_stack' [-Werror=implicit-function-declaration]
>> 
>> Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>

Unfortunately there's more changes needed to fix the allmodconfig
build on sparc64 completely, I'll push it all to Linus.
