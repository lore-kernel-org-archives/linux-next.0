From: Andy Gross <agross@codeaurora.org>
Subject: Re: next-20150806 build: 2 failures 52 warnings (next-20150806)
Date: Thu, 6 Aug 2015 13:50:05 -0500
Message-ID: <20150806185005.GA31045@qualcomm.com>
References: <E1ZNIul-0007IF-Ev@optimist>
 <20150806171958.GZ20873@sirena.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from smtp.codeaurora.org ([198.145.29.96]:49740 "EHLO
	smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754014AbbHFSuH (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 6 Aug 2015 14:50:07 -0400
Content-Disposition: inline
In-Reply-To: <20150806171958.GZ20873@sirena.org.uk>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Mark Brown <broonie@kernel.org>
Cc: Kumar Gala <galak@codeaurora.org>, David Brown <davidb@codeaurora.org>, David Airlie <airlied@linux.ie>, Rob Clark <robdclark@gmail.com>, jilai wang <jilaiw@codeaurora.org>, kernel-build-reports@lists.linaro.org, linaro-kernel@lists.linaro.org, linux-next@vger.kernel.org, linux-soc@vger.kernel.org, linux-arm-msm@vger.kernel.org

On Thu, Aug 06, 2015 at 06:19:58PM +0100, Mark Brown wrote:
> On Thu, Aug 06, 2015 at 12:00:47PM +0100, Build bot for Mark Brown wrote:
> 
> Today's linux-next fails to build an arm64 allmodconfig due to:
> 
> > 	arm64-allmodconfig
> > ERROR: "qcom_scm_hdcp_req" [drivers/gpu/drm/msm/msm.ko] undefined!
> > ERROR: "qcom_scm_hdcp_available" [drivers/gpu/drm/msm/msm.ko] undefined!
> 
> I'm not sure exactly where it crept in (I suspect it's an architecture
> change) but I do note that there's no select for QCOM_SCM but it has no
> config text.  The arch/arm code does select that symbol but only in SMP
> cases.

I'll look into this.  Thanks for the report.

-- 
Qualcomm Innovation Center, Inc.
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
