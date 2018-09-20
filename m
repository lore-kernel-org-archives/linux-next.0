From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Subject: Re: linux-next: disabling -Wstringop-truncation
Date: Thu, 20 Sep 2018 18:28:20 +0200
Message-ID: <CANiq72kseYacgu91NuDGaH1cb+9Jind=0bAt-7baPi28YGbgsQ@mail.gmail.com>
References: <20180831080714.4f94fba9@canb.auug.org.au> <CA+55aFyApn2d+bv_3LGwXKnLpj2zdX6HYw_9cYZoNUVPi-Bu_g@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CA+55aFyApn2d+bv_3LGwXKnLpj2zdX6HYw_9cYZoNUVPi-Bu_g@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>, Andi Kleen <ak@linux.intel.com>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, linux-next <linux-next@vger.kernel.org>, Linus Torvalds <torvalds@linux-foundation.org>
List-Id: linux-next.vger.kernel.org

Hi Stephen, Andi, (Linus),

On Fri, Aug 31, 2018 at 3:17 AM, Linus Torvalds
<torvalds@linux-foundation.org> wrote:
> On Thu, Aug 30, 2018 at 3:07 PM Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>>
>> I am now mainly using gcc v8.2 for my builds and -Wstringop-truncation
>> causes so many warnings that I am sure to miss others, so I have
>> applied the below to my fixes tree until the noise reduces.
>
> Applied.
>
> If people want the warning with W=xyz, then this is still the correct
> patch, and we should add a line to re-enable it in
> scripts/Makefile.extrawarn.

For reference, I am sending the v5 of the Compiler Attributes series
with the __nonstring patches appended on top, and I am adding the
warning back as well, on W=1.

I think W=1 is better: there are not that many warnings compared to
those in W=2. AFAIK, it is relatively easy to achieve a clean W=1 (and
most code should at least try be W=1 clean, no?). Also, note that now
people can use __nonstring to suppress that warning (if applicable);
and that using properly __nonstring can detect even more problems
(i.e. adding __nonstring may trigger additional warnings, e.g.
-Wstringop-overflow); so I think we should encourage the use of
__nonstring.

Cheers,
Miguel
