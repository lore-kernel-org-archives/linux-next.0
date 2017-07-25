From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: unsigned commits in the coresight tree
Date: Wed, 26 Jul 2017 09:32:56 +1000
Message-ID: <20170726093256.460cf864@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:35163 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751601AbdGYXc6 (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 25 Jul 2017 19:32:58 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

Hi Mathieu,

I noticed that commits

  ee0c4a55a06c ("perf: cs-etm: Fix ETMv4 CONFIGR entry in perf.data file")
  45d8dfdde64b ("coresight tmc: Support for save-restore in ETR")

have no Signed-off-by from you as the committer.

-- 
Cheers,
Stephen Rothwell
