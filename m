From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: Signed-off-by missing for commits in the dlm tree
Date: Tue, 19 Sep 2017 07:49:19 +1000
Message-ID: <20170919074919.1aee891b@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:43423 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751411AbdIRVtV (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 18 Sep 2017 17:49:21 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: David Teigland <teigland@redhat.com>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Bob Peterson <rpeterso@redhat.com>, "tsutomu.owa@toshiba.co.jp" <tsutomu.owa@toshiba.co.jp>, Tadashi Miyauchi <miyauchi@toshiba-tops.co.jp>

Hi David,

Commits

  bcc976a145c9 ("DLM: Eliminate CF_CONNECT_PENDING flag")
  c071b28b2bd5 ("DLM: Eliminate CF_WRITE_PENDING flag")
  782551aac851 ("DLM: Fix saving of NULL callbacks")

are missing a Signed-off-by from their author.

-- 
Cheers,
Stephen Rothwell
