From: Dmitry Kasatkin <d.kasatkin@samsung.com>
Subject: Re: linux-next: Tree for Aug 28 [ xhci build breakage ]
Date: Wed, 28 Aug 2013 20:24:41 +0300
Message-ID: <521E3259.6040201@samsung.com>
References: <CA+icZUUTBYMxLPBv2fq86h3dxyANhtpd6=Q4XGMscrntPNA9bQ@mail.gmail.com>
 <CA+icZUW6JMa6VoRJ62AUZDpYm2_q_tzSM0Ryb56RNnCdEhwQyA@mail.gmail.com>
 <CA+icZUVTzMxS4f3kZnauDkrpf4vwMbS3zd7ECOhE37S_FF83UA@mail.gmail.com>
 <CA+icZUVsG-1J2oYF+AeHsxonG2ABW4d0464yijNwaq7R5k94SQ@mail.gmail.com>
 <521DD43D.7070605@samsung.com>
 <CA+icZUWQp0k8jMqY=_DYW2Ev1cEhpev=iQNnc=NbHNgHNbifTA@mail.gmail.com>
 <521DD6BD.4030700@samsung.com> <20130828165938.GA26483@xanatos>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mailout3.w1.samsung.com ([210.118.77.13]:17377 "EHLO
	mailout3.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753566Ab3H1RYr (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 28 Aug 2013 13:24:47 -0400
In-reply-to: <20130828165938.GA26483@xanatos>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Sarah Sharp <sarah.a.sharp@linux.intel.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, sedat.dilek@gmail.com, Stephen Rothwell <sfr@canb.auug.org.au>, linux-next <linux-next@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, linux-usb@vger.kernel.org

On 28/08/13 19:59, Sarah Sharp wrote:
> Please trim your replies.
>
> On Wed, Aug 28, 2013 at 01:53:49PM +0300, Dmitry Kasatkin wrote:
>>>>> That change seems to cause the problems:
>>>>>
>>>>> commit 0730d52a86919300a39a2be37f6c140997dfb82f
>>>>> "xhci:prevent "callbacks suppressed" when debug is not enabled"
>>>>>
>>>>> - Sedat -
>>>>>
>>>>> [1] http://git.kernel.org/cgit/linux/kernel/git/gregkh/usb.git/commit/drivers/usb/host/xhci-ring.c?h=usb-next&id=0730d52a86919300a39a2be37f6c140997dfb82f
>>>>>
>>>> Hello,
>>>>
>>>> [PATCHv2 1/2] was not applied before.
>>>> I pointed this out few hours ago...
> So commit 0730d52a86919300a39a2be37f6c140997dfb82f 'xhci:prevent
> "callbacks suppressed" when debug is not enabled' needed to be applied
> after your first patch?  And basically applying that patch alone breaks
> the build?

Right...
May be I had to stress it somehow... sorry.

> Ugh.  Sorry about this.  Greg, how do you want to handle this?
>
> Sarah "needs a vacation" Sharp
>
