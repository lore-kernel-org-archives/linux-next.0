From: Greg KH <greg@kroah.com>
Subject: Re: linux-next: Signed-off-by missing for commits in the char-misc
 tree
Date: Wed, 20 Dec 2017 10:41:02 +0100
Message-ID: <20171220094102.GA18198@kroah.com>
References: <20171220071216.096a2d09@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from out3-smtp.messagingengine.com ([66.111.4.27]:46515 "EHLO
        out3-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1753885AbdLTJk7 (ORCPT
        <rfc822;linux-next@vger.kernel.org>);
        Wed, 20 Dec 2017 04:40:59 -0500
Content-Disposition: inline
In-Reply-To: <20171220071216.096a2d09@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Arnd Bergmann <arnd@arndb.de>, Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Sagar Dharia <sdharia@codeaurora.org>, Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, Mark Brown <broonie@kernel.org>

On Wed, Dec 20, 2017 at 07:12:16AM +1100, Stephen Rothwell wrote:
> Hi all,
> 
> Commits
> 
>   46a2bb5a7f7e ("slimbus: core: Add slim controllers support")
>   afbdcc7c384b ("slimbus: Add messaging APIs to slimbus framework")
> 
> are missing a Signed-off-by from their author.

I am guessing that Linaro doesn't know about the codeveloped-by new tag
here :(

greg k-h
