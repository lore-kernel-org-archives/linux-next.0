From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH] ARM: at91: Add ADC driver to at91sam9260/at91sam9g20 dtsi files
Date: Wed, 16 May 2012 18:50:54 +0000
Message-ID: <201205161850.54765.arnd@arndb.de>
References: <4FB3B1F3.6080102@atmel.com> <1337182626-13033-1-git-send-email-nicolas.ferre@atmel.com>
Mime-Version: 1.0
Content-Type: Text/Plain;
  charset="iso-8859-15"
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from moutng.kundenserver.de ([212.227.126.186]:56652 "EHLO
	moutng.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755159Ab2EPSu7 (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 16 May 2012 14:50:59 -0400
In-Reply-To: <1337182626-13033-1-git-send-email-nicolas.ferre@atmel.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Nicolas Ferre <nicolas.ferre@atmel.com>
Cc: gregkh@linuxfoundation.org, sfr@canb.auug.org.au, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, plagnioj@jcrosoft.com, maxime.ripard@free-electrons.com, olof@lixom.net, linux-next@vger.kernel.org

On Wednesday 16 May 2012, Nicolas Ferre wrote:
> Now that the bulk of at91sam9g20-related nodes are located in at91sam9260.dtsi,
> we have to re-create the path to this ADC node for SoC specific parts.
> 
> Signed-off-by: Nicolas Ferre <nicolas.ferre@atmel.com>

Should we apply this patch in arm-soc so that Greg can drop the hunk that
no longer applies?

	Arnd
