Return-Path: <linux-next-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 661DDC5519F
	for <linux-next@archiver.kernel.org>; Sun, 22 Nov 2020 15:13:36 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 23D5A20776
	for <linux-next@archiver.kernel.org>; Sun, 22 Nov 2020 15:13:36 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="h4E8xZI/"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727889AbgKVPNP (ORCPT <rfc822;linux-next@archiver.kernel.org>);
        Sun, 22 Nov 2020 10:13:15 -0500
Received: from mail.kernel.org ([198.145.29.99]:60350 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727728AbgKVPNP (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Sun, 22 Nov 2020 10:13:15 -0500
Received: from localhost (129.sub-72-107-112.myvzw.com [72.107.112.129])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 9F47320773;
        Sun, 22 Nov 2020 15:13:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1606057994;
        bh=VxOpbFCo20zTNX/fHJ9IRt1WuNySr5HXXq6vrx5fscU=;
        h=Date:From:To:Cc:Subject:In-Reply-To:From;
        b=h4E8xZI/xK8GEdrGfQwOblul4PfT2/cF1cBPr7l0VgL2wY43g3ZG7+sa+51G/ZRJv
         Gk27aySFxr/PgZmo1s+Gw3BaGve7x68b74WXpxBUknle3WqtLlkxbbMZfnlTh9bElS
         Rqj7I6K/WyraQBiLIU8rr6WLxeXFr1ZyffKBG2AE=
Date:   Sun, 22 Nov 2020 09:13:13 -0600
From:   Bjorn Helgaas <helgaas@kernel.org>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Bjorn Helgaas <bhelgaas@google.com>,
        Colin Ian King <colin.king@canonical.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: Fixes tag needs some work in the pci tree
Message-ID: <20201122151313.GA390256@bjorn-Precision-5520>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201122205525.1219bfaf@canb.auug.org.au>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Sun, Nov 22, 2020 at 08:55:25PM +1100, Stephen Rothwell wrote:
> Hi all,
> 
> In commit
> 
>   466d79c1a470 ("PCI: Fix overflow in command-line resource alignment requests")
> 
> Fixes tag
> 
>   Fixes: 32a9a682bef2 ("PCI: allow assignment of memory resources with a
> 
> has these problem(s):
> 
>   - Subject has leading but no trailing parentheses
>   - Subject has leading but no trailing quotes
> 
> Please do not split Fixes tags over more than one line.

Fixed, thanks!  I probably won't rebuild the "next" branch containing
this until Monday.
