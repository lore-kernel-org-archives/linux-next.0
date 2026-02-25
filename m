Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5998395255;
	Wed, 25 Feb 2026 15:04:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772031862; cv=none; b=ClTwzB9zqkDFPYcGzCa/4grYZnOFSb3HjkeuxBu12p2dPDnWm2c6kgQQLqViRnb/UdsYWDOqKzP0Bp+9/4wC1W420uc8kAFjRXkPvsqKEEEEXdSZsHvbv8LTNAkjsyKg1ZZLr8l1TYXHWUV2MLpQe4WunnJFCb2fkgj0qm6oi5U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772031862; c=relaxed/simple;
	bh=+5h+6YiaviOAGeakccp8CJtOgDMv66j3ZqLmWW6gBK0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=dzMGK/OwChC6L881KdFqH0FGzAZCjLseteTAkvnyM8sD6+iJUbhYG4JQhxaQ/I0sIIDau/wVSg+OTF8hovgJkYpvXBXH9gbAyv7VtJ2Y3iX6GeppN2QPjU6+1/GDpOIag66LE7fvdT0LsdzreWKXelC+T2gPPxFjVTTsO66bs/c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UXwE7gmn; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UXwE7gmn"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 56ACCC116D0;
	Wed, 25 Feb 2026 15:04:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772031862;
	bh=+5h+6YiaviOAGeakccp8CJtOgDMv66j3ZqLmWW6gBK0=;
	h=Date:From:To:Cc:Subject:From;
	b=UXwE7gmneiLCd+AfqGACF+FtWIJbc7rm19KhwMALomm944O8B2xgKFLWOuSFqu9q7
	 tPuVpWDMRvtUmp9aMEGvYW1sqxeFilIbIM9ueO4ILXj4JMrakDidKkEcHGh2seTvMX
	 4ITRzqWrE0jMPjpNS7Nyzg1h20Ojs4qOPGPHFUq54QFL56bLeC8MOgjWTuGEKHy+aM
	 OhdVS1r5pdSJ6ULmSJl7Ux/vCG18H78GMeR28kbyow37WpQTo/9VycwJoFVVK6fhlX
	 QYrylXcT5xQltRzDZhoIpV7wX+XSJrDVKHMsC2mfP4VPRAd1aahaAvLOfvhKshAxhr
	 LwRVkcU/cWJAQ==
Date: Wed, 25 Feb 2026 15:04:18 +0000
From: Mark Brown <broonie@kernel.org>
To: Greg KH <greg@kroah.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	Nikolay Kulikov <nikolayof23@gmail.com>
Subject: linux-next: manual merge of the staging tree with the
 staging.current tree
Message-ID: <aZ8PcvFgmYITOmjg@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="rLy9erXFGIeCTzXa"
Content-Disposition: inline


--rLy9erXFGIeCTzXa
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the staging tree got a conflict in:

  drivers/staging/rtl8723bs/core/rtw_ieee80211.c

