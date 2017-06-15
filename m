From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: build failure after merge of the akpm-current tree
Date: Thu, 15 Jun 2017 12:06:31 +1000
Message-ID: <20170615120631.121c6c9b@canb.auug.org.au>
References: <20170605170117.6a1fc15e@canb.auug.org.au>
        <20170615113548.3e4edcf4@canb.auug.org.au>
        <CAGXu5jJyjymPfRNcKrRruYzZFUR-W8H7EWUnYR-6PJi3HcQ+-A@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:42047 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751620AbdFOCGd (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Wed, 14 Jun 2017 22:06:33 -0400
In-Reply-To: <CAGXu5jJyjymPfRNcKrRruYzZFUR-W8H7EWUnYR-6PJi3HcQ+-A@mail.gmail.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Kees Cook <keescook@chromium.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Daniel Micay <danielmicay@gmail.com>

Hi Kees,

On Wed, 14 Jun 2017 18:56:30 -0700 Kees Cook <keescook@chromium.org> wrote:
>
> I sent a series for -mm (or maintainers) to merge that should catch
> everything. Do you want me to carry it in my kspp tree instead? (My
> original intention was to carry all the fixes and the fortify patch in
> kspp but akpm took it into -mm somewhat unexpectedly, not that I'm
> complaining.)

Andrew is currently not responding to stuff (he warned us last week),
so if you do put the series in your tree, I will remove it from my copy
of Andrew's quilt series.  All the fixes necessary to make this usable
should really be in the same tree if possible.

(I am assuming that the fix patches have been reviewed and acked by
appropriate people.)
-- 
Cheers,
Stephen Rothwell
