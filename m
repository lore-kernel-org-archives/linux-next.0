Return-Path: <linux-next-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CAB4FEB64D9
	for <linux-next@archiver.kernel.org>; Tue,  4 Jul 2023 14:32:27 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231284AbjGDOc1 (ORCPT <rfc822;linux-next@archiver.kernel.org>);
        Tue, 4 Jul 2023 10:32:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51096 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229647AbjGDOc0 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 4 Jul 2023 10:32:26 -0400
Received: from ms.lwn.net (ms.lwn.net [IPv6:2600:3c01:e000:3a1::42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 947B010C3;
        Tue,  4 Jul 2023 07:32:23 -0700 (PDT)
Received: from localhost (unknown [IPv6:2601:281:8300:73::5f6])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id 3A099732;
        Tue,  4 Jul 2023 14:32:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 3A099732
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
        t=1688481143; bh=KqRvufJhrCO2GbqutpkHMJw0GBm9uffZNOU2JaiBHck=;
        h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
        b=SGl2DB8e2PYfhfeGQCIWbTyZ2st1VzqqhXzDUdssyYJIb22LMFHi0q1uYhEGhUEsv
         9bW5AFRPa8OCehRf9yJcWEnSKZuOSJAmUOmbNqxDg0Eyrqzcv+x9HJcNKgFWQCY2/j
         wQaEYhaCWu8+1+2W1cw458IQP99WDwlwHvnDqsnv+CyKPDry5bO1MrePHoL6S0q/hR
         8FR9M9xUKN8NoU3C7vTJmtjHsmWRutbM9SQvBX/2q98ghIgT0XP4AfrzQ1lcz9inYE
         tmZ7f8y3I0Xj8gQQCUricCn4L3vp+8jEIQdz0CRbqthbV/uIktbmMFJXKRNPERn/f8
         1eGU8l8kk+nCQ==
From:   Jonathan Corbet <corbet@lwn.net>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Olaf Hering <olaf@aepfle.de>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: Fixes tag needs some work in the jc_docs tree
In-Reply-To: <20230704094623.161dfdbc@canb.auug.org.au>
References: <20230704094623.161dfdbc@canb.auug.org.au>
Date:   Tue, 04 Jul 2023 08:32:22 -0600
Message-ID: <871qhniw7d.fsf@meer.lwn.net>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Stephen Rothwell <sfr@canb.auug.org.au> writes:

> Hi all,
>
> In commit
>
>   c029b8a0c5d0 ("Fix documentation of panic_on_warn")
>
> Fixes tag
>
>   Fixes: 9e3961a0978 ("kernel: add panic_on_warn")
>
> has these problem(s):
>
>   - Target SHA1 does not exist
>
> Maybe you meant
>
> Fixes: 9e3961a09798 ("kernel: add panic_on_warn")

Apologies...I'll get this right one of these years...

Should be good now, thanks.

jon
