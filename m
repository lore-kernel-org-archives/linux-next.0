From: Doug Anderson <dianders@chromium.org>
Subject: Re: linux-next: Fixes tag needs some work in the qcom tree
Date: Thu, 7 Feb 2019 09:06:19 -0800
Message-ID: <CAD=FV=U07_E6O96o4KrJGPaKvE4aSGb9OT6kCy7x40Q_-kGGOA@mail.gmail.com>
References: <20190208004721.129a9eb7@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190208004721.129a9eb7@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Andy Gross <andy.gross@linaro.org>, Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Bjorn Andersson <bjorn.andersson@linaro.org>
List-Id: linux-next.vger.kernel.org

Hi,

On Thu, Feb 7, 2019 at 5:47 AM Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>
> Hi Andy,
>
> In commit
>
>   761f63b2ff21 ("arm64: dts: sdm845: Add clocks and iommus to WCN3990 WLAN node")
>
> Fixes tag
>
>   Fixes: be7019103469 ("dts: arm64/sdm845: Add WCN3990 WLAN module device node")
>
> has these problem(s):
>
>   - Target SHA1 does not exist
>
> Did you mean:
>
>   022bccb840b7 ("arm64: dts: sdm845: Add WCN3990 WLAN module device node")

+Bjorn

Looks like someone reorganized and/or rebased the tree after I sent
out my fix.  When I check locally I have the old commit still and the
new:

commit be7019103469e6ccb997f932d3e0dce0141a0eda
Author:     Govind Singh <govinds@codeaurora.org>
AuthorDate: Mon Nov 5 18:38:37 2018 +0530
Commit:     Bjorn Andersson <bjorn.andersson@linaro.org>
CommitDate: Wed Jan 16 14:13:41 2019 -0800

    dts: arm64/sdm845: Add WCN3990 WLAN module device node

    Add device node for the ath10k SNOC platform driver probe
    and add resources required for WCN3990 on SDM845 soc.

    Reviewed-by: Brian Norris <briannorris@chromium.org>
    Tested-by: Brian Norris <briannorris@chromium.org>
    Signed-off-by: Govind Singh <govinds@codeaurora.org>
    Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>

---

commit 022bccb840b7ff9c64a70e81ac017d4d10bb8a9c
Author:     Govind Singh <govinds@codeaurora.org>
AuthorDate: Mon Nov 5 18:38:37 2018 +0530
Commit:     Andy Gross <andy.gross@linaro.org>
CommitDate: Thu Jan 24 22:19:20 2019 -0600

    arm64: dts: sdm845: Add WCN3990 WLAN module device node

    Add device node for the ath10k SNOC platform driver probe
    and add resources required for WCN3990 on SDM845 soc.

    Reviewed-by: Brian Norris <briannorris@chromium.org>
    Tested-by: Brian Norris <briannorris@chromium.org>
    Signed-off-by: Govind Singh <govinds@codeaurora.org>
    Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
    Signed-off-by: Andy Gross <andy.gross@linaro.org>
