From: Paul Moore <paul@paul-moore.com>
Subject: Re: linux-next: manual merge of the selinux tree with the vfs tree
Date: Wed, 28 Nov 2018 16:52:35 -0500
Message-ID: <CAHC9VhSFSxBc+-O=GQMkiyiQz3S+_ZreicLhsoAuvR-oq2mi6g@mail.gmail.com>
References: <20181127115246.00967523@canb.auug.org.au> <CAFqZXNs6XTOx2-EQ5P9bK3vPsPby7rzryHPqzqsVD9XsbsG20w@mail.gmail.com>
 <20181127225013.133adc7d@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181127225013.133adc7d@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: sfr@canb.auug.org.au, omosnace@redhat.com
Cc: viro@zeniv.linux.org.uk, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, dhowells@redhat.com, selinux@vger.kernel.org, linux-fsdevel@vger.kernel.org
List-Id: linux-next.vger.kernel.org

On Tue, Nov 27, 2018 at 6:50 AM Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> Hi Ondrej,
>
> On Tue, 27 Nov 2018 09:53:32 +0100 Ondrej Mosnacek <omosnace@redhat.com> wrote:
> >
> > Hm... seems that there was some massive overhaul in the VFS code right
> > at the wrong moment... There are new hooks for mounting now and the
>
> The mount changes have been in linux-next since before the last
> release ...
>
> > code that our commit changes is now here:
> >
> > https://git.kernel.org/pub/scm/linux/kernel/git/viro/vfs.git/tree/security/selinux/hooks.c?h=for-next#n3131
> >
> > It seems that the logic is still the same, just now our patch (or the
> > VFS one) needs to be updated to change the above line as such
> > (untested pseudo-patch):
> >
> > - if (fc->purpose == FS_CONTEXT_FOR_KERNEL_MOUNT)
> > + if (fc->purpose == (FS_CONTEXT_FOR_KERNEL_MOUNT|FS_CONTEXT_FOR_SUBMOUNT))
>
> OK, so from tomorrow I will use that merge resolution.  Someone needs
> to remember to tell Linus about this when the latter of the vfs and
> selinux trees reach him.

I will, or at least I'll do my best to remember; since we only have a
few more week until the merge window I like my odds.  FWIW, I
typically do a test merge on top of Linus' tree before sending the
SELinux PR just to verify that everything is relatively clean and
there are no surprises.

Ondrej, please work with David Howells to ensure that submounts are
handled correctly in his mount rework.

-- 
paul moore
www.paul-moore.com
