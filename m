Return-Path: <SRS0=eKcF=AE=vger.kernel.org=linux-next-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A570BC433E0
	for <linux-next@archiver.kernel.org>; Tue, 23 Jun 2020 14:43:18 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 7ED4320774
	for <linux-next@archiver.kernel.org>; Tue, 23 Jun 2020 14:43:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1592923398;
	bh=TqRulyYtUd2PZV9buPXaMmCk2xLtxGioopemn6iYm7k=;
	h=Date:From:To:Cc:Subject:List-ID:From;
	b=ptxCAfonwyjte6NPE74+Mobmy3ONQ/SKkAQe4SomEtuNpgvwuRIIg+483oxj7lqmH
	 MtRrHMImbeLcGvuqJamjmLZhdnvBpBYHm3SyJlRP+EWpafTaxbQod53hbOA3j7LjRg
	 ufC1NzcpuSP7FZMQJlkN0vqx5YQ4PPcs8xJk1lmI=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732760AbgFWOnS (ORCPT <rfc822;linux-next@archiver.kernel.org>);
        Tue, 23 Jun 2020 10:43:18 -0400
Received: from mail.kernel.org ([198.145.29.99]:60830 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1732738AbgFWOnS (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 23 Jun 2020 10:43:18 -0400
Received: from localhost (unknown [171.61.66.58])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 9710720720;
        Tue, 23 Jun 2020 14:43:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1592923397;
        bh=TqRulyYtUd2PZV9buPXaMmCk2xLtxGioopemn6iYm7k=;
        h=Date:From:To:Cc:Subject:From;
        b=VtlvOQMs2K58PUFaCbGtn+dEs5Fef99FZeEvhGNvPJay/uCDTKAEiwCbdpsrEx9l/
         sJm9H4JrxNZ8XQKSOJaJ1xu4zhe9/BlVatOmT+pvi1Z5sdsBYyr3eYlQzTppWRAcbz
         GaBC+PMnV39WD7TChmnYrGdxNNhnKwVD+7iylFYA=
Date:   Tue, 23 Jun 2020 20:13:13 +0530
From:   Vinod Koul <vkoul@kernel.org>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Switching dmaengine tree to kernel.org
Message-ID: <20200623144313.GS2324254@vkoul-mobl>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Hello Stephen,

I have switched dmaengine tree to kernel.org [1], please update your
database to new tree which can be found at [2]

[1]: https://lore.kernel.org/dmaengine/20200623143729.781403-1-vkoul@kernel.org/
[2]: git://git.kernel.org/pub/scm/linux/kernel/git/vkoul/dmaengine.git

Thanks
-- 
~Vinod
