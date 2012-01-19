From: Linus Torvalds <torvalds@linux-foundation.org>
Subject: Re: linux-next: Tree for Jan 19 (uml)
Date: Wed, 18 Jan 2012 19:40:53 -0800
Message-ID: <CA+55aFyu1t6xuCpNmyrfAtScz2x2o7ozzhU7WQOyz7k1TwmC5w@mail.gmail.com>
References: <20120119125932.a4c67005cf6a0938558e8b36@canb.auug.org.au>
 <4F1788EC.4040901@xenotime.net> <20120119131854.d1795a461302e72e727e63df@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-ww0-f44.google.com ([74.125.82.44]:35154 "EHLO
	mail-ww0-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754128Ab2ASDlP (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 18 Jan 2012 22:41:15 -0500
In-Reply-To: <20120119131854.d1795a461302e72e727e63df@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Randy Dunlap <rdunlap@xenotime.net>, linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, "user-mode-linux-devel@lists.sourceforge.net" <user-mode-linux-devel@lists.sourceforge.net>, Richard Weinberger <richard@nod.at>, Eric Paris <eparis@redhat.com>

On Wed, Jan 18, 2012 at 6:18 PM, Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>
> This file now needs protection against double inclusion.

Done. I didn't check the UML end result, though, so...

                 Linus
