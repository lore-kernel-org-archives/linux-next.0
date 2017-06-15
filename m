From: Kees Cook <keescook@chromium.org>
Subject: Re: linux-next: build failure after merge of the akpm-current tree
Date: Wed, 14 Jun 2017 19:16:41 -0700
Message-ID: <CAGXu5jK2N349VCRb6ROAa=mMvF7bPqjEs3HofXVjzPQqWzRD3A@mail.gmail.com>
References: <20170605170117.6a1fc15e@canb.auug.org.au> <20170615113548.3e4edcf4@canb.auug.org.au>
 <CAGXu5jJyjymPfRNcKrRruYzZFUR-W8H7EWUnYR-6PJi3HcQ+-A@mail.gmail.com> <20170615120631.121c6c9b@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170615120631.121c6c9b@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Andrew Morton <akpm@linux-foundation.org>, Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Daniel Micay <danielmicay@gmail.com>
List-Id: linux-next.vger.kernel.org

On Wed, Jun 14, 2017 at 7:06 PM, Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> Hi Kees,
>
> On Wed, 14 Jun 2017 18:56:30 -0700 Kees Cook <keescook@chromium.org> wrote:
>>
>> I sent a series for -mm (or maintainers) to merge that should catch
>> everything. Do you want me to carry it in my kspp tree instead? (My
>> original intention was to carry all the fixes and the fortify patch in
>> kspp but akpm took it into -mm somewhat unexpectedly, not that I'm
>> complaining.)
>
> Andrew is currently not responding to stuff (he warned us last week),
> so if you do put the series in your tree, I will remove it from my copy
> of Andrew's quilt series.  All the fixes necessary to make this usable
> should really be in the same tree if possible.
>
> (I am assuming that the fix patches have been reviewed and acked by
> appropriate people.)

Mostly, yes. But they're usually trivial. All have been sent out for
review (some a few times).

Given that the fixes are already scattered between various trees and
you merge -mm last in -next, I'll just carry the remaining fixes and
you can leave akpm's fortify patch in -mm.

-Kees

-- 
Kees Cook
Pixel Security
