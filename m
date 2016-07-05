From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: process question - linux-next conflicts
Date: Tue, 5 Jul 2016 23:36:34 +1000
Message-ID: <20160705233634.55d802c3@canb.auug.org.au>
References: <20160705130124.GA18622@osadl.at>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:37981 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S932860AbcGENgg convert rfc822-to-8bit (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 5 Jul 2016 09:36:36 -0400
In-Reply-To: <20160705130124.GA18622@osadl.at>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Nicholas Mc Guire <der.herr@hofr.at>
Cc: linux-next@vger.kernel.org

Hi Nicholas,

On Tue, 5 Jul 2016 13:01:24 +0000 Nicholas Mc Guire <der.herr@hofr.at> =
wrote:
>
>  linux-next daily tree mails include information on conflicts like=20
>=20
>  "The drm-misc tree gained a conflict against Linus' tree."
>=20
>  and if one looks at these email-reported conflicts they are quite
>  inffrequent, e.g. March 2016 range from 0-5 with a mean of about 1.5=
,
>  but the plots on http://neuling.org/linux-next-size.html for=20
>  conflicts show significantly higher numbers, again March 2016
>  range between aprox. 10 and 75 with a mean of aprox. 40 - so I=C2=B4=
m=20
>  mixing up something here - are the plots refereing to different=20
>  conflicts or am I just interpreting the e-mail notes incorectly ?

The graphs show the total number of conflicts you would get if you did
the merges of all the trees from scratch on any one day.  But I only
report new conflicts each day.

--=20
Cheers,
Stephen Rothwell
