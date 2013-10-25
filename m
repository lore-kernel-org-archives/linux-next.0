From: Olof Johansson <olof@lixom.net>
Subject: Re: linux-next: Tree for Oct 24
Date: Fri, 25 Oct 2013 06:33:43 -0700
Message-ID: <CAOesGMjuT0ntb6awo0PVtccqvFfo_Lzj1zyGNX=C4BrVLBow7w@mail.gmail.com>
References: <1382632289-18523-1-git-send-email-treding@nvidia.com>
	<5269FB5E.6010901@roeck-us.net>
	<20131025083525.GF19622@ulmo.nvidia.com>
	<CAOesGMg+Xi3+MZrPbRiMGFe2cQFjN9qaif9u5gW_tDzK62EB7w@mail.gmail.com>
	<20131025132422.GC12932@sirena.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20131025132422.GC12932@sirena.org.uk>
Sender: linux-kernel-owner@vger.kernel.org
To: Mark Brown <broonie@kernel.org>
Cc: Thierry Reding <thierry.reding@gmail.com>, Guenter Roeck <linux@roeck-us.net>, "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

On Fri, Oct 25, 2013 at 6:24 AM, Mark Brown <broonie@kernel.org> wrote:
> On Fri, Oct 25, 2013 at 06:16:02AM -0700, Olof Johansson wrote:
>> On Fri, Oct 25, 2013 at 1:35 AM, Thierry Reding
>
>> > Yeah, I saw the devm_gpio_request_one() errors too. They happened for 3
>> > boards on ARM I think. Must have forgotten to update the summary email.
>> > I'll see if I can come up with a patch to fix the GPIO related build
>> > failures, or at least report it to LinusW or Alexandre.
>
>> Hmm.
>
>> Please don't apply fixes like these directly to your tree, keep the
>> broken parts (or drop the tree that introduced it). It makes the
>> process of getting the fixes in where they really have to go much more
>> error prone, since there's no way to track whether they have landed in
>> the right place yet or not.
>
> The rule I was applying (which I think is the same as Stephen applies)
> is that I'd fix anything that was definitely the result of a merge issue
> (like the build failure in misc due to a sysfs API change in the sysfs
> tree) but not anything that was just plain broken in the tree in
> isolation.

Some of those might still make sense, but as many as possible of them
should be pushed down into the trees where they belong, even if
they're strictly not needed there (as long as they don't break the
standalone tree, of course).


-Olof
