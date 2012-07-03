From: Arnd Bergmann <arnd.bergmann@linaro.org>
Subject: Re: linux-next: build failure after merge of the final tree (pwm tree related)
Date: Tue, 3 Jul 2012 08:59:11 +0000
Message-ID: <201207030859.11975.arnd.bergmann@linaro.org>
References: <20120629174826.546cc991459b12833f2aaebd@canb.auug.org.au> <201207030806.49561.arnd.bergmann@linaro.org> <20120703081138.GA25183@avionic-0098.mockup.avionic-design.de>
Mime-Version: 1.0
Content-Type: Text/Plain;
  charset="iso-8859-15"
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from moutng.kundenserver.de ([212.227.17.10]:61208 "EHLO
	moutng.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752219Ab2GCI72 (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 3 Jul 2012 04:59:28 -0400
In-Reply-To: <20120703081138.GA25183@avionic-0098.mockup.avionic-design.de>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Thierry Reding <thierry.reding@avionic-design.de>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Sascha Hauer <s.hauer@pengutronix.de>

On Tuesday 03 July 2012, Thierry Reding wrote:
> I came up with the attached patch. What do you think? It fixes the
> PowerPC allyesconfig issue for me.

This one looks correct, but I would still do it the other way around,
putting the depends statements into the locations of the other drivers.
The main difference is that we can then independently convert the
remaining drivers, without having merge conflicts in the same line
every time we remove one of the dependencies.

	Arnd
