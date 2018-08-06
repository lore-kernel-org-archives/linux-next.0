From: Heiko Stuebner <heiko@sntech.de>
Subject: Re: linux-next: Signed-off-by missing for commit in the rockchip tree
Date: Mon, 06 Aug 2018 23:49:50 +0200
Message-ID: <1644264.7NhfmVZyFD@phil>
References: <20180807072902.62d6b279@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180807072902.62d6b279@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

Hi Stephen,

Am Montag, 6. August 2018, 23:29:16 CEST schrieb Stephen Rothwell:
> Hi Heiko,
> 
> Commit
> 
>   508fc689cfe5 ("clk: rockchip: Add pclk_rkpwm_pmu to PMU critical clocks in rk3399")
> 
> is missing a Signed-off-by from its committer.

thanks for noticing this mistake. I've fixed the commit to add the
missing Signed-off-by ... I blame the heat of the last weeks ;-)


Thanks
Heiko
