From: Nicolas Ferre <nicolas.ferre@atmel.com>
Subject: Re: linux-next: manual merge of the tty tree with Linus' tree
Date: Tue, 25 Oct 2011 12:03:01 +0200
Message-ID: <4EA68955.8010102@atmel.com>
References: <20111025191840.329d2a862d549ec6fe6b242f@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from newsmtp5.atmel.com ([204.2.163.5]:44012 "EHLO
	sjogate2.atmel.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754180Ab1JYKIb (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 25 Oct 2011 06:08:31 -0400
In-Reply-To: <20111025191840.329d2a862d549ec6fe6b242f@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Greg KH <greg@kroah.com>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, "Voss, Nikolaus" <N.Voss@weinmann.de>, Nicolas FERRE <nicolas.ferre@atmel.com>

On 10/25/2011 10:18 AM, Stephen Rothwell :
> Hi Greg,
> 
> Today's linux-next merge of the tty tree got a conflict in 
> drivers/tty/serial/atmel_serial.c between commit 0d0a3cc183c5 
> ("atmel_serial: fix atmel_default_console_device") from Linus' tree
> and commit 4cbf9f4864bd ("tty/serial: atmel_serial: auto-enumerate
> ports") from the tty tree.
> 
> I just used the tty tree version (which may not be completely
> correct).

I sent a patch now to fix this conflict. It can be applied on both
current tty-next and linux-next (obviously).

Sorry for the noise and thank you to having take care of this.

Best regards,
-- 
Nicolas Ferre
