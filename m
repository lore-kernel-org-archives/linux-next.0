From: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [PATCH -next] sh: fix up the machtypes.h move.
Date: Mon, 28 Sep 2009 09:49:45 +0200
Message-ID: <20090928074945.GA10791@merkur.ravnborg.org>
References: <20090928073327.GC6668@linux-sh.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from [195.41.46.235] ([195.41.46.235]:44497 "EHLO pfepa.post.tele.dk"
	rhost-flags-FAIL-FAIL-OK-OK) by vger.kernel.org with ESMTP
	id S1751432AbZI1Htq (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 28 Sep 2009 03:49:46 -0400
Content-Disposition: inline
In-Reply-To: <20090928073327.GC6668@linux-sh.org>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Paul Mundt <lethal@linux-sh.org>
Cc: linux-next@vger.kernel.org

On Mon, Sep 28, 2009 at 04:33:27PM +0900, Paul Mundt wrote:
> rts7751r2d PCI support is referencing the old asm/ version.
> 
> Signed-off-by: Paul Mundt <lethal@linux-sh.org>

Thanks.
Linus did not take this patchset before -rc1 :-(

So I think it may have to wait until next merge window in which case
I will submit the sh specific bits to you with this patch included.

	Sam
