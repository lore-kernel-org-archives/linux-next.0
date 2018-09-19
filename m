From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: linux-next: build failure after merge of the vfs tree
Date: Wed, 19 Sep 2018 09:17:03 +0200
Message-ID: <CAMuHMdUyazZR1MhUm6ekFHJ3HPtVEBhejsyAvNVEtfuGVvDrNA@mail.gmail.com>
References: <20180919073826.02370812@canb.auug.org.au> <20180910133525.28c5dd20@canb.auug.org.au>
 <15925.1537309041@warthog.procyon.org.uk> <20180919094847.2103082b@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180919094847.2103082b@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: David Howells <dhowells@redhat.com>, Al Viro <viro@zeniv.linux.org.uk>, Linux-Next <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

On Wed, Sep 19, 2018 at 1:50 AM Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> On Tue, 18 Sep 2018 23:17:21 +0100 David Howells <dhowells@redhat.com> wrote:
> > Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> > > > After merging the vfs tree, today's linux-next build (powerpc
> > > > allyesconfig) failed like this:
> > > >
> > > > samples/vfs/test-fsinfo.c: In function 'fsinfo':
> > > > samples/vfs/test-fsinfo.c:37:17: error: '__NR_fsinfo' undeclared (first use in this function); did you mean 'fsinfo'?
> >
> > I think the problem is that I haven't allocated system call numbers for any
> > arches other than x86 - even the x86 syscall numbers are provisional until the
> > patchset is taken upstream.  I'm not sure of the best way to deal with this -
> > make the samples dependent on the X86 arch?
>
> But the sample programs are built with HOSTCC, so you can't depend on
> ARCH (since I, for one, am cross compiling).  Maybe SUBARCH.  Better
> would be to use either Kconfig's shell primitive or some make magic to
> figure out if the syscall number define's are defined.
>
> > > > samples/vfs/test-fsinfo.c:180:30: warning: format '%llx' expects argument of type 'long long unsigned int', but argument 2 has type '__u64' {aka 'long unsigned int'} [-Wformat=]
> > > >   printf("\tmax file size: %llx\n", f->max_file_size);
> >
> > Sigh.  On powerpc __u64 is unsigned long, but on x86_64 it's unsigned long
> > long.  Is it possible to shift all arches to use unsigned long long for __u64?
>
> I doubt it - that would probably cause more warnings in the arch code.

In kernelspace, it's unsigned long long on all architectures.
In userspace, it may still be unsigned long on early 64-bit architectures.

> Instead, just explicitly cast it to unsigned long long.

Or use C99's PRIx64?

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
