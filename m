From: Michael Neuling <mikey@neuling.org>
Subject: Re: linux-next: manual merge of the tty tree with the tty.current
 tree
Date: Thu, 30 Mar 2017 14:46:06 +1100
Message-ID: <1490845566.27519.30.camel@neuling.org>
References: <20170320132839.72fac965@canb.auug.org.au>
         <CACT4Y+arSk0nujZwvTNj2bYDByw+CDQjzCsWMVUGoFMFi=vr0g@mail.gmail.com>
         <CACT4Y+YvkT0dVhM3fG_cnaMA_guNAt28dvzhbgyXtowDD7oBaw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:50821 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1752742AbdC3DqK (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Wed, 29 Mar 2017 23:46:10 -0400
In-Reply-To: <CACT4Y+YvkT0dVhM3fG_cnaMA_guNAt28dvzhbgyXtowDD7oBaw@mail.gmail.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Dmitry Vyukov <dvyukov@google.com>
Cc: Greg KH <greg@kroah.com>, linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, Peter Hurley <peter@hurleysoftware.com>, Stephen Rothwell <sfr@canb.auug.org.au>

On Mon, 2017-03-20 at 10:26 +0100, Dmitry Vyukov wrote:
> On Mon, Mar 20, 2017 at 10:21 AM, Dmitry Vyukov <dvyukov@google.com> wrote:
> > On Mon, Mar 20, 2017 at 3:28 AM, Stephen Rothwell <sfr@canb.auug.org.au>
> > wrote:
> > > Hi Greg,
> > > 
> > > Today's linux-next merge of the tty tree got a conflict in:
> > > 
> > >   drivers/tty/tty_ldisc.c
> > > 
> > > between commit:
> > > 
> > >   5362544bebe8 ("tty: don't panic on OOM in tty_set_ldisc()")
> > > 
> > > from the tty.current tree and commit:
> > > 
> > >   71472fa9c52b ("tty: Fix ldisc crash on reopened tty")
> > > 
> > > from the tty tree.
> > > 
> > > I fixed it up (see below) and can carry the fix as necessary. This
> > > is now fixed as far as linux-next is concerned, but any non trivial
> > > conflicts should be mentioned to your upstream maintainer when your tree
> > > is submitted for merging.  You may also want to consider cooperating
> > > with the maintainer of the conflicting tree to minimise any particularly
> > > complex conflicts.
> > > 
> > > --
> > > Cheers,
> > > Stephen Rothwell
> > > 
> > > diff --cc drivers/tty/tty_ldisc.c
> > > index b0500a0a87b8,4ee7742dced3..000000000000
> > > --- a/drivers/tty/tty_ldisc.c
> > > +++ b/drivers/tty/tty_ldisc.c
> > > @@@ -621,14 -669,17 +621,15 @@@ int tty_ldisc_reinit(struct tty_struct
> > >                 tty_ldisc_put(tty->ldisc);
> > >         }
> > > 
> > > -       /* switch the line discipline */
> > > -       tty->ldisc = ld;
> > >         tty_set_termios_ldisc(tty, disc);
> > > -       retval = tty_ldisc_open(tty, tty->ldisc);
> > > +       retval = tty_ldisc_open(tty, ld);
> > >         if (retval) {
> > > -               tty_ldisc_put(tty->ldisc);
> > > -               tty->ldisc = NULL;
> > >  -              if (!WARN_ON(disc == N_TTY)) {
> > >  -                      tty_ldisc_put(ld);
> > >  -                      ld = NULL;
> > >  -              }
> > > ++              tty_ldisc_put(ld);
> > > ++              ld = NULL;
> > >         }
> > > +
> > > +       /* switch the line discipline */
> > > +       smp_store_release(&tty->ldisc, ld);
> > >         return retval;
> > >   }
> > > 
> > 
> > 
> > Peter,
> > 
> > Looking at your patch "tty: Fix ldisc crash on reopened tty", I think
> > there is a missed barrier in tty_ldisc_ref. A single barrier does not
> > have any effect, they always need to be in pairs. So I think we also
> > need at least:
> > 
> > @@ -295,7 +295,8 @@ struct tty_ldisc *tty_ldisc_ref(struct tty_struct *tty)
> >         struct tty_ldisc *ld = NULL;
> > 
> >         if (ldsem_down_read_trylock(&tty->ldisc_sem)) {
> > -               ld = tty->ldisc;
> > +               ld = READ_ONCE(tty->ldisc);
> > +               read_barrier_depends();
> >                 if (!ld)
> >                         ldsem_up_read(&tty->ldisc_sem);
> >         }
> > 
> > 
> > Or simply:
> > 
> > @@ -295,7 +295,8 @@ struct tty_ldisc *tty_ldisc_ref(struct tty_struct *tty)
> >         struct tty_ldisc *ld = NULL;
> > 
> >         if (ldsem_down_read_trylock(&tty->ldisc_sem)) {
> > -               ld = tty->ldisc;
> > +               /* pairs with smp_store_release in tty_ldisc_reinit */
> > +               ld = smp_load_acquire(&tty->ldisc);
> >                 if (!ld)
> >                         ldsem_up_read(&tty->ldisc_sem);
> >         }
> 
> 
> 
> 
> I am also surprised that callers of tty_ldisc_reinit don't hold
> ldisc_sem. I thought that ldisc_sem is what's supposed to protect
> changes to ldisc. That would also auto fix the crash without any
> tricky barriers as flush_to_ldisc uses tty_ldisc_ref.

