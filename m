Return-Path: <linux-next-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 213DEC6FA82
	for <linux-next@archiver.kernel.org>; Fri, 23 Sep 2022 12:33:53 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229549AbiIWMdw (ORCPT <rfc822;linux-next@archiver.kernel.org>);
        Fri, 23 Sep 2022 08:33:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43214 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232001AbiIWMdi (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 23 Sep 2022 08:33:38 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8BD374D169;
        Fri, 23 Sep 2022 05:33:37 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 2024E61DEC;
        Fri, 23 Sep 2022 12:33:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 180DAC433C1;
        Fri, 23 Sep 2022 12:33:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1663936416;
        bh=KtW8k0kA+8gTuMRx0SKpjjOhfZ67AD4ypTIX8+v5QAw=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=G3H1EJR9Iu02nPf9zRID8JFBelUjTeu5AX6SkZDItpRVJ9yJa0hltA74ckMtOkhco
         n6gmhTooeVRLY/qhsKu0KVlcn+FTzFz6LG5yVd2riSeofwjY5ek2QHo6llcmtW9Iy/
         sqc0vuY6c0ORZKI5MzsiD49W2eftERFN2ffukLoIcndgQsEH4wFOhFXX1PFGV2ioW5
         wx7ta9MOnwYoDYiyzHK/sxljgYeuU/l3NE7jM0bBoBQOpv+OFBU0DLbd1pHl6p5Lbt
         FwI9EnsHCrf2pu9/y+BC3Y63qQEt7yZiVakiRRa1KxYwc+fIiXTPiKd5FVAtoP1Y/8
         W3VwrncZypJPg==
Date:   Fri, 23 Sep 2022 13:33:31 +0100
From:   Will Deacon <will@kernel.org>
To:     "Sudip Mukherjee (Codethink)" <sudipm.mukherjee@gmail.com>
Cc:     James Clark <james.clark@arm.com>, Mark Brown <broonie@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-next@vger.kernel.org
Subject: Re: build failure of next-20220923 due to cbb0c02caf4b ("perf:
 arm64: Add SVE vector granule register to user regs")
Message-ID: <20220923123329.GA13942@willie-the-truck>
References: <Yy2braL3vc0SYDGl@debian>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Yy2braL3vc0SYDGl@debian>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Fri, Sep 23, 2022 at 12:42:37PM +0100, Sudip Mukherjee (Codethink) wrote:
> Hi All,
> 
> A native build of next-20220923 on arm64 host has failed with the error:
> 
> ./usr/include/asm/perf_regs.h:42:26: error: C++ style comments are not allowed in ISO C90
>    42 |  PERF_REG_ARM64_VG = 46, // SVE Vector Granule
>       |                          ^
> ./usr/include/asm/perf_regs.h:42:26: note: (this will be reported only once per input file)
> 
> I have not bisected but I think it will be from cbb0c02caf4b ("perf: arm64: Add SVE vector granule register to user regs").
> 
> I will be happy to test any patch or provide any extra log if needed.

I had a crack at fixing this last night when it was first reported, so
hopefully the next -next will be alright.

Will