between commit:

  f0109b9d3e1e4 ("staging: rtl8723bs: properly validate the data in rtw_get=
_ie_ex()")

=66rom the staging.current tree and commit:

  0c9d1b56f9af0 ("staging: rtl8723bs: fix spaces around binary operators")

=66rom the staging tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

diff --combined drivers/staging/rtl8723bs/core/rtw_ieee80211.c
index 3e2b5e6b07f93,605c32fd2e881..0000000000000
--- a/drivers/staging/rtl8723bs/core/rtw_ieee80211.c
+++ b/drivers/staging/rtl8723bs/core/rtw_ieee80211.c
@@@ -109,7 -109,7 +109,7 @@@ int rtw_check_network_type(unsigned cha
  u8 *rtw_set_fixed_ie(unsigned char *pbuf, unsigned int len, unsigned char=
 *source,
  				unsigned int *frlen)
  {
- 	memcpy((void *)pbuf, (void *)source, len);
+ 	memcpy(pbuf, source, len);
  	*frlen =3D *frlen + len;
  	return pbuf + len;
  }
@@@ -126,7 -126,7 +126,7 @@@ u8 *rtw_set_ie(u8 *pbuf
  	*(pbuf + 1) =3D (u8)len;
 =20
  	if (len > 0)
- 		memcpy((void *)(pbuf + 2), (void *)source, len);
+ 		memcpy(pbuf + 2, source, len);
 =20
  	*frlen =3D *frlen + (len + 2);
 =20
@@@ -186,25 -186,20 +186,25 @@@ u8 *rtw_get_ie_ex(u8 *in_ie, uint in_le
 =20
  	cnt =3D 0;
 =20
 -	while (cnt < in_len) {
 -		if (eid =3D=3D in_ie[cnt] &&
 -		    (!oui || !memcmp(&in_ie[cnt + 2], oui, oui_len))) {
 +	while (cnt + 2 <=3D in_len) {
 +		u8 ie_len =3D in_ie[cnt + 1];
 +
 +		if (cnt + 2 + ie_len > in_len)
 +			break;
 +
 +		if (eid =3D=3D in_ie[cnt]
 +			&& (!oui || (ie_len >=3D oui_len && !memcmp(&in_ie[cnt + 2], oui, oui_=
len)))) {
  			target_ie =3D &in_ie[cnt];
 =20
  			if (ie)
 -				memcpy(ie, &in_ie[cnt], in_ie[cnt + 1] + 2);
 +				memcpy(ie, &in_ie[cnt], ie_len + 2);
 =20
  			if (ielen)
 -				*ielen =3D in_ie[cnt + 1] + 2;
 +				*ielen =3D ie_len + 2;
 =20
  			break;
  		}
 -		cnt +=3D in_ie[cnt + 1] + 2; /* goto next */
 +		cnt +=3D ie_len + 2; /* goto next */
  	}
 =20
  	return target_ie;
@@@ -291,7 -286,7 +291,7 @@@ uint rtw_get_rateset_len(u8 *rateset
  int rtw_generate_ie(struct registry_priv *pregistrypriv)
  {
  	u8 wireless_mode;
- 	int	sz =3D 0, rateLen;
+ 	int	sz =3D 0, rate_len;
  	struct wlan_bssid_ex *pdev_network =3D &pregistrypriv->dev_network;
  	u8 *ie =3D pdev_network->ies;
 =20
@@@ -326,13 -321,13 +326,13 @@@
 =20
  	rtw_set_supported_rate(pdev_network->supported_rates, wireless_mode);
 =20
- 	rateLen =3D rtw_get_rateset_len(pdev_network->supported_rates);
+ 	rate_len =3D rtw_get_rateset_len(pdev_network->supported_rates);
 =20
- 	if (rateLen > 8) {
+ 	if (rate_len > 8) {
  		ie =3D rtw_set_ie(ie, WLAN_EID_SUPP_RATES, 8, pdev_network->supported_r=
ates, &sz);
- 		/* ie =3D rtw_set_ie(ie, WLAN_EID_EXT_SUPP_RATES, (rateLen - 8), (pdev_=
network->supported_rates + 8), &sz); */
+ 		/* ie =3D rtw_set_ie(ie, WLAN_EID_EXT_SUPP_RATES, (rate_len - 8), (pdev=
_network->supported_rates + 8), &sz); */
  	} else {
- 		ie =3D rtw_set_ie(ie, WLAN_EID_SUPP_RATES, rateLen, pdev_network->suppo=
rted_rates, &sz);
+ 		ie =3D rtw_set_ie(ie, WLAN_EID_SUPP_RATES, rate_len, pdev_network->supp=
orted_rates, &sz);
  	}
 =20
  	/* DS parameter set */
@@@ -342,8 -337,8 +342,8 @@@
 =20
  	ie =3D rtw_set_ie(ie, WLAN_EID_IBSS_PARAMS, 2, (u8 *)&(pdev_network->con=
figuration.atim_window), &sz);
 =20
- 	if (rateLen > 8)
- 		ie =3D rtw_set_ie(ie, WLAN_EID_EXT_SUPP_RATES, (rateLen - 8), (pdev_net=
work->supported_rates + 8), &sz);
+ 	if (rate_len > 8)
+ 		ie =3D rtw_set_ie(ie, WLAN_EID_EXT_SUPP_RATES, (rate_len - 8), (pdev_ne=
twork->supported_rates + 8), &sz);
 =20
  	/* HT Cap. */
  	if ((pregistrypriv->wireless_mode & WIRELESS_11_24N) &&
@@@ -455,10 -450,10 +455,10 @@@ int rtw_parse_wpa_ie(u8 *wpa_ie, int wp
  		return _FAIL;
  	}
 =20
- 	if ((*wpa_ie !=3D WLAN_EID_VENDOR_SPECIFIC) || (*(wpa_ie+1) !=3D (u8)(wp=
a_ie_len - 2)) ||
- 	   (memcmp(wpa_ie+2, RTW_WPA_OUI_TYPE, WPA_SELECTOR_LEN))) {
+ 	if ((*wpa_ie !=3D WLAN_EID_VENDOR_SPECIFIC) ||
+ 	    (*(wpa_ie + 1) !=3D (u8)(wpa_ie_len - 2)) ||
+ 	    (memcmp(wpa_ie + 2, RTW_WPA_OUI_TYPE, WPA_SELECTOR_LEN)))
  		return _FAIL;
- 	}
 =20
  	pos =3D wpa_ie;
 =20
@@@ -518,7 -513,7 +518,7 @@@ int rtw_parse_wpa2_ie(u8 *rsn_ie, int r
  		return _FAIL;
  	}
 =20
- 	if ((*rsn_ie !=3D WLAN_EID_RSN) || (*(rsn_ie+1) !=3D (u8)(rsn_ie_len - 2=
)))
+ 	if ((*rsn_ie !=3D WLAN_EID_RSN) || (*(rsn_ie + 1) !=3D (u8)(rsn_ie_len -=
 2)))
  		return _FAIL;
 =20
  	pos =3D rsn_ie;
@@@ -585,18 -580,18 +585,18 @@@ int rtw_get_wapi_ie(u8 *in_ie, uint in_
  	while (cnt < in_len) {
  		authmode =3D in_ie[cnt];
 =20
- 		/* if (authmode =3D=3D WLAN_EID_BSS_AC_ACCESS_DELAY) */
- 		if (authmode =3D=3D WLAN_EID_BSS_AC_ACCESS_DELAY && (!memcmp(&in_ie[cnt=
+6], wapi_oui1, 4) ||
- 					!memcmp(&in_ie[cnt+6], wapi_oui2, 4))) {
+ 		if (authmode =3D=3D WLAN_EID_BSS_AC_ACCESS_DELAY &&
+ 		    (!memcmp(&in_ie[cnt + 6], wapi_oui1, 4) ||
+ 		     !memcmp(&in_ie[cnt + 6], wapi_oui2, 4))) {
  			if (wapi_ie)
- 				memcpy(wapi_ie, &in_ie[cnt], in_ie[cnt+1]+2);
+ 				memcpy(wapi_ie, &in_ie[cnt], in_ie[cnt + 1] + 2);
 =20
  			if (wapi_len)
- 				*wapi_len =3D in_ie[cnt+1]+2;
+ 				*wapi_len =3D in_ie[cnt + 1] + 2;
 =20
- 			cnt +=3D in_ie[cnt+1]+2;  /* get next */
+ 			cnt +=3D in_ie[cnt + 1] + 2;  /* get next */
  		} else {
- 			cnt +=3D in_ie[cnt+1]+2;   /* get next */
+ 			cnt +=3D in_ie[cnt + 1] + 2;   /* get next */
  		}
  	}
 =20
@@@ -619,9 -614,10 +619,10 @@@ void rtw_get_sec_ie(u8 *in_ie, uint in_
  	while (cnt < in_len) {
  		authmode =3D in_ie[cnt];
 =20
- 		if ((authmode =3D=3D WLAN_EID_VENDOR_SPECIFIC) && (!memcmp(&in_ie[cnt+2=
], &wpa_oui[0], 4))) {
+ 		if ((authmode =3D=3D WLAN_EID_VENDOR_SPECIFIC) &&
+ 		    (!memcmp(&in_ie[cnt + 2], &wpa_oui[0], 4))) {
  			if (wpa_ie)
- 				memcpy(wpa_ie, &in_ie[cnt], in_ie[cnt+1]+2);
+ 				memcpy(wpa_ie, &in_ie[cnt], in_ie[cnt + 1] + 2);
 =20
  			*wpa_len =3D in_ie[cnt + 1] + 2;
  			cnt +=3D in_ie[cnt + 1] + 2;  /* get next */
@@@ -630,10 -626,10 +631,10 @@@
  				if (rsn_ie)
  					memcpy(rsn_ie, &in_ie[cnt], in_ie[cnt + 1] + 2);
 =20
- 				*rsn_len =3D in_ie[cnt+1]+2;
- 				cnt +=3D in_ie[cnt+1]+2;  /* get next */
+ 				*rsn_len =3D in_ie[cnt + 1] + 2;
+ 				cnt +=3D in_ie[cnt + 1] + 2;  /* get next */
  			} else {
- 				cnt +=3D in_ie[cnt+1]+2;   /* get next */
+ 				cnt +=3D in_ie[cnt + 1] + 2;   /* get next */
  			}
  		}
  	}
@@@ -665,20 -661,20 +666,20 @@@ u8 *rtw_get_wps_ie(u8 *in_ie, uint in_l
  	while (cnt < in_len) {
  		eid =3D in_ie[cnt];
 =20
- 		if ((eid =3D=3D WLAN_EID_VENDOR_SPECIFIC) && (!memcmp(&in_ie[cnt+2], wp=
s_oui, 4))) {
+ 		if ((eid =3D=3D WLAN_EID_VENDOR_SPECIFIC) && (!memcmp(&in_ie[cnt + 2], =
wps_oui, 4))) {
  			wpsie_ptr =3D &in_ie[cnt];
 =20
  			if (wps_ie)
- 				memcpy(wps_ie, &in_ie[cnt], in_ie[cnt+1]+2);
+ 				memcpy(wps_ie, &in_ie[cnt], in_ie[cnt + 1] + 2);
 =20
  			if (wps_ielen)
- 				*wps_ielen =3D in_ie[cnt+1]+2;
+ 				*wps_ielen =3D in_ie[cnt + 1] + 2;
 =20
- 			cnt +=3D in_ie[cnt+1]+2;
+ 			cnt +=3D in_ie[cnt + 1] + 2;
 =20
  			break;
  		}
- 		cnt +=3D in_ie[cnt+1]+2; /* goto next */
+ 		cnt +=3D in_ie[cnt + 1] + 2; /* goto next */
  	}
 =20
  	return wpsie_ptr;
@@@ -756,12 -752,12 +757,12 @@@ u8 *rtw_get_wps_attr_content(u8 *wps_ie
 =20
  	if (attr_ptr && attr_len) {
  		if (buf_content)
- 			memcpy(buf_content, attr_ptr+4, attr_len-4);
+ 			memcpy(buf_content, attr_ptr + 4, attr_len - 4);
 =20
  		if (len_content)
- 			*len_content =3D attr_len-4;
+ 			*len_content =3D attr_len - 4;
 =20
- 		return attr_ptr+4;
+ 		return attr_ptr + 4;
  	}
 =20
  	return NULL;
@@@ -851,9 -847,9 +852,9 @@@ static int rtw_ieee802_11_parse_vendor_
   * @show_errors: Whether to show parsing errors in debug log
   * Returns: Parsing result
   */
- enum ParseRes rtw_ieee802_11_parse_elems(u8 *start, uint len,
- 				struct rtw_ieee802_11_elems *elems,
- 				int show_errors)
+ enum parse_result rtw_ieee802_11_parse_elems(u8 *start, uint len,
+ 					     struct rtw_ieee802_11_elems *elems,
+ 					     int show_errors)
  {
  	uint left =3D len;
  	u8 *pos =3D start;
@@@ -869,7 -865,7 +870,7 @@@
  		left -=3D 2;
 =20
  		if (elen > left)
- 			return ParseFailed;
+ 			return PARSE_FAILED;
 =20
  		switch (id) {
  		case WLAN_EID_SSID:
@@@ -972,9 -968,9 +973,9 @@@
  	}
 =20
  	if (left)
- 		return ParseFailed;
+ 		return PARSE_FAILED;
 =20
- 	return unknown ? ParseUnknown : ParseOK;
+ 	return unknown ? PARSE_UNKNOWN : PARSE_OK;
  }
 =20
  void rtw_macaddr_cfg(struct device *dev, u8 *mac_addr)
@@@ -1012,20 -1008,25 +1013,25 @@@ static int rtw_get_cipher_info(struct w
  	int group_cipher =3D 0, pairwise_cipher =3D 0, is8021x =3D 0;
  	int ret =3D _FAIL;
 =20
- 	pbuf =3D rtw_get_wpa_ie(&pnetwork->network.ies[12], &wpa_ielen, pnetwork=
->network.ie_length-12);
+ 	pbuf =3D rtw_get_wpa_ie(&pnetwork->network.ies[12],
+ 			      &wpa_ielen,
+ 			      pnetwork->network.ie_length - 12);
 =20
  	if (pbuf && (wpa_ielen > 0)) {
- 		if (rtw_parse_wpa_ie(pbuf, wpa_ielen+2, &group_cipher, &pairwise_cipher=
, &is8021x) =3D=3D _SUCCESS) {
+ 		if (rtw_parse_wpa_ie(pbuf, wpa_ielen + 2, &group_cipher,
+ 				     &pairwise_cipher, &is8021x) =3D=3D _SUCCESS) {
  			pnetwork->bcn_info.pairwise_cipher =3D pairwise_cipher;
  			pnetwork->bcn_info.group_cipher =3D group_cipher;
  			pnetwork->bcn_info.is_8021x =3D is8021x;
  			ret =3D _SUCCESS;
  		}
  	} else {
- 		pbuf =3D rtw_get_wpa2_ie(&pnetwork->network.ies[12], &wpa_ielen, pnetwo=
rk->network.ie_length-12);
+ 		pbuf =3D rtw_get_wpa2_ie(&pnetwork->network.ies[12], &wpa_ielen,
+ 				       pnetwork->network.ie_length - 12);
 =20
  		if (pbuf && (wpa_ielen > 0)) {
- 			if (rtw_parse_wpa2_ie(pbuf, wpa_ielen+2, &group_cipher, &pairwise_ciph=
er, &is8021x) =3D=3D _SUCCESS) {
+ 			if (rtw_parse_wpa2_ie(pbuf, wpa_ielen + 2, &group_cipher,
+ 					      &pairwise_cipher, &is8021x) =3D=3D _SUCCESS) {
  				pnetwork->bcn_info.pairwise_cipher =3D pairwise_cipher;
  				pnetwork->bcn_info.group_cipher =3D group_cipher;
  				pnetwork->bcn_info.is_8021x =3D is8021x;
@@@ -1094,21 -1095,21 +1100,21 @@@ u16 rtw_mcs_rate(u8 bw_40MHz, u8 short_
  	u16 max_rate =3D 0;
 =20
  	if (MCS_rate[0] & BIT(7))
- 		max_rate =3D (bw_40MHz) ? ((short_GI)?1500:1350):((short_GI)?722:650);
+ 		max_rate =3D (bw_40MHz) ? ((short_GI) ? 1500 : 1350) : ((short_GI) ? 72=
2 : 650);
  	else if (MCS_rate[0] & BIT(6))
- 		max_rate =3D (bw_40MHz) ? ((short_GI)?1350:1215):((short_GI)?650:585);
+ 		max_rate =3D (bw_40MHz) ? ((short_GI) ? 1350 : 1215) : ((short_GI) ? 65=
0 : 585);
  	else if (MCS_rate[0] & BIT(5))
- 		max_rate =3D (bw_40MHz) ? ((short_GI)?1200:1080):((short_GI)?578:520);
+ 		max_rate =3D (bw_40MHz) ? ((short_GI) ? 1200 : 1080) : ((short_GI) ? 57=
8 : 520);
  	else if (MCS_rate[0] & BIT(4))
- 		max_rate =3D (bw_40MHz) ? ((short_GI)?900:810):((short_GI)?433:390);
+ 		max_rate =3D (bw_40MHz) ? ((short_GI) ? 900 : 810) : ((short_GI) ? 433 =
: 390);
  	else if (MCS_rate[0] & BIT(3))
- 		max_rate =3D (bw_40MHz) ? ((short_GI)?600:540):((short_GI)?289:260);
+ 		max_rate =3D (bw_40MHz) ? ((short_GI) ? 600 : 540) : ((short_GI) ? 289 =
: 260);
  	else if (MCS_rate[0] & BIT(2))
- 		max_rate =3D (bw_40MHz) ? ((short_GI)?450:405):((short_GI)?217:195);
+ 		max_rate =3D (bw_40MHz) ? ((short_GI) ? 450 : 405) : ((short_GI) ? 217 =
: 195);
  	else if (MCS_rate[0] & BIT(1))
- 		max_rate =3D (bw_40MHz) ? ((short_GI)?300:270):((short_GI)?144:130);
+ 		max_rate =3D (bw_40MHz) ? ((short_GI) ? 300 : 270) : ((short_GI) ? 144 =
: 130);
  	else if (MCS_rate[0] & BIT(0))
- 		max_rate =3D (bw_40MHz) ? ((short_GI)?150:135):((short_GI)?72:65);
+ 		max_rate =3D (bw_40MHz) ? ((short_GI) ? 150 : 135) : ((short_GI) ? 72 :=
 65);
 =20
  	return max_rate;
  }

--rLy9erXFGIeCTzXa
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmmfD3EACgkQJNaLcl1U
h9C+YQf+LInQfGlqOGOiONI14fVQUCCy4PUeOxjIlIBIL1itppA8Mthct4A4SfB8
1XaXiDezXgonL9FG6Rvc+uUTdM+Q6uWaKEOGnuHGf+6P7Kr9/J3nL89s9rq9b2+3
0bgx9S5bgrTyHQ8T3pOWHNIXLMDrXUZ+OuZKpDA1RqdDAJ9f/4s83FSekXwLr62/
kpP1Imh2T7dvx2OPvOVy4krPJy9NIJgIEwCEuOSSXqUbLJ3TlTjcgOc/9SB3aVS+
g4CBUnFY8+4KsAKQ5NYI9RWgPkBqL/G+YoDqQ5ba7tJszd8p/KwxGKsGnx2vKNfZ
14zjdF/YEX39nbhv6+63/74SuGeYWg==
=NX1w
-----END PGP SIGNATURE-----

--rLy9erXFGIeCTzXa--
