From: Russell King - ARM Linux <linux@arm.linux.org.uk>
Subject: Re: [PATCH 00/12] Thumb-2 kernel support
Date: Sun, 27 Jul 2008 12:08:05 +0100
Message-ID: <20080727110804.GE32366@flint.arm.linux.org.uk>
References: <20080606173300.7930.31525.stgit@pc1117.cambridge.arm.com> <20080630125110.1dc5689a.akpm@linux-foundation.org> <1214901131.29199.31.camel@pc1117.cambridge.arm.com> <20080701014529.272706d8.akpm@linux-foundation.org> <1216829155.23395.19.camel@pc1117.cambridge.arm.com> <20080723130140.ff016944.akpm@linux-foundation.org> <1216847422.6550.8.camel@localhost.localdomain> <20080723151045.bcae107e.akpm@linux-foundation.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from caramon.arm.linux.org.uk ([78.32.30.218]:40146 "EHLO
	caramon.arm.linux.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751013AbYG0LI5 (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Sun, 27 Jul 2008 07:08:57 -0400
Content-Disposition: inline
In-Reply-To: <20080723151045.bcae107e.akpm@linux-foundation.org>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>, linux-next@vger.kernel.org, linux-arm-kernel@lists.arm.linux.org.uk

On Wed, Jul 23, 2008 at 03:10:45PM -0700, Andrew Morton wrote:
> Well.  Rather than doing things sequentially we could go parallel. 
> Russell could say "I'll look at them before 2.6.28 but please put them
> into linux-next meanwhile".

There have been some valid but (iirc) non-vocal objections to the
Thumb-2 support from a few people.  The biggest one is all the
mess associated with supporting this "unified" assembler stuff.

My view is that I really don't like these patches; they make the
code very unreadable and more prone to errors.  They're going to
cause us lots of problems in the future.  Every git merge which
touches any ARM file containing assembly is going to have to be
_very_ carefully reviewed, and it's not always possible to catch
all of those.

The only suggestion I have to improving the situation is to recommend
that someone rethinks their wizzy new assembly language format - which
IMHO is currently only fit for "write once, read or modify never"
assembly code.
