From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: build failure after merge of the akpm-current tree
Date: Fri, 16 Jun 2017 11:20:19 +1000
Message-ID: <20170616112019.27a29a04@canb.auug.org.au>
References: <20170605170117.6a1fc15e@canb.auug.org.au>
        <20170615113548.3e4edcf4@canb.auug.org.au>
        <CAGXu5jJyjymPfRNcKrRruYzZFUR-W8H7EWUnYR-6PJi3HcQ+-A@mail.gmail.com>
        <20170615121220.4331a37b0fb736ec9da4e423@linux-foundation.org>
        <CAGXu5jJJPZYnhcubfWrjj8XROAycEYsgK_AhBF-rQydeZyCwCg@mail.gmail.com>
        <1497571513.17727.2.camel@gmail.com>
        <CAGXu5jKXNuZOqWB6pa+1L6x0k6qwXyFzba0nECCpvb07XcW+zg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:52191 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751641AbdFPBUV (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Thu, 15 Jun 2017 21:20:21 -0400
In-Reply-To: <CAGXu5jKXNuZOqWB6pa+1L6x0k6qwXyFzba0nECCpvb07XcW+zg@mail.gmail.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Kees Cook <keescook@chromium.org>
Cc: Daniel Micay <danielmicay@gmail.com>, Andrew Morton <akpm@linux-foundation.org>, Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

Hi Kees,

On Thu, 15 Jun 2017 17:35:43 -0700 Kees Cook <keescook@chromium.org> wrote:
>
> Sounds good. I've added ARCH_HAS_FORTIFY_SOURCE to the patch (and noted it).

And that just made it in time for today's linux-next.  I have removed
the patches from Andrew's tree.

-- 
Cheers,
Stephen Rothwell
