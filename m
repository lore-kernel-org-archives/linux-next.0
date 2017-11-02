From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: linux-next: SPDX id conflicts
Date: Thu, 2 Nov 2017 22:29:56 +0100
Message-ID: <20171102212956.GA21675@kroah.com>
References: <20171103075738.55dcd769@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail.linuxfoundation.org ([140.211.169.12]:38222 "EHLO
        mail.linuxfoundation.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S964867AbdKBV3p (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 2 Nov 2017 17:29:45 -0400
Content-Disposition: inline
In-Reply-To: <20171103075738.55dcd769@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux-Next Mailing List <linux-next@vger.kernel.org>, Linus Torvalds <torvalds@linux-foundation.org>

On Fri, Nov 03, 2017 at 07:57:38AM +1100, Stephen Rothwell wrote:
> Hi all,
> 
> I expect to get quite a few conflicts due to the addition of the SPDX
> license ids to many files overnight in Linus' tree.  I will not be
> reporting these conflicts as they are mostly trivial.

They should all be trivial, as they all hit the first, or second, line
of the file, and I would be amazed if that caused conflicts.

> If anyone thinks otherwise, please let me know.

Nope, that's fine with me :)

thanks,

greg k-h
