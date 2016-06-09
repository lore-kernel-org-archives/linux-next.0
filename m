From: Johannes Berg <johannes@sipsolutions.net>
Subject: Re: [PATCH] Add .set_antenna callback in ath6kl driver to fix
 wireless core warns
Date: Thu, 09 Jun 2016 08:43:15 +0200
Message-ID: <1465454595.3442.0.camel@sipsolutions.net>
References: <CAGRGNgV4sL2TypkR+zsaDHN26KCF0kjtWPsi9y9D_JkGpvWrUw@mail.gmail.com>
	 <1465450591-23543-1-git-send-email-prasunmaiti87@gmail.com>
	 (sfid-20160609_073700_555858_D064B679)
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-next-owner@vger.kernel.org>
Received: from s3.sipsolutions.net ([5.9.151.49]:57760 "EHLO sipsolutions.net"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751952AbcFIGnX (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 9 Jun 2016 02:43:23 -0400
In-Reply-To: <1465450591-23543-1-git-send-email-prasunmaiti87@gmail.com> (sfid-20160609_073700_555858_D064B679)
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Prasun Maiti <prasunmaiti87@gmail.com>, Linux Kernel <linux-kernel@vger.kernel.org>, Kalle Valo <kvalo@qca.qualcomm.com>
Cc: "ath6kl@lists.infradead.org" <ath6kl@lists.infradead.org>, Linux Next <linux-next@vger.kernel.org>, Linux Wireless <linux-wireless@vger.kernel.org>, Prasun Maiti <prasunmaii87@gmail.com>

On Thu, 2016-06-09 at 11:06 +0530, Prasun Maiti wrote:
> Since add more warnings for inconsistent ops in cfg80211, the
> wireless
> core warns if a driver implements a cfg80211 callback but doesn't
> implements the inverse operation. The ath6kl driver implements a
> cfg80211
> .get_antenna operation handler but doesn't have the inverse
> .set_antenna
> callback. So, it makes warning.
>=20
> To remove this warning, add .set_antenna callback in ath6kl driver
> which
> is unimplemented.
>=20
> Signed-off-by: Prasun Maiti <prasunmaiti87@gmail.com>
> ---
> =C2=A0drivers/net/wireless/ath/ath6kl/cfg80211.c | 11 +++++++++++
> =C2=A01 file changed, 11 insertions(+)
>=20
> diff --git a/drivers/net/wireless/ath/ath6kl/cfg80211.c
> b/drivers/net/wireless/ath/ath6kl/cfg80211.c
> index 4e11ba0..e638296 100644
> --- a/drivers/net/wireless/ath/ath6kl/cfg80211.c
> +++ b/drivers/net/wireless/ath/ath6kl/cfg80211.c
> @@ -3231,6 +3231,16 @@ static int ath6kl_mgmt_tx(struct wiphy *wiphy,
> struct wireless_dev *wdev,
> =C2=A0					wait, buf, len, no_cck);
> =C2=A0}
> =C2=A0
> +static int ath6kl_set_antenna(struct wiphy *wiphy,
> +				u32 tx_ant, u32 rx_ant)
> +{
> +	/*
> +	=C2=A0* Note: This callback should be implement when firmware
> support this
> +	=C2=A0* command.
> +	=C2=A0*/
> +	return 0;
> +}
>=20
Seriously, this makes no sense at all. Just submit a patch to remove
the warning.

johannes
