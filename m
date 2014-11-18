From: Stephen Boyd <sboyd@codeaurora.org>
Subject: Re: [PATCH] ARM: vfp: Silence mvfr0 unused variable warning
Date: Tue, 18 Nov 2014 13:31:22 -0800
Message-ID: <546BBAAA.4050909@codeaurora.org>
References: <1416344191-20484-1-git-send-email-sboyd@codeaurora.org> <20141119081438.3df66238@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20141119081438.3df66238@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Russell King <linux@arm.linux.org.uk>, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-next@vger.kernel.org, Will Deacon <will.deacon@arm.com>, Rob Clark <robdclark@gmail.com>
List-Id: linux-next.vger.kernel.org

On 11/18/2014 01:14 PM, Stephen Rothwell wrote:
> One small nit below:
>> +		if (IS_ENABLED(CONFIG_VFPv3)) {
>> +			mvfr0 = fmrx(MVFR0);
> Now that you have a block here, you could move the declaration of mvfr0
> into this block, right?
>

Sure I can squash in that change.

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
