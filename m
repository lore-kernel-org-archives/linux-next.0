Return-Path: <SRS0=Ie+F=V7=vger.kernel.org=linux-next-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5020EC0650F
	for <linux-next@archiver.kernel.org>; Sat,  3 Aug 2019 01:39:58 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id E426B2173E
	for <linux-next@archiver.kernel.org>; Sat,  3 Aug 2019 01:39:57 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="e9fFQ/W4"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388441AbfHCBj5 (ORCPT <rfc822;linux-next@archiver.kernel.org>);
        Fri, 2 Aug 2019 21:39:57 -0400
Received: from bombadil.infradead.org ([198.137.202.133]:55180 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387975AbfHCBj5 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 2 Aug 2019 21:39:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=In-Reply-To:Content-Type:MIME-Version
        :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=JJ18jXKRYL+LjHZJQGyVORqTBwR9XEPkY/Ue29F9y00=; b=e9fFQ/W4Cn9iL2CW1JTYk1P3H
        6EebSbSHNCQoTIbNQALP34w4xqvVGLDd3LNrSYiD9QVl6XC1/qBo4NdjXpJb5F1qP4UusDbIrJ8in
        vTlp7viQ4e//Q5tCr4oboQAkuPVc7dfu5OgkQm8byGfJTEZ/YiAo7WQjcU62T3itACScsTo/tVIWi
        WtCWXzvSr8Oi0nyQ4b03IDDkEi3NhCtXgxLwueeIN/SQU9QXwyStQjQpU3my2HBF3AXcvk2gPExXm
        dsXAxOjb8UsTff0/yg/UqVm45e3I4XB36ra44SaAcN0LJaDuQi4TTcmnpJXcvFz7Wgya87VIQ4dcN
        UN7/A22CA==;
Received: from willy by bombadil.infradead.org with local (Exim 4.92 #3 (Red Hat Linux))
        id 1htj1V-00079c-0O; Sat, 03 Aug 2019 01:39:53 +0000
Date:   Fri, 2 Aug 2019 18:39:52 -0700
From:   Matthew Wilcox <willy@infradead.org>
To:     Nathan Chancellor <natechancellor@gmail.com>
Cc:     David Miller <davem@davemloft.net>, andrew@lunn.ch,
        broonie@kernel.org, devel@driverdev.osuosl.org,
        f.fainelli@gmail.com, gregkh@linuxfoundation.org,
        hkallweit1@gmail.com, kernel-build-reports@lists.linaro.org,
        linux-arm-kernel@lists.infradead.org, linux-next@vger.kernel.org,
        netdev@vger.kernel.org, lkp@intel.com, rdunlap@infradead.org
Subject: Re: [PATCH] net: mdio-octeon: Fix build error and Kconfig warning
Message-ID: <20190803013952.GF5597@bombadil.infradead.org>
References: <20190731.094150.851749535529247096.davem@davemloft.net>
 <20190731185023.20954-1-natechancellor@gmail.com>
 <20190802.181132.1425585873361511856.davem@davemloft.net>
 <20190803013031.GA76252@archlinux-threadripper>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190803013031.GA76252@archlinux-threadripper>
User-Agent: Mutt/1.11.4 (2019-03-13)
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Fri, Aug 02, 2019 at 06:30:31PM -0700, Nathan Chancellor wrote:
> On Fri, Aug 02, 2019 at 06:11:32PM -0700, David Miller wrote:
> > The proper way to fix this is to include either
> > 
> > 	linux/io-64-nonatomic-hi-lo.h
> > 
> > or
> > 
> > 	linux/io-64-nonatomic-lo-hi.h
> > 
> > whichever is appropriate.
> 
> Hmmmm, is that not what I did?
> 
> Although I did not know about io-64-nonatomic-hi-lo.h. What is the
> difference and which one is needed here?

Whether you write the high or low 32 bits first.  For this, it doesn't
matter, since the compiled driver will never be run on real hardware.

> There is apparently another failure when OF_MDIO is not set, I guess I
> can try to look into that as well and respin into a series if
> necessary.

Thanks for taking care of that!
