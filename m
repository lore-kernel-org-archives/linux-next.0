From: Jesse Barnes <jbarnes@virtuousgeek.org>
Subject: Re: linux-next: build failure after merge of the final tree
 (pci-current tree related)
Date: Wed, 25 Aug 2010 12:54:20 -0700
Message-ID: <20100825125420.78d63e37@virtuousgeek.org>
References: <20100825115604.07928f97.sfr@canb.auug.org.au>
	<201008252133.29525.rjw@sisk.pl>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from cpoproxy2-pub.bluehost.com ([67.222.39.38]:34985 "HELO
	cpoproxy2-pub.bluehost.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with SMTP id S1753287Ab0HYTyX (ORCPT
	<rfc822;linux-next@vger.kernel.org>);
	Wed, 25 Aug 2010 15:54:23 -0400
In-Reply-To: <201008252133.29525.rjw@sisk.pl>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: "Rafael J. Wysocki" <rjw@sisk.pl>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

On Wed, 25 Aug 2010 21:33:29 +0200
"Rafael J. Wysocki" <rjw@sisk.pl> wrote:

> Subject: PCI / hot-plug: Fix build with CONFIG_ACPI unset
> 
> One of the recent changes caused complilation of
> drivers/pci/hotplug/pciehp_core.c to fail.  Fix this issue.
> 
> Signed-off-by: Rafael J. Wysocki <rjw@sisk.pl>

Fix pushed out to my for-linus branch, thanks guys.

-- 
Jesse Barnes, Intel Open Source Technology Center
