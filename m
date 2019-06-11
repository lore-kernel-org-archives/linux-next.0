Return-Path: <SRS0=lqV3=UK=vger.kernel.org=linux-next-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 17A04C31E44
	for <linux-next@archiver.kernel.org>; Tue, 11 Jun 2019 21:24:08 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id D8A9E2086A
	for <linux-next@archiver.kernel.org>; Tue, 11 Jun 2019 21:24:07 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="AerbBfo2"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387878AbfFKVYH (ORCPT <rfc822;linux-next@archiver.kernel.org>);
        Tue, 11 Jun 2019 17:24:07 -0400
Received: from ozlabs.org ([203.11.71.1]:41809 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2387764AbfFKVYH (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 11 Jun 2019 17:24:07 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 45Njg76vsjz9s3l;
        Wed, 12 Jun 2019 07:24:03 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1560288244;
        bh=9rjufHApJRAldRXg70H3MtYGdEDXkpTXARFGRxLzusk=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=AerbBfo2YG9/xWuxq++wdBOVOpqoKEX0UAK1xYbk0EzceLS552eAOrulIWkgmXwyD
         E+fkydl+vRx6p1GkQ8w5KyPMV2O3tthNcdmunBzJSmN4kvX9i46wfhO330FwMy7F2A
         M7o2e70RqXWFzwAxffHi2sAYw3TTFougaAtK/Qb+XawwYbttvgJZcPl0Uqu2BeLn/l
         O66YpHokL+I1dnSFCOze4RbRLNXfu/WCDhsqjaufly2hwA7Ipw1ifXhyN47NKVB+kp
         oJx4y0t7sIrkVI3Df2f0KigU9h27dwMHFumTe8XF/EwnRhDpIy1psHVoHbyMqS5Qkr
         NmMmu3Hw5+r0A==
Date:   Wed, 12 Jun 2019 07:23:49 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Sudeep Holla <sudeep.holla@arm.com>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        ARM SoC Team <arm@kernel.org>,
        Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
        Liviu Dudau <liviu.dudau@arm.com>
Subject: Re: linux-next: inclusion of my tree for early testing
Message-ID: <20190612072349.593c521f@canb.auug.org.au>
In-Reply-To: <20190611170646.GB27548@e107155-lin>
References: <20190611170646.GB27548@e107155-lin>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/JenPgb99iP_99kvltfU=oGW"; protocol="application/pgp-signature"
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/JenPgb99iP_99kvltfU=oGW
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Sudeep,

On Tue, 11 Jun 2019 18:06:46 +0100 Sudeep Holla <sudeep.holla@arm.com> wrot=
e:
>
> I maintain SCMI(drivers/firmware/arm_scmi) and co-maintain vexpress
> and few other ARM Ltd platforms. I usually send pull request to
> ARM SoC team(Olof/Arnd/Kevin) to get the changes merged into mainline.
>=20
> Sometimes ARM SoC team are busy and may pull the changes quite late
> in the cycle. So similar to few other ARM platform sub-maintainers, I
> would like to add my branch which I intend to send pull request to ARM
> SoC to be added to linux-next so that it can get more testing.
>=20
> The repo and branch details as below:
>=20
> git://git.kernel.org/pub/scm/linux/kernel/git/sudeep.holla/linux.git for-=
linux-next
>=20
> Please add the same if you are fine with it.

Added from today.  I called it "scmi" for convenience (not to restrict
it content).

Thanks for adding your subsystem tree as a participant of linux-next.  As
you may know, this is not a judgement of your code.  The purpose of
linux-next is for integration testing and to lower the impact of
conflicts between subsystems in the next merge window.=20

You will need to ensure that the patches/commits in your tree/series have
been:
     * submitted under GPL v2 (or later) and include the Contributor's
        Signed-off-by,
     * posted to the relevant mailing list,
     * reviewed by you (or another maintainer of your subsystem tree),
     * successfully unit tested, and=20
     * destined for the current or next Linux merge window.

Basically, this should be just what you would send to Linus (or ask him
to fetch).  It is allowed to be rebased if you deem it necessary.

--=20
Cheers,
Stephen Rothwell=20
sfr@canb.auug.org.au

--Sig_/JenPgb99iP_99kvltfU=oGW
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl0AG+UACgkQAVBC80lX
0GzEOwf/VXUQCSZyYwwRlfnVp0l123OoAFFMNVpTr6AkyC7ZLPkomvmqPvhaBaQ0
IpzAe/IFDrpOQd76xXVnX/ysySNuRBv0R3MJj3a8tIT85azzLyFgPKMcsePXzUmw
XdNXmXKcpU99uOTzBsmOFuWFB2npn5hYXvFrn7/cKacHlIrWbmiiT6pnifv0Jd1V
hSwWSU6BNWpQAdVjP5aQKVDOkdl+hoYWp5vI0ZAqqRr2Jc95SfdblKxyB9dwv1Ov
U75OZZL+9Od2RRQQYJmz5/PmqvIUHGdrNUR3KR6nj717JssJS7KK7243hVyuUTKK
ZNgZrdZjRat7pA5njG5p2GHjF7VjUw==
=RPkT
-----END PGP SIGNATURE-----

--Sig_/JenPgb99iP_99kvltfU=oGW--
