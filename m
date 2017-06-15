From: Daniel Micay <danielmicay@gmail.com>
Subject: Re: linux-next: build failure after merge of the akpm-current tree
Date: Wed, 14 Jun 2017 22:12:02 -0400
Message-ID: <1497492722.1435.4.camel@gmail.com>
References: <20170605170117.6a1fc15e@canb.auug.org.au>
         <20170615113548.3e4edcf4@canb.auug.org.au>
         <CAGXu5jJyjymPfRNcKrRruYzZFUR-W8H7EWUnYR-6PJi3HcQ+-A@mail.gmail.com>
         <1497491922.1435.1.camel@gmail.com>
         <20170615120406.134205ee@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-io0-f193.google.com ([209.85.223.193]:33451 "EHLO
        mail-io0-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751888AbdFOCME (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 14 Jun 2017 22:12:04 -0400
In-Reply-To: <20170615120406.134205ee@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Kees Cook <keescook@chromium.org>, Andrew Morton <akpm@linux-foundation.org>, Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

On Thu, 2017-06-15 at 12:04 +1000, Stephen Rothwell wrote:
> Hi Daniel,
> 
> On Wed, 14 Jun 2017 21:58:42 -0400 Daniel Micay <danielmicay@gmail.com
> > wrote:
> > 
> > They're false positive warnings. I think objtool has a list of
> > __noreturn functions and needs fortify_panic added there. It's just
> > a
> > warning so it doesn't need to happen immediately.
> 
> There are *lots* of them, so it does need to be fixed (Linus will be
> very irritated if it hits his tree like that).  Create a patch to
> objtool and get the x86 guys to Ack it?

Okay, I'll send a patch. It turns out that it's very straightforward.

c1fad9ef7ed14aad464972e6444e7a3bd5670f26 is an example of an earlier
one.
