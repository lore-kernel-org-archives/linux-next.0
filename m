From: Zhang Rui <rui.zhang@intel.com>
Subject: Re: linux-next: build failure after merge of the akpm tree
Date: Thu, 13 Sep 2012 16:46:27 +0800
Message-ID: <1347525987.1682.1194.camel@rui.sh.intel.com>
References: <20120913174441.f5fbf5cc38713425331f4d86@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mga02.intel.com ([134.134.136.20]:28910 "EHLO mga02.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752068Ab2IMIpj (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 13 Sep 2012 04:45:39 -0400
In-Reply-To: <20120913174441.f5fbf5cc38713425331f4d86@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Andrew Morton <akpm@linux-foundation.org>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Fengguang Wu <fengguang.wu@intel.com>, Amit Daniel Kachhap <amit.kachhap@linaro.org>

Hi, all,

On =E5=9B=9B, 2012-09-13 at 17:44 +1000, Stephen Rothwell wrote:
> Hi Andrew,
>=20
> After merging the akpm tree, today's linux-next build (x86_64
> allmodconfig) failed like this:
>=20
> drivers/thermal/cpu_cooling.c: In function 'get_idr':
> drivers/thermal/cpu_cooling.c:89:14: error: 'MAX_ID_MASK' undeclared =
(first use in this function)
>=20
> Caused by commit "idr: rename MAX_LEVEL to MAX_IDR_LEVEL" from the ak=
pm
> tree interacting with commit 78edc7cdcf5e ("thermal: add generic cpuf=
req
> cooling implementation") from the thermal tree.
>=20
> I have applied the following merge fix patch and can carry it as
> necessary.
>=20
> From: Stephen Rothwell <sfr@canb.auug.org.au>
> Date: Thu, 13 Sep 2012 17:42:11 +1000
> Subject: [PATCH] thermal: fix up for MAX_ID_MASK rename
>=20
> Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>

thanks for the fix.

I'm new as a git owner, so a stupid question here,
in this case, who should keep this fix? Do I need to do something when
sending pull request?

thanks,
rui
> ---
>  drivers/thermal/cpu_cooling.c |    4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/thermal/cpu_cooling.c b/drivers/thermal/cpu_cool=
ing.c
> index 99a5d75..f6ce617 100644
> --- a/drivers/thermal/cpu_cooling.c
> +++ b/drivers/thermal/cpu_cooling.c
> @@ -9,7 +9,7 @@
>   *  it under the terms of the GNU General Public License as publishe=
d by
>   *  the Free Software Foundation; version 2 of the License.
>   *
> - *  This program is distributed in the hope that it will be useful, =
but
> + *  This program is distributed in the hope that it will be useful, =
butX_ID_MASK
>   *  WITHOUT ANY WARRANTY; without even the implied warranty of
>   *  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GN=
U
>   *  General Public License for more details.
> @@ -86,7 +86,7 @@ again:
>  	else if (unlikely(err))
>  		return err;
> =20
> -	*id =3D *id & MAX_ID_MASK;
> +	*id =3D *id & MAX_IDR_MASK;
>  	return 0;
>  }
> =20
> --=20
> 1.7.10.280.gaa39
>=20
