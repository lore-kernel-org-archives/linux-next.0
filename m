From: Russell King - ARM Linux <linux@arm.linux.org.uk>
Subject: Re: linux-next-20100201 - OMAP2+ defconfig broken with
	CONFIG_DEBUG_LL
Date: Tue, 1 Feb 2011 09:22:39 +0000
Message-ID: <20110201092238.GA31015@n2100.arm.linux.org.uk>
References: <AANLkTinF+dpKvuRztChBM01MAjgL-foGp_yVq3uC9ghu@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from caramon.arm.linux.org.uk ([78.32.30.218]:49369 "EHLO
	caramon.arm.linux.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751935Ab1BAJWy (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 1 Feb 2011 04:22:54 -0500
Content-Disposition: inline
In-Reply-To: <AANLkTinF+dpKvuRztChBM01MAjgL-foGp_yVq3uC9ghu@mail.gmail.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: "Gadiyar, Anand" <gadiyar@ti.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-next@vger.kernel.org

On Tue, Feb 01, 2011 at 11:09:52AM +0530, Gadiyar, Anand wrote:
> Hi all,
> 
> I tried to build linux-next as of 20100201 with omap2plus_defconfig. In addition
> I turned on CONFIG_DEBUG_LL and hit the following error.

No need to bisect.  Tony knows about it.  It's the OMAP debug code using
what was a macro in assembly, which becomes a C function with the dynamic
P2V patches.
