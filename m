From: Alan Cox <alan@lxorguk.ukuu.org.uk>
Subject: Re: linux-next: Tree for May 8 (gpu/drm/gma500)
Date: Tue, 8 May 2012 21:53:24 +0100
Message-ID: <20120508215324.29b5cdc4@pyramind.ukuu.org.uk>
References: <20120508181531.072fdc5fefa60d852e784587@canb.auug.org.au>
	<4FA9496D.604@xenotime.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from lxorguk.ukuu.org.uk ([81.2.110.251]:35233 "EHLO
	lxorguk.ukuu.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754605Ab2EHUus (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 8 May 2012 16:50:48 -0400
In-Reply-To: <4FA9496D.604@xenotime.net>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Randy Dunlap <rdunlap@xenotime.net>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, dri-devel@lists.freedesktop.org

On Tue, 08 May 2012 09:27:25 -0700
Randy Dunlap <rdunlap@xenotime.net> wrote:

> On 05/08/2012 01:15 AM, Stephen Rothwell wrote:
> 
> > Hi all,
> > 
> > There will be no linux-next tomorrow.
> > 
> > Changes since 20120507:
> 
> 
> 
> When CONFIG_ACPI is not enabled:
> 
> drivers/gpu/drm/gma500/opregion.c:269:3: error: implicit declaration of function 'register_acpi_notifier'
> drivers/gpu/drm/gma500/opregion.c:288:3: error: implicit declaration of function 'unregister_acpi_notifier'

Will take a look tomorrow.
