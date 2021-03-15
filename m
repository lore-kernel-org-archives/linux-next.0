Return-Path: <linux-next-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0C73BC433DB
	for <linux-next@archiver.kernel.org>; Mon, 15 Mar 2021 19:09:46 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D6CB564F42
	for <linux-next@archiver.kernel.org>; Mon, 15 Mar 2021 19:09:45 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233256AbhCOTJN (ORCPT <rfc822;linux-next@archiver.kernel.org>);
        Mon, 15 Mar 2021 15:09:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55862 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233252AbhCOTJJ (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 15 Mar 2021 15:09:09 -0400
Received: from ms.lwn.net (ms.lwn.net [IPv6:2600:3c01:e000:3a1::42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C49B8C06174A;
        Mon, 15 Mar 2021 12:09:09 -0700 (PDT)
Received: from localhost (unknown [IPv6:2601:281:8300:104d::5f6])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id 73C642E5;
        Mon, 15 Mar 2021 19:09:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 73C642E5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
        t=1615835349; bh=ZBSsbD4nkj2DS/6nUad/j7rTlC6FlsoysMDBIJcrd0c=;
        h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
        b=On8cL7vYDBmXsZk2kWSMNnrdDh9uLFBwPQFYGp3G1tTLVqrKCdXyhMygHDVyX4/EL
         vliRR9mGiyUcUL5KgkSMV40hQexxySJywNh0exJejC4RbBRVtfhFa+1mh/QxteX4Nf
         wYfoZMrUr7S3eywZ5hQNOrWEwfXZv1BUECZCQ1JBuitEdpVNqTjqlIflfzyHHc/JDm
         j9gJXGGShpF9cTasPpP5ylT6WuFsBQdbvQwfCp8RFKeiPYLyCtLM3LgSstk5jZz+QA
         CsGs1kCyUL8ipBTcJLvtFAKRZXZ0KywB5OeZv5PfkMuwicAlm423kvhNkwNNyd5x56
         K4Vw96ULMSUVA==
From:   Jonathan Corbet <corbet@lwn.net>
To:     Wu XiangCheng <bobwxc@email.cn>
Cc:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: [PATCH] docs/zh_CN: fix original link unknown document warning
In-Reply-To: <20210310083335.GA17722@mipc>
References: <20210310142019.27b9aa7b@canb.auug.org.au>
 <20210310083335.GA17722@mipc>
Date:   Mon, 15 Mar 2021 13:09:08 -0600
Message-ID: <87eegg2q0b.fsf@meer.lwn.net>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Wu XiangCheng <bobwxc@email.cn> writes:

> fix original link unknown document warning in zh_CN/admin-guide/README.rst
> and admin-guide/unicode.rst which introduced by commit:
>
>   550c8399d017 ("docs/zh_CN: Add zh_CN/admin-guide/README.rst")
>
> Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
> Signed-off-by: Wu XiangCheng <bobwxc@email.cn>
> ---
> Sorry for the inconvenience. This is a fix patch. 
> Or I could re-submit the two original patches if you need.
>
>  Documentation/translations/zh_CN/admin-guide/README.rst  | 2 +-
>  Documentation/translations/zh_CN/admin-guide/unicode.rst | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/Documentation/translations/zh_CN/admin-guide/README.rst b/Documentation/translations/zh_CN/admin-guide/README.rst
> index 939aee115e48..99b708a416d8 100644
> --- a/Documentation/translations/zh_CN/admin-guide/README.rst
> +++ b/Documentation/translations/zh_CN/admin-guide/README.rst
> @@ -1,6 +1,6 @@
>  .. include:: ../disclaimer-zh_CN.rst
>  
> -:Original: :ref:`Documentation/admin-guide/README.rst <Linux kernel release 5.x>`
> +:Original: :doc:`../../../admin-guide/README`

It seems even better to just let automarkup do its thing:

	:Original: Documentation/admin-guide/README.rst

I'll just put in a quick fix along those lines.

Thanks,

jon
