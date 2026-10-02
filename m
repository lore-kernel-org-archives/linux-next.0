Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1738414411
	for <linux-next@vger.kernel.org>; Fri,  2 Oct 2026 12:59:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790945988; cv=none; b=Ru/iX1jdDkHoBHDFw2zQ3XvmMt+fpuz7c69K0N9+6MSFV6XQ5IBTua1Pbg7WdCYohEirvQykKchs7wPEo4Iaj23hO4n+HGrq6Llj3QkFIxV6PvG1KzZfLG66u0E38a3CWGkXHZz+EGe+W1qGYu3Gky26l/5lKemPvYkQaP20JFM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790945988; c=relaxed/simple;
	bh=1kyDt4JTb22Uoi2LnkpQhAiVJKN25v4eLOJunyfK0HA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hPQm9Lja0GlOMXM2hkUMDt8BZN6+E4m9lWJIBWGRSDFGBPhKyZgUf6cV0ryOxd+7IsZYek08h9xCvMOk3QpjbdGMv9ogWDXBcKuK4okxB9cmVYfJOusyU7gJuw4ITqT2ynmWhsUpERE7dilgzDAbTxeCz7SlazstfmAHCXGFoD0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JAziJZBi; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fnsaTMSI; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JAziJZBi";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fnsaTMSI"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6929nb1G207339
	for <linux-next@vger.kernel.org>; Fri, 2 Oct 2026 12:59:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Y7x/VlWWy2BsRTiBpnYJg7ky
	XQlMniK9j0tDbkxyDLY=; b=JAziJZBiG50qprKDeSWjkAGyyLrmlrLfC69no1ZS
	G/CoEvxY/4B1wFMoES0WmgXCV+tCAd6v4btzjfFHw90+2ypP/vG8Ss3rLOkORPdO
	2Qunr3eLSx363QKnCm4eIp5FUzyj/uu4ja2SNoxhYec8wwbjt63//YxLTVylAJLT
	myHl/Sm2uK2dY6Rby8WPaiOGxWc8VqAvwVTJuBUzb3q/5Vw0RgrX9NuLpCoc2uXD
	gNPL1ne5Ab4XwaIoZY9cK3Zl603ptLUGa1RD87MbR8Rqn/zApAkzmgEZvvndTqme
	vXax4apSTVU7FBTrE8F2uR2kU9+4wnTq+MBqAvCTcz8vhg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h1v033g1g-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-next@vger.kernel.org>; Fri, 02 Oct 2026 12:59:45 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93ae8e7e546so1425665585a.1
        for <linux-next@vger.kernel.org>; Fri, 02 Oct 2026 05:59:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790945985; x=1791550785; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Y7x/VlWWy2BsRTiBpnYJg7kyXQlMniK9j0tDbkxyDLY=;
        b=fnsaTMSIHO7rzPtkr5Zd/MwvEvsm8anrGRtQDbxpEHFtQpShqqI3kUY8AmqvJ8ZXC9
         jRBvpyKgDXk6ymCGpxgxXxcV9rBkd+l13gSBT69WMW5bO1hF34o+8gnIAY8PIVa5iUi9
         JAvdCbu2bFvRJIAaFO3OugvWmGepHzTXHVClVH8cIw2ZPKJY9WtPwIKkHMiAgjNxaQUH
         liCMsISavy7o3d7gpfNTlD1WmtKDSvlWZAHqkINOUj2rdVz+9+poO7ttJLPFrkZVTUf/
         Kj3EzO+JUmmeD+mitAHg0NKpSrLdgxx3tt2IDiqiKcAT3S4bkvzNnO0LipDF+nL8fsNj
         m09w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790945985; x=1791550785;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Y7x/VlWWy2BsRTiBpnYJg7kyXQlMniK9j0tDbkxyDLY=;
        b=WzSZ0Q0loVJE3IugqhKfhRK1acOtYXuphgivgo23eJgoF+2yOfQihX2gP4ZiC4Izc+
         Q4OrFEFtpNqUc3bYXooNh+a8zaKbaWbLlLeOKmKBaHPei4COOrheIeDQJB7IZBWz25fD
         il4QIQXTuEDE+k7x+yIK2IthIR6YJL7BWjNTBt8q4Y8HmuVGiJeTtd7cdhK63naDAJFv
         zK1cueEKIMYYnrryVVjO52IeCaSDFNA0AJMC2iG/IcNubsPAKRi4OxR4k33hb1h6CTWe
         A4dIgtIyfFQX/4izWy4NxpWaF7DfWvj68AwDXgek99fPS99fj4Wtg7OiZ1ilPQDVZp5U
         06rg==
