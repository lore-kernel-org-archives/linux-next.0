From: Kees Cook <keescook@chromium.org>
Subject: Re: linux-next: build failure after merge of the akpm-current tree
Date: Wed, 17 Apr 2019 17:22:38 -0500
Message-ID: <CAGXu5jKYxLe9-umda7C3iWfYFe-Thv=dL4bJQC9nU4GMGK5Wwg@mail.gmail.com>
References: <20190417165321.61cd6380@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190417165321.61cd6380@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Andrew Morton <akpm@linux-foundation.org>, Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Kees Cook <keescook@chromium.org>, Alexey Dobriyan <adobriyan@gmail.com>
List-Id: linux-next.vger.kernel.org

On Wed, Apr 17, 2019 at 1:53 AM Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>
> Hi Andrew,
>
> After merging the akpm-current tree, today's linux-next build (arm
> multi_v7_defconfig) failed like this:
>
> fs/binfmt_elf.c: In function 'load_elf_binary':
> fs/binfmt_elf.c:1140:7: error: 'elf_interpreter' undeclared (first use in this function); did you mean 'interpreter'?
>   if (!elf_interpreter)
>        ^~~~~~~~~~~~~~~
>        interpreter

static int load_elf_binary(struct linux_binprm *bprm)
{
...
        char * elf_interpreter = NULL;

This is _absolutely_ a valid variable.

>
>
> Caused by commit
>
>   3ebf0dd657ce ("fs/binfmt_elf.c: move brk out of mmap when doing direct loader exec")
>
> interacting with commit
>
>   a34f642bccf1 ("fs/binfmt_elf.c: free PT_INTERP filename ASAP")
>
> I have applied the following patch for today.
>
> From: Stephen Rothwell <sfr@canb.auug.org.au>
> Date: Wed, 17 Apr 2019 16:48:29 +1000
> Subject: [PATCH] fix "fs/binfmt_elf.c: move brk out of mmap when doing direct loader exec"
>
> Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
> ---
>  fs/binfmt_elf.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/fs/binfmt_elf.c b/fs/binfmt_elf.c
> index b3bbe6bca499..fe5668a1bbaa 100644
> --- a/fs/binfmt_elf.c
> +++ b/fs/binfmt_elf.c
> @@ -1137,7 +1137,7 @@ static int load_elf_binary(struct linux_binprm *bprm)
>          * collide early with the stack growing down), and into the unused
>          * ELF_ET_DYN_BASE region.
>          */
> -       if (!elf_interpreter)
> +       if (!interpreter)

No, this is very wrong and will, I think, cause all PIE binaries to fail to run.

>                 current->mm->brk = current->mm->start_brk = ELF_ET_DYN_BASE;
>
>         if ((current->flags & PF_RANDOMIZE) && (randomize_va_space > 1)) {
> --
> 2.20.1
>
> --
> Cheers,
> Stephen Rothwell



-- 
Kees Cook
