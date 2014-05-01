From: Greg KH <greg@kroah.com>
Subject: Re: linux-next: manual merge of the staging tree with the
 staging.current tree
Date: Wed, 30 Apr 2014 21:47:07 -0700
Message-ID: <20140501044707.GB6918@kroah.com>
References: <20140501143726.13b4ea03f25679d3e0a78fed@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from out5-smtp.messagingengine.com ([66.111.4.29]:58599 "EHLO
	out5-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1750754AbaEAEqL (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 1 May 2014 00:46:11 -0400
Received: from compute6.internal (compute6.nyi.mail.srv.osa [10.202.2.46])
	by gateway1.nyi.mail.srv.osa (Postfix) with ESMTP id 42299214DE
	for <linux-next@vger.kernel.org>; Thu,  1 May 2014 00:46:10 -0400 (EDT)
Content-Disposition: inline
In-Reply-To: <20140501143726.13b4ea03f25679d3e0a78fed@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Doug Anderson <dianders@chromium.org>, Jonathan Cameron <jic23@kernel.org>, Jean Delvare <jdelvare@suse.de>

On Thu, May 01, 2014 at 02:37:26PM +1000, Stephen Rothwell wrote:
> Hi Greg,
> 
> Today's linux-next merge of the staging tree got a conflict in
> drivers/iio/adc/Kconfig between commit bbc28134e915 ("iio: adc: Nothing
> in ADC should be a bool CONFIG") from the staging.current tree and commit
> 9ef080ec0c5e ("iio: adc: Fix exynos_adc dependencies") from the staging
> tree.
> 
> I fixed it up (see below) and can carry the fix as necessary (no action
> is required).

Looks good, thanks.

greg k-h
