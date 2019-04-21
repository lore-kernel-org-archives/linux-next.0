From: Alexey Dobriyan <adobriyan@gmail.com>
Subject: Re: linux-next: build failure after merge of the akpm-current tree
Date: Sun, 21 Apr 2019 19:56:11 +0300
Message-ID: <20190421165611.GB26843@avx2>
References: <20190417165321.61cd6380@canb.auug.org.au>
 <CAGXu5jKYxLe9-umda7C3iWfYFe-Thv=dL4bJQC9nU4GMGK5Wwg@mail.gmail.com>
 <CAGXu5j+9_f=5aT7x=K=Hg9LS3eQ9-dhVF18LCBfZcx+EmTO3PA@mail.gmail.com>
 <20190418090247.2982dafd@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190418090247.2982dafd@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Kees Cook <keescook@chromium.org>, Andrew Morton <akpm@linux-foundation.org>, Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

On Thu, Apr 18, 2019 at 09:02:47AM +1000, Stephen Rothwell wrote:
> Hi Kees,
> 
> On Wed, 17 Apr 2019 17:28:39 -0500 Kees Cook <keescook@chromium.org> wrote:
> >
> > On Wed, Apr 17, 2019 at 5:22 PM Kees Cook <keescook@chromium.org> wrote:
> > >
> > > On Wed, Apr 17, 2019 at 1:53 AM Stephen Rothwell <sfr@canb.auug.org.au> wrote:  
> > > >
> > > > Hi Andrew,
> > > >
> > > > After merging the akpm-current tree, today's linux-next build (arm
> > > > multi_v7_defconfig) failed like this:
> > > >
> > > > fs/binfmt_elf.c: In function 'load_elf_binary':
> > > > fs/binfmt_elf.c:1140:7: error: 'elf_interpreter' undeclared (first use in this function); did you mean 'interpreter'?
> > > >   if (!elf_interpreter)
> > > >        ^~~~~~~~~~~~~~~
> > > >        interpreter  
> > >
> > > static int load_elf_binary(struct linux_binprm *bprm)
> > > {
> > > ...
> > >         char * elf_interpreter = NULL;
> > >
> > > This is _absolutely_ a valid variable.  
> 
> It was. However commit a34f642bccf1 from Andrew's tree changes its scope.
> 
> So there is nothing wrong with commit 3ebf0dd657ce, it is the incorrect
> rebase of it on top of a34f642bccf1 that causes the build problem.
> 
> > > > Caused by commit
> > > >
> > > >   3ebf0dd657ce ("fs/binfmt_elf.c: move brk out of mmap when doing direct loader exec")
> > > >
> > > > interacting with commit
> > > >
> > > >   a34f642bccf1 ("fs/binfmt_elf.c: free PT_INTERP filename ASAP")
> > > >
> > > > I have applied the following patch for today.
> > > >
> > > > From: Stephen Rothwell <sfr@canb.auug.org.au>
> > > > Date: Wed, 17 Apr 2019 16:48:29 +1000
> > > > Subject: [PATCH] fix "fs/binfmt_elf.c: move brk out of mmap when doing direct loader exec"
> > > >
> > > > Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
> > > > ---
> > > >  fs/binfmt_elf.c | 2 +-
> > > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > > >
> > > > diff --git a/fs/binfmt_elf.c b/fs/binfmt_elf.c
> > > > index b3bbe6bca499..fe5668a1bbaa 100644
> > > > --- a/fs/binfmt_elf.c
> > > > +++ b/fs/binfmt_elf.c
> > > > @@ -1137,7 +1137,7 @@ static int load_elf_binary(struct linux_binprm *bprm)
> > > >          * collide early with the stack growing down), and into the unused
> > > >          * ELF_ET_DYN_BASE region.
> > > >          */
> > > > -       if (!elf_interpreter)
> > > > +       if (!interpreter)  
> > >
> > > No, this is very wrong and will, I think, cause all PIE binaries to fail to run.  
> > 
> > I may be wrong: I think this will cause all static binaries to see
> > their brk moved very unexpectedly. All static PIE binaries will fail?
> 
> Are you sure that elf_interpreter == NULL is not equivalent to
> interpreter == NULL by this point in the code?  Earlier if
> elf_intpreter is not NULL, we have set interpreter (using open_exec)
> and errored out if that fails.

My patch was done based on this very observation: if interpreter has been
opened then its filename has been allocated before otherwise how do you
know which interpreter to open? Just like with pathname resolution, once
lookup is done and inode has been fished out, pathname becomes irrelevant.
