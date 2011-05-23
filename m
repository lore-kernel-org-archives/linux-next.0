From: Eduardo Silva <edsiper@gmail.com>
Subject: Re: linux-next: build warnings in Linus' tree
Date: Sun, 22 May 2011 22:31:36 -0400
Message-ID: <BANLkTimq+cFfHYx183v_RvH6hAaOmJZ-Mg@mail.gmail.com>
References: <20110523112529.c2dbc445.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-px0-f173.google.com ([209.85.212.173]:37490 "EHLO
	mail-px0-f173.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755856Ab1EWCbh convert rfc822-to-8bit (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Sun, 22 May 2011 22:31:37 -0400
In-Reply-To: <20110523112529.c2dbc445.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: "H. Peter Anvin" <hpa@linux.intel.com>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Linus Torvalds <torvalds@linux-foundation.org>

On Sun, May 22, 2011 at 9:25 PM, Stephen Rothwell <sfr@canb.auug.org.au=
> wrote:
> Hi all,
>
> After merging the origin tree, today's linux-next build (x86_64
> allmodconfig) produced these warnings:
>
> arch/x86/kernel/ftrace.c: In function 'ftrace_make_nop':
> arch/x86/kernel/ftrace.c:308: warning: assignment discards qualifiers=
 from pointer target type
> arch/x86/kernel/ftrace.c: In function 'ftrace_make_call':
> arch/x86/kernel/ftrace.c:318: warning: assignment discards qualifiers=
 from pointer target type

discussing ftrace.c warnings on this thread:

   https://lkml.org/lkml/2011/5/22/158

regards,


>
> Introduced by commit dc326fca2b64 ("x86, cpu: Clean up and unify the =
NOP
> selection infrastructure").
>
> --
> Cheers,
> Stephen Rothwell =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0sfr@canb.auug=
=2Eorg.au
> http://www.canb.auug.org.au/~sfr/
>



--=20
Eduardo Silva
http://edsiper.linuxchile.cl
http://www.monkey-project.com
