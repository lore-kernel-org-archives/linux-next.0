From: Dominique Martinet <asmadeus@codewreck.org>
Subject: [v9fs] Pull request for linux-next
Date: Wed, 18 Jul 2018 08:29:20 +0200
Message-ID: <20180718062920.GA7302@nautica>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Andrew Morton <akpm@linux-foundation.org>, v9fs-developer@lists.sourceforge.net, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-next.vger.kernel.org

I'd like to request that you add the following tree to linux-next:

  git://github.com/martinetd/linux 9p-next

9p has seen some renewal of interest recently and I'd like to help take
a bit of the burden off Andrew, who suggested getting this included in
linux-next here[1].

This branch contains 9p filesystem & network patches that I have
gathered recently after they have been reviewed, and will keep pushing
patches there.


I've tried to respect the rules I've found, but please tell me if I
missed anything:
 - all patches have the author's Signed-off-by tag,
 - been posted to the v9fs and linux-kernel lists,
 - have been reviewed,
 - have been tested (*cough* a bit, I need to improve the process),
 - and are destined to the 4.19 merge window


[1] https://sourceforge.net/p/v9fs/mailman/message/36370423/

Thanks,
-- 
Dominique Martinet
