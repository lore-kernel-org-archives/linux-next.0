From: Greg KH <greg@kroah.com>
Subject: Re: Next March 19: drivers/comedi build break.
Date: Thu, 19 Mar 2009 08:33:27 -0700
Message-ID: <20090319153327.GB13963@kroah.com>
References: <20090319221024.5e2ad6e5.sfr@canb.auug.org.au> <49C2468A.1040504@in.ibm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner+glk-linux-kernel-3=40m.gmane.org-S1756681AbZCSPds@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <49C2468A.1040504@in.ibm.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Sachin Sant <sachinp@in.ibm.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

On Thu, Mar 19, 2009 at 06:50:10PM +0530, Sachin Sant wrote:
> Next 19 randconfig build fails with :
>
>  CC [M]  drivers/staging/comedi/comedi_fops.o
> In file included from drivers/staging/comedi/comedidev.h:38,
>                 from drivers/staging/comedi/comedi_fops.c:45:
> drivers/staging/comedi/interrupt.h:25: error: conflicting types for=20
> =E2=80=98irqreturn_t=E2=80=99
> include/linux/irqreturn.h:14: error: previous declaration of=20
> =E2=80=98irqreturn_t=E2=80=99 was here
> In file included from drivers/staging/comedi/comedidev.h:38,
>                 from drivers/staging/comedi/comedi_fops.c:45:
> drivers/staging/comedi/interrupt.h:28:1: warning: "IRQ_RETVAL" redefi=
ned
> In file included from include/linux/interrupt.h:10,
>                 from drivers/staging/comedi/interrupt.h:22,
>                 from drivers/staging/comedi/comedidev.h:38,
>                 from drivers/staging/comedi/comedi_fops.c:45:
> include/linux/irqreturn.h:15:1: warning: this is the location of the=20
> previous definition
> make[3]: *** [drivers/staging/comedi/comedi_fops.o] Error 1
>
> Probably because of the irqreturn_t related changes.

Ah, I wasn't aware of them, I'll go dig and fix this up...

thanks,

greg k-h
