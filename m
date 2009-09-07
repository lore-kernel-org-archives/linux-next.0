From: Catalin Marinas <catalin.marinas@arm.com>
Subject: Re: [PATCH -next] Fix "W" macro in unified.h
Date: Mon, 07 Sep 2009 10:00:22 +0100
Message-ID: <1252314022.23780.27.camel@pc1117.cambridge.arm.com>
References: <20090905210240.GA3525@x200.localdomain>
Mime-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from cam-admin0.cambridge.arm.com ([193.131.176.58]:64581 "EHLO
	cam-admin0.cambridge.arm.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1752175AbZIGJAd (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 7 Sep 2009 05:00:33 -0400
In-Reply-To: <20090905210240.GA3525@x200.localdomain>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Alexey Dobriyan <adobriyan@gmail.com>
Cc: linux-next@vger.kernel.org, sfr@canb.auug.org.au, Russell King - ARM Linux <linux@arm.linux.org.uk>

On Sun, 2009-09-06 at 01:02 +0400, Alexey Dobriyan wrote:
> Please, fold into 0becb088501886f37ade38762c8eaaf4263572cc
> aka "Thumb-2: Add macros for the unified assembler syntax"
> 
> otherwise:
> 
> 	crypto/cast6.c:372:39: error: macro "W" passed 2 arguments, but takes just 1
> 
> Signed-off-by: Alexey Dobriyan <adobriyan@gmail.com>

Thanks for this. I added it as a new patch since Russell already merged
the current thumb-2 branch and I don't want to modify the history.

The unified.h file is automatically included in the .S files only. But
it seems that it gets included in C files via asm/uaccess.h, so this
patch makes sense.

Russell, would you like the patch on top of my thumb-2 git branch
(should only pull one patch as I haven't rebased it) or to the patch
system (but Alexey should send it so that the author information is
preserved)?

Thanks.

-- 
Catalin
