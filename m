From: James Bottomley <James.Bottomley@HansenPartnership.com>
Subject: Re: Request for linux-next inclusion of the voyager tree
Date: Wed, 10 Jun 2009 14:45:14 +0000
Message-ID: <1244645114.4109.34.camel@mulgrave.site>
References: <1244477423.4079.228.camel@mulgrave.site>
	 <20090608232853.GG16602@bilbo.ozlabs.org>
Mime-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from bedivere.hansenpartnership.com ([66.63.167.143]:58747 "EHLO
	bedivere.hansenpartnership.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1757000AbZFJOpQ (ORCPT
	<rfc822;linux-next@vger.kernel.org>);
	Wed, 10 Jun 2009 10:45:16 -0400
In-Reply-To: <20090608232853.GG16602@bilbo.ozlabs.org>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Tony Breeds <tony@bakeyournoodle.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org

On Tue, 2009-06-09 at 09:28 +1000, Tony Breeds wrote:
> On Mon, Jun 08, 2009 at 11:10:23AM -0500, James Bottomley wrote:
> > Could you add this (as a postmerge tree) somewhere after the x86 trees,
> > please (it depends on the auto-x86-next branch).
> 
> I'm sure I've seen to somewhere before, but can you provide any relevant
> details for building a voyager kernel (defconfig and crosscompile invocations
> is probably all we need.)

It just uses a standard x86 build environment, so it's all x86 build
tools.  You just answer Y to the "Voyager (NCR)" question; you have to
have also answered Y to "Support non-standard 32-bit SMP architectures".
The resulting kernel should be bootable on any x86 system (well, that
the config supports).

James
