From: Thierry Reding <thierry.reding@gmail.com>
Subject: linux-next fixes
Date: Fri, 1 Nov 2013 10:36:39 +0100
Message-ID: <20131101093638.GE27864@ulmo.nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="pY3vCvL1qV+PayAL"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-bk0-f52.google.com ([209.85.214.52]:63230 "EHLO
	mail-bk0-f52.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751380Ab3KAJgn (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Fri, 1 Nov 2013 05:36:43 -0400
Received: by mail-bk0-f52.google.com with SMTP id u14so1027138bkz.25
        for <linux-next@vger.kernel.org>; Fri, 01 Nov 2013 02:36:41 -0700 (PDT)
Content-Disposition: inline
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, Stephen Warren <swarren@wwwdotorg.org>, Olof Johansson <olof@lixom.net>


--pY3vCvL1qV+PayAL
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Stephen,

There have been some discussions lately revolving around the topic of
linux-next fixes. That is, commits that people come up with over the
course of a day to fix issues found in the latest linux-next trees.

It's a fact that many people rely on linux-next for everyday work, so
whenever things break in linux-next a lot of people end up chasing the
same bugs and posting the same patches (or not posting them for that
matter).

A lot of developer time is wasted that way, so I originally proposed
that we could set up a separate linux-next-fixes tree where we collect
patches of interest. I volunteer to do that, since, well, I'm doing it
anyway as part of my daily routine. Timezone-wise it also fits pretty
well, since I usually start my day sometime around when you publish
linux-next.

If we can establish a canonical location where such fixes are
accumulated, people could fetch those at the same time they fetch the
linux-next tree and automatically get fixes.

One idea was to carry those fixes within the linux-next tree, within
separate tags (next-YYYYMMDD-fixes). If you don't feel comfortable with
that I suppose we could also set up a separate repository. It that case
I think it would still make sense to run it as part of the "Linux Next
Group" on kernel.org.

What do you think? If it's something you'd be okay with I can contact
the administrators to have me added to the linux-next group.

Thierry

--pY3vCvL1qV+PayAL
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iQIcBAEBAgAGBQJSc3YmAAoJEN0jrNd/PrOhUCoP/jXRiv4lVk1k58nWKuG51mdy
d3WeNbEJ2Db+yk7rVdzrCHp4wmN9gSIFCQn/7XuBSOm0YQ8hx6pE1DLurjs9KVvH
WRnS3nHbxsxNPJItWxA4XgUNZaBmsGiO65BBrO87kxnsJMaKKHMqE2Bbs3Z3pzq+
ihDbj4OIDduepf3tURGP0D4Ndj+GVJ8YilOLEE2YAyDW4IqDjq0PTh3qVUmeH8gl
ZGKqHVriVuoEcJBhq2f339lnYYR8vdFrt+LDOV209zRk8jjKA4uDnHhZh1pV+ZtI
85NCMPw3K8EW5py5DKjRMnAXJPJBh8NLfqfn+Pkzy08eDtAXpGsI3drkUC0tT3Pu
8/2DpL85MSz2TULHY6IPBry3VDelUH1jp5Yz14Gcelhw5HA/Kk0jXgKFimDLKP2y
ViCBqe3AGetnhMPxJ4uXC4zcLgs/eruyMPPvtqpG6OV4hnR3yMjmsmc2Ax1tU+q8
Yat6q+VvT5Rqb0JHojnv7aVWwI/DFvXI0S31x3RCiVBlCiEzO2pLof8xjvQlrM8K
UZsHVYsanjqEl5+PRYgAtDNuPMzgIufC43f/UekkAgD+pCjgeGpwBwFi4tI/mz4E
VXdaYKC90P+R/J7Ae8Pknx+lwaA2B0WkdVoD3Y55ws+aR3P3Oi1KEBfFtUo1b2qK
qHvV3J/b5NZ5Y42Aq2Wo
=tqr1
-----END PGP SIGNATURE-----

--pY3vCvL1qV+PayAL--
