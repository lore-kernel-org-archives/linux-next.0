Return-Path: <linux-next-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B224AE95A8F
	for <linux-next@archiver.kernel.org>; Tue, 10 Oct 2023 10:20:28 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229892AbjJJKU1 (ORCPT <rfc822;linux-next@archiver.kernel.org>);
        Tue, 10 Oct 2023 06:20:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60700 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229941AbjJJKU1 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 10 Oct 2023 06:20:27 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AC7CE94;
        Tue, 10 Oct 2023 03:20:25 -0700 (PDT)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 352B2C433C7;
        Tue, 10 Oct 2023 10:20:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1696933225;
        bh=UIzJx9EmdbrSr5WpmaFcMaGe/RDVjYRXUMS2tzKKXmY=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=HSwSQWITufInYmmSKAke1aptuLT9IKtBaJqTbLmntC7oDswHXF4OgQPyYJtnSNrEK
         1q4Ky4z6l6QGO3MR+NeyfrPd4r2OieTlf/lQv+urTUPeTCuX4Zo/AXYTCCTpSd06gQ
         10Wzdgs+NoDQn8aX5NSB8w+qrWLcs1UGPRTgO0e0j3UxDCOUC+7LaSmhz9RYypKmgT
         TZYYmZUHjHgjIcST6dpkk8ibmKx7XerZUmbxkCvmsH3xHAi5puey68vCnWXBl8+I5e
         Cznm8AfPzV7VCPaJFpOHGX3TmnzPWw0wWiiO6sZwo52WDGs6HoNkyxSK1blpg3jmlg
         shKpR/hB6VMEQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 1D1FCE0009E;
        Tue, 10 Oct 2023 10:20:25 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net] net/smc: Fix dependency of SMC on ISM
From:   patchwork-bot+netdevbpf@kernel.org
Message-Id: <169693322510.26630.14172040587036609321.git-patchwork-notify@kernel.org>
Date:   Tue, 10 Oct 2023 10:20:25 +0000
References: <20231006125847.1517840-1-gbayer@linux.ibm.com>
In-Reply-To: <20231006125847.1517840-1-gbayer@linux.ibm.com>
To:     Gerd Bayer <gbayer@linux.ibm.com>
Cc:     rdunlap@infradead.org, wenjia@linux.ibm.com,
        linux-kernel@vger.kernel.org, linux-next@vger.kernel.org,
        netdev@vger.kernel.org, raspl@linux.ibm.com, sfr@canb.auug.org.au,
        alibuda@linux.alibaba.com, wintera@linux.ibm.com,
        guwen@linux.alibaba.com, tonylu@linux.alibaba.com,
        jaka@linux.ibm.com
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Hello:

This patch was applied to netdev/net.git (main)
by Paolo Abeni <pabeni@redhat.com>:

On Fri,  6 Oct 2023 14:58:47 +0200 you wrote:
> When the SMC protocol is built into the kernel proper while ISM is
> configured to be built as module, linking the kernel fails due to
> unresolved dependencies out of net/smc/smc_ism.o to
> ism_get_smcd_ops, ism_register_client, and ism_unregister_client
> as reported via the linux-next test automation (see link).
> This however is a bug introduced a while ago.
> 
> [...]

Here is the summary with links:
  - [net] net/smc: Fix dependency of SMC on ISM
    https://git.kernel.org/netdev/net/c/a72178cfe855

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


