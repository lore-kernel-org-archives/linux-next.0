From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: [PATCH 10/17] wireless: update gfp/slab.h includes
Date: Wed, 19 May 2010 19:02:30 +1000
Message-ID: <20100519190230.52385a65.sfr@canb.auug.org.au>
References: <1269885165-18617-1-git-send-email-tj@kernel.org>
	<1269885165-18617-11-git-send-email-tj@kernel.org>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Wed__19_May_2010_19_02_30_+1000_upjhJPFx41jCqHI_"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:58300 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751004Ab0ESJCi (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 19 May 2010 05:02:38 -0400
In-Reply-To: <1269885165-18617-11-git-send-email-tj@kernel.org>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: "John W. Linville" <linville@tuxdriver.com>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Tejun Heo <tj@kernel.org>, "David S. Miller" <davem@davemloft.net>

--Signature=_Wed__19_May_2010_19_02_30_+1000_upjhJPFx41jCqHI_
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi John,

On Tue, 30 Mar 2010 02:52:38 +0900 Tejun Heo <tj@kernel.org> wrote:
>
> Implicit slab.h inclusion via percpu.h is about to go away.  Make sure
> gfp.h or slab.h is included as necessary.
>=20
> Signed-off-by: Tejun Heo <tj@kernel.org>
> Cc: Stephen Rothwell <sfr@canb.auug.org.au>
> Cc: John W. Linville <linville@tuxdriver.com>
> ---
>  drivers/net/wireless/ath/ath9k/htc.h       |    1 +
>  drivers/net/wireless/iwlwifi/iwl-agn-ict.c |    1 +
>  2 files changed, 2 insertions(+), 0 deletions(-)
>=20
> diff --git a/drivers/net/wireless/ath/ath9k/htc.h b/drivers/net/wireless/=
ath/ath9k/htc.h
> index 7770649..4497479 100644
> --- a/drivers/net/wireless/ath/ath9k/htc.h
> +++ b/drivers/net/wireless/ath/ath9k/htc.h
> @@ -23,6 +23,7 @@
>  #include <linux/skbuff.h>
>  #include <linux/netdevice.h>
>  #include <linux/leds.h>
> +#include <linux/slab.h>
>  #include <net/mac80211.h>
> =20
>  #include "common.h"
> diff --git a/drivers/net/wireless/iwlwifi/iwl-agn-ict.c b/drivers/net/wir=
eless/iwlwifi/iwl-agn-ict.c
> index 4c5395e..0cc7fd9 100644
> --- a/drivers/net/wireless/iwlwifi/iwl-agn-ict.c
> +++ b/drivers/net/wireless/iwlwifi/iwl-agn-ict.c
> @@ -30,6 +30,7 @@
>  #include <linux/module.h>
>  #include <linux/etherdevice.h>
>  #include <linux/sched.h>
> +#include <linux/gfp.h>
>  #include <net/mac80211.h>
> =20
>  #include "iwl-dev.h"

I think that this patch is still needed in the wireless tree and I notice
that Dave has asked Linus to pull the net tree (containing the wireless
tree).  I have been carrying this in linux-next.

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Wed__19_May_2010_19_02_30_+1000_upjhJPFx41jCqHI_
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEARECAAYFAkvzqSYACgkQjjKRsyhoI8yGFwCfe1kYtq8NLO92EoGmgzUxLxok
7ZoAoJ6OOAp7mJWZK0+80Kaw+IweClKB
=jTyf
-----END PGP SIGNATURE-----

--Signature=_Wed__19_May_2010_19_02_30_+1000_upjhJPFx41jCqHI_--
