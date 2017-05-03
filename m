From: Timur Tabi <timur@codeaurora.org>
Subject: Re: [PATCH 0/9] [v3] arm64: defconfig: enable several options useful
 for ARM64 server platforms
Date: Wed, 3 May 2017 10:53:41 -0500
Message-ID: <49cef082-f1e7-a790-0a9c-9f0c9fe12d4a@codeaurora.org>
References: <1493413563-18375-1-git-send-email-timur@codeaurora.org>
 <20170503154852.GS8233@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from smtp.codeaurora.org ([198.145.29.96]:60422 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751444AbdECPxo (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 3 May 2017 11:53:44 -0400
In-Reply-To: <20170503154852.GS8233@arm.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Will Deacon <will.deacon@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-next@vger.kernel.org, Gregory CLEMENT <gregory.clement@free-electrons.com>, Catalin Marinas <catalin.marinas@arm.com>, Arnd Bergmann <arnd@arndb.de>

On 05/03/2017 10:48 AM, Will Deacon wrote:
> The arm-soc folks usually deal with defconfig updates, so please resend this
> to arm@kernel.org, although I suspect it's too late for 4.12 given that the
> merge window is now open. The "resynchronize" patch is also likely to
> conflict with any other pending changes to the file.

I'm sure it will conflict, but the defconfig has to be synchronized sooner
or later.  Frankly, I think Linus should just do a "batch resynchronize" of
every defconfig in every release (e.g. make it the last commit).
arch/arm64/configs/defconfig is way off today, and it's only going to get worse.

-- 
Qualcomm Datacenter Technologies, Inc. as an affiliate of Qualcomm
Technologies, Inc.  Qualcomm Technologies, Inc. is a member of the
Code Aurora Forum, a Linux Foundation Collaborative Project.
