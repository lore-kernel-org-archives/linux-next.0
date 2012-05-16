From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [PATCH] staging: gdm72xx: WIMAX_GDM72XX_USB_PM should depend on
 USB_SUSPEND
Date: Wed, 16 May 2012 13:31:13 -0700
Message-ID: <20120516203113.GA32372@kroah.com>
References: <1337197660-7852-1-git-send-email-geert@linux-m68k.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-pb0-f46.google.com ([209.85.160.46]:61800 "EHLO
	mail-pb0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S965561Ab2EPUbU (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 16 May 2012 16:31:20 -0400
Received: by pbbrp8 with SMTP id rp8so1580680pbb.19
        for <linux-next@vger.kernel.org>; Wed, 16 May 2012 13:31:20 -0700 (PDT)
Content-Disposition: inline
In-Reply-To: <1337197660-7852-1-git-send-email-geert@linux-m68k.org>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Sage Ahn <syahn@gctsemi.com>, devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org, linux-next@vger.kernel.org

On Wed, May 16, 2012 at 09:47:40PM +0200, Geert Uytterhoeven wrote:
> Use Kconfig logic instead of a rude #error in the driver source,
> which breaks m68k-allmodconfig.
> Also remove the "default n", as that's the default.
> 
> Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
> ---
> http://kisskb.ellerman.id.au/kisskb/buildresult/6335693/

Sorry about missing that, now applied thanks.

greg k-h
