From: Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>
Subject: Re: [-next] rename of VM_NR_PDFLUSH_THREADS breaks strace compilation
Date: Fri, 7 Dec 2018 12:54:12 +0100
Message-ID: <20181207115412.GA15336@kroah.com>
References: <20181207075807.GA9030@osiris> <20181207105312.GA11365@xps>
 <20181207110146.GD9030@osiris> <20181207111600.GB11365@xps>
Reply-To: strace development discussions <strace-devel-3+4lAyCyj6AWlMsSdNXQLw@public.gmane.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <strace-devel-bounces-3+4lAyCyj6AWlMsSdNXQLw@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20181207111600.GB11365@xps>
List-Unsubscribe: <https://lists.strace.io/mailman/options/strace-devel>,
 <mailto:strace-devel-request-3+4lAyCyj6AWlMsSdNXQLw@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.strace.io/pipermail/strace-devel/>
List-Post: <mailto:strace-devel-3+4lAyCyj6AWlMsSdNXQLw@public.gmane.org>
List-Help: <mailto:strace-devel-request-3+4lAyCyj6AWlMsSdNXQLw@public.gmane.org?subject=help>
List-Subscribe: <https://lists.strace.io/mailman/listinfo/strace-devel>,
 <mailto:strace-devel-request-3+4lAyCyj6AWlMsSdNXQLw@public.gmane.org?subject=subscribe>
Errors-To: strace-devel-bounces-3+4lAyCyj6AWlMsSdNXQLw@public.gmane.org
Sender: "Strace-devel" <strace-devel-bounces-3+4lAyCyj6AWlMsSdNXQLw@public.gmane.org>
To: Rafael Aquini <aquini-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: William Kucharski <william.kucharski-QHcLZuEGTsvQT0dZR+AlfA@public.gmane.org>, linux-next-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Heiko Carstens <heiko.carstens-tA70FqPdS9bQT0dZR+AlfA@public.gmane.org>, strace-devel-3+4lAyCyj6AWlMsSdNXQLw@public.gmane.org, "Dmitry V. Levin" <ldv-u2l5PoMzF/Vg9hUCZPvPmw@public.gmane.org>
List-Id: linux-next.vger.kernel.org

On Fri, Dec 07, 2018 at 06:16:01AM -0500, Rafael Aquini wrote:
> On Fri, Dec 07, 2018 at 12:01:46PM +0100, Heiko Carstens wrote:
> > On Fri, Dec 07, 2018 at 05:53:13AM -0500, Rafael Aquini wrote:
> > > On Fri, Dec 07, 2018 at 08:58:07AM +0100, Heiko Carstens wrote:
> > > > Hi Rafael,
> > > > 
> > > > your patch 77cab92a2cb1 ("sysctl: clean up nr_pdflush_threads
> > > > leftover") in linux-next breaks strace compilation if used with kernel
> > > > headers from linux-next.
> > > > -       VM_NR_PDFLUSH_THREADS=15, /* nr_pdflush_threads */
> > > > +       VM_UNUSED15=15,         /* was: int: nr_pdflush_threads */
> > > The nr_pdflush_threads (VM_NR_PDFLUSH_THREADS) tunable has been obsolete since 2.6.32
> > > and it was, excepting by the bit in the referred patch, completely removed on 4.15.
> > > 
> > > I think you just need to patch strace source with the following hunk, in
> > > order to reflect the removal. Would you mind checking it?
> > > 
> > > diff --git a/xlat/sysctl_vm.in b/xlat/sysctl_vm.in
> > > index 3c2b4739..30784c2a 100644
> > > --- a/xlat/sysctl_vm.in
> > > +++ b/xlat/sysctl_vm.in
> > > @@ -5,7 +5,6 @@ VM_DIRTY_BACKGROUND
> > >  VM_DIRTY_RATIO
> > >  VM_DIRTY_WB_CS
> > >  VM_DIRTY_EXPIRE_CS
> > > -VM_NR_PDFLUSH_THREADS
> > >  VM_OVERCOMMIT_RATIO
> > >  VM_PAGEBUF
> > >  VM_HUGETLB_PAGES
> > 
> > I'll leave that up to Dmitry to decide what to do here. At least it
> > won't be possible to compile old strace versions with new kernel
> > headers if the kernel change gets merged upstream.
> >
> 
> It escapes me why strace bootstrap needs to tabulate these sysctl_vm, as no one 
> of these defs are referenced in the rest of the code, let alone 
> /proc/sys/vm/nr_pdflush_threads that means nothing since per-BDI flusher threads
> were introduced almost 10 years ago.

This isn't ok, we shouldn't break userspace, I'll go revert this patch.

Rafael, feel free to resend but just add a comment that says it is
obsolete or something.

thanks,

greg k-h
-- 
Strace-devel mailing list
Strace-devel-3+4lAyCyj6AWlMsSdNXQLw@public.gmane.org
https://lists.strace.io/mailman/listinfo/strace-devel
