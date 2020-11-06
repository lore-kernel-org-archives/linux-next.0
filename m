Return-Path: <SRS0=qnOo=EM=vger.kernel.org=linux-next-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A48D1C2D0A3
	for <linux-next@archiver.kernel.org>; Fri,  6 Nov 2020 10:25:39 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 46E2421707
	for <linux-next@archiver.kernel.org>; Fri,  6 Nov 2020 10:25:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1604658339;
	bh=iCYS5xczwoSPs3A7wGDf5mP0CfR5SUt/GIeOnite/ZE=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-ID:From;
	b=0QCo7+mfmn6U9rmxZfwNOlyqaQ9zTK6GIaIBcLRGaqIaXxi64M41BI6j5z/z+8AyD
	 XERKupZupypXNgaf838B6QusTkVqNPU/twskt7JeWXzRuV6JrT7mJHZPsoLnXaFY+O
	 TIZEUtBUodrCBns2QtHzOwgFUB3+mQfeA9VOz3nM=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726621AbgKFKZi (ORCPT <rfc822;linux-next@archiver.kernel.org>);
        Fri, 6 Nov 2020 05:25:38 -0500
Received: from mail.kernel.org ([198.145.29.99]:59144 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726642AbgKFKZi (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Fri, 6 Nov 2020 05:25:38 -0500
Received: from disco-boy.misterjones.org (disco-boy.misterjones.org [51.254.78.96])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 06F0920720;
        Fri,  6 Nov 2020 10:25:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1604658338;
        bh=iCYS5xczwoSPs3A7wGDf5mP0CfR5SUt/GIeOnite/ZE=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=kE6nsTVJCbBw2gNRqnk7aW6bPLCofZsYTI1CfLd4PrBcmFkAuL8AzSPnSOE93GYKz
         yi/Owz+b1ZpDzuR4P997xlGFFrVrlKNFEQcadqlEcGCA14olJh29vCGCa8IHfySV0d
         7Pk+mO6HZ0OJYRkTLiRu5DBmGv/w7lIPCwcmjO00=
Received: from disco-boy.misterjones.org ([51.254.78.96] helo=www.loen.fr)
        by disco-boy.misterjones.org with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
        (Exim 4.94)
        (envelope-from <maz@kernel.org>)
        id 1kayw2-0089VW-LM; Fri, 06 Nov 2020 10:25:35 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Fri, 06 Nov 2020 10:25:34 +0000
From:   Marc Zyngier <maz@kernel.org>
To:     Murphy Zhou <jencce.kernel@gmail.com>
Cc:     Gavin Shan <gshan@redhat.com>,
        linux-arm-kernel@lists.infradead.org, kvm@vger.kernel.org,
        linux-next@vger.kernel.org
Subject: Re: linux-next arm64 kvm build error
In-Reply-To: <20201106100929.pllgrxcdj3xjx47a@xzhoux.usersys.redhat.com>
References: <20201106100929.pllgrxcdj3xjx47a@xzhoux.usersys.redhat.com>
User-Agent: Roundcube Webmail/1.4.9
Message-ID: <c1bd128a817a8c2677b9e68ee9215a31@kernel.org>
X-Sender: maz@kernel.org
X-SA-Exim-Connect-IP: 51.254.78.96
X-SA-Exim-Rcpt-To: jencce.kernel@gmail.com, gshan@redhat.com, linux-arm-kernel@lists.infradead.org, kvm@vger.kernel.org, linux-next@vger.kernel.org
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On 2020-11-06 10:09, Murphy Zhou wrote:
> Hi,
> 
> It's introduced by this commit:
>     KVM: arm64: Use fallback mapping sizes for contiguous huge page 
> sizes
> and blocking further test.

It's already been reported, with a patch [1], and you can still test
with a 48bit VA configuration.

Thanks,

         M.

[1] https://lore.kernel.org/r/20201103003009.32955-1-gshan@redhat.com
-- 
Jazz is not dead. It just smells funny...
