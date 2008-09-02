From: Alan Cox <alan@lxorguk.ukuu.org.uk>
Subject: Re: broken tty-move-canon-specials patch
Date: Tue, 2 Sep 2008 17:30:22 +0100
Message-ID: <20080902173022.5a83c5f3@lxorguk.ukuu.org.uk>
References: <20080902145939.GA4864@x200.localdomain>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from earthlight.etchedpixels.co.uk ([81.2.110.250]:55959 "EHLO
	lxorguk.ukuu.org.uk" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
	with ESMTP id S1751246AbYIBQaw (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 2 Sep 2008 12:30:52 -0400
In-Reply-To: <20080902145939.GA4864@x200.localdomain>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Alexey Dobriyan <adobriyan@gmail.com>
Cc: alan@redhat.com, linux-next@vger.kernel.org

On Tue, 2 Sep 2008 18:59:39 +0400
Alexey Dobriyan <adobriyan@gmail.com> wrote:

> 1. n_tty_set_termios() unconditionally dereferences termios pointer
> 2. n_tty_open() does n_tty_set_termios(tty, NULL)
> 
> which results in panic at boot.

Already fixed and pushed - I screwed up the last push and missed the fix
out - sorry about that.
