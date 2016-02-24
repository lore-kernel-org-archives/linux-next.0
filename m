From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build failure after merge of the mac80211-next tree
Date: Wed, 24 Feb 2016 11:59:27 +1100
Message-ID: <20160224115927.3fa9161e@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:47375 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751370AbcBXA73 (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 23 Feb 2016 19:59:29 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Johannes Berg <johannes@sipsolutions.net>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Heikki Krogerus <heikki.krogerus@linux.intel.com>

Hi Johannes,

After merging the mac80211-next tree, today's linux-next build (x86_64
allmodconfig) failed like this:

In file included from include/linux/linkage.h:4:0,
                 from include/linux/kernel.h:6,
                 from net/rfkill/core.c:20:
net/rfkill/core.c: In function 'rfkill_find_type':
include/linux/compiler.h:501:38: error: call to '__compiletime_assert_647' declared with attribute error: BUILD_BUG_ON failed: !rfkill_types[NUM_RFKILL_TYPES - 1]
  _compiletime_assert(condition, msg, __compiletime_assert_, __LINE__)
                                      ^
include/linux/compiler.h:484:4: note: in definition of macro '__compiletime_assert'
    prefix ## suffix();    \
    ^
include/linux/compiler.h:501:2: note: in expansion of macro '_compiletime_assert'
  _compiletime_assert(condition, msg, __compiletime_assert_, __LINE__)
  ^
include/linux/bug.h:50:37: note: in expansion of macro 'compiletime_assert'
 #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
                                     ^
include/linux/bug.h:74:2: note: in expansion of macro 'BUILD_BUG_ON_MSG'
  BUILD_BUG_ON_MSG(condition, "BUILD_BUG_ON failed: " #condition)
  ^
net/rfkill/core.c:647:2: note: in expansion of macro 'BUILD_BUG_ON'
  BUILD_BUG_ON(!rfkill_types[NUM_RFKILL_TYPES - 1]);
  ^

Caused by commit

  1f86443b4ffe ("net: rfkill: add rfkill_find_type function")

Maybe the compiler version matters?  I am using gcc v5.2.0.

Though, it seems to be that "!rfkill_types[NUM_RFKILL_TYPES - 1]" is
not a constant expression since

static const char *rfkill_types[NUM_RFKILL_TYPES]

does not stop "rfkill_types[NUM_RFKILL_TYPES - 1]" being modified at
run time. I think that you might need:

static const char * const rfkill_types[NUM_RFKILL_TYPES]

I have used the mac80211-next from next-20160223 for today.

-- 
Cheers,
Stephen Rothwell
