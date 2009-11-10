From: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: linux-next: rr tree build warnings
Date: Tue, 10 Nov 2009 06:20:40 +0100
Message-ID: <20091110052040.GA473@merkur.ravnborg.org>
References: <20091109183104.2bf7add6.sfr@canb.auug.org.au> <20091109184046.2a802372.sfr@canb.auug.org.au> <200911101250.58516.rusty@rustcorp.com.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from pfepa.post.tele.dk ([195.41.46.235]:55225 "EHLO
	pfepa.post.tele.dk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750876AbZKJFUs (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 10 Nov 2009 00:20:48 -0500
Content-Disposition: inline
In-Reply-To: <200911101250.58516.rusty@rustcorp.com.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Rusty Russell <rusty@rustcorp.com.au>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

On Tue, Nov 10, 2009 at 12:50:58PM +1030, Rusty Russell wrote:
> On Mon, 9 Nov 2009 06:10:46 pm Stephen Rothwell wrote:
> > I am also getting some section mismatch warnings like this:
> > 
> > WARNING: drivers/mtd/ubi/ubi.o(.data+0x1c0): Section mismatch in reference from the variable __ops_mtd to the function .init.text:ubi_mtd_param_parse()
> > The variable __ops_mtd references
> > the function __init ubi_mtd_param_parse()
> 
> Right.  This needs a new rule in modpost; here's what I've added:

Looks fine.

Acked-by: Sam Ravnborg <sam@ravnborg.org>

	Sam
