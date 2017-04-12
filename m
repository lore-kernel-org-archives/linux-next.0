From: Timur Tabi <timur@codeaurora.org>
Subject: Re: [PATCH 5/8] arm64: defconfig: enable EFI_VARS and
 EFI_CAPSULE_LOADER
Date: Wed, 12 Apr 2017 15:58:07 -0500
Message-ID: <b795d943-c85f-4f39-ec13-2388f6f7f6bb@codeaurora.org>
References: <1492012980-11650-1-git-send-email-timur@codeaurora.org>
 <1492012980-11650-6-git-send-email-timur@codeaurora.org>
 <a80a1b2f-e5fa-36c7-5175-8a9718584720@arm.com>
 <20170412161442.GB7153@leverpostej>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from smtp.codeaurora.org ([198.145.29.96]:53752 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1754675AbdDLU6N (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 12 Apr 2017 16:58:13 -0400
In-Reply-To: <20170412161442.GB7153@leverpostej>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Mark Rutland <mark.rutland@arm.com>, Robin Murphy <robin.murphy@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, sfr@canb.auug.org.au, linux-next@vger.kernel.org, maxime.ripard@free-electrons.com, olof@lixom.net, Wei Xu <xuwei5@hisilicon.com>, ard.biesheuvel@linaro.org, leif.lindholm@arm.com

On 04/12/2017 11:14 AM, Mark Rutland wrote:
>>> > > Many ARM64 server systems boot via EFI, so enable support for some EFI
>>> > > options to allow applications to interact with EFI.
>>> > > 
>>> > > CONFIG_EFI_VARS enables sysfs support for reading and writing variables
>> > 
>> > Isn't efivarfs preferred for that these days, or have I imagined that?
>> > 
>> > Robin.
> Ard, Leif?

So my research suggests that efivarfs is a replacement for CONFIG_EFI_VARS.
We may still have some older programs that use the sysfs entries, but I'm
not sure.

Regardless, I will drop EFI_VARS from v2 of the patset, and just set
EFI_CAPSULE_LOADER.

-- 
Qualcomm Datacenter Technologies, Inc. as an affiliate of Qualcomm
Technologies, Inc.  Qualcomm Technologies, Inc. is a member of the
Code Aurora Forum, a Linux Foundation Collaborative Project.
