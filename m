From: Robert Jarzmik <robert.jarzmik@free.fr>
Subject: Re: linux-next: build failure after merge of the arm-soc tree
Date: Mon, 16 Jul 2018 08:18:00 +0200
Message-ID: <87601faelj.fsf@belgarion.home>
References: <20180716091337.6c1b2a4d@canb.auug.org.au>
        <CAOesGMgicOOi0Nr+m_UHEGYL+ryRW65YAPwVsN+CZpo6kc2FLA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAOesGMgicOOi0Nr+m_UHEGYL+ryRW65YAPwVsN+CZpo6kc2FLA@mail.gmail.com>
        (Olof Johansson's message of "Sun, 15 Jul 2018 16:50:25 -0700")
Sender: linux-kernel-owner@vger.kernel.org
To: Olof Johansson <olof@lixom.net>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Arnd Bergmann <arnd@arndb.de>, ARM <linux-arm-kernel@lists.infradead.org>, Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Vinod Koul <vkoul@kernel.org>
List-Id: linux-next.vger.kernel.org

Olof Johansson <olof@lixom.net> writes:

> It's a known issue due to dependencies with a driver tree. :(
>
> Robert, this is unfortunate. What's the dependent patches? We can pick
> them up in our tree as duplicates if needed.
I'd rather postpone one of the patches, as I explained in the pull request.
As Stephen noticed, this will be :
0d0b16b8e008 ("dmaengine: pxa: make the filter function internal")

I'll queue this one for the 4.20 cycle. By the way, all of this cames from the
fact that I didn't take this very patch in my imutable branch for this change
...

I'll also resend a pull request, without this patch if that's good for you,
which will solve the breakage.

Cheers.

-- 
Robert
