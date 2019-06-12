Return-Path: <SRS0=4G8J=UL=vger.kernel.org=linux-next-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.6 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 393ECC31E44
	for <linux-next@archiver.kernel.org>; Wed, 12 Jun 2019 01:56:20 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 054F020883
	for <linux-next@archiver.kernel.org>; Wed, 12 Jun 2019 01:56:20 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="jqJrIgKb"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2406027AbfFLB4T (ORCPT <rfc822;linux-next@archiver.kernel.org>);
        Tue, 11 Jun 2019 21:56:19 -0400
Received: from merlin.infradead.org ([205.233.59.134]:33782 "EHLO
        merlin.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2406016AbfFLB4T (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 11 Jun 2019 21:56:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=merlin.20170209; h=Content-Transfer-Encoding:Content-Type:
        In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender
        :Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
        Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
        List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=xR6+1PyIqEmaA8/bOtvN0hFQ+RMhvQfDLxGeET655CQ=; b=jqJrIgKbPqixulb5RqwDZPu1Up
        DMka96rc045kccJWgznJDbskc9aN8KGmGStOPFNk+XPTwElypCI+Ua2k7eC2KUxtSeT9s/SXUPam3
        nVkPYSd9hJKCoFYiamYCxV94uy0ZvAD5n6Zt7CW7P0ox7ijyntubOABgD7LByobX4FemE6PuO39I+
        q1UDqgZS/P6PO7GnSPm/WfvrdgJ6RzQWHF6BJhlwvDhHN2Jty7M6hQ0wZZoOvKujX8NTOVWlg0ghO
        1BViAtO6Y/AKr1WMjc5lfzW+/3LIwT32vccQkHGCIwhKcFJD6tJrwSRxxr77QxKMXcntgpRcDi/sn
        iwfBqRzQ==;
Received: from static-50-53-52-16.bvtn.or.frontiernet.net ([50.53.52.16] helo=dragon.dunlab)
        by merlin.infradead.org with esmtpsa (Exim 4.92 #3 (Red Hat Linux))
        id 1hasUp-0002QX-Vl; Wed, 12 Jun 2019 01:56:16 +0000
Subject: Re: [PATCH net-next] net: dsa: tag_sja1105: Select CONFIG_PACKING
To:     Vladimir Oltean <olteanv@gmail.com>, f.fainelli@gmail.com,
        vivien.didelot@gmail.com, andrew@lunn.ch, sfr@canb.auug.org.au,
        davem@davemloft.net
Cc:     netdev@vger.kernel.org, linux-next@vger.kernel.org
References: <20190611184745.6104-1-olteanv@gmail.com>
From:   Randy Dunlap <rdunlap@infradead.org>
Message-ID: <005d0239-c0fa-7cd2-aed7-df9c46096b60@infradead.org>
Date:   Tue, 11 Jun 2019 18:56:13 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190611184745.6104-1-olteanv@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On 6/11/19 11:47 AM, Vladimir Oltean wrote:
> The packing facility is needed to decode Ethernet meta frames containing
> source port and RX timestamping information.
> 
> The DSA driver selects CONFIG_PACKING, but the tagger did not, and since
> taggers can be now compiled as modules independently from the drivers
> themselves, this is an issue now, as CONFIG_PACKING is disabled by
> default on all architectures.
> 
> Fixes: e53e18a6fe4d ("net: dsa: sja1105: Receive and decode meta frames")
> Signed-off-by: Vladimir Oltean <olteanv@gmail.com>
> Reported-by: Randy Dunlap <rdunlap@infradead.org>

Acked-by: Randy Dunlap <rdunlap@infradead.org> # build-tested

Thanks.

> ---
>  net/dsa/Kconfig | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/net/dsa/Kconfig b/net/dsa/Kconfig
> index d449f78c1bd0..6e942dda1bcd 100644
> --- a/net/dsa/Kconfig
> +++ b/net/dsa/Kconfig
> @@ -106,6 +106,7 @@ config NET_DSA_TAG_LAN9303
>  config NET_DSA_TAG_SJA1105
>  	tristate "Tag driver for NXP SJA1105 switches"
>  	select NET_DSA_TAG_8021Q
> +	select PACKING
>  	help
>  	  Say Y or M if you want to enable support for tagging frames with the
>  	  NXP SJA1105 switch family. Both the native tagging protocol (which
> 


-- 
~Randy
