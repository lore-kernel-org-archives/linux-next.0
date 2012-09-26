From: Ralf Baechle <ralf@linux-mips.org>
Subject: Re: [PATCH -next] MIPS: ptrace: Add missing #include <asm/syscall.h>
Date: Wed, 26 Sep 2012 23:09:43 +0200
Message-ID: <20120926210943.GA4745@linux-mips.org>
References: <1347913216-11140-1-git-send-email-geert@linux-m68k.org>
 <20120923173609.GE13842@linux-mips.org>
 <5060A52C.1050504@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from eddie.linux-mips.org ([78.24.191.182]:48190 "EHLO
	cvs.linux-mips.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751648Ab2IZVJv (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 26 Sep 2012 17:09:51 -0400
Received: from localhost.localdomain ([127.0.0.1]:58262 "EHLO linux-mips.org"
        rhost-flags-OK-OK-OK-FAIL) by eddie.linux-mips.org with ESMTP
        id S1903848Ab2IZVJt (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Wed, 26 Sep 2012 23:09:49 +0200
Content-Disposition: inline
In-Reply-To: <5060A52C.1050504@gmail.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: David Daney <ddaney.cavm@gmail.com>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, linux-mips@linux-mips.org, linux-next@vger.kernel.org

On Mon, Sep 24, 2012 at 11:23:40AM -0700, David Daney wrote:

> >Thanks, I already had fixed that in the linux-trace tree; the latest
> >version just had not yet propagated yet to the other trees.
> >
> 
> It is still not on mips-for-linux-next.  Perhaps we should arrange
> for it to be there, so that the actual propagation may commence.

Seems my fix one branch, push the other strategy didn't work so well ;-)

Fixed, sorry.

  Ralf
