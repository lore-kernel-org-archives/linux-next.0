From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: build failure after merge of the akpm-current tree
Date: Thu, 15 Jun 2017 12:04:06 +1000
Message-ID: <20170615120406.134205ee@canb.auug.org.au>
References: <20170605170117.6a1fc15e@canb.auug.org.au>
        <20170615113548.3e4edcf4@canb.auug.org.au>
        <CAGXu5jJyjymPfRNcKrRruYzZFUR-W8H7EWUnYR-6PJi3HcQ+-A@mail.gmail.com>
        <1497491922.1435.1.camel@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:49477 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751606AbdFOCEI (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Wed, 14 Jun 2017 22:04:08 -0400
In-Reply-To: <1497491922.1435.1.camel@gmail.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Daniel Micay <danielmicay@gmail.com>
Cc: Kees Cook <keescook@chromium.org>, Andrew Morton <akpm@linux-foundation.org>, Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

Hi Daniel,

On Wed, 14 Jun 2017 21:58:42 -0400 Daniel Micay <danielmicay@gmail.com> wrote:
>
> They're false positive warnings. I think objtool has a list of
> __noreturn functions and needs fortify_panic added there. It's just a
> warning so it doesn't need to happen immediately.

There are *lots* of them, so it does need to be fixed (Linus will be
very irritated if it hits his tree like that).  Create a patch to
objtool and get the x86 guys to Ack it?

-- 
Cheers,
Stephen Rothwell
