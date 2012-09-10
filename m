From: Greg KH <greg@kroah.com>
Subject: Re: [PATCH 3.6rc5.linux-next 1/1] Force module
Date: Mon, 10 Sep 2012 11:04:13 -0700
Message-ID: <20120910180413.GA31046@kroah.com>
References: <20120910170409.59b71819008bc527130d3987@canb.auug.org.au>
 <20120910173153.GA25033@kroah.com>
 <20120911014330.GA15327@elbert.example.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from out1-smtp.messagingengine.com ([66.111.4.25]:33065 "EHLO
	out1-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1751774Ab2IJSGw (ORCPT
	<rfc822;linux-next@vger.kernel.org>);
	Mon, 10 Sep 2012 14:06:52 -0400
Content-Disposition: inline
In-Reply-To: <20120911014330.GA15327@elbert.example.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: DanielC <puff65537@bansheeslibrary.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

On Mon, Sep 10, 2012 at 06:43:30PM -0700, DanielC wrote:
> Sorry about breaking the build, this should fix.

This doesn't make sense in a changelog entry.

> 
> Staging: silicom: Depend on module until monolithic build fixed

This needs to be in the Subject: line of the patch, don't make me edit
it by hand to add it in.

> 
> Signed-off-by: Daniel Cotey <puff65537@bansheeslibrary.com>

You forgot to add:
	Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
to this list, as he is the one that found the problem.

Care to fix this up and resend the patch so I can apply it without
needing to edit it at all?

thanks,

greg k-h
