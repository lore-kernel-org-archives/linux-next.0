Return-Path: <linux-next-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DF6D4C38A2D
	for <linux-next@archiver.kernel.org>; Mon, 24 Oct 2022 04:29:07 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229520AbiJXE3F (ORCPT <rfc822;linux-next@archiver.kernel.org>);
        Mon, 24 Oct 2022 00:29:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56318 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229501AbiJXE3E (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 24 Oct 2022 00:29:04 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 945C072B75;
        Sun, 23 Oct 2022 21:29:03 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 46BE8B80EA1;
        Mon, 24 Oct 2022 04:29:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0A431C433B5;
        Mon, 24 Oct 2022 04:28:59 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
        dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="pTFdF6vJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105;
        t=1666585738;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=fyw1dc0Dqpw5fGx5Mm/RRN7l91d5IljC2WwAp1jS9hk=;
        b=pTFdF6vJgFCgFTM2FMoSpTBEaghAK00wlShS6T3xLbEqRMJngqpVqblsdBduTaHyLf4dc1
        vKpYqlWqhmtI9MBH0/Np9EfdH1K47+iWXDs5/H8QeTcBBP4i8dimevMg4iaObyOf6g2yI3
        xepajog6hXlUi45CzcEt3kVr5iWh1Wc=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id d41b90ef (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO);
        Mon, 24 Oct 2022 04:28:57 +0000 (UTC)
Date:   Mon, 24 Oct 2022 06:28:53 +0200
From:   "Jason A. Donenfeld" <Jason@zx2c4.com>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Theodore Ts'o <tytso@mit.edu>,
        Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@redhat.com>,
        "H. Peter Anvin" <hpa@zytor.com>,
        Peter Zijlstra <peterz@infradead.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the random tree
Message-ID: <Y1YUhaHXpMV80gQO@zx2c4.com>
References: <20221024132319.4b3910ad@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20221024132319.4b3910ad@canb.auug.org.au>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

I'll remove the removal commit for now and will plan on handling that
separately at the end of the 6.2 merge window.

Jason
