From: Kees Cook <keescook@chromium.org>
Subject: Re: linux-next: build failure after merge of the pstore tree
Date: Thu, 2 Jun 2016 11:14:59 -0700
Message-ID: <CAGXu5jJgP6rgf5wYftAvNn-AGidjcxkS0KBO=6qZTi99Q3Kx1A@mail.gmail.com>
References: <20160602102556.722ad0cf@canb.auug.org.au> <20160602140307.506b98ba@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-wm0-f50.google.com ([74.125.82.50]:37338 "EHLO
	mail-wm0-f50.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932188AbcFBSPF (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 2 Jun 2016 14:15:05 -0400
Received: by mail-wm0-f50.google.com with SMTP id z87so79865393wmh.0
        for <linux-next@vger.kernel.org>; Thu, 02 Jun 2016 11:15:04 -0700 (PDT)
In-Reply-To: <20160602140307.506b98ba@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Linux-Next <linux-next@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, Geliang Tang <geliangtang@163.com>

Thanks! All callers should be fixed now.

-Kees

On Wed, Jun 1, 2016 at 9:03 PM, Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> Hi Kees,
>
> On Thu, 2 Jun 2016 10:25:56 +1000 Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>>
>> After merging the pstore tree, today's linux-next build (x86_64
>> allmodconfig) failed like this:
>>
>> drivers/acpi/apei/erst.c:943:11: error: initialization from incompatible pointer type [-Werror=incompatible-pointer-types]
>>   .read  = erst_reader,
>>            ^
>
> This also affected arch/powerpc/kernel/nvram_64.c:
>
> arch/powerpc/kernel/nvram_64.c:563:10: error: initialization
>  from incompatible pointer type [-Werror=incompatible-pointer-types]
>   .read = nvram_pstore_read,
>           ^
>
> So I added this patch as well:
>
> From: Stephen Rothwell <sfr@canb.auug.org.au>
> Date: Thu, 2 Jun 2016 13:58:25 +1000
> Subject: [PATCH] pstore: update arch/powerpc/kernel/nvram_64.c for struct pstore_info change
>
> Fixes: d8aaf3511a13 ("pstore: add lzo/lz4 compression support")
> Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
> ---
>  arch/powerpc/kernel/nvram_64.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/arch/powerpc/kernel/nvram_64.c b/arch/powerpc/kernel/nvram_64.c
> index 856f9a7944cd..5ad2579e2cdc 100644
> --- a/arch/powerpc/kernel/nvram_64.c
> +++ b/arch/powerpc/kernel/nvram_64.c
> @@ -444,7 +444,8 @@ static int nvram_pstore_write(enum pstore_type_id type,
>   */
>  static ssize_t nvram_pstore_read(u64 *id, enum pstore_type_id *type,
>                                 int *count, struct timespec *time, char **buf,
> -                               bool *compressed, struct pstore_info *psi)
> +                               bool *compressed, ssize_t *ecc_notice_size,
> +                               struct pstore_info *psi)
>  {
>         struct oops_log_info *oops_hdr;
>         unsigned int err_type, id_no, size = 0;
> --
> 2.8.1
>
> I guess I don't really know if there is further fixes necessary, these
> patches just fix up the build.
> --
> Cheers,
> Stephen Rothwell



-- 
Kees Cook
Chrome OS & Brillo Security
