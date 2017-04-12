From: Mark Rutland <mark.rutland@arm.com>
Subject: Re: [PATCH 3/8] arm64: defconfig: enable TCG_TPM and TCG_CRB
Date: Wed, 12 Apr 2017 17:09:08 +0100
Message-ID: <20170412160907.GA7153@leverpostej>
References: <1492012980-11650-1-git-send-email-timur@codeaurora.org>
 <1492012980-11650-4-git-send-email-timur@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from foss.arm.com ([217.140.101.70]:46184 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1752928AbdDLQJf (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Wed, 12 Apr 2017 12:09:35 -0400
Content-Disposition: inline
In-Reply-To: <1492012980-11650-4-git-send-email-timur@codeaurora.org>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Timur Tabi <timur@codeaurora.org>
Cc: linux-arm-kernel@lists.infradead.org, sfr@canb.auug.org.au, linux-next@vger.kernel.org, maxime.ripard@free-electrons.com, olof@lixom.net, Wei Xu <xuwei5@hisilicon.com>

On Wed, Apr 12, 2017 at 11:02:55AM -0500, Timur Tabi wrote:
> Some ARM64 server systems have a Trusted Platform Module security chip
> on the board, and the chip is used to validate the operating system,
> among other things.
> 
> Signed-off-by: Timur Tabi <timur@codeaurora.org>
> ---
>  arch/arm64/configs/defconfig | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
> index a684c92..99e9964 100644
> --- a/arch/arm64/configs/defconfig
> +++ b/arch/arm64/configs/defconfig
> @@ -240,6 +240,8 @@ CONFIG_SERIAL_XILINX_PS_UART=y
>  CONFIG_SERIAL_XILINX_PS_UART_CONSOLE=y
>  CONFIG_SERIAL_MVEBU_UART=y
>  CONFIG_VIRTIO_CONSOLE=y
> +CONFIG_TCG_TPM=y
> +CONFIG_TCG_CRB=y

I see there are patches queued in linux-next enabling some arm64 TPM CRB
support, which I believe are related.

As I have commented elsewhere [1], I think those have been taken
prematurely, and I'm not sure it's a good idea to enable this just yet,
due to that. There are spec issues to be addressed in the draft that is
still open.

[1] https://lkml.kernel.org/r/20170411113652.GB32267@leverpostej

Thanks,
Mark.
