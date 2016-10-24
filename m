From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: bad commit in the sunxi tree
Date: Tue, 25 Oct 2016 09:22:55 +1100
Message-ID: <20161025092255.3f4f59e2@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:42405 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S938991AbcJXWW5 (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 24 Oct 2016 18:22:57 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Maxime Ripard <maxime.ripard@free-electrons.com>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

Hi Maxime,

In today's sunxi tree
(git://git.kernel.org/pub/scm/linux/kernel/git/mripard/linux.git#sunxi/for-next)
I noticed that commit

  3861b711f8b5 ("ARM: sun5i: chip: add a node for the w1 gpio controller")

has no Signed-off-by from its committer.

-- 
Cheers,
Stephen Rothwell
