From: Emese Revfy <re.emese@gmail.com>
Subject: Re: linux-next: build warnings after merge of the kbuild tree
Date: Thu, 9 Jun 2016 19:37:36 +0200
Message-ID: <20160609193736.db48229a82b9fad7de1562d9@gmail.com>
References: <20160609122258.1c2068f0@canb.auug.org.au>
	<CAGXu5jLxN65Z-+Miiju3VcOK7fpWKqAQY6hn6u5KTZm_NP54kQ@mail.gmail.com>
	<20160609140505.3e336ba3@canb.auug.org.au>
	<57594B8C.8020006@suse.cz>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-wm0-f49.google.com ([74.125.82.49]:34701 "EHLO
	mail-wm0-f49.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932077AbcFIRao (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 9 Jun 2016 13:30:44 -0400
In-Reply-To: <57594B8C.8020006@suse.cz>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Michal Marek <mmarek@suse.cz>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Kees Cook <keescook@chromium.org>, Linux-Next <linux-next@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>

On Thu, 9 Jun 2016 12:57:16 +0200
Michal Marek <mmarek@suse.cz> wrote:

> Dne 9.6.2016 v 06:05 Stephen Rothwell napsal(a):
> > On Wed, 8 Jun 2016 19:56:38 -0700 Kees Cook <keescook@chromium.org> wrote:
> >> Ah, yes, that should default to off. We'll get a fix landed ASAP.
> > 
> > Note that this was an allmodconfig build.  The default is 'n', but
> > allmodconfig will turn it on (as will allyesconfig).
> 
> I guess we should make GCC_PLUGINS depend on !COMPILE_TEST. Actually I
> thought this was already the case, but it is not.

Is it really necessary to disable all gcc plugins or would it be enough
to disable only the cyc_complexity plugin?

-- 
Emese
