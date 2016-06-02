From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: build failure after merge of the pstore tree
Date: Thu, 2 Jun 2016 12:29:09 +1000
Message-ID: <20160602122909.04daa8c1@canb.auug.org.au>
References: <20160602102556.722ad0cf@canb.auug.org.au>
	<CAGXu5jKqoL_wdgr2d7+e1ey+ThF6tkxXnyEx7QCBNun4zT5ZqQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:49804 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752075AbcFBC3M (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 1 Jun 2016 22:29:12 -0400
In-Reply-To: <CAGXu5jKqoL_wdgr2d7+e1ey+ThF6tkxXnyEx7QCBNun4zT5ZqQ@mail.gmail.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Kees Cook <keescook@chromium.org>
Cc: Linux-Next <linux-next@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, Geliang Tang <geliangtang@163.com>

Hi Kees,

On Wed, 1 Jun 2016 19:15:11 -0700 Kees Cook <keescook@chromium.org> wrote:
>
> Thanks for the patch! Should I add this to my tree?

Yes, since your tree is broken without it.  This patch should have been
part of the patch it fixes.  An x86_64 allmodconfig build of just your
tree should fail at the moment.

-- 
Cheers,
Stephen Rothwell
