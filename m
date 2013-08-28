From: Sarah Sharp <sarah.a.sharp@linux.intel.com>
Subject: Re: linux-next: Tree for Aug 28 [ xhci build breakage ]
Date: Wed, 28 Aug 2013 09:59:38 -0700
Message-ID: <20130828165938.GA26483@xanatos>
References: <CA+icZUUTBYMxLPBv2fq86h3dxyANhtpd6=Q4XGMscrntPNA9bQ@mail.gmail.com>
 <CA+icZUW6JMa6VoRJ62AUZDpYm2_q_tzSM0Ryb56RNnCdEhwQyA@mail.gmail.com>
 <CA+icZUVTzMxS4f3kZnauDkrpf4vwMbS3zd7ECOhE37S_FF83UA@mail.gmail.com>
 <CA+icZUVsG-1J2oYF+AeHsxonG2ABW4d0464yijNwaq7R5k94SQ@mail.gmail.com>
 <521DD43D.7070605@samsung.com>
 <CA+icZUWQp0k8jMqY=_DYW2Ev1cEhpev=iQNnc=NbHNgHNbifTA@mail.gmail.com>
 <521DD6BD.4030700@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <521DD6BD.4030700@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Dmitry Kasatkin <d.kasatkin@samsung.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: sedat.dilek@gmail.com, Stephen Rothwell <sfr@canb.auug.org.au>, linux-next <linux-next@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, linux-usb@vger.kernel.org
List-Id: linux-next.vger.kernel.org

Please trim your replies.

On Wed, Aug 28, 2013 at 01:53:49PM +0300, Dmitry Kasatkin wrote:
> >>> That change seems to cause the problems:
> >>>
> >>> commit 0730d52a86919300a39a2be37f6c140997dfb82f
> >>> "xhci:prevent "callbacks suppressed" when debug is not enabled"
> >>>
> >>> - Sedat -
> >>>
> >>> [1] http://git.kernel.org/cgit/linux/kernel/git/gregkh/usb.git/commit/drivers/usb/host/xhci-ring.c?h=usb-next&id=0730d52a86919300a39a2be37f6c140997dfb82f
> >>>
> >> Hello,
> >>
> >> [PATCHv2 1/2] was not applied before.
> >> I pointed this out few hours ago...

So commit 0730d52a86919300a39a2be37f6c140997dfb82f 'xhci:prevent
"callbacks suppressed" when debug is not enabled' needed to be applied
after your first patch?  And basically applying that patch alone breaks
the build?

Ugh.  Sorry about this.  Greg, how do you want to handle this?

Sarah "needs a vacation" Sharp
