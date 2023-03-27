Return-Path: <linux-next-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BE80FC7619A
	for <linux-next@archiver.kernel.org>; Mon, 27 Mar 2023 06:55:24 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232105AbjC0GzX (ORCPT <rfc822;linux-next@archiver.kernel.org>);
        Mon, 27 Mar 2023 02:55:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32790 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231778AbjC0GzX (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 27 Mar 2023 02:55:23 -0400
Received: from muru.com (muru.com [72.249.23.125])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 5BD2849E1;
        Sun, 26 Mar 2023 23:55:21 -0700 (PDT)
Received: from localhost (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id 255588108;
        Mon, 27 Mar 2023 06:55:20 +0000 (UTC)
Date:   Mon, 27 Mar 2023 09:55:18 +0300
From:   Tony Lindgren <tony@atomide.com>
To:     Juerg Haefliger <juerg.haefliger@canonical.com>
Cc:     arnd@arndb.de, juergh@canonical.com,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-next@vger.kernel.org, olof@lixom.net, sfr@canb.auug.org.au
Subject: Re: [PATCH v2] ARM: omap1: Kconfig: Fix indentation
Message-ID: <20230327065518.GQ7501@atomide.com>
References: <Y8kXVekfGHEcPvWg@atomide.com>
 <20230315091152.132443-1-juerg.haefliger@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230315091152.132443-1-juerg.haefliger@canonical.com>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

* Juerg Haefliger <juerg.haefliger@canonical.com> [230315 11:12]:
> The convention for indentation seems to be a single tab. Help text is
> further indented by an additional two whitespaces. Fix the lines that
> violate these rules.
> 
> Signed-off-by: Juerg Haefliger <juerg.haefliger@canonical.com>
> 
> ---
> v2: Updated for latest upstream.

Thans for updating it, applying into omap-for-v6.4/omap1.

Regards,

Tony
