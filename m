From: Randy Dunlap <rdunlap@infradead.org>
Subject: Re: [OpenRISC] Add openrisc for-next branch to linux-next
Date: Wed, 30 Nov 2016 14:05:45 -0800
Message-ID: <2079b13e-080c-7797-b003-f1d1336dfb58@infradead.org>
References: <alpine.LFD.2.20.1611302214520.29569@lianli.shorne-pla.net>
 <f7f0e124-00b9-5b21-9ca0-1f17e7c338bd@infradead.org>
 <CAKaYPCMpZF6tQwQrtkVMZ1+F=vSUWxAx+skyMeU6FPPA_LGgVg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from merlin.infradead.org ([205.233.59.134]:46228 "EHLO
        merlin.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751086AbcK3WFt (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 30 Nov 2016 17:05:49 -0500
In-Reply-To: <CAKaYPCMpZF6tQwQrtkVMZ1+F=vSUWxAx+skyMeU6FPPA_LGgVg@mail.gmail.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Olof Kindgren <olof.kindgren@gmail.com>
Cc: Stafford Horne <shorne@gmail.com>, sfr@canb.auug.org.au, linux-next@vger.kernel.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, openrisc@lists.librecores.org

On 11/30/16 12:11, Olof Kindgren wrote:
> 
>     Hi,
> 
>     I see that you have updated MAINTAINERS.  Good.
> 
>     Does openRISC support VGA console?
>     I tried to send a patch to Jason a few days ago.
>     Please look at http://marc.info/?l=linux-kernel&m=147968525011508&w=2 <http://marc.info/?l=linux-kernel&m=147968525011508&w=2>
>     (or I can resend it if you wish).
> 
>     The kbuild test bot has been reporting this build error for several
>     months.  If my fix is wrong, please submit something else.
> 
>     Thanks.
>     --
>     ~Randy
>     _______________________________________________
>     OpenRISC mailing list
>     OpenRISC@lists.librecores.org <mailto:OpenRISC@lists.librecores.org>
>     https://lists.librecores.org/listinfo/openrisc <https://lists.librecores.org/listinfo/openrisc>
> 
> 
> Hi Randy,
> 
> This is a known issue. This patch (https://github.com/openrisc/linux/pull/5) should take care of it. Can't say if it's the correct solution though, but it works both with and without a VGA console
> 
> //Olof

Thanks.


-- 
~Randy
