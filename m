From: Lee Jones <lee.jones@linaro.org>
Subject: Re: linux-next: build failure after merge of the mailbox tree
Date: Wed, 4 Nov 2015 08:16:10 +0000
Message-ID: <20151104081610.GG3503@x1>
References: <20151101231253.64beff47@canb.auug.org.au>
 <CAJe_Zhe3iL=H9E1uVTLv959eVYDxzZMre8D6m8iOJbzDsFg0Nw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CAJe_Zhe3iL=H9E1uVTLv959eVYDxzZMre8D6m8iOJbzDsFg0Nw@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Jassi Brar <jaswinder.singh@linaro.org>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, lkml <linux-kernel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

On Wed, 04 Nov 2015, Jassi Brar wrote:

> On 1 November 2015 at 17:42, Stephen Rothwell <sfr@canb.auug.org.au> =
wrote:
> > Hi Jassi,
> >
> > After merging the mailbox tree, today's linux-next build (x86_64
> > allmodconfig) failed like this:
> >
> > drivers/mailbox/mailbox-test.c: In function 'mbox_test_receive_mess=
age':
> > drivers/mailbox/mailbox-test.c:226:11: error: implicit declaration =
of function '__io_virt' [-Werror=3Dimplicit-function-declaration]
> >            __io_virt(tdev->mmio), MBOX_MAX_MSG_LEN, true);
> >            ^
> >
> > Caused by commit
> >
> >   a133f8b65d59 ("mailbox: mailbox-test: Correctly repair Sparse war=
nings")
> >
> > I have used the mailbox tree from next-20151022 for today.
> >
> Lee, would you please send a fix for your last fix please?

I was about to take a look at this, but it looks like you fixed it alre=
ady.

--=20
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org =E2=94=82 Open source software for ARM SoCs
=46ollow Linaro: Facebook | Twitter | Blog
