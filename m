From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: linux-next: Tree for May 24
Date: Mon, 28 May 2018 11:08:22 +0200
Message-ID: <CAK8P3a2vmbxYmMqTYb0kHoB3uTcWi_=hL=Wunfw6nqE0NGr+QA@mail.gmail.com>
References: <20180525173025.GO4828@sirena.org.uk> <20180527184639.GD1564@sirena.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180527184639.GD1564@sirena.org.uk>
Sender: linux-kernel-owner@vger.kernel.org
To: Mark Brown <broonie@kernel.org>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

On Sun, May 27, 2018 at 8:46 PM, Mark Brown <broonie@kernel.org> wrote:
> On Fri, May 25, 2018 at 06:30:25PM +0100, Mark Brown wrote:
>
>> quickly as hoped, sorry.  There should be another linux-next done by me
>> for today (25th) as well, that will appear tomorrow all being well.
>
> There won't be.  For some reason I need to get to the bottom of the
> builds are taking a lot longer than they have previously which has
> caused a whole bunch of problems.
>
>> Stephen should be back on Monday.

One possible reason for slowdown on ARM allmodconfig might be the addition of
KCOV, though that is only enabled in mmotm at the end of your builds.

       Arnd
