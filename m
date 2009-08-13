From: Greg KH <greg@kroah.com>
Subject: Re: [PATCH] USB: isp1362: fix build warnings on 64-bit systems
Date: Thu, 13 Aug 2009 16:44:10 -0700
Message-ID: <20090813234410.GB4406@kroah.com>
References: <1250046053-3097-1-git-send-email-vapier@gentoo.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from kroah.org ([198.145.64.141]:36400 "EHLO coco.kroah.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752386AbZHNAEk (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 13 Aug 2009 20:04:40 -0400
Content-Disposition: inline
In-Reply-To: <1250046053-3097-1-git-send-email-vapier@gentoo.org>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Mike Frysinger <vapier@gentoo.org>
Cc: Greg Kroah-Hartman <gregkh@suse.de>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Lothar Wassmann <LW@karo-electronics.de>, Stephen Rothwell <sfr@canb.auug.org.au>

On Tue, Aug 11, 2009 at 11:00:53PM -0400, Mike Frysinger wrote:
> A bunch of places assumed pointers were 32-bits in size (bit checking and
> debug output), but none of these affected runtime functionality.
> 
> Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
> Signed-off-by: Mike Frysinger <vapier@gentoo.org>

This patch doesn't apply to my tree, what did you make it against?

thanks,

greg k-h
