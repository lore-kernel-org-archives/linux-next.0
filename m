Return-Path: <SRS0=Pnbl=UJ=vger.kernel.org=linux-next-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_MUTT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9207AC468C1
	for <linux-next@archiver.kernel.org>; Mon, 10 Jun 2019 06:41:49 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 6EE02207E0
	for <linux-next@archiver.kernel.org>; Mon, 10 Jun 2019 06:41:49 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387688AbfFJGlt (ORCPT <rfc822;linux-next@archiver.kernel.org>);
        Mon, 10 Jun 2019 02:41:49 -0400
Received: from muru.com ([72.249.23.125]:52388 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2387655AbfFJGlt (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 10 Jun 2019 02:41:49 -0400
Received: from atomide.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id 39169807E;
        Mon, 10 Jun 2019 06:42:09 +0000 (UTC)
Date:   Sun, 9 Jun 2019 23:41:45 -0700
From:   Tony Lindgren <tony@atomide.com>
To:     Mark Brown <broonie@kernel.org>
Cc:     =?utf-8?Q?Beno=C3=AEt?= Cousson <bcousson@baylibre.com>,
        linux-next@vger.kernel.org, linux-omap@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Kevin Hilman <khilman@baylibre.com>
Subject: Re: next/master boot: 257 boots: 11 failed, 229 passed with 16
 offline, 1 conflict (next-20190604)
Message-ID: <20190610064145.GS5447@atomide.com>
References: <5cf685d0.1c69fb81.e3d89.43ae@mx.google.com>
 <20190604160018.GI2456@sirena.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190604160018.GI2456@sirena.org.uk>
User-Agent: Mutt/1.11.4 (2019-03-13)
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Hi,

* Mark Brown <broonie@kernel.org> [190604 16:00]:
> On Tue, Jun 04, 2019 at 07:53:04AM -0700, kernelci.org bot wrote:
> 
> Today's -next fails to boot omap2plus_defconfig on Beagle XM:
> 
> >     omap2plus_defconfig:
> >         gcc-8:
> >           omap3-beagle-xm:
> >               lab-baylibre: failing since 1 day (last pass: next-20190531 - first fail: next-20190603)
> 
> The boot fails silently with no output after the bootloader:
> 
>     https://kernelci.org/boot/id/5cf655fc59b5149acad51504/
> 
> which isn't much to go on, it does seem to have been OK in
> multi_v7_defconfig though.

Thanks for the report, adding Kevin to Cc. I think this is the same
board that seems to have started randomly failing?

Regards,

Tony