X-Forwarded-Encrypted: i=1; AKwUvBxd87XBIR+z4WST28iCktyOdCQn6L6KnY2f9/+47UD8PRtVY28bdEjQ8zePNRliID77/I5v9gEi4xpg@vger.kernel.org
X-Gm-Message-State: AFuF++my6Z17DRxETAHZgL4aS/fnVRKM9LsZovxTVgqhwsTuZg5qdpFK
	L9RtpUgKwgaJt7AvszHm1SDGnlUdT0bpyhvdagrQ1fV3AIPRQb9coqs5qSyCvgU9z+40zqVqKMR
	+lLHuCqmWj6qWPiBA3OP+V3T7u/MfaX3JWWd/Ki8Ml+lRdpP7aMf5a5TupLzcy/ld
X-Gm-Gg: AYBFou3O9lwzQgHkHW/50f1J/qLxpAbbiBX2GsC6vrk9U/MGx4nRBFhieTDHMzjik6P
	VoH6k570Kp6r253cDEMCNlngoGWJxJZilBv2QPEBUjGslhPHfBhvicSrFq3rHKkq/GH0b7kjYxx
	4nrnNLPiyrxl51RqWA36FTidyC3foFwOXDHKRmraXTbgaWfFemBVyoA+h/wl1ChrxhKYk7qs4uu
	5/w15begeiR7R9zKG80ILqPqU8s51NwwqEYtwU8j8re8YiXiuD2OPKvSwUEaW1c8z6TqDWTlKKF
	9nJ561sTPFrgbeAtnW5hwb2tAfYAN8MPTgWP2LhzuUYt5DO6DBG4gekErIGXwvquZP977t+kkYE
	dqQqsTtcLKrRpQA==
X-Received: by 2002:a05:620a:271c:b0:939:6de6:9518 with SMTP id af79cd13be357-93cf1763839mr390082485a.47.1790945984825;
        Fri, 02 Oct 2026 05:59:44 -0700 (PDT)
X-Received: by 2002:a05:620a:271c:b0:939:6de6:9518 with SMTP id af79cd13be357-93cf1763839mr390075885a.47.1790945984155;
        Fri, 02 Oct 2026 05:59:44 -0700 (PDT)
Received: from localhost ([188.216.77.92])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a0304407d2sm49887535e9.0.2026.10.02.05.59.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2026 05:59:43 -0700 (PDT)
Date: Fri, 2 Oct 2026 14:59:42 +0200
From: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
To: Mark Brown <broonie@kernel.org>
Cc: David Miller <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, Networking <netdev@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: manual merge of the net-next tree with the net tree
Message-ID: <ar-qvvGVATQ8-YxY@lore-desk>
References: <ar-iXZa3AIidNzsZ@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="O4EjaSrLBJhM+Fvw"
Content-Disposition: inline
In-Reply-To: <ar-iXZa3AIidNzsZ@sirena.org.uk>
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDAyMDA1MSBTYWx0ZWRfX1DgCZtUhiyvS
 de8ku4FqVo68SOzoTEd6jysR8twG0yBy5ACwYdCJfsRYGjHiBwOBmF3k9rBECZ4b8S52uYhKAhH
 oYq+yTmM4rRZbjp3chvT6OrVXla3Fd4=
X-Authority-Analysis: v=2.4 cv=GqfXaU1C c=1 sm=1 tr=0 ts=6abfaac1 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=WpTaRW6qxYHRGzLzQsVYzg==:17
 a=C2QiusJkKhMZhfYo:21 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EEJO2GkaDteSM9pISacA:9 a=CjuIK1q_8ugA:10 a=nKQr2Z7tQUnx1KUvgakA:9
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: tfWyvJjewt0ZAtCQpwS9UpWD8Qg5rm84
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDAyMDA1MSBTYWx0ZWRfXxW2Xcp/TacZK
 W3sjgqVRY8PhObpkHPa9SX//Y7HpclE2MiY5YBCfURTrz6CZPX5PcvnzNlNmHCqBrEl3+jfmouT
 LH0bsbcy5xBeyI67ZVtRKUrjHv7kN9bm5q2AXTzUWjVw9CyhPCk8Al056+929wGq8Z/erJBSU2v
 N3/ubpCQTnPx04P1COMcQttrCB6KJK1tkoBBLKp5/+3eOm5CZc1YUh0m5HcTAEYbp8Qlj8TAojD
 7JIiQ46e34sq5qZn0pcKHa1XQlOepsN+NBxJypv0DEDSwrftdmRZCoX28P0h0bEuflF2W17sMX+
 1VN+X1GKdcIaAp5mVnserfQHZg/eu+TNoASj52onT9ETbfMXwBjANr2crviCMaaWH5sddpDIlsW
 6nvaYidXmodc7IsvbDjSefRqecKZLJalTi7NVRHyvdOp3vbzgcDM1BPl6sfbtSXpGWExgiK+13/
 Eq/UuF7ottcRxAezVgQ==
X-Proofpoint-ORIG-GUID: tfWyvJjewt0ZAtCQpwS9UpWD8Qg5rm84
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-02_03,2026-10-01_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 priorityscore=1501 lowpriorityscore=0 malwarescore=0
 phishscore=0 impostorscore=0 adultscore=0 bulkscore=0 suspectscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2610020051

