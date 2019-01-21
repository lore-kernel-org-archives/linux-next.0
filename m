From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: linux-next: Signed-off-by missing for commits in the y2038 tree
Date: Mon, 21 Jan 2019 21:48:50 +0100
Message-ID: <CAK8P3a28_hxweVAXn0tdE83fpTcNMdOnuuva=Z4J9-jv6skyMg@mail.gmail.com>
References: <20190120153044.71775e03@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190120153044.71775e03@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

On Sun, Jan 20, 2019 at 5:30 AM Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>
> Hi Arnd,
>
> Commits
>
>   e6f8f282d174 ("timex: use __kernel_timex internally")
>   683569ef2b4f ("time: Add struct __kernel_timex")
>
> are missing a Signed-off-by from their committers.

Fixed now, thanks for the report!

    Arnd
