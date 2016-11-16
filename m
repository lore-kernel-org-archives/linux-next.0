From: Kevin Hilman <khilman@baylibre.com>
Subject: Re: linux-next: unable to fetch the amlogic tree
Date: Tue, 15 Nov 2016 22:13:04 -0800
Message-ID: <CAOi56cWUepwhPspgURe1ek2xQPpN6WWNwf3G_0RmX7V7-Yo_fA@mail.gmail.com>
References: <20161116091830.7a623914@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20161116091830.7a623914@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Carlo Caione <carlo@caione.org>, linux-next@vger.kernel.org, lkml <linux-kernel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

HI Stephen,

On Tue, Nov 15, 2016 at 2:18 PM, Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> Hi all,
>
> Fetching the amlogic tree
> (git://git.kernel.org/pub/scm/linux/kernel/git/khilman/linux-amlogic.git#for-next)
> produces this error:
>
> fatal: Couldn't find remote ref refs/heads/for-next

Hmm, must've been bad timing.  I was updating branches much earlier,
but maybe the your mirror didn't have it in time.  Seems to be fully
mirrored now:
https://git.kernel.org/cgit/linux/kernel/git/khilman/linux-amlogic.git/log/?h=for-next

> I will continue to use te previously fetched version of this tree.

Should be fine for today.

Thanks,

Kevin
