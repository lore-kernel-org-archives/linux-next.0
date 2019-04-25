From: Benjamin Tissoires <benjamin.tissoires@redhat.com>
Subject: Re: linux-next: Fixes tags need some work in the hid tree
Date: Thu, 25 Apr 2019 16:16:17 +0200
Message-ID: <CAO-hwJ+DOfjoL+ZS0amusr7JEBv6uis5tn59gb7XFepXO8Lb0Q@mail.gmail.com>
References: <20190425233430.14bdb102@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190425233430.14bdb102@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Jiri Kosina <jikos@kernel.org>, Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

Hi Stephen,

On Thu, Apr 25, 2019 at 3:34 PM Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>
> Hi all,
>
> In commit
>
>   39b3c3a5fbc5 ("HID: input: fix assignment of .value")
>
> Fixes tag
>
>   Fixes: 2dc702c991e377 ("HID: input: use the Resolution Multiplier for
>
> has these problem(s):
>
>   - Subject has leading but no trailing parentheses
>   - Subject has leading but no trailing quotes
>
> In commit
>
>   d43c17ead879 ("HID: input: make sure the wheel high resolution multiplier is set")
>
> Fixes tag
>
>   Fixes: 2dc702c991e377 ("HID: input: use the Resolution Multiplier for
>
> has these problem(s):
>
>   - Subject has leading but no trailing parentheses
>   - Subject has leading but no trailing quotes
>
> Please do not aplit Fixes tags over more than one line.
>

Sorry for that, these are my commits.

I just re-read the doc, and indeed, we are not supposed to trim or
split the commit title. I'll be more careful next time.

Also, can't we add these requirements in checkpatch?

Cheers,
Benjamin