Dmitry,

Thanks for the help.  Peter doesn't seem to be responding to email any more.

I'm not familiar with the tty layer, but the issue that patch was suppose to fix
had a similar signature to the below oops we are seeing on powerpc on boot.
(sorry I don't have a repro on mainline or linux-next). Hence why I pushed on
it.

In the below crash the call to tty_ldisc_reinit is coming from a workqueue, so
requiring the callers to hold the ldisc_sem is more tricky.

Could we just hold the ldisc_sem inside tty_ldisc_reinit()?

Regards,
Mikey

[ 9.021567] Unable to handle kernel paging request for data at address 0x00002260
[ 9.022501] Faulting instruction address: 0xc0000000006c7770
[ 9.023105] Oops: Kernel access of bad area, sig: 11 [#1]
[ 9.023674] SMP NR_CPUS=2048
[ 9.023676] NUMA
[ 9.023970] PowerNV
[ 9.024372] Modules linked in: ofpart cmdlinepart ipmi_powernv powernv_flash ipmi_devintf mtd ipmi_msghandler ibmpowernv opal_prd uio_pdrv_genirq uio vmx_crypto ip_tables x_tables autofs4 ast i2c_algo_bit ttm drm_kms_helper syscopyarea sysfillrect sysimgblt crc32c_vpmsum fb_sys_fops drm ahci libahci tg3
[ 9.027146] CPU: 15 PID: 354 Comm: kworker/u64:2 Not tainted 4.10.0-8-generic #10-Ubuntu
[ 9.027978] Workqueue: events_unbound flush_to_ldisc
[ 9.028468] task: c0000016a7758c00 task.stack: c0000000fd084000
[ 9.029055] NIP: c0000000006c7770 LR: c0000000006c7758 CTR: c0000000006c84b0
[ 9.029767] REGS: c0000000fd0878c0 TRAP: 0300 Not tainted (4.10.0-8-generic)
[ 9.030520] MSR: 900000000280b033 <SF,HV,VEC,VSX,EE,FP,ME,IR,DR,RI,LE>
[ 9.030537] CR: 28002888 XER: 00000000
[ 9.031579] CFAR: c000000000b3e20c DAR: 0000000000002260 DSISR: 40000000 SOFTE: 1
[ 9.031579] GPR04: c000000002ac8c20 c000000002ac8d20 0000000000000100 0000000000000001
[ 9.031579] GPR12: 0000000028002888 c00000000fb88700 c0000000000f6668 c0000016b4b7e3c0
[ 9.031579] GPR20: 0000000000000000 0000000000000000 c000000001335ce9 0000000100000000
[ 9.031579] GPR28: c000000002ac8d20 0000000000000100 c0000016a8dca608 c0000016ae0ebc00
[ 9.031579] GPR00: c0000000006c7758 c0000000fd087b40 c00000000143c900 0000000000000000
[ 9.031579] GPR08: c0000016ae0ebcc0 0000000000000001 c00000000139a5a0 c0000016a7758ca8
[ 9.031579] GPR16: c0000016c90322d8 c0000016c9032090 c0000016c9032020 0000000000000001
[ 9.031579] GPR24: 0000000000000000 0000000000000000 c000000002ac8c20 c0000016b4f932a0
[ 9.038511] NIP [c0000000006c7770] n_tty_receive_buf_common+0xb0/0xdf0
[ 9.039139] LR [c0000000006c7758] n_tty_receive_buf_common+0x98/0xdf0
[ 9.039766] Call Trace:
[ 9.040009] [c0000000fd087b40] [c0000000006c7758] n_tty_receive_buf_common+0x98/0xdf0 (unreliable)
[ 9.040868] [c0000000fd087c10] [c0000000006cc524] tty_ldisc_receive_buf+0x44/0xe0
[ 9.041595] [c0000000fd087c40] [c0000000006ccd9c] flush_to_ldisc+0x13c/0x160
[ 9.042265] [c0000000fd087c90] [c0000000000ed8c0] process_one_work+0x2b0/0x5a0
[ 9.042955] [c0000000fd087d20] [c0000000000edc58] worker_thread+0xa8/0x650
[ 9.043625] [c0000000fd087dc0] [c0000000000f67b4] kthread+0x154/0x1a0
[ 9.044245] [c0000000fd087e30] [c00000000000b4e8] ret_from_kernel_thread+0x5c/0x74
[ 9.044964] Instruction dump:
[ 9.045281] eb3f0260 7c9a2378 7cbc2b78 7cdd3378 f8e10030 48476a55 60000000 3b000000
[ 9.046128] 7af783e4 60000000 60000000 60420000 7c2004ac e8d90000 80ff0110
[ 9.047044] ---[ end trace 6b3bf4b72485f95c ]---
[ 9.047485]
