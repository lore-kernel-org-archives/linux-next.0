From: Roland Stigge <stigge@antcom.de>
Subject: Re: linux-next: manual merge of the arm-soc tree with the usb tree
Date: Thu, 06 Sep 2012 11:32:03 +0200
Message-ID: <50486D93.4090009@antcom.de>
References: <20120906154240.12f7e0c01686559dd43744fa@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from antcom.de ([188.40.178.216]:38428 "EHLO chuck.antcom.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1754875Ab2IFJcG (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 6 Sep 2012 05:32:06 -0400
In-Reply-To: <20120906154240.12f7e0c01686559dd43744fa@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Olof Johansson <olof@lixom.net>, Arnd Bergmann <arnd@arndb.de>, linux-arm-kernel@lists.infradead.org, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Greg KH <greg@kroah.com>

On 09/06/2012 07:42 AM, Stephen Rothwell wrote:
> Today's linux-next merge of the arm-soc tree got a conflict in 
> drivers/usb/host/Kconfig between commit 952230d774bb ("usb: ohci:
> Fix Kconfig dependency on USB_ISP1301") from the usb tree and
> commit d684f05f2d55 ("ARM: mach-pnx4008: Remove architecture") from
> the arm-soc tree.
> 
> I fixed it up (see below) and can carry the fix as necessary (no
> action required).

Thanks - this little conflict was expected when merging pnx4008
removal and the isp1301 deoendency fix.

And the fixup is correct.

Roland
