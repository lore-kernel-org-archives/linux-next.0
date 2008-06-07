From: Segher Boessenkool <segher@kernel.crashing.org>
Subject: Re: linux-next: frimware build failure
Date: Sat, 7 Jun 2008 02:42:07 +0200
Message-ID: <319e1e066fdd3a977c0f23be13a38346@kernel.crashing.org>
References: <20080605172512.e000ddc5.sfr@canb.auug.org.au> <1212652090.32207.159.camel@pmac.infradead.org> <20080605175941.5520add5.sfr@canb.auug.org.au>
Mime-Version: 1.0 (Apple Message framework v623)
Content-Type: text/plain; charset=US-ASCII; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from gate.crashing.org ([63.228.1.57]:53338 "EHLO gate.crashing.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752121AbYFGAml (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Fri, 6 Jun 2008 20:42:41 -0400
In-Reply-To: <20080605175941.5520add5.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: David Woodhouse <dwmw2@infradead.org>, linux-next@vger.kernel.org, Russell King <rmk@arm.linux.org.uk>

> I am a little worried that this may be broken the same way on other
> platforms ...  The gas manual said something like "On platforms where @
> is the comment character (like ARM) another character is used instead.
> For example, the ARM port uses the % character."
>
> A grep through the kernel sources shows only @ except on arm, so it
> should be ok.

The GAS code shows the same: only ARM is affected currently.

Incidentally, all GAS targets accept both "@" and "%" as the
character before progbits etc. -- but please don't use "%"
universally, since it could be a comment character on some archs
as well [1] (or break in some other way).


Segher

[1] The mmix gas port uses % as comment char already, for example.

