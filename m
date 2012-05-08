From: Randy Dunlap <rdunlap@xenotime.net>
Subject: Re: linux-next: Tree for May 8 (gpu/drm/gma500)
Date: Tue, 08 May 2012 09:27:25 -0700
Message-ID: <4FA9496D.604@xenotime.net>
References: <20120508181531.072fdc5fefa60d852e784587@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from oproxy1-pub.bluehost.com ([66.147.249.253]:50795 "HELO
	oproxy1-pub.bluehost.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with SMTP id S1755396Ab2EHQ1J (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 8 May 2012 12:27:09 -0400
In-Reply-To: <20120508181531.072fdc5fefa60d852e784587@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, dri-devel@lists.freedesktop.org

On 05/08/2012 01:15 AM, Stephen Rothwell wrote:

> Hi all,
> 
> There will be no linux-next tomorrow.
> 
> Changes since 20120507:



When CONFIG_ACPI is not enabled:

drivers/gpu/drm/gma500/opregion.c:269:3: error: implicit declaration of function 'register_acpi_notifier'
drivers/gpu/drm/gma500/opregion.c:288:3: error: implicit declaration of function 'unregister_acpi_notifier'

-- 
~Randy
