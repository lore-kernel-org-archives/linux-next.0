Return-Path: <SRS0=/h+o=XZ=vger.kernel.org=linux-next-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A4AD0C32792
	for <linux-next@archiver.kernel.org>; Mon, 30 Sep 2019 21:39:18 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 7535B20815
	for <linux-next@archiver.kernel.org>; Mon, 30 Sep 2019 21:39:18 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="TQr1qHjz"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726504AbfI3VjS (ORCPT <rfc822;linux-next@archiver.kernel.org>);
        Mon, 30 Sep 2019 17:39:18 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:47369 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726314AbfI3VjR (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 30 Sep 2019 17:39:17 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 46hwlQ3SQhz9sNF;
        Tue,  1 Oct 2019 07:39:14 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1569879554;
        bh=ssa4rHOoce+FRuNeCxxrQdnx1dGiWsjlaEbqrBZY88w=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=TQr1qHjz16DfdYuD4JluzS0Xy0lR6OV9bc2OzwL5gxgzMhCdmYWnBLgkYvS0Lrdqh
         XzdR6StskvH6qgvch8FzwPmhmY5ytBEiL0LPsyZLqWUFnjCLvuSY2JYuRGR8BrzorP
         NDZph4FODShawMHToEV6nTI+9GSkWSGrUfIiBQxKPBSyG5P1Hu5QFC09MuBTFhzPsv
         ynoePNCacbXOTa7ul5myNr+0AavjbE2QVCLfY0aQ5OTl8ssEKmubLumKX8cb2Orgj3
         +wnh7jQFL8IyFjPHYXKFwAVg/lL7/GWDGu6fuCfLpYw8VohBrppAXAFNijm2scvH3w
         ZYvJdOs3D4ZyA==
Date:   Tue, 1 Oct 2019 07:39:13 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Shuah Khan <skhan@linuxfoundation.org>
Cc:     Brendan Higgins <brendanhiggins@google.com>,
        Mark Brown <broonie@kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: Request to add linux-kselftest test branch
Message-ID: <20191001073913.256b5669@canb.auug.org.au>
In-Reply-To: <CAFd5g44bbh8cd=kfwLR2eFf0FRuO0d5-Mszo7P0JRLbs7e8CQw@mail.gmail.com>
References: <8b9795d2-a384-dec8-076c-5b9d5c524eba@linuxfoundation.org>
        <20190926150538.GS2036@sirena.org.uk>
        <e5af1cd1-be83-cf9e-c6c7-a5258d1b49a9@linuxfoundation.org>
        <CAFd5g44bbh8cd=kfwLR2eFf0FRuO0d5-Mszo7P0JRLbs7e8CQw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/PX.+8aPJYPET.76QfyrZvFc";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/PX.+8aPJYPET.76QfyrZvFc
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Shuah,

On Mon, 30 Sep 2019 10:05:28 -0700 Brendan Higgins <brendanhiggins@google.c=
om> wrote:
>
> On Thu, Sep 26, 2019 at 9:53 AM Shuah Khan <skhan@linuxfoundation.org> wr=
ote:
> >
> > On 9/26/19 9:05 AM, Mark Brown wrote: =20
> > > On Wed, Sep 25, 2019 at 01:30:15PM -0600, Shuah Khan wrote:
> > > =20
> > >> Please add the following linux-kselftest test branch to linux-next. =
=20
> > > =20
> > >> https://git.kernel.org/pub/scm/linux/kernel/git/shuah/linux-kselftes=
t.git/log/?h=3Dtest =20
> > > =20
> > >> please let me know if you have questions. =20
> > >
> > > OK, I've added that now - I did actually merge it in by hand
> > > yesterday too.  It looks like it's for kunit so I guess Brendan
> > > should be in the CC list for any issues too?  Hopefully Stephen
> > > will see these mails when he gets back but it's worth checking
> > > and following up to make sure that he picks it up after he gets
> > > back on the 30th. =20
>=20
> Just following up since Mark suggested that it might be a good idea to
> do so and it doesn't look like the linux-kselftest test branch is
> currently in next-20190930.

Brendan, thanks for the reminder.

I have added this tree form today and called it kunit, I hope that is
OK.

Is this meant to be the updates for the next merge window, or fixes for
the current releasel?  I ask because I notice that you also have a
"next" branch that Linus has merged for the current merge window.

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

--Sig_/PX.+8aPJYPET.76QfyrZvFc
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl2SdgEACgkQAVBC80lX
0Gys8Qf/cocA6LzgM5VVJOGFjus75Q63iQruHZ3gNrnagkW8ZIak2NwbUvTQ1e5z
QzCrILP8Anv6GUR7Ic/GkNYuMq3JqlDQEM9zTwep9NE91zQBwlggFAu0Bl+ItEry
pdJAKSqTpDH7gLvC47LXT2UiIS9CQAi2ULZ6drZzk2rujRbLHMo7mI5GgKw/zq3i
FntesSH04hdKKuRwHwquYZslEroTnPi8MtxOOSly7st/OlX3h9EltvjvQ36aehQY
krI0+++4t9OSRtlVWBUFGFrEJ+mXRXsgBIx7R2GNqybQNLD/P/4N6ZKeZ48WkRtY
cd0PXryMfOt6bG1W0YMT1AXUTNfYlg==
=Abq9
-----END PGP SIGNATURE-----

--Sig_/PX.+8aPJYPET.76QfyrZvFc--
