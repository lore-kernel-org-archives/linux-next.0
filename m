From: Andy Gross <agross@codeaurora.org>
Subject: Re: next-20150807 build: 2 failures 51 warnings (next-20150807)
Date: Fri, 7 Aug 2015 12:30:31 -0500
Message-ID: <20150807173031.GA25070@qualcomm.com>
References: <E1ZNgYS-0000SE-QL@optimist>
 <20150807122344.GT20873@sirena.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-arm-msm-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20150807122344.GT20873@sirena.org.uk>
Sender: linux-arm-msm-owner@vger.kernel.org
To: Mark Brown <broonie@kernel.org>
Cc: David Brown <davidb@codeaurora.org>, Stephen Boyd <sboyd@codeaurora.org>, Lina Iyer <lina.iyer@linaro.org>, kernel-build-reports@lists.linaro.org, linaro-kernel@lists.linaro.org, linux-next@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org
List-Id: linux-next.vger.kernel.org

On Fri, Aug 07, 2015 at 01:23:44PM +0100, Mark Brown wrote:
> On Fri, Aug 07, 2015 at 01:15:20PM +0100, Build bot for Mark Brown wrote:
> 
> Today's linux-next fails to build an arm64 allmodconfig with:
> 
> > 	arm64-allmodconfig
> > ../drivers/firmware/qcom_scm-32.c:27:28: fatal error: asm/outercache.h: No such file or directory
> 
> This header file only exists on ARM, either the driver shouldn't be
> built for ARMv8, we need a dummy header for ARMv8 or we need to use the
> header conditionally in the driver.

Right.  We're right in the middle of pulling together SCM for 64 bit.  I think
for now, perhaps I should just send in a stubbed out placeholder for ARMV8 SCM
and then fill it in once we get that patch set reworked (previously sent by
Kumar Gala).

I'll add that to my branch today and it should resolve our next builds.  I'll
send it to arm/soc in a fixes pull request.

-- 
Qualcomm Innovation Center, Inc.
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
