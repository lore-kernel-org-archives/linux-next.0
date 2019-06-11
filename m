Return-Path: <SRS0=lqV3=UK=vger.kernel.org=linux-next-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.3 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_MUTT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1127DC4321A
	for <linux-next@archiver.kernel.org>; Tue, 11 Jun 2019 17:06:51 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id E3F302086D
	for <linux-next@archiver.kernel.org>; Tue, 11 Jun 2019 17:06:50 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390815AbfFKRGu (ORCPT <rfc822;linux-next@archiver.kernel.org>);
        Tue, 11 Jun 2019 13:06:50 -0400
Received: from foss.arm.com ([217.140.110.172]:38194 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2388316AbfFKRGu (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 11 Jun 2019 13:06:50 -0400
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B6F24346;
        Tue, 11 Jun 2019 10:06:49 -0700 (PDT)
Received: from e107155-lin (e107155-lin.cambridge.arm.com [10.1.196.42])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id CDD273F73C;
        Tue, 11 Jun 2019 10:06:48 -0700 (PDT)
Date:   Tue, 11 Jun 2019 18:06:46 +0100
From:   Sudeep Holla <sudeep.holla@arm.com>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Sudeep Holla <sudeep.holla@arm.com>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        ARM SoC Team <arm@kernel.org>,
        Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
        Liviu Dudau <liviu.dudau@arm.com>
Subject: linux-next: inclusion of my tree for early testing
Message-ID: <20190611170646.GB27548@e107155-lin>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Hi Stephen,

I maintain SCMI(drivers/firmware/arm_scmi) and co-maintain vexpress
and few other ARM Ltd platforms. I usually send pull request to
ARM SoC team(Olof/Arnd/Kevin) to get the changes merged into mainline.

Sometimes ARM SoC team are busy and may pull the changes quite late
in the cycle. So similar to few other ARM platform sub-maintainers, I
would like to add my branch which I intend to send pull request to ARM
SoC to be added to linux-next so that it can get more testing.

The repo and branch details as below:

git://git.kernel.org/pub/scm/linux/kernel/git/sudeep.holla/linux.git for-linux-next

Please add the same if you are fine with it.

--
Regards,
Sudeep
