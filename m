From: Kees Cook <keescook@chromium.org>
Subject: Re: linux-next: build failure after merge of the akpm-current tree
Date: Wed, 17 Apr 2019 17:46:35 -0500
Message-ID: <CAGXu5jJfDnSJ328iQORWFRQUB=AEP-jdBG+_ppWo5m_MJasRNw@mail.gmail.com>
References: <20190417165321.61cd6380@canb.auug.org.au> <CAGXu5jKYxLe9-umda7C3iWfYFe-Thv=dL4bJQC9nU4GMGK5Wwg@mail.gmail.com>
 <CAGXu5j+9_f=5aT7x=K=Hg9LS3eQ9-dhVF18LCBfZcx+EmTO3PA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAGXu5j+9_f=5aT7x=K=Hg9LS3eQ9-dhVF18LCBfZcx+EmTO3PA@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Andrew Morton <akpm@linux-foundation.org>, Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Kees Cook <keescook@chromium.org>, Alexey Dobriyan <adobriyan@gmail.com>
List-Id: linux-next.vger.kernel.org

On Wed, Apr 17, 2019 at 5:28 PM Kees Cook <keescook@chromium.org> wrote:
>
> On Wed, Apr 17, 2019 at 5:22 PM Kees Cook <keescook@chromium.org> wrote:
> >
> > On Wed, Apr 17, 2019 at 1:53 AM Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> > > [...]
> > > Caused by commit
> > >
> > >   3ebf0dd657ce ("fs/binfmt_elf.c: move brk out of mmap when doing direct loader exec")
> > >
> > > interacting with commit
> > >
> > >   a34f642bccf1 ("fs/binfmt_elf.c: free PT_INTERP filename ASAP")

I should read more closely! I see now this is the patch where
elf_interpreter got moved. :)

And, yes, your fix is correct. *sigh* I will go find a brown paper bag now...

-- 
Kees Cook
