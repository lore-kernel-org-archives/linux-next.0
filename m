From: Corey Minyard <minyard@acm.org>
Subject: Re: linux-next: manual merge of the ipmi tree with the modules tree
Date: Thu, 2 Nov 2017 08:31:23 -0500
Message-ID: <16c92e03-98b8-3121-cdd8-2e6371451724@acm.org>
References: <20171102145808.5bb97c3a@canb.auug.org.au>
Reply-To: minyard@acm.org
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20171102145808.5bb97c3a@canb.auug.org.au>
Content-Language: en-GB
Sender: linux-kernel-owner@vger.kernel.org
To: Corey Minyard <cminyard@mvista.com>, Jessica Yu <jeyu@kernel.org>, Kees Cook <keescook@chromium.org>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

On 11/01/2017 10:58 PM, Stephen Rothwell wrote:
> Hi Corey,
>
> Today's linux-next merge of the ipmi tree got a conflict in:
>
>    drivers/char/ipmi/ipmi_si_intf.c
>
> between commit:
>
>    e4dca7b7aa08 ("treewide: Fix function prototypes for module_param_call()")
>
> from the modules tree and commit:
>
>    44814ec982d2 ("ipmi_si: Move the hotmod handling to another file.")
>
> from the ipmi tree.

Thanks Stephen.

Kees, do you have a tree I can merge so we can avoid this going upstream?

-corey

> I fixed it up (I used the ipmi tree version of the file and added the
> following merge fix patch) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.
>
> From: Stephen Rothwell <sfr@canb.auug.org.au>
> Date: Thu, 2 Nov 2017 14:55:01 +1100
> Subject: [PATCH] ipmi_si: merge fix for "treewide: Fix function prototypes for
>   module_param_call()"
>
> Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
> ---
>   drivers/char/ipmi/ipmi_si_hotmod.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/char/ipmi/ipmi_si_hotmod.c b/drivers/char/ipmi/ipmi_si_hotmod.c
> index da5716159974..fc03b9be2f3d 100644
> --- a/drivers/char/ipmi/ipmi_si_hotmod.c
> +++ b/drivers/char/ipmi/ipmi_si_hotmod.c
> @@ -10,7 +10,7 @@
>   
>   #define PFX "ipmi_hotmod: "
>   
> -static int hotmod_handler(const char *val, struct kernel_param *kp);
> +static int hotmod_handler(const char *val, const struct kernel_param *kp);
>   
>   module_param_call(hotmod, hotmod_handler, NULL, NULL, 0200);
>   MODULE_PARM_DESC(hotmod, "Add and remove interfaces.  See"
> @@ -97,7 +97,7 @@ static int check_hotmod_int_op(const char *curr, const char *option,
>   	return 0;
>   }
>   
> -static int hotmod_handler(const char *val, struct kernel_param *kp)
> +static int hotmod_handler(const char *val, const struct kernel_param *kp)
>   {
>   	char *str = kstrdup(val, GFP_KERNEL);
>   	int  rv;
