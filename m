Return-Path: <linux-next-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D17DDC38142
	for <linux-next@archiver.kernel.org>; Thu, 19 Jan 2023 10:11:39 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229598AbjASKLh convert rfc822-to-8bit (ORCPT
        <rfc822;linux-next@archiver.kernel.org>);
        Thu, 19 Jan 2023 05:11:37 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45684 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229590AbjASKLg (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 19 Jan 2023 05:11:36 -0500
Received: from muru.com (muru.com [72.249.23.125])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 1D3EA768A;
        Thu, 19 Jan 2023 02:11:35 -0800 (PST)
Received: from localhost (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id 61F9B80F1;
        Thu, 19 Jan 2023 10:11:34 +0000 (UTC)
Date:   Thu, 19 Jan 2023 12:11:33 +0200
From:   Tony Lindgren <tony@atomide.com>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Olof Johansson <olof@lixom.net>, Arnd Bergmann <arnd@arndb.de>,
        ARM <linux-arm-kernel@lists.infradead.org>,
        Juerg Haefliger <juerg.haefliger@canonical.com>,
        Juerg Haefliger <juergh@canonical.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: manual merge of the omap tree with the arm-soc tree
Message-ID: <Y8kXVekfGHEcPvWg@atomide.com>
References: <20230110095041.0d6311d2@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: 8BIT
In-Reply-To: <20230110095041.0d6311d2@canb.auug.org.au>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

* Stephen Rothwell <sfr@canb.auug.org.au> [230109 22:57]:
> Hi all,
> 
> Today's linux-next merge of the omap tree got a conflict in:
> 
>   arch/arm/mach-omap1/Kconfig
> 
> between commit:
> 
>   67d3928c3df5 ("ARM: omap1: remove unused board files")
> 
> from the arm-soc tree and commit:
> 
>   609c1fabc7c5 ("ARM: omap1: Kconfig: Fix indentation")
> 
> from the omap tree.
> 
> I fixed it up (see below) and can carry the fix as necessary.

Thanks, I just dropped "ARM: omap1: remove unused board files" to
simplify things.

Juerg, care to update and resend in a few weeks after v6.3-rc1
after the omap1 clean-up patches are merged?

Regards,

Tony


