From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: linux-next: triage for March 6, 2012
Date: Wed, 7 Mar 2012 10:46:37 +0100
Message-ID: <CAMuHMdXMqb17fSFoqu7BTGMGHBpy4xLAy2PjmrKd1pCKnsx+-Q@mail.gmail.com>
References: <20120307024306.GA18493@windriver.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20120307024306.GA18493@windriver.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Paul Gortmaker <paul.gortmaker@windriver.com>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-next.vger.kernel.org

On Wed, Mar 7, 2012 at 03:43, Paul Gortmaker
<paul.gortmaker@windriver.com> wrote:
> Due to the nature of the commits I've been making lately, when I see
> a fail in linux-next, I have to wonder if I somehow caused it by a
> header shuffle. =C2=A0After pouring over the kisskb linux-next result=
s,
> I realized that I can't be the only one doing this, and that a triage
> summary of the linux-next fails should in theory be useful to a
> bunch of people doing similar to what I do.

Indeed. Unfortunately I don't have the bandwidth to do daily regression
summaries for linux-next, like I do for Linus' releases.

I haven't uploaded my scripts to kernel.org after the resurrection,
but you may be able to get linux-log-diff.pl and linux-log-summary.pl
from an old mirror.

Gr{oetje,eeting}s,

=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-=
m68k.org

In personal conversations with technical people, I call myself a hacker=
=2E But
when I'm talking to journalists I just say "programmer" or something li=
ke that.
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0=C2=A0 -- Linus Torvalds
