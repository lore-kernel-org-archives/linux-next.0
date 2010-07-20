From: Jiri Slaby <jirislaby@gmail.com>
Subject: Re: linux-next: manual merge of the limits tree with the tile tree
Date: Tue, 20 Jul 2010 10:01:50 +0200
Message-ID: <4C4557EE.2090708@gmail.com>
References: <20100720134833.4082eed4.sfr@canb.auug.org.au> <4C452399.3050708@tilera.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-bw0-f46.google.com ([209.85.214.46]:56498 "EHLO
	mail-bw0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752884Ab0GTIBz (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 20 Jul 2010 04:01:55 -0400
In-Reply-To: <4C452399.3050708@tilera.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Chris Metcalf <cmetcalf@tilera.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>

On 07/20/2010 06:18 AM, Chris Metcalf wrote:
> Jiri, would it be possible to put __NR_prlimit64 as number 261 in
> <asm-generic/syscall.h>?

Hi, I assume you meant asm-generic/unistd.h. Yes, I will do that.

thank you both,
-- 
js
