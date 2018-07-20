From: Kevin Hilman <khilman@baylibre.com>
Subject: Re: linux-next: Signed-off-by missing for commits in the amlogic tree
Date: Fri, 20 Jul 2018 10:22:49 -0500
Message-ID: <7hh8ku53ue.fsf@baylibre.com>
References: <20180716080014.75c9016b@canb.auug.org.au>
        <7h4lgvm3go.fsf@baylibre.com>
        <CAOesGMghENGioK2o_dZKGPJYT01yoP9Fks1k-i1SUXZFENu3Lg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAOesGMghENGioK2o_dZKGPJYT01yoP9Fks1k-i1SUXZFENu3Lg@mail.gmail.com>
        (Olof Johansson's message of "Thu, 19 Jul 2018 14:57:19 -0700")
Sender: linux-kernel-owner@vger.kernel.org
To: Olof Johansson <olof@lixom.net>
Cc: ARM-SoC Maintainers <arm@kernel.org>, Carlo Caione <carlo@caione.org>, Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Stephen Rothwell <sfr@canb.auug.org.au>
List-Id: linux-next.vger.kernel.org

Olof Johansson <olof@lixom.net> writes:

> On Thu, Jul 19, 2018 at 12:26 PM, Kevin Hilman <khilman@baylibre.com> wrote:
>> Stephen Rothwell <sfr@canb.auug.org.au> writes:
>>
>>> Commits
>>>
>>>   3f1ad8c53b29 ("ARM64: dts: meson: enable the saradc node in meson-gx-p23x-q20x.dtsi")
>>>   4dabd157d48e ("ARM64: dts: meson-gx-p23x-q20x: move the wifi node to each board's .dts")
>>>
>>> are missing a Signed-off-by from their committer.
>>
>> Oops.  I missed these.
>>
>> Olof, these were just merged by you in my PR[1].  How do you want me to
>> handle this?
>>
>> I could respin the PR, or just send another with them reverted then
>> re-applied with signoff?
>>
>> Or, since these branches don't need to be static (yet), I suppose you
>> could just edit the commits and add my signoff.
>>
>> I'm OK with any of the above, let me know your preferene.
>
> Hi,
>
> Fresh pull requests is probably easiest for all. I'll drop the one I brought in.
>

Ack, I'll resend.  Thanks.

Kevin
