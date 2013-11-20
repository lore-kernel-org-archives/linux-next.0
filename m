From: Brian Norris <computersforpeace@gmail.com>
Subject: Re: Regarding the l2-mtd branch in linux-next
Date: Wed, 20 Nov 2013 10:34:17 -0800
Message-ID: <20131120183417.GI9468@ld-irv-0074.broadcom.com>
References: <20131120114654.GA26240@localhost>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-ie0-f174.google.com ([209.85.223.174]:62537 "EHLO
	mail-ie0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754477Ab3KTSeV (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 20 Nov 2013 13:34:21 -0500
Received: by mail-ie0-f174.google.com with SMTP id at1so8384935iec.5
        for <linux-next@vger.kernel.org>; Wed, 20 Nov 2013 10:34:20 -0800 (PST)
Content-Disposition: inline
In-Reply-To: <20131120114654.GA26240@localhost>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
Cc: linux-mtd@lists.infradead.org, linux-next@vger.kernel.org, Artem Bityutskiy <dedekind1@gmail.com>, David Woodhouse <dwmw2@infradead.org>

Hi Ezequiel,

On Wed, Nov 20, 2013 at 08:46:55AM -0300, Ezequiel Garcia wrote:
> Can you explain in detail the differences between l2-mtd/master and
> l2-mtd/next?
> 
> I'm seeing linux-next merges the former, but instead maybe it should
> be the latter?
> 
> What do you think?

I only created the l2-mtd.git 'next' branch recently because I don't
think linux-next likes to see new stuff during the merge window that's
not going into the current release cycle. So I just queued up stuff in a
different branch temporarily, and I plan to bring it into 'master' on
top of 3.13-rc1 once the merge window closes.

In answer to your second question, then, the inclusion of
l2-mtd.git/master in linux-next is exactly as intended.

I am new at this whole maintainership thing, though, and I could be very
wrong about the intended development process regarding linux-next and
the merge window. I couldn't find much clear documentation regarding
this process. I suppose it's something you learn over time. Any comments
are welcome.

Regards,
Brian
