From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: build failure after merge of the pinctrl tree
Date: Fri, 18 Dec 2015 16:57:57 +1100
Message-ID: <20151218165757.1c8d35ec@canb.auug.org.au>
References: <20151218144516.77c8e052@canb.auug.org.au>
	<0C803592FC378B4E83922050AB46442A2ADB1C73@SJEXCHMB10.corp.ad.broadcom.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:41454 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751343AbbLRF57 (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Fri, 18 Dec 2015 00:57:59 -0500
In-Reply-To: <0C803592FC378B4E83922050AB46442A2ADB1C73@SJEXCHMB10.corp.ad.broadcom.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Pramod Kumar <pramodku@broadcom.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>

Hi Pramod,

On Fri, 18 Dec 2015 05:34:58 +0000 Pramod Kumar <pramodku@broadcom.com> wrote:
>
> Hi Stephen/Linus,
> 
> Please suggest us how could we fix this issue.

I think you issue is different from what I reported, What I reported
was caused by the addition of the dependency on COMPILE_TEST which
allowed the driver to be built on architectures/platforms that do not
have the needed definitions.

-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
