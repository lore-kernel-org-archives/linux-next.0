Return-Path: <SRS0=LBCO=BG=vger.kernel.org=linux-next-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BE532C433E3
	for <linux-next@archiver.kernel.org>; Mon, 27 Jul 2020 07:43:03 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 8FBD920738
	for <linux-next@archiver.kernel.org>; Mon, 27 Jul 2020 07:43:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1595835783;
	bh=CWDrS913xhE/Ei5VKRgacCZBZZ5CT52NbA8L2aWjx8U=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-ID:From;
	b=yc4AKa57vFrcgqNuF9s7lqZdkjmhV4COmc1vToP8aJ6GaOYNJbkzv3Z9jUhPnwO6g
	 RCUH9UT8Yb/5V33whHGrRMjm6j89zLQn4CRsAy9OdiSDUzpSso5u29HMatnePmA6Oe
	 egggq0vrfdegm1wDA25epPdGslwhh16Jm8L1ojvU=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726183AbgG0HnD (ORCPT <rfc822;linux-next@archiver.kernel.org>);
        Mon, 27 Jul 2020 03:43:03 -0400
Received: from mail.kernel.org ([198.145.29.99]:33894 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726116AbgG0HnD (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 27 Jul 2020 03:43:03 -0400
Received: from disco-boy.misterjones.org (disco-boy.misterjones.org [51.254.78.96])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 90B212072E;
        Mon, 27 Jul 2020 07:43:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1595835782;
        bh=CWDrS913xhE/Ei5VKRgacCZBZZ5CT52NbA8L2aWjx8U=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=04BPySg3vTHHFuE6IVvZMuxbzbtb/uzbjuKvBAdIUkHp6tq5XF+7MJoLbRVZ3LHSE
         y9s3q6mM1VT+/fttpy3P4ZRnymKtZBgoLWTCxAmDoKh8cmTrvBJfWXuufjV2c5AxsW
         /z+4p//QrVD3PitJOegbt19ciAgz3e2pUM37w8io=
Received: from disco-boy.misterjones.org ([51.254.78.96] helo=www.loen.fr)
        by disco-boy.misterjones.org with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.92)
        (envelope-from <maz@kernel.org>)
        id 1jzxmn-00FDtT-6A; Mon, 27 Jul 2020 08:43:01 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Mon, 27 Jul 2020 08:43:01 +0100
From:   Marc Zyngier <maz@kernel.org>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: linux-next: Signed-off-by missing for commit in the irqchip tree
In-Reply-To: <20200727081003.7ffaa22d@canb.auug.org.au>
References: <20200727081003.7ffaa22d@canb.auug.org.au>
User-Agent: Roundcube Webmail/1.4.5
Message-ID: <c6211f3d4f9c85a0fa77f19ef4efec95@kernel.org>
X-Sender: maz@kernel.org
X-SA-Exim-Connect-IP: 51.254.78.96
X-SA-Exim-Rcpt-To: sfr@canb.auug.org.au, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Hi Stephen,

On 2020-07-26 23:10, Stephen Rothwell wrote:
> Hi all,
> 
> Commit
> 
>   e5c19cf32b68 ("irqchip/stm32-exti: Use the
> hwspin_lock_timeout_in_atomic() API")
> 
> is missing a Signed-off-by from its committer.

Looks like I fat-fingered a b4 invocation! Thanks for the heads up,
will be fixed in a minute.

         M.
-- 
Jazz is not dead. It just smells funny...
