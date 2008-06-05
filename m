From: David Woodhouse <dwmw2@infradead.org>
Subject: Re: linux-next: frimware build failure
Date: Thu, 05 Jun 2008 08:30:30 +0100
Message-ID: <1212651030.32207.156.camel@pmac.infradead.org>
References: <20080605172512.e000ddc5.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([18.85.46.34]:54944 "EHLO
	bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751882AbYFEHai (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 5 Jun 2008 03:30:38 -0400
In-Reply-To: <20080605172512.e000ddc5.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Russell King <rmk@arm.linux.org.uk>, linux-next@vger.kernel.org

On Thu, 2008-06-05 at 17:25 +1000, Stephen Rothwell wrote:
> Hi David,
> 
> Yesterday's linux-next build (arm csb637_defconfig and others) failed
> like this:
> 
> firmware/keyspan/usa19qi.fw.gen.S: Assembler messages:
> firmware/keyspan/usa19qi.fw.gen.S:11: Error: junk at end of line, first unrecognized character is `,'
> 
> for the various firmware bits.  Turns out that '@' is a gas comment start
> character on arm.
> 
> I have applied the following patch.  This contains some white space and
> other changes as well - in particular the first .palign was not getting a
> number.

Thanks for that; I'll rework the patch accordingly. Sorry for the
trouble in this area; I expected one or two issues getting this right in
assembly, but I still think it's better to be able to use .incbin rather
than doing it in C as I had it originally.

-- 
dwmw2

