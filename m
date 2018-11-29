From: Paul Moore <paul@paul-moore.com>
Subject: Re: linux-next: manual merge of the selinux tree with the vfs tree
Date: Thu, 29 Nov 2018 17:23:24 -0500
Message-ID: <CAHC9VhRthWKfgYenGq6Az+jVQ+76wCeBhBcMyo9zZwv+nBhy3A@mail.gmail.com>
References: <20181127115246.00967523@canb.auug.org.au> <CAFqZXNs6XTOx2-EQ5P9bK3vPsPby7rzryHPqzqsVD9XsbsG20w@mail.gmail.com>
 <20181127225013.133adc7d@canb.auug.org.au> <CAHC9VhSFSxBc+-O=GQMkiyiQz3S+_ZreicLhsoAuvR-oq2mi6g@mail.gmail.com>
 <CAFqZXNuZCof=7CtyMq8JDyAgRmONYRZhhqr6bFVy9-F70-Uwrw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAFqZXNuZCof=7CtyMq8JDyAgRmONYRZhhqr6bFVy9-F70-Uwrw@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: omosnace@redhat.com
Cc: sfr@canb.auug.org.au, viro@zeniv.linux.org.uk, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, dhowells@redhat.com, selinux@vger.kernel.org, linux-fsdevel@vger.kernel.org
List-Id: linux-next.vger.kernel.org

On Thu, Nov 29, 2018 at 5:07 AM Ondrej Mosnacek <omosnace@redhat.com> wrote:
>
> On Wed, Nov 28, 2018 at 10:52 PM Paul Moore <paul@paul-moore.com> wrote:
> > On Tue, Nov 27, 2018 at 6:50 AM Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> > > Hi Ondrej,
> > >
> > > On Tue, 27 Nov 2018 09:53:32 +0100 Ondrej Mosnacek <omosnace@redhat.com> wrote:
> > > >
> > > > Hm... seems that there was some massive overhaul in the VFS code right
> > > > at the wrong moment... There are new hooks for mounting now and the
> > >
> > > The mount changes have been in linux-next since before the last
> > > release ...
> > >
> > > > code that our commit changes is now here:
> > > >
> > > > https://git.kernel.org/pub/scm/linux/kernel/git/viro/vfs.git/tree/security/selinux/hooks.c?h=for-next#n3131
> > > >
> > > > It seems that the logic is still the same, just now our patch (or the
> > > > VFS one) needs to be updated to change the above line as such
> > > > (untested pseudo-patch):
> > > >
> > > > - if (fc->purpose == FS_CONTEXT_FOR_KERNEL_MOUNT)
> > > > + if (fc->purpose == (FS_CONTEXT_FOR_KERNEL_MOUNT|FS_CONTEXT_FOR_SUBMOUNT))
> > >
> > > OK, so from tomorrow I will use that merge resolution.  Someone needs
> > > to remember to tell Linus about this when the latter of the vfs and
> > > selinux trees reach him.
> >
> > I will, or at least I'll do my best to remember; since we only have a
> > few more week until the merge window I like my odds.  FWIW, I
> > typically do a test merge on top of Linus' tree before sending the
> > SELinux PR just to verify that everything is relatively clean and
> > there are no surprises.
> >
> > Ondrej, please work with David Howells to ensure that submounts are
> > handled correctly in his mount rework.
>
> OK, I will verify that the SELinux submount fix rebased on top of
> vfs/work.mount in the way I suggested above passes the same testing
> (seliinux-testsuite + NFS crossmnt reproducer). I am now building two
> kernels (vfs/work.mount with and without the fix) to test. Let me know
> if there is anything more to do.

Thanks.

The big thing is just making sure that we don't regress on the fix in
selinux/next if/when David's mount rework hits Linus' tree.

-- 
paul moore
www.paul-moore.com
