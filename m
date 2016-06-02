From: Kees Cook <keescook@chromium.org>
Subject: Re: linux-next: build failure after merge of the pstore tree
Date: Wed, 1 Jun 2016 19:15:11 -0700
Message-ID: <CAGXu5jKqoL_wdgr2d7+e1ey+ThF6tkxXnyEx7QCBNun4zT5ZqQ@mail.gmail.com>
References: <20160602102556.722ad0cf@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20160602102556.722ad0cf@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Linux-Next <linux-next@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, Geliang Tang <geliangtang@163.com>
List-Id: linux-next.vger.kernel.org

Thanks for the patch! Should I add this to my tree?

-Kees

On Wed, Jun 1, 2016 at 5:25 PM, Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> Hi Kees,
>
> After merging the pstore tree, today's linux-next build (x86_64
> allmodconfig) failed like this:
>
> drivers/acpi/apei/erst.c:943:11: error: initialization from incompatible pointer type [-Werror=incompatible-pointer-types]
>   .read  = erst_reader,
>            ^
>
> Caused by commit
>
>   d8aaf3511a13 ("pstore: add lzo/lz4 compression support")
>
> I added this patch for today:
>
> From: Stephen Rothwell <sfr@canb.auug.org.au>
> Date: Thu, 2 Jun 2016 10:20:27 +1000
> Subject: [PATCH] pstore: update acpi/apei/erst.c for struct pstore_info change
>
> Fixes: d8aaf3511a13 ("pstore: add lzo/lz4 compression support")
> Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
> ---
>  drivers/acpi/apei/erst.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/acpi/apei/erst.c b/drivers/acpi/apei/erst.c
> index 006c3894c6ea..3024edf43a92 100644
> --- a/drivers/acpi/apei/erst.c
> +++ b/drivers/acpi/apei/erst.c
> @@ -927,7 +927,8 @@ static int erst_open_pstore(struct pstore_info *psi);
>  static int erst_close_pstore(struct pstore_info *psi);
>  static ssize_t erst_reader(u64 *id, enum pstore_type_id *type, int *count,
>                            struct timespec *time, char **buf,
> -                          bool *compressed, struct pstore_info *psi);
> +                          bool *compressed, ssize_t *ecc_notice_size,
> +                          struct pstore_info *psi);
>  static int erst_writer(enum pstore_type_id type, enum kmsg_dump_reason reason,
>                        u64 *id, unsigned int part, int count, bool compressed,
>                        size_t size, struct pstore_info *psi);
> @@ -987,7 +988,8 @@ static int erst_close_pstore(struct pstore_info *psi)
>
>  static ssize_t erst_reader(u64 *id, enum pstore_type_id *type, int *count,
>                            struct timespec *time, char **buf,
> -                          bool *compressed, struct pstore_info *psi)
> +                          bool *compressed, ssize_t *ecc_notice_size,
> +                          struct pstore_info *psi)
>  {
>         int rc;
>         ssize_t len = 0;
> --
> 2.8.1
>
> --
> Cheers,
> Stephen Rothwell



-- 
Kees Cook
Chrome OS & Brillo Security
