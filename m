From: =?UTF-8?Q?Andr=c3=a9_Przywara?= <andre.przywara@arm.com>
Subject: Re: linux-next: manual merge of the watchdog tree with the arm-soc
 tree
Date: Tue, 8 Mar 2016 22:52:38 +0700
Message-ID: <56DEF546.9090900@arm.com>
References: <20160307150402.191ba735@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from foss.arm.com ([217.140.101.70]:34509 "EHLO foss.arm.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750773AbcCHP6k (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 8 Mar 2016 10:58:40 -0500
In-Reply-To: <20160307150402.191ba735@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>, Wim Van Sebroeck <wim@iguana.be>, Olof Johansson <olof@lixom.net>, Arnd Bergmann <arnd@arndb.de>, linux-arm-kernel@lists.infradead.org
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Fu Wei <fu.wei@linaro.org>, Guenter Roeck <linux@roeck-us.net>, Sudeep Holla <sudeep.holla@arm.com>

On 07/03/16 11:04, Stephen Rothwell wrote:
> Hi Wim,
> 
> Today's linux-next merge of the watchdog tree got a conflict in:
> 
>   arch/arm64/boot/dts/arm/foundation-v8.dts
> 
> between commit:
> 
>   d11a89796678 ("arm64: dts: split Foundation model dts to put the GIC separately")
> 
> from the arm-soc tree and commit:
> 
>   fe3a97e8ed02 ("ARM64: add SBSA Generic Watchdog device node in foundation-v8.dts")
> 
> from the watchdog tree.
> 
> I fixed it up (see below) and can carry the fix as necessary (no action
> is required).

But unfortunately this is the wrong solution. The watchdog DT node
belongs into the (newly created) common foundation-v8.dtsi, not into the
GICv2-only .dts.
So whoever now provides the watchdog patch, can it be rebased on top of
the foundation model .dts rework, so that the new node ends up in the
.dtsi file?
If this is too much hassle I could also send a fix after -rc1 (as the
breakage is not really critical).

Cheers,
Andre.
