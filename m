From: "Rafael J. Wysocki" <rjw@rjwysocki.net>
Subject: Re: linux-next: manual merge of the pm tree with Linus' tree
Date: Tue, 30 Oct 2018 08:33:08 +0100
Message-ID: <1746838.ttb7sSuUtV@aspire.rjw.lan>
References: <20181029130124.290346e9@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181029130124.290346e9@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Johannes Weiner <hannes@cmpxchg.org>, Andrew Morton <akpm@linux-foundation.org>, Daniel Lezcano <daniel.lezcano@linaro.org>
List-Id: linux-next.vger.kernel.org

On Monday, October 29, 2018 3:01:24 AM CET Stephen Rothwell wrote:
> 
> --Sig_/X_/swfdki+BZTJ8afk_lQqW
> Content-Type: text/plain; charset=US-ASCII
> Content-Transfer-Encoding: quoted-printable
> 
> Hi Rafael,
> 
> Today's linux-next merge of the pm tree got a conflict in:
> 
>   drivers/cpuidle/governors/menu.c
> 
> between commit:
> 
>   8508cf3ffad4 ("sched: loadavg: consolidate LOAD_INT, LOAD_FRAC, CALC_LOAD=
> ")
> 
> from Linus' tree and commit:
> 
>   a7fe5190c03f ("cpuidle: menu: Remove get_loadavg() from the performance m=
> ultiplier")
> 
> from the pm tree.
> 
> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.
> 
> --=20
> Cheers,
> Stephen Rothwell
> 
> diff --cc drivers/cpuidle/governors/menu.c
> index 71979605246e,76df4f947f07..000000000000
> --- a/drivers/cpuidle/governors/menu.c
> +++ b/drivers/cpuidle/governors/menu.c
> @@@ -130,11 -130,10 +130,6 @@@ struct menu_device=20
>   	int		interval_ptr;
>   };
>  =20
> - static inline int get_loadavg(unsigned long load)
> - {
> - 	return LOAD_INT(load) * 10 + LOAD_FRAC(load) / 10;
> - }
>  -
>  -#define LOAD_INT(x) ((x) >> FSHIFT)
>  -#define LOAD_FRAC(x) LOAD_INT(((x) & (FIXED_1-1)) * 100)
> --
>   static inline int which_bucket(unsigned int duration, unsigned long nr_io=
> waiters)
>   {
>   	int bucket =3D 0;
> 
> --Sig_/X_/swfdki+BZTJ8afk_lQqW
> Content-Type: application/pgp-signature
> Content-Description: OpenPGP digital signature
> 
> 
> --Sig_/X_/swfdki+BZTJ8afk_lQqW--
> 

The fix looks good to me, thanks!

Cheers,
Rafael
