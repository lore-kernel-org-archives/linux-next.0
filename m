From: Mark Brown <broonie@opensource.wolfsonmicro.com>
Subject: Re: [PATCH] regulator: Fix compile break due to missing arguments to
 regulator_register
Date: Thu, 24 Nov 2011 10:51:54 +0000
Message-ID: <20111124105153.GE8470@opensource.wolfsonmicro.com>
References: <1322119637-32634-1-git-send-email-rnayak@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from opensource.wolfsonmicro.com ([80.75.67.52]:59424 "EHLO
	opensource.wolfsonmicro.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1753483Ab1KXKv4 (ORCPT
	<rfc822;linux-next@vger.kernel.org>);
	Thu, 24 Nov 2011 05:51:56 -0500
Content-Disposition: inline
In-Reply-To: <1322119637-32634-1-git-send-email-rnayak@ti.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Rajendra Nayak <rnayak@ti.com>
Cc: sfr@canb.auug.org.au, lrg@slimlogic.co.uk, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, heiko@sntech.de

On Thu, Nov 24, 2011 at 12:57:17PM +0530, Rajendra Nayak wrote:
> The commit 2c043bcbf287 ("regulator: pass additional of_node to
> regulator_register()") caused a compile break because it missed
> updating the regulator_register() call in gpio-regulator.c with
> the additional parameter (NULL).

Applied, thanks.  Please do submit patches against -next.
