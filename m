From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Subject: Re: linux-next: manual merge of the mfd tree with the arm-soc tree
Date: Thu, 15 Oct 2015 11:23:28 +0900
Message-ID: <CAJKOXPdug+xtGNYReqV-THnnNF1iRW7Rh54kEWMrw22k-wNPpw@mail.gmail.com>
References: <20151015131911.3b3a7ca8@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-qk0-f172.google.com ([209.85.220.172]:34731 "EHLO
	mail-qk0-f172.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752957AbbJOCX3 (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 14 Oct 2015 22:23:29 -0400
In-Reply-To: <20151015131911.3b3a7ca8@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Lee Jones <lee.jones@linaro.org>, Olof Johansson <olof@lixom.net>, Arnd Bergmann <arnd@arndb.de>, linux-arm-kernel@lists.infradead.org, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Kukjin Kim <kgene@kernel.org>

2015-10-15 11:19 GMT+09:00 Stephen Rothwell <sfr@canb.auug.org.au>:
> Hi Lee,
>
> Today's linux-next merge of the mfd tree got a conflict in:
>
>   Documentation/devicetree/bindings/mfd/s2mps11.txt
>
> between commit:
>
>   6a4479f96543 ("dt-bindings: Document grounded ACOKB pin on S2MPS11")
>
> from the arm-soc tree and commit:
>
>   db96ec728d69 ("mfd: dt-bindings: Document pulled down WRSTBI pin on S2MPS1X")
>
> from the mfd tree.
>
> I fixed it up (see below) and can carry the fix as necessary (no action
> is required).

Thanks! The fix for conflict is good.

Best regards,
Krzysztof
