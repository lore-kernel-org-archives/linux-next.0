Return-Path: <linux-next-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 44416C2D0E4
	for <linux-next@archiver.kernel.org>; Tue, 17 Nov 2020 19:34:25 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id CEB3B24248
	for <linux-next@archiver.kernel.org>; Tue, 17 Nov 2020 19:34:24 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="Xpzw0tID"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726340AbgKQTdx (ORCPT <rfc822;linux-next@archiver.kernel.org>);
        Tue, 17 Nov 2020 14:33:53 -0500
Received: from mail.kernel.org ([198.145.29.99]:42780 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725613AbgKQTdx (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 17 Nov 2020 14:33:53 -0500
Received: from kicinski-fedora-PC1C0HJN.hsd1.ca.comcast.net (c-67-180-217-166.hsd1.ca.comcast.net [67.180.217.166])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 97A6E24248;
        Tue, 17 Nov 2020 19:33:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1605641633;
        bh=xiFTO+xtMId5Mc1ydGqE7ry0Mj0N+6Jalzdl0AnD3zE=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=Xpzw0tIDQ4CDHP6mQaixSQ+1SFjYxHhZzrtEgV0Zu6iw3VIsMoy5JG/8iqFySu5OP
         FKSht2qYexAm2YiiPMS7rdGrt/VYey3lAYpPxM9yg2jcLEpnNmUFj5Xq954cnTerSZ
         gQ4RW4IW+GBdd77hVxLse7BVstbHeu0NKFbrd7rA=
Date:   Tue, 17 Nov 2020 11:33:51 -0800
From:   Jakub Kicinski <kuba@kernel.org>
To:     Florian Westphal <fw@strlen.de>
Cc:     Randy Dunlap <rdunlap@infradead.org>, linux-kernel@vger.kernel.org,
        kernel test robot <lkp@intel.com>,
        Aleksandr Nogikh <nogikh@google.com>,
        Willem de Bruijn <willemb@google.com>,
        linux-next@vger.kernel.org, netdev@vger.kernel.org
Subject: Re: [PATCH net-next v5] net: linux/skbuff.h: combine SKB_EXTENSIONS
 + KCOV handling
Message-ID: <20201117113351.144ddb79@kicinski-fedora-PC1C0HJN.hsd1.ca.comcast.net>
In-Reply-To: <20201117063626.GF22792@breakpoint.cc>
References: <20201116212108.32465-1-rdunlap@infradead.org>
        <20201117063626.GF22792@breakpoint.cc>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Tue, 17 Nov 2020 07:36:26 +0100 Florian Westphal wrote:
> Randy Dunlap <rdunlap@infradead.org> wrote:
> > The previous Kconfig patch led to some other build errors as
> > reported by the 0day bot and my own overnight build testing.
> > 
> > These are all in <linux/skbuff.h> when KCOV is enabled but
> > SKB_EXTENSIONS is not enabled, so fix those by combining those conditions
> > in the header file.  
> 
> Acked-by: Florian Westphal <fw@strlen.de>

Applied, thanks1
