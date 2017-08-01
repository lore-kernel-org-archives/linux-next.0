From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: linux-next: build failure after merge of the akpm tree
Date: Tue, 1 Aug 2017 22:44:26 +0200
Message-ID: <CAK8P3a1LtRf0MzoKJOsZ8Py5isQHFKQEMCC4kN=hvpDMpc4bhw@mail.gmail.com>
References: <20170801162511.39fa58ad@canb.auug.org.au> <CAGXu5jK4wv2exKT3HnKG8TuHOWuDjKJx214y_q1QErg8djTQ9Q@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-oi0-f52.google.com ([209.85.218.52]:36573 "EHLO
        mail-oi0-f52.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752152AbdHAUo1 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 1 Aug 2017 16:44:27 -0400
In-Reply-To: <CAGXu5jK4wv2exKT3HnKG8TuHOWuDjKJx214y_q1QErg8djTQ9Q@mail.gmail.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Kees Cook <keescook@chromium.org>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Andrew Morton <akpm@linux-foundation.org>, Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

On Tue, Aug 1, 2017 at 8:40 PM, Kees Cook <keescook@chromium.org> wrote:
>>
>> I don't know why this has turned up now.  I have just left it broken
>> for now and would appreciate any fix.
>
> Thanks for the heads-up! I'm not sure why this suddenly appeared
> either, but Arnd has sent a patch for this now.

The main difference I see that can impact gcc's optimization steps is the
unreachable() that was there in BUG() but is absent in WARN().

It's possible that the compiler decided that the entire code path leading
up to the unreachable() couldn't happen, so it dropped the
__read_overflow2() call as well.

      Arnd
