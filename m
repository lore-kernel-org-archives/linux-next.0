From: Greg KH <greg@kroah.com>
Subject: Re: linux-next: manual merge of the staging tree with the
 driver-core tree
Date: Tue, 24 Apr 2012 07:45:14 -0700
Message-ID: <20120424144514.GC3532@kroah.com>
References: <20120424144837.67a84b1e4e5905de7fd03e67@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from out3-smtp.messagingengine.com ([66.111.4.27]:33805 "EHLO
	out3-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1754588Ab2DXOpR (ORCPT
	<rfc822;linux-next@vger.kernel.org>);
	Tue, 24 Apr 2012 10:45:17 -0400
Content-Disposition: inline
In-Reply-To: <20120424144837.67a84b1e4e5905de7fd03e67@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, MyungJoo Ham <myungjoo.ham@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, John Stultz <john.stultz@linaro.org>

On Tue, Apr 24, 2012 at 02:48:37PM +1000, Stephen Rothwell wrote:
> Hi Greg,
> 
> Today's linux-next merge of the staging tree got conflicts in
> drivers/staging/android/Kconfig and drivers/staging/android/Makefile
> between commit 449a2bf5e881 ("Remove "switch" class in
> drivers/staging/android/switch") from the driver-core tree and commit
> ef2353d26bdc ("android-alarm: Remove unused android alarm in-kernel
> interfaces") from the staging tree.
> 
> Just context changes.  I fixed it up (see below) and can carry the fix as
> necessary.

Thanks, that looks fine.

greg k-h
