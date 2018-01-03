From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: manual merge of the usb tree with the usb.current
 tree
Date: Wed, 3 Jan 2018 11:56:42 +1100
Message-ID: <20180103115642.4653ce2f@canb.auug.org.au>
References: <20171220130949.51553723@canb.auug.org.au>
        <20171220093615.GA17337@kroah.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:42563 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751008AbeACA4o (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 2 Jan 2018 19:56:44 -0500
In-Reply-To: <20171220093615.GA17337@kroah.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Greg KH <greg@kroah.com>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Shuah Khan <shuahkh@osg.samsung.com>, Colin Ian King <colin.king@canonical.com>

Hi Greg,

On Wed, 20 Dec 2017 10:36:15 +0100 Greg KH <greg@kroah.com> wrote:
>
> Thanks for the fixup, I'll do it when these trees converge in a week or
> so.

Unfortunately, it looks like when you back merged Linus' tree (to get
commit 8272d099d05f) you lost the spelling fix in commit 81d8a8eb0a97.

-- 
Cheers,
Stephen Rothwell
