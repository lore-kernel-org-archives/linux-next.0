From: Andy Gross <agross@codeaurora.org>
Subject: Re: linux-next: manual merge of the qcom tree with the arm-soc tree
Date: Mon, 12 Oct 2015 11:29:13 -0500
Message-ID: <20151012162913.GA31761@qualcomm.com>
References: <20151012101912.33e77590@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from smtp.codeaurora.org ([198.145.29.96]:52569 "EHLO
	smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751073AbbJLQ3P (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 12 Oct 2015 12:29:15 -0400
Content-Disposition: inline
In-Reply-To: <20151012101912.33e77590@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Olof Johansson <olof@lixom.net>, Arnd Bergmann <arnd@arndb.de>, linux-arm-kernel@lists.infradead.org, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, Sjoerd Simons <sjoerd.simons@collabora.co.uk>

On Mon, Oct 12, 2015 at 10:19:12AM +1100, Stephen Rothwell wrote:
> Hi Andy,
> 
> Today's linux-next merge of the qcom tree got a conflict in:
> 
>   arch/arm/configs/multi_v7_defconfig
> 
> between commits:
> 
>   b605aded4491 ("ARM: multi_v7_defconfig: Add missing QCOM APQ8064 configs")
>   cc68819a582c ("ARM: multi_v7_defconfig: Enable Rockchip display support")
> 
> from the arm-soc tree and commit:
> 
>   4e7fb93081f8 ("ARM: multi_v7_defconfig: Enable QCOM SMD/RPM")
> 
> from the qcom tree.
> 
> I fixed it up (see below) and can carry the fix as necessary (no action


Thanks.  I'll redo that patch based on arm-soc's next before sending the pull
request.  multi_v7 defconfig changes are always a barrel o' fun

-- 
Qualcomm Innovation Center, Inc.
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
