Return-Path: <SRS0=mkkr=A3=vger.kernel.org=linux-next-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8F01EC433E3
	for <linux-next@archiver.kernel.org>; Thu, 16 Jul 2020 09:53:20 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 72B4B207F9
	for <linux-next@archiver.kernel.org>; Thu, 16 Jul 2020 09:53:20 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726293AbgGPJxT (ORCPT <rfc822;linux-next@archiver.kernel.org>);
        Thu, 16 Jul 2020 05:53:19 -0400
Received: from smtprelay0250.hostedemail.com ([216.40.44.250]:38766 "EHLO
        smtprelay.hostedemail.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726027AbgGPJxT (ORCPT
        <rfc822;linux-next@vger.kernel.org>);
        Thu, 16 Jul 2020 05:53:19 -0400
X-Greylist: delayed 382 seconds by postgrey-1.27 at vger.kernel.org; Thu, 16 Jul 2020 05:53:19 EDT
Received: from smtprelay.hostedemail.com (10.5.19.251.rfc1918.com [10.5.19.251])
        by smtpgrave05.hostedemail.com (Postfix) with ESMTP id 894D91802E6DA
        for <linux-next@vger.kernel.org>; Thu, 16 Jul 2020 09:46:58 +0000 (UTC)
Received: from filter.hostedemail.com (clb03-v110.bra.tucows.net [216.40.38.60])
        by smtprelay03.hostedemail.com (Postfix) with ESMTP id 3F00D837F24D;
        Thu, 16 Jul 2020 09:46:57 +0000 (UTC)
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-HE-Tag: mind98_58102b926f01
X-Filterd-Recvd-Size: 1571
Received: from XPS-9350.home (unknown [47.151.133.149])
        (Authenticated sender: joe@perches.com)
        by omf03.hostedemail.com (Postfix) with ESMTPA;
        Thu, 16 Jul 2020 09:46:55 +0000 (UTC)
Message-ID: <687734b1623965b154752252968adeca35740c88.camel@perches.com>
Subject: Re: [PATCH] net: neterion: vxge: reduce stack usage in
 VXGE_COMPLETE_VPATH_TX
From:   Joe Perches <joe@perches.com>
To:     Bixuan Cui <cuibixuan@huawei.com>, davem@davemloft.net,
        kuba@kernel.org, linux-next@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
        jdmason@kudzu.us, christophe.jaillet@wanadoo.fr,
        john.wanghui@huawei.com
Date:   Thu, 16 Jul 2020 02:46:54 -0700
In-Reply-To: <20200716173247.78912-1-cuibixuan@huawei.com>
References: <20200716173247.78912-1-cuibixuan@huawei.com>
Content-Type: text/plain; charset="ISO-8859-1"
User-Agent: Evolution 3.36.3-0ubuntu1 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Thu, 2020-07-16 at 17:32 +0000, Bixuan Cui wrote:
> Fix the warning: [-Werror=-Wframe-larger-than=]
[]
> diff --git a/drivers/net/ethernet/neterion/vxge/vxge-main.c b/drivers/net/ethernet/neterion/vxge/vxge-main.c
[]
> @@ -100,8 +100,14 @@ static inline void VXGE_COMPLETE_VPATH_TX(struct vxge_fifo *fifo)
>  	struct sk_buff **temp;
>  #define NR_SKB_COMPLETED 128
>  	struct sk_buff *completed[NR_SKB_COMPLETED];
> +	struct sk_buff **completed;
>  	int more;
> 
> +	completed = kcalloc(NR_SKB_COMPLETED, sizeof(*completed),
> +			    GFP_KERNEL);

I doubt this is a good idea.
Check the callers interrupt status.


