From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Subject: Re: linux-next: Tree for Nov 2
Date: Fri, 2 Nov 2018 14:57:48 +0100
Message-ID: <CANiq72=kHErmujzMgM4akXeoWkSR0Q3VLd-6Mwiaj5mGan8yZw@mail.gmail.com>
References: <20181102143018.09feb051@canb.auug.org.au> <CANiq72m65bQZefAoFF5dTUB-rPzm4vofZFnDn0nYBG3MsGrjZg@mail.gmail.com>
 <20181103002218.3bd015b3@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181103002218.3bd015b3@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

On Fri, Nov 2, 2018 at 2:22 PM Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>
> Its always OK (and actually useful) to move your branch head up to
> where Linus merged it (this is usually a fast forward anyway) since
> that doesn't add any new code to linux-next to conflict with code that
> is still pending to be merged by Linus.
>
> Also, adding bug fixes is always fine.
>
> I just want to avoid getting conflicts in linux-next between code
> that Linus will merge during this merge window and new code destined
> for the next merge window.

Thanks Stephen! I assumed as much, but I doubted due to the warning
(and I wanted to avoid giving you an unexpected surprise tomorrow).

Cheers,
Miguel
