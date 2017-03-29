From: Greg KH <greg@kroah.com>
Subject: Re: linux-next: manual merge of the tty tree with the tty.current
 tree
Date: Wed, 29 Mar 2017 07:51:52 +0200
Message-ID: <20170329055152.GE4137@kroah.com>
References: <20170320132839.72fac965@canb.auug.org.au>
 <CACT4Y+arSk0nujZwvTNj2bYDByw+CDQjzCsWMVUGoFMFi=vr0g@mail.gmail.com>
 <CACT4Y+YvkT0dVhM3fG_cnaMA_guNAt28dvzhbgyXtowDD7oBaw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from out1-smtp.messagingengine.com ([66.111.4.25]:51574 "EHLO
        out1-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1752729AbdC2FwH (ORCPT
        <rfc822;linux-next@vger.kernel.org>);
        Wed, 29 Mar 2017 01:52:07 -0400
Content-Disposition: inline
In-Reply-To: <CACT4Y+YvkT0dVhM3fG_cnaMA_guNAt28dvzhbgyXtowDD7oBaw@mail.gmail.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Dmitry Vyukov <dvyukov@google.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, Peter Hurley <peter@hurleysoftware.com>, Michael Neuling <mikey@neuling.org>

On Mon, Mar 20, 2017 at 10:26:43AM +0100, Dmitry Vyukov wrote:
> On Mon, Mar 20, 2017 at 10:21 AM, Dmitry Vyukov <dvyukov@google.com> wrote:
> > On Mon, Mar 20, 2017 at 3:28 AM, Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> >> Hi Greg,
> >>
> >> Today's linux-next merge of the tty tree got a conflict in:
> >>
> >>   drivers/tty/tty_ldisc.c
> >>
> >> between commit:
> >>
> >>   5362544bebe8 ("tty: don't panic on OOM in tty_set_ldisc()")
> >>
> >> from the tty.current tree and commit:
> >>
> >>   71472fa9c52b ("tty: Fix ldisc crash on reopened tty")
> >>
> >> from the tty tree.
> >>
> >> I fixed it up (see below) and can carry the fix as necessary. This
> >> is now fixed as far as linux-next is concerned, but any non trivial
> >> conflicts should be mentioned to your upstream maintainer when your tree
> >> is submitted for merging.  You may also want to consider cooperating
> >> with the maintainer of the conflicting tree to minimise any particularly
> >> complex conflicts.
> >>
> >> --
> >> Cheers,
> >> Stephen Rothwell
> >>
> >> diff --cc drivers/tty/tty_ldisc.c
> >> index b0500a0a87b8,4ee7742dced3..000000000000
> >> --- a/drivers/tty/tty_ldisc.c
> >> +++ b/drivers/tty/tty_ldisc.c
> >> @@@ -621,14 -669,17 +621,15 @@@ int tty_ldisc_reinit(struct tty_struct
> >>                 tty_ldisc_put(tty->ldisc);
> >>         }
> >>
> >> -       /* switch the line discipline */
> >> -       tty->ldisc = ld;
> >>         tty_set_termios_ldisc(tty, disc);
> >> -       retval = tty_ldisc_open(tty, tty->ldisc);
> >> +       retval = tty_ldisc_open(tty, ld);
> >>         if (retval) {
> >> -               tty_ldisc_put(tty->ldisc);
> >> -               tty->ldisc = NULL;
> >>  -              if (!WARN_ON(disc == N_TTY)) {
> >>  -                      tty_ldisc_put(ld);
> >>  -                      ld = NULL;
> >>  -              }
> >> ++              tty_ldisc_put(ld);
> >> ++              ld = NULL;
> >>         }
> >> +
> >> +       /* switch the line discipline */
> >> +       smp_store_release(&tty->ldisc, ld);
> >>         return retval;
> >>   }
> >>
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
> >         struct tty_ldisc *ld = NULL;
> >
> >         if (ldsem_down_read_trylock(&tty->ldisc_sem)) {
> > -               ld = tty->ldisc;
> > +               ld = READ_ONCE(tty->ldisc);
> > +               read_barrier_depends();
> >                 if (!ld)
> >                         ldsem_up_read(&tty->ldisc_sem);
> >         }
> >
> >
> > Or simply:
> >
> > @@ -295,7 +295,8 @@ struct tty_ldisc *tty_ldisc_ref(struct tty_struct *tty)
> >         struct tty_ldisc *ld = NULL;
> >
> >         if (ldsem_down_read_trylock(&tty->ldisc_sem)) {
> > -               ld = tty->ldisc;
> > +               /* pairs with smp_store_release in tty_ldisc_reinit */
> > +               ld = smp_load_acquire(&tty->ldisc);
> >                 if (!ld)
> >                         ldsem_up_read(&tty->ldisc_sem);
> >         }
> 
> 
> 
> 
> I am also surprised that callers of tty_ldisc_reinit don't hold
> ldisc_sem. I thought that ldisc_sem is what's supposed to protect
> changes to ldisc. That would also auto fix the crash without any
> tricky barriers as flush_to_ldisc uses tty_ldisc_ref.

Ok, I'm reverting this patch.  Michael and Peter, please rework it and
resubmit.

thanks,

greg k-h
