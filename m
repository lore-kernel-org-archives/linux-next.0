Return-Path: <linux-next-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EFE63C433E0
	for <linux-next@archiver.kernel.org>; Mon, 21 Dec 2020 01:29:41 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id AE3BE22BF5
	for <linux-next@archiver.kernel.org>; Mon, 21 Dec 2020 01:29:41 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726508AbgLUB3Z (ORCPT <rfc822;linux-next@archiver.kernel.org>);
        Sun, 20 Dec 2020 20:29:25 -0500
Received: from ozlabs.org ([203.11.71.1]:40715 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726146AbgLUB3Z (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Sun, 20 Dec 2020 20:29:25 -0500
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4Czhgs1Yfyz9sVm;
        Mon, 21 Dec 2020 12:28:40 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1608514122;
        bh=w40A4IYbXZZIx6CaaucdvRQw2TEpw7jkwP9SIPKLWik=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=dICMCrTvxHID21D8wf5cRqROG21eMLF917s5cQvJxWTjGSlgkC8e90DWuZCgFdAzE
         Q9Apr0LYiOJ1niz7YgsYQHDxH4n0BpO/HWppyhYZxIiagB053PEmv4KJ9Gli49jawP
         8dpgGl2bADSGgJar6YBfoXdLV3Lgl9Pt/Kl1cdCFAzwVLuuJo7v5/hc1xqdjTP+LcQ
         tlL7gdC0blUzB+i7X3mx7ZQjZW/F0eWPaTApLMlqS2v00c/r+MG4RcK7hnnfXlzSgX
         TOOjxNQ3LH+4qV4B9zW0CZ2J3Imh3nrOOrrQscvsaSRChtJv3X+DKC7BoSo/o3IV+T
         FwKJj+LPUh1mA==
Date:   Mon, 21 Dec 2020 12:28:39 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     David Miller <davem@davemloft.net>,
        Networking <netdev@vger.kernel.org>
Cc:     Carl Huang <cjhuang@codeaurora.org>,
        Johannes Berg <johannes.berg@intel.com>,
        Brian Norris <briannorris@chromium.org>,
        Abhishek Kumar <kuabhs@chromium.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build warnings after merge of the net-next tree
Message-ID: <20201221122839.72d29127@canb.auug.org.au>
In-Reply-To: <20201214201025.60cee658@canb.auug.org.au>
References: <20201214201025.60cee658@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/PBT5w0wR/wDCf5dmzBDI.Rk";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/PBT5w0wR/wDCf5dmzBDI.Rk
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Mon, 14 Dec 2020 20:10:25 +1100 Stephen Rothwell <sfr@canb.auug.org.au> =
wrote:
>
> After merging the net-next tree, today's linux-next build (htmldocs)
> produced these warnings:
>=20
> include/net/cfg80211.h:1759: warning: Cannot understand  * @struct cfg802=
11_sar_chan_ranges - sar frequency ranges
>  on line 1759 - I thought it was a doc line
> include/net/cfg80211.h:1759: warning: Cannot understand  * @struct cfg802=
11_sar_chan_ranges - sar frequency ranges
>  on line 1759 - I thought it was a doc line
> include/net/cfg80211.h:1759: warning: Cannot understand  * @struct cfg802=
11_sar_chan_ranges - sar frequency ranges
>  on line 1759 - I thought it was a doc line
> include/net/cfg80211.h:1759: warning: Cannot understand  * @struct cfg802=
11_sar_chan_ranges - sar frequency ranges
>  on line 1759 - I thought it was a doc line
> include/net/cfg80211.h:1759: warning: Cannot understand  * @struct cfg802=
11_sar_chan_ranges - sar frequency ranges
> include/net/cfg80211.h:1759: warning: Cannot understand  * @struct cfg802=
11_sar_chan_ranges - sar frequency ranges
>  on line 1759 - I thought it was a doc line
> include/net/cfg80211.h:1759: warning: Cannot understand  * @struct cfg802=
11_sar_chan_ranges - sar frequency ranges
>  on line 1759 - I thought it was a doc line
> include/net/cfg80211.h:1759: warning: Cannot understand  * @struct cfg802=
11_sar_chan_ranges - sar frequency ranges
>  on line 1759 - I thought it was a doc line
> include/net/cfg80211.h:1759: warning: Cannot understand  * @struct cfg802=
11_sar_chan_ranges - sar frequency ranges
>  on line 1759 - I thought it was a doc line
> include/net/cfg80211.h:1759: warning: Cannot understand  * @struct cfg802=
11_sar_chan_ranges - sar frequency ranges
>  on line 1759 - I thought it was a doc line
> include/net/cfg80211.h:1759: warning: Cannot understand  * @struct cfg802=
11_sar_chan_ranges - sar frequency ranges
>  on line 1759 - I thought it was a doc line
> include/net/cfg80211.h:1759: warning: Cannot understand  * @struct cfg802=
11_sar_chan_ranges - sar frequency ranges
>  on line 1759 - I thought it was a doc line
> include/net/cfg80211.h:1759: warning: Cannot understand  * @struct cfg802=
11_sar_chan_ranges - sar frequency ranges
>  on line 1759 - I thought it was a doc line
> include/net/cfg80211.h:1759: warning: Cannot understand  * @struct cfg802=
11_sar_chan_ranges - sar frequency ranges
>  on line 1759 - I thought it was a doc line
> include/net/cfg80211.h:1759: warning: Cannot understand  * @struct cfg802=
11_sar_chan_ranges - sar frequency ranges
>  on line 1759 - I thought it was a doc line
> include/net/cfg80211.h:1759: warning: Cannot understand  * @struct cfg802=
11_sar_chan_ranges - sar frequency ranges
>  on line 1759 - I thought it was a doc line
> include/net/cfg80211.h:1759: warning: Cannot understand  * @struct cfg802=
11_sar_chan_ranges - sar frequency ranges
>  on line 1759 - I thought it was a doc line
> include/net/cfg80211.h:5073: warning: Function parameter or member 'sar_c=
apa' not described in 'wiphy'
>=20
> Introduced by commit
>=20
>   6bdb68cef7bf ("nl80211: add common API to configure SAR power limitatio=
ns")

I am now getting these warnings from Linus' tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/PBT5w0wR/wDCf5dmzBDI.Rk
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl/f+kcACgkQAVBC80lX
0Gxp3Qf+KzvC9l3OkBEFPLQG+B8V3BnN/x2g+Ei22tisJ4xTjla/RQ2+HaOEB7ua
HrhvoVilOYLe3Di0TCxLQHpSy3MeY2qHi9SksBtNnrtzatwbAj0jKVhlv+1/eGYq
5YHqIyXqhkgnSTrCu1+4gJPp4UCs3oAGzwlXVEfSZ9+fQ8sZ4G5t7THQHPcxcSdd
zRVX3d+vld8ddqNGeSt/9OsxaTMI1j3OZRP6KqAv3H1HzEb161e3q4aXGsFNMfk0
buST7KOnxQRuLMdfVv3y8TBGzG7IAxBmvcRYtUiJyL04N5sGkHv2JIH3VywAnzrZ
x9ficRZ6pZobHG2jyqdquxz/NTO3iQ==
=rnOv
-----END PGP SIGNATURE-----

--Sig_/PBT5w0wR/wDCf5dmzBDI.Rk--
