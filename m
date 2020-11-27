Return-Path: <linux-next-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A0E4BC2D0E4
	for <linux-next@archiver.kernel.org>; Fri, 27 Nov 2020 10:19:53 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 3E364206CA
	for <linux-next@archiver.kernel.org>; Fri, 27 Nov 2020 10:19:53 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=mess.org header.i=@mess.org header.b="bEzXrwlR"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726178AbgK0KTx (ORCPT <rfc822;linux-next@archiver.kernel.org>);
        Fri, 27 Nov 2020 05:19:53 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51178 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725616AbgK0KTw (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 27 Nov 2020 05:19:52 -0500
X-Greylist: delayed 483 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Fri, 27 Nov 2020 02:19:52 PST
Received: from gofer.mess.org (gofer.mess.org [IPv6:2a02:8011:d000:212::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8BFDEC0613D1
        for <linux-next@vger.kernel.org>; Fri, 27 Nov 2020 02:19:52 -0800 (PST)
Received: by gofer.mess.org (Postfix, from userid 1000)
        id B7EF711A002; Fri, 27 Nov 2020 10:11:45 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=mess.org; s=2020;
        t=1606471905; bh=cRd++8FxFtFtEqKfQ2I2Pyvg3fB2wERHgK8QdwcN7WA=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=bEzXrwlRnLhVAewRKDrlSkU5Q9m6AruxVpUsDISjwMNoBRWIFRxnjyeiq3Xg+u7WN
         pQCTbUDXvjyOQp+q1fNq0Wgbch7EjZ13Zu1JYNd2NXDjVtdyokrRqifYZWDig9IKDx
         Z2mSlNFuGlTToUS0VdBpzRo/v4iWTthks0S2qpF16nD1g1ue6ESLfHHmgcy0ngj1l4
         NLynMI5ed73ZDpOtVfkTim+W0JA34Aef7fNsT/sJ8Jqh8cWYjFXzWN5Sq7ZyVYuSSP
         GcejbuaAZTRKybZXfWffXPgQlJ7Cv2oW+ZvvEgERQXUcPgvZKnv7i2IHA36pANooLt
         w5xwdTjThZO+Q==
Date:   Fri, 27 Nov 2020 10:11:45 +0000
From:   Sean Young <sean@mess.org>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Dan Carpenter <dan.carpenter@oracle.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build warning after merge of the v4l-dvb tree
Message-ID: <20201127101145.GB4263@gofer.mess.org>
References: <20201118162934.6a12b8f2@canb.auug.org.au>
 <20201126175452.4ff300db@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201126175452.4ff300db@canb.auug.org.au>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Thu, Nov 26, 2020 at 05:54:52PM +1100, Stephen Rothwell wrote:
> Hi all,
> 
> On Wed, 18 Nov 2020 16:29:34 +1100 Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> >
> > After merging the v4l-dvb tree, today's linux-next build (htmldocs)
> > produced this warning:
> > 
> > Documentation/output/lirc.h.rst:6: WARNING: undefined label: rc-proto-max (if the link has no caption the label must precede a section header)
> > 
> > Introduced by commit
> > 
> >   72e637fec558 ("media: rc: validate that "rc_proto" is reasonable")
> 
> I am still getting this - despite commit
> 
>  cea357bc2571 ("media: lirc: ensure RC_PROTO_MAX has documentation")
> 
> and today I got a second copy of the warning ...

Yes, this my bad. Thanks for pointing this out -- again.

In the mean time, this should be resolved by commit 711561a41d1f ("media:
lirc: fix lirc.h documentation generation").

Thanks,

Sean
