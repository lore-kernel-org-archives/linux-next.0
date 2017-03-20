From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: Please add pinctrl/samsung tree to linux-next
Date: Tue, 21 Mar 2017 09:43:55 +1100
Message-ID: <20170321094355.28e14d1a@canb.auug.org.au>
References: <20170320170559.xojploiymqgm7dl4@kozik-lap>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:42051 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1753860AbdCTWyF (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 20 Mar 2017 18:54:05 -0400
In-Reply-To: <20170320170559.xojploiymqgm7dl4@kozik-lap>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: linux-next@vger.kernel.org, Sylwester Nawrocki <s.nawrocki@samsung.com>, Linus Walleij <linus.walleij@linaro.org>, Tomasz Figa <tomasz.figa@gmail.com>

Hi Krzysztof,

On Mon, 20 Mar 2017 19:05:59 +0200 Krzysztof Kozlowski <krzk@kernel.org> wrote:
>
> Could you add the branch "for-next" of repo:
> 	git://git.kernel.org/pub/scm/linux/kernel/git/pinctrl/samsung.git
> to linux-next?
> 
> Contact points for errors:
> 1. Krzysztof Kozlowski <krzk@kernel.org>
> 2. Sylwester Nawrocki <s.nawrocki@samsung.com>
> (shared model)
> 
> The pull requests will be sent to Linus Walleij (pinctrl maintainer).

Added from today.  I notice that it is actually empty today (which is fine).

Thanks for adding your subsystem tree as a participant of linux-next.  As
you may know, this is not a judgement of your code.  The purpose of
linux-next is for integration testing and to lower the impact of
conflicts between subsystems in the next merge window. 

You will need to ensure that the patches/commits in your tree/series have
been:
     * submitted under GPL v2 (or later) and include the Contributor's
        Signed-off-by,
     * posted to the relevant mailing list,
     * reviewed by you (or another maintainer of your subsystem tree),
     * successfully unit tested, and 
     * destined for the current or next Linux merge window.

Basically, this should be just what you would send to Linus (or ask him
to fetch).  It is allowed to be rebased if you deem it necessary.

-- 
Cheers,
Stephen Rothwell 
sfr@canb.auug.org.au
