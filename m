From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: Signed-off-by missing for commits in the staging tree
Date: Tue, 19 Sep 2017 07:54:55 +1000
Message-ID: <20170919075455.59a3183b@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:45223 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751458AbdIRVy6 (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 18 Sep 2017 17:54:58 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Greg KH <greg@kroah.com>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, "Tobin C. Harding" <me@tobin.cc>

Hi Greg,

Commits

  688a0206cfb8 ("staging: rtlwifi: fix parenthesis alignment")
  85d309d53f7a ("staging: rtlwifi: use kcalloc instead of multiply")
  f216f6cdeb1d ("staging: rtlwifi: remove unused functions")

are missing a Signed-off-by from their author.

-- 
Cheers,
Stephen Rothwell
