From: Deepa Dinamani <deepa.kernel@gmail.com>
Subject: Re: linux-next: Signed-off-by missing for commit in the y2038 tree
Date: Tue, 5 Jun 2018 17:04:25 -0700
Message-ID: <CABeXuvoQJ0sSpJCjfeKR+s1esS3kq34F0k=S87GMOC2B5XKxug@mail.gmail.com>
References: <20180606075535.09b41c23@canb.auug.org.au> <CABeXuvqG_DQMOwa0vrmJB+kx7DPbuMo=s-aS-DK7LdBy_ZGtTw@mail.gmail.com>
 <20180606091707.18a8f2f0@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180606091707.18a8f2f0@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Kees Cook <keescook@chromium.org>, Arnd Bergmann <arnd@arndb.de>, Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

Oh, you meant that it has keescook@chromium.org author sign-off, but
it needs mine because I applied it.

Please add

Signed-off-by: Deepa Dinamani <deepa.kernel@gmail.com>

I also updated it in my tree.

Thanks,
- Deepa

On Tue, Jun 5, 2018 at 4:17 PM, Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> Hi Deepa,
>
> On Tue, 5 Jun 2018 15:00:24 -0700 Deepa Dinamani <deepa.kernel@gmail.com> wrote:
>>
>> That patch belongs to Kees.
>
> But you committed it to the tree ...
>
> --
> Cheers,
> Stephen Rothwell
