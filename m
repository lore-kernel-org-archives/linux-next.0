From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: SPDX id conflicts
Date: Fri, 3 Nov 2017 09:10:29 +1100
Message-ID: <20171103091029.267f39a6@canb.auug.org.au>
References: <20171103075738.55dcd769@canb.auug.org.au>
        <20171102212956.GA21675@kroah.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:36581 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1754185AbdKBWKd (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Thu, 2 Nov 2017 18:10:33 -0400
In-Reply-To: <20171102212956.GA21675@kroah.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux-Next Mailing List <linux-next@vger.kernel.org>, Linus Torvalds <torvalds@linux-foundation.org>

Hi Greg,

On Thu, 2 Nov 2017 22:29:56 +0100 Greg Kroah-Hartman <gregkh@linuxfoundation.org> wrote:
>
> They should all be trivial, as they all hit the first, or second, line
> of the file, and I would be amazed if that caused conflicts.

8 so far, but 5 of those were files removed in linux-next trees.

The pain is that I have to check each one just in case there is some
other conflict :-(
-- 
Cheers,
Stephen Rothwell
