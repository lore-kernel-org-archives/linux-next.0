From: Michal Marek <mmarek@suse.cz>
Subject: Re: linux-next: build warnings after merge of the kbuild tree
Date: Thu, 9 Jun 2016 12:57:16 +0200
Message-ID: <57594B8C.8020006@suse.cz>
References: <20160609122258.1c2068f0@canb.auug.org.au>
 <CAGXu5jLxN65Z-+Miiju3VcOK7fpWKqAQY6hn6u5KTZm_NP54kQ@mail.gmail.com>
 <20160609140505.3e336ba3@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mx2.suse.de ([195.135.220.15]:44334 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752255AbcFIK5V (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 9 Jun 2016 06:57:21 -0400
In-Reply-To: <20160609140505.3e336ba3@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>, Kees Cook <keescook@chromium.org>
Cc: Linux-Next <linux-next@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, Emese Revfy <re.emese@gmail.com>

Dne 9.6.2016 v 06:05 Stephen Rothwell napsal(a):
> On Wed, 8 Jun 2016 19:56:38 -0700 Kees Cook <keescook@chromium.org> wrote:
>> Ah, yes, that should default to off. We'll get a fix landed ASAP.
> 
> Note that this was an allmodconfig build.  The default is 'n', but
> allmodconfig will turn it on (as will allyesconfig).

I guess we should make GCC_PLUGINS depend on !COMPILE_TEST. Actually I
thought this was already the case, but it is not.

Michal
