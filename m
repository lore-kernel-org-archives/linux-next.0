From: Mike Waychison <mikew@google.com>
Subject: Re: [PATCH -next] firmware: fix google/gsmi.c build warning
Date: Wed, 27 Jul 2011 12:49:59 -0700
Message-ID: <CAGTjWtBq39vBMWfk0aTZuw_kNQSUch8oUcg14VF5NpOwuuJiew@mail.gmail.com>
References: <20110727141151.d31e3da6a8d21a255473293c@canb.auug.org.au> <20110727101128.8d63fbab.rdunlap@xenotime.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20110727101128.8d63fbab.rdunlap@xenotime.net>
Sender: linux-kernel-owner@vger.kernel.org
To: Randy Dunlap <rdunlap@xenotime.net>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, akpm <akpm@linux-foundation.org>, linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

On Wed, Jul 27, 2011 at 10:11 AM, Randy Dunlap <rdunlap@xenotime.net> w=
rote:
> From: Randy Dunlap <rdunlap@xenotime.net>
>
> Modify function parameter type to match expected type. =A0Fixes a
> build warning:
>
> drivers/firmware/google/gsmi.c:473: warning: initialization from inco=
mpatible pointer type
>
> Signed-off-by: Randy Dunlap <rdunlap@xenotime.net>
> Cc: Mike Waychison <mikew@google.com>
> ---
> =A0drivers/firmware/google/gsmi.c | =A0 =A02 +-
> =A01 file changed, 1 insertion(+), 1 deletion(-)
>
> --- linux-next-20110727.orig/drivers/firmware/google/gsmi.c
> +++ linux-next-20110727/drivers/firmware/google/gsmi.c
> @@ -420,7 +420,7 @@ static efi_status_t gsmi_get_next_variab
>
> =A0static efi_status_t gsmi_set_variable(efi_char16_t *name,
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0efi_guid_t *vendor,
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 unsigned long attr,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 u32 attr,
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0unsigned long data_size,
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0void *data)
> =A0{
>

Looks good.