--O4EjaSrLBJhM+Fvw
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> Hi all,
>=20
> Today's linux-next merge of the net-next tree got a conflict in:
>=20
>   drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
>=20
> between commit:
>=20
>   232d49dd4b40a ("net: stmmac: propagate PTP addend and system time progr=
amming errors")
>=20
> from the net tree and commit:
>=20
>   8181678a92f01 ("net: stmmac: propagate PTP init failures in __stmmac_op=
en() and stmmac_resume()")
>=20
> from the net-next tree.
>=20
> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.

Hi Mark,

I double checked the diff and it seems correct to me. Thanks.

Regards,
Lorenzo

>=20
> diff --cc drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> index 9741f97fa37a2,0c381ae0d0ffa..0000000000000
> --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> @@@ -893,38 -862,38 +894,46 @@@ static int stmmac_hwtstamp_get(struct n
>    * Will be rerun after resuming from suspend, case in which the timesta=
mping
>    * flags updated by stmmac_hwtstamp_set() also need to be restored.
>    */
>  -static int stmmac_init_tstamp_counter(struct stmmac_priv *priv,
>  -				      u32 systime_flags)
>  +static int stmmac_init_tstamp_counter(struct stmmac_priv *priv)
>   {
>  +	u32 default_addend =3D priv->default_addend;
>   	struct timespec64 now;
>  +	int ret;
>  =20
> - 	if (!priv->plat->clk_ptp_rate) {
> - 		netdev_err(priv->dev, "Invalid PTP clock rate");
> - 		return -EINVAL;
> - 	}
>  -	stmmac_config_hw_tstamping(priv, priv->ptpaddr, systime_flags);
>  -	priv->systime_flags =3D systime_flags;
> --
>  -	stmmac_update_subsecond_increment(priv);
>  +	ret =3D stmmac_update_subsecond_increment(priv, priv->systime_flags);
>  +	if (ret)
>  +		return ret;
>  =20
>   	/* initialize system time */
>   	ktime_get_real_ts64(&now);
>  =20
>   	/* lower 32 bits of tv_sec are safe until y2106 */
>  -	stmmac_init_systime(priv, priv->ptpaddr, (u32)now.tv_sec, now.tv_nsec);
>  +	ret =3D stmmac_init_systime(priv, priv->ptpaddr, (u32)now.tv_sec,
>  +				  now.tv_nsec);
>  +	if (ret)
>  +		goto error;
>  =20
>   	return 0;
>  +error:
>  +	/* Restore previous configuration */
>  +	stmmac_restore_subsecond_increment(priv, default_addend);
>  +
>  +	return ret;
>   }
>  =20
> + static int stmmac_init_ptp_clk_freq(struct stmmac_priv *priv)
> + {
> + 	if (priv->plat->ptp_clk_freq_config)
> + 		priv->plat->ptp_clk_freq_config(priv);
> +=20
> + 	if (!priv->plat->clk_ptp_rate) {
> + 		netdev_info(priv->dev, "PTP clock rate not configured\n");
> + 		return -EINVAL;
> + 	}
> +=20
> + 	return 0;
> + }
> +=20
>   /**
>    * stmmac_init_timestamping - initialise timestamping
>    * @priv: driver private structure
> @@@ -937,22 -912,8 +952,14 @@@ static int stmmac_init_timestamping(str
>   	bool xmac =3D dwmac_is_xmac(priv->plat->core_type);
>   	int ret;
>  =20
> - 	if (priv->plat->ptp_clk_freq_config)
> - 		priv->plat->ptp_clk_freq_config(priv);
> -=20
> - 	if (!(priv->dma_cap.time_stamp || priv->dma_cap.atime_stamp)) {
> - 		netdev_info(priv->dev, "PTP not supported by HW\n");
> - 		return -EOPNOTSUPP;
> - 	}
> -=20
>  -	ret =3D stmmac_init_tstamp_counter(priv, STMMAC_HWTS_ACTIVE |
>  -					       PTP_TCR_TSCFUPDT);
>  +	/* Reset hw ts configuration */
>  +	memset(&priv->tstamp_config, 0, sizeof(priv->tstamp_config));
>  +	priv->systime_flags =3D STMMAC_HWTS_ACTIVE | PTP_TCR_TSCFUPDT;
>  +	priv->tsfupdt_coarse =3D false;
>  +	priv->hwts_tx_en =3D 0;
>  +	priv->hwts_rx_en =3D 0;
>  +
>  +	ret =3D stmmac_init_tstamp_counter(priv);
>   	if (ret) {
>   		netdev_warn(priv->dev, "PTP init failed\n");
>   		return ret;



--O4EjaSrLBJhM+Fvw
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCar+qvgAKCRA6cBh0uS2t
rG+dAP96RtWcVw97+ysSLMsHdkn7pHCvHn20QqWpLICWQ/MJPAEAv5uAMJxDnb3x
dWajHJaVos9QdyaVvlOK466kOrSyawY=
=tita
-----END PGP SIGNATURE-----

--O4EjaSrLBJhM+Fvw--
