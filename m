Return-Path: <linux-next-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B47FBEB64D7
	for <linux-next@archiver.kernel.org>; Fri, 16 Jun 2023 05:53:02 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237848AbjFPFxB (ORCPT <rfc822;linux-next@archiver.kernel.org>);
        Fri, 16 Jun 2023 01:53:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41360 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229581AbjFPFxA (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 16 Jun 2023 01:53:00 -0400
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 303DD2D50;
        Thu, 15 Jun 2023 22:53:00 -0700 (PDT)
Received: by verein.lst.de (Postfix, from userid 2407)
        id C99AF67373; Fri, 16 Jun 2023 07:52:56 +0200 (CEST)
Date:   Fri, 16 Jun 2023 07:52:56 +0200
From:   Christoph Hellwig <hch@lst.de>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Jaegeuk Kim <jaegeuk@kernel.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        Christoph Hellwig <hch@lst.de>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Lu Hongfei <luhongfei@vivo.com>, Yangtao Li <frank.li@vivo.com>
Subject: Re: linux-next: manual merge of the f2fs tree with the mm tree
Message-ID: <20230616055256.GA28569@lst.de>
References: <20230616102524.73bb5efb@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230616102524.73bb5efb@canb.auug.org.au>
User-Agent: Mutt/1.5.17 (2007-11-01)
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

The merge looks good to me, thanks.

