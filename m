Return-Path: <SRS0=mkkr=A3=vger.kernel.org=linux-next-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1DBE0C433E1
	for <linux-next@archiver.kernel.org>; Thu, 16 Jul 2020 14:26:28 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E7B03207E8
	for <linux-next@archiver.kernel.org>; Thu, 16 Jul 2020 14:26:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1594909588;
	bh=ZlwmH0E9lZJEivqtWGBdLOZZKFoWh4IDv7GC9uoVejY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=ppaSe6XLDB19aw9x55ZUc6DAbTCIc4WFUn7jnECijYp2SVUdYdnljZWnvmp6rwTwe
	 s9/RSW32TFoBPkexqNIxzfqfiOOCaHX6gUtdyrvLIeyeIbCK6pSOejZVyl5U+Rskh6
	 kAclZ3x470z5V9jsmKV5sd6ZJmdy+o3TSpG7OObA=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728622AbgGPO01 (ORCPT <rfc822;linux-next@archiver.kernel.org>);
        Thu, 16 Jul 2020 10:26:27 -0400
Received: from mail.kernel.org ([198.145.29.99]:50474 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728273AbgGPO01 (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Thu, 16 Jul 2020 10:26:27 -0400
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 8218A206F4;
        Thu, 16 Jul 2020 14:26:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1594909587;
        bh=ZlwmH0E9lZJEivqtWGBdLOZZKFoWh4IDv7GC9uoVejY=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=TVp+u3ET7KIhPTi9oaB3zFY5pcp8lUy7EfO7NBbQFwpbj/wbu44WzSl9OmScTAIz1
         BJCL+NLRIbDHm7AlIP72fInC90LPWzpOZUzRe5Rsol2BtiMzaB/nB1+tqYej9vGCUF
         GY/QrJhJ9JACRG+9XsZmCWfyw0QkUh3pK10mhbrY=
Date:   Thu, 16 Jul 2020 16:26:20 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Bixuan Cui <cuibixuan@huawei.com>
Cc:     linux-next@vger.kernel.org, gustavoars@kernel.org,
        stern@rowland.harvard.edu, linux-kernel@vger.kernel.org,
        linux-usb@vger.kernel.org, qiang.zhang@windriver.com,
        "Wanghui (John)" <john.wanghui@huawei.com>
Subject: Re: [PATCH -next v2] usb: usbtest: reduce stack usage in test_queue
Message-ID: <20200716142620.GB2176745@kroah.com>
References: <20200716082735.66342-1-cuibixuan@huawei.com>
 <42fe1a83-38a5-816b-9258-8a344008f398@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <42fe1a83-38a5-816b-9258-8a344008f398@huawei.com>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Thu, Jul 16, 2020 at 09:47:10PM +0800, Bixuan Cui wrote:
> Fix the warning: [-Werror=-Wframe-larger-than=]
> 
> drivers/usb/misc/usbtest.c: In function 'test_queue':
> drivers/usb/misc/usbtest.c:2148:1:
> warning: the frame size of 1232 bytes is larger than 1024 bytes
> 
> Reported-by: kbuild test robot <lkp@intel.com>
> Signed-off-by: Bixuan Cui <cuibixuan@huawei.com>
> ---
>  drivers/usb/misc/usbtest.c | 10 +++++++++-
>  1 file changed, 9 insertions(+), 1 deletion(-)

What changed from v1?  Always put that below the --- line.

Please fix up and resend a v2.

thanks,

greg k-h
