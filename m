From: Nicolas Ferre <nicolas.ferre@atmel.com>
Subject: Re: linux-next: manual merge of the mmc-uh tree with the arm-soc
 tree
Date: Mon, 10 Nov 2014 09:58:59 +0100
Message-ID: <54607E53.4060105@atmel.com>
References: <20141110125637.30fe73b9@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from eusmtp01.atmel.com ([212.144.249.243]:37164 "EHLO
	eusmtp01.atmel.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750930AbaKJI7F (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 10 Nov 2014 03:59:05 -0500
In-Reply-To: <20141110125637.30fe73b9@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>, Ulf Hansson <ulf.hansson@linaro.org>, Olof Johansson <olof@lixom.net>, Arnd Bergmann <arnd@arndb.de>, linux-arm-kernel@lists.infradead.org
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Alexandre Belloni <alexandre.belloni@free-electrons.com>

On 10/11/2014 02:56, Stephen Rothwell :
> Hi Ulf,
> 
> Today's linux-next merge of the mmc-uh tree got a conflict in
> arch/arm/mach-at91/at91sam9g45_devices.c between commit 4bf7753b8ab7
> ("ARM: at91: remove at91sam9g45/9m10 legacy board support") from the
> arm-soc tree and commit 4049854c41e0 ("ARM: at91: remove
> mach/atmel-mci.h") from the mmc-uh tree.
> 
> I fixed it up (I just removed the file) and can carry the fix as
> necessary (no action is required).

Well fixed. Thanks Stephen.

Bye,
-- 
Nicolas Ferre
