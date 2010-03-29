From: Jean Delvare <khali@linux-fr.org>
Subject: Re: linux-next: build warning after merge of the i2c tree
Date: Mon, 29 Mar 2010 15:21:55 +0200
Message-ID: <20100329152155.056741d2@hyperion.delvare>
References: <20100329105439.1e474095.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from poutre.nerim.net ([62.4.16.124]:50286 "EHLO poutre.nerim.net"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750902Ab0C2NWA (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 29 Mar 2010 09:22:00 -0400
In-Reply-To: <20100329105439.1e474095.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, "Rafael J. Wysocki" <rjw@sisk.pl>

Hi Stephen,

On Mon, 29 Mar 2010 10:54:39 +1100, Stephen Rothwell wrote:
> Hi Jean,
> 
> After merging the ii2c tree, today's linux-next build (powerpc
> ppc64_defconfig) produced this warning:
> 
> drivers/i2c/i2c-core.c:159: warning: 'i2c_legacy_suspend' defined but not used
> drivers/i2c/i2c-core.c:172: warning: 'i2c_legacy_resume' defined but not used
> 
> Introduced by commit 592b0bd0324728fe0aca823951eba06a9494c2f9 ("i2c: Fix
> bus-level power management callbacks").  These routines are only called
> if CONFIG_PM_SLEEP is defined.

Err, sorry. I noticed the problem and fixed it some days ago, but
forgot to refresh the patch before pushing it to you. This is fixed
now, thanks for the notice.

-- 
Jean Delvare
