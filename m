From: Grant Likely <grant.likely@secretlab.ca>
Subject: Re: [PATCH] of: fix recursive locking in of_get_next_available_child()
Date: Mon, 11 Feb 2013 22:39:07 +0000
Message-ID: <20130211223907.271653E3530@localhost>
References: <1360617332-2738-1-git-send-email-swarren@wwwdotorg.org>
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-we0-f169.google.com ([74.125.82.169]:43653 "EHLO
	mail-we0-f169.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932781Ab3BKWjJ (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 11 Feb 2013 17:39:09 -0500
Received: by mail-we0-f169.google.com with SMTP id t11so5402533wey.0
        for <linux-next@vger.kernel.org>; Mon, 11 Feb 2013 14:39:08 -0800 (PST)
In-Reply-To: <1360617332-2738-1-git-send-email-swarren@wwwdotorg.org>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Warren <swarren@wwwdotorg.org>, Rob Herring <rob.herring@calxeda.com>
Cc: Paul Gortmaker <paul.gortmaker@windriver.com>, Thomas Gleixner <tglx@linutronix.de>, linux-rt-users@vger.kernel.org, devicetree-discuss@lists.ozlabs.org, linux-kernel@vger.kernel.org, sparclinux@vger.kernel.org, Sam Ravnborg <sam@ravnborg.org>, linux-next@vger.kernel.org, Stephen Warren <swarren@nvidia.com>

On Mon, 11 Feb 2013 14:15:32 -0700, Stephen Warren <swarren@wwwdotorg.org> wrote:
> From: Stephen Warren <swarren@nvidia.com>
> 
> of_get_next_available_child() acquires devtree_lock, then calls
> of_device_is_available() which calls of_get_property() which calls
> of_find_property() which tries to re-acquire devtree_lock, thus causing
> deadlock.
> 
> To avoid this, create a new __of_device_is_available() which calls
> __of_get_property() instead, which calls __of_find_property(), which
> does not take the lock,. Update of_get_next_available_child() to call
> the new __of_device_is_available() since it already owns the lock.
> 
> Signed-off-by: Stephen Warren <swarren@nvidia.com>

Thanks for looking at this Stephen. I ended up applying my version of
this patch though just because it was more convenient to do so. It was
pretty much identical anyway.

g.
