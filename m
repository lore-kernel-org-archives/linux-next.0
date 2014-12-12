From: Andrew Morton <akpm@linux-foundation.org>
Subject: Re: linux-next: Tree for Dec 12
Date: Fri, 12 Dec 2014 14:56:23 -0800
Message-ID: <20141212145623.dc2394c57c2254b2603456e4@linux-foundation.org>
References: <20141212183518.06e3803d@canb.auug.org.au>
	<1418377757.5756.24.camel@x220>
	<20141212210449.7f460bb1@canb.auug.org.au>
	<1418380316.5756.37.camel@x220>
	<20141212135719.4c79bac46d43bfd8d7c8e6a6@linux-foundation.org>
	<1418423797.5756.54.camel@x220>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail.linuxfoundation.org ([140.211.169.12]:37174 "EHLO
	mail.linuxfoundation.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751456AbaLLW4Y (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Fri, 12 Dec 2014 17:56:24 -0500
In-Reply-To: <1418423797.5756.54.camel@x220>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Paul Bolle <pebolle@tiscali.nl>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Valentin Rothberg <valentinrothberg@gmail.com>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Andy Lutomirski <luto@amacapital.net>, Josh Triplett <josh@joshtriplett.org>

On Fri, 12 Dec 2014 23:36:37 +0100 Paul Bolle <pebolle@tiscali.nl> wrote:

> On Fri, 2014-12-12 at 13:57 -0800, Andrew Morton wrote:
> > On Fri, 12 Dec 2014 11:31:56 +0100 Paul Bolle <pebolle@tiscali.nl> wrote:
> 
> > > I won't be bothering (Andrew and) you again about this. Unless sorting
> > > this out takes rather long, that is.
> > 
> > Is there some problem with the current mainline 3.19 code?
> 
> The problem I noticed is with next-20141212. For some reason - Stephen
> appears to not know exactly why - it ended up with a Kconfig entry for
> INIT_FALLBACK without any actually users of that Kconfig symbol.

How'd that happen? 
http://ozlabs.org/~akpm/mmots/broken-out/init-remove-config_init_fallback.patch
removes all mention of CONFIG_INIT_FALLBACK?
