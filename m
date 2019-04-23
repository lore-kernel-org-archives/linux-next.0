From: Matthias Kaehlcke <mka@chromium.org>
Subject: Re: linux-next: build failure after merge of the qcom tree
Date: Tue, 23 Apr 2019 16:50:41 -0700
Message-ID: <20190423235041.GF112750@google.com>
References: <20190424092531.3988850d@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190424092531.3988850d@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Andy Gross <andy.gross@linaro.org>, Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Douglas Anderson <dianders@chromium.org>, Stephen Boyd <swboyd@chromium.org>
List-Id: linux-next.vger.kernel.org

On Wed, Apr 24, 2019 at 09:25:31AM +1000, Stephen Rothwell wrote:
> Hi all,
> 
> After merging the qcom tree, today's linux-next build (arm
> multi_v7_defconfig) failed like this:
> 
> arch/arm/boot/dts/qcom-apq8064.dtsi:1297.29-1309.5: ERROR (phandle_references): /soc/dsi-phy@4700200: Reference to non-existent node or label "xo_board"
> 
> Caused by commit
> 
>   3560af5a56b5 ("ARM: dts: qcom-apq8064: Set 'xo_board' as ref clock of the DSI PHY")
> 
> I have used the version of the qcom tree from next-20190423 for today.

I thought I built-tested this, but probably only did arm64 builds :(

I'm working on a fix.

Matthias
