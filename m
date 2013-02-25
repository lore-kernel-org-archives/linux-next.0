From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH 01/11] ARM: disable virt_to_bus/virt_to_bus almost everywhere
Date: Mon, 25 Feb 2013 14:54:47 +0000
Message-ID: <201302251454.47617.arnd@arndb.de>
References: <1360849767-1463135-1-git-send-email-arnd@arndb.de> <20130222101359.0c91a7259f648a3d06221bd8@canb.auug.org.au> <512B72A7.6040307@synopsys.com>
Mime-Version: 1.0
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from moutng.kundenserver.de ([212.227.126.171]:64127 "EHLO
	moutng.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756044Ab3BYOzM (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 25 Feb 2013 09:55:12 -0500
In-Reply-To: <512B72A7.6040307@synopsys.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Vineet Gupta <Vineet.Gupta1@synopsys.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, James Hogan <james.hogan@imgtec.com>, Andrew Morton <akpm@linux-foundation.org>, arm@kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Russell King <linux@arm.linux.org.uk>, linux-next@vger.kernel.org

On Monday 25 February 2013, Vineet Gupta wrote:
> Have you queued up this change via one of your trees already for 3.9-rcX ?
> If not, I can fold it in with a bunch of Kconfig cleanups for ARC
> (GENERIC_SIGALTSTACK, HAVE_IRQ_WORK), given that those bits are already in linus'
> tree.
> 

I haven't put it in my tree yet, not. Please put it in yours.

	Arnd
