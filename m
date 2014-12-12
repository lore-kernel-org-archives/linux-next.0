From: Paul Bolle <pebolle@tiscali.nl>
Subject: Re: linux-next: Tree for Dec 12
Date: Fri, 12 Dec 2014 23:36:37 +0100
Message-ID: <1418423797.5756.54.camel@x220>
References: <20141212183518.06e3803d@canb.auug.org.au>
	 <1418377757.5756.24.camel@x220> <20141212210449.7f460bb1@canb.auug.org.au>
	 <1418380316.5756.37.camel@x220>
	 <20141212135719.4c79bac46d43bfd8d7c8e6a6@linux-foundation.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from cpsmtpb-ews08.kpnxchange.com ([213.75.39.13]:62317 "EHLO
	cpsmtpb-ews08.kpnxchange.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1751089AbaLLWgk (ORCPT
	<rfc822;linux-next@vger.kernel.org>);
	Fri, 12 Dec 2014 17:36:40 -0500
In-Reply-To: <20141212135719.4c79bac46d43bfd8d7c8e6a6@linux-foundation.org>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Valentin Rothberg <valentinrothberg@gmail.com>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Andy Lutomirski <luto@amacapital.net>, Josh Triplett <josh@joshtriplett.org>

On Fri, 2014-12-12 at 13:57 -0800, Andrew Morton wrote:
> On Fri, 12 Dec 2014 11:31:56 +0100 Paul Bolle <pebolle@tiscali.nl> wrote:

> > I won't be bothering (Andrew and) you again about this. Unless sorting
> > this out takes rather long, that is.
> 
> Is there some problem with the current mainline 3.19 code?

The problem I noticed is with next-20141212. For some reason - Stephen
appears to not know exactly why - it ended up with a Kconfig entry for
INIT_FALLBACK without any actually users of that Kconfig symbol. My
infamous 800 line perl monster - which I run on every linux-next release
to check for exactly stuff like this - can't help but notice that. The
idea being that my script notices these problems before they actually
hit mainline.

Note that the set of people actually worrying about this stuff contains
me and, maybe, one or two other persons.


Paul Bolle
