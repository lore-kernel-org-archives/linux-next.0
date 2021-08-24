Return-Path: <linux-next-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 367EEC4338F
	for <linux-next@archiver.kernel.org>; Tue, 24 Aug 2021 13:47:00 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 0DA856125F
	for <linux-next@archiver.kernel.org>; Tue, 24 Aug 2021 13:47:00 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237702AbhHXNrn (ORCPT <rfc822;linux-next@archiver.kernel.org>);
        Tue, 24 Aug 2021 09:47:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39110 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237683AbhHXNrl (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 24 Aug 2021 09:47:41 -0400
Received: from ms.lwn.net (ms.lwn.net [IPv6:2600:3c01:e000:3a1::42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7A4F4C061757
        for <linux-next@vger.kernel.org>; Tue, 24 Aug 2021 06:46:57 -0700 (PDT)
Received: from localhost (unknown [IPv6:2601:281:8300:104d::5f6])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id 787651C3F;
        Tue, 24 Aug 2021 13:46:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 787651C3F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
        t=1629812816; bh=2Hlb19nSuaGuonU77eD1y1qzVeXYu1pmsQQQNUuOQEA=;
        h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
        b=DuQ7IwRZF6ja24opBUrL4vz7kneiieODc7+CSOQshjEpfVlff7nj94oSfySlRGYLn
         W1Af5pGXCcJVBG8Hc1kJ7gre+jSJHYGeXrSvL6iHxo0ebbJZAAke9Rg7teGR/DjIQ3
         ZN3RekO3/6AJW43jjs/i253B6r7pcAsxQ/r/vYQpPheia8JuWv7UUD+/Vz/tHqyrJ9
         0EjpHEEbTZeKt5eDgokSZt8Jhps14iosu6jtpD6VTPSFIoKrEbpRw+md7/rOQLEeqk
         utgNYEXS9S5il/ONzoLOesBoBooVtkqHsBHGEs3h/hVrNkl3SBlfiI2stE+BBe8x5B
         o1Dzn/9nzmd3Q==
From:   Jonathan Corbet <corbet@lwn.net>
To:     "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        Michael Ellerman <mpe@ellerman.id.au>,
        PowerPC <linuxppc-dev@lists.ozlabs.org>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Daniel Henrique Barboza <danielhb413@gmail.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: linux-next: build warning after merge of the powerpc tree
In-Reply-To: <87v93ve7yg.fsf@linux.ibm.com>
References: <20210823195540.4d7363ed@canb.auug.org.au>
 <20210823204803.7cb76778@canb.auug.org.au> <87v93ve7yg.fsf@linux.ibm.com>
Date:   Tue, 24 Aug 2021 07:46:55 -0600
Message-ID: <877dgbneeo.fsf@meer.lwn.net>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

"Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com> writes:


> Thanks for looking into this. I guess we also need to format the below table?
>
>   | 0    8   40
> --|------------
>   |
> 0 | 10   20  80
>   |
> 8 | 20   10  160
>   |
> 40| 80   160  10
>
>
> I don't know how to represent that in the documentation file. A table is
> probably not the right one?

The cheap way out is to put it in a literal block, of course.  Sphinx
makes tables pretty easy, though:

  https://www.sphinx-doc.org/en/master/usage/restructuredtext/basics.html#tables

jon
