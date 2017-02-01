From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build warning after merge of the random tree
Date: Wed, 1 Feb 2017 17:09:17 +1100
Message-ID: <20170201170917.1d268823@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:35715 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751004AbdBAGJU (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Wed, 1 Feb 2017 01:09:20 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Theodore Ts'o <tytso@mit.edu>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Stephan =?UTF-8?B?TcO8bGxlcg==?= <smueller@chronox.de>

Hi Ted,

[This actually appeared yesterday, but I missed it, sorry.]

After merging the random tree, today's linux-next build (x86_64
allnoconfig) produced this warning:

drivers/char/random.c:318:12: warning: 'random_min_urandom_seed' defined but not used [-Wunused-variable]
 static int random_min_urandom_seed = 60;
            ^

Introduced by commit

  43d8a72cd985 ("random: remove variable limit")

I understand why it is left there, but it would be nice if this warning
could be removed.

-- 
Cheers,
Stephen Rothwell
