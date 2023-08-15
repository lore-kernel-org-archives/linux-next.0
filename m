Return-Path: <linux-next-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3C585C41513
	for <linux-next@archiver.kernel.org>; Tue, 15 Aug 2023 17:33:31 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238965AbjHORc5 (ORCPT <rfc822;linux-next@archiver.kernel.org>);
        Tue, 15 Aug 2023 13:32:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45222 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238889AbjHORcZ (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 15 Aug 2023 13:32:25 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AC44D1BD7;
        Tue, 15 Aug 2023 10:32:24 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 46D9964AE5;
        Tue, 15 Aug 2023 17:32:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8C917C433CD;
        Tue, 15 Aug 2023 17:32:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1692120743;
        bh=SkRhyPf29u94NXSe+SgrmqpQYI+LqRjgJJoSkouM+Ps=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=HvZY4M7FBtrmbWm3RIal6ANh/Nmh4r/KZL9zIyxkWjqBTZFSrGvF4jgxhANIM9F45
         ghaj88bcKERwSlq92nk7NaBIdAO3BAR2W+ucB+0lLQopkE2nsDNPkhAvX4DmmzGl1A
         bCCt0qfsVaBNZROYglKcEMZeO5bgl/GyW3/xfaOVGWkRK6Xxvux3EwqOuFgXEYk71m
         8rNEp35t5Vug0eNbbzaUTnr8K+TpPc24Z/UEyXcZLbGRNwpOLHXnTPNxvmYIiNYoLo
         jDfUI5g6YUEMzynJzjAhAfCXnSJ4KnFdr4L1mrgyvRmCD77OGPbhoZQrp+9wnU9DWN
         aWFSWEdV+ZPkQ==
Date:   Tue, 15 Aug 2023 18:32:19 +0100
From:   Lee Jones <lee@kernel.org>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Rob Herring <robh@kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: unexpected file in the mfd tree
Message-ID: <20230815173219.GF648357@google.com>
References: <20230809081524.006da553@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230809081524.006da553@canb.auug.org.au>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Wed, 09 Aug 2023, Stephen Rothwell wrote:

> Hi all,
> 
> Commit
> 
>   bb60922c31d0 ("mfd: Explicitly include correct DT includes")
> 
> added this unexpected file:
> 
>   drivers/mfd/rz-mtu3.c.rej

Already fixed, thanks.

-- 
Lee Jones [李琼斯]
