Return-Path: <SRS0=UEoh=C2=vger.kernel.org=linux-next-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5097CC433E2
	for <linux-next@archiver.kernel.org>; Thu, 17 Sep 2020 02:31:53 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 0F1B120715
	for <linux-next@archiver.kernel.org>; Thu, 17 Sep 2020 02:31:53 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="rzr9aEng"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726007AbgIQCbw (ORCPT <rfc822;linux-next@archiver.kernel.org>);
        Wed, 16 Sep 2020 22:31:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60472 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725886AbgIQCbv (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 16 Sep 2020 22:31:51 -0400
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E115CC061351;
        Wed, 16 Sep 2020 19:31:50 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4BsLZW4rKqz9sRf;
        Thu, 17 Sep 2020 12:31:47 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1600309909;
        bh=390y6I+DYM38qkkVXCcUkc6LlriptJwAccl9l3BvkgI=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=rzr9aEngQMP5agzlqO2vQstP9xUarpY7Y24jgCYeDFZjBHC00upkaKyVMt/7Ts6E3
         kknawMhaiPzO7unlf5UbJzykgXcEmorP5ww2zMy8rYPibDJ4B35Z9y0fpordI4eqTK
         fLUh37f8WEbc9jEEob3MumCwLVjDm+ZhabyxUldCzF5woebiskKm3VT54MaOx6mLF2
         us904viYiCk4++CoQfxXECtBOr81Vz2deN70iHGlh3ljZg/ltBrPaSk5exWRENMJm8
         CcmpoJJ+c1yRsLNNtWeypZgIujZ6ytZ9JxUKSxeASE2eK0aSGnBJZalC0xBn02hdZu
         U6DI67nWLHLXg==
Date:   Thu, 17 Sep 2020 12:31:46 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     peterz@infradead.org
Cc:     Qian Cai <caiqian@redhat.com>, Qian Cai <cai@redhat.com>,
        Boqun Feng <boqun.feng@gmail.com>,
        "Ahmed S. Darwish" <a.darwish@linutronix.de>,
        Ingo Molnar <mingo@redhat.com>, Will Deacon <will@kernel.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        "Sebastian A. Siewior" <bigeasy@linutronix.de>,
        "Paul E. McKenney" <paulmck@kernel.org>,
        Steven Rostedt <rostedt@goodmis.org>,
        LKML <linux-kernel@vger.kernel.org>, linux-next@vger.kernel.org,
        Waiman Long <longman@redhat.com>
Subject: Re: [PATCH v2 0/5] seqlock: Introduce PREEMPT_RT support
Message-ID: <20200917123146.1ddc2f6d@canb.auug.org.au>
In-Reply-To: <20200916130233.GS2674@hirez.programming.kicks-ass.net>
References: <20200904153231.11994-1-a.darwish@linutronix.de>
        <224bd11b533dd2acff3f6cce51ab4ca676eb4f9f.camel@redhat.com>
        <20200915124817.GA127490@debian-boqun.qqnc3lrjykvubdpftowmye0fmh.lx.internal.cloudapp.net>
        <20200915143028.GB2674@hirez.programming.kicks-ass.net>
        <32bfdec1ad4e11cfecd840e1b83d95ba2bab1abc.camel@redhat.com>
        <20200916125402.GR2674@hirez.programming.kicks-ass.net>
        <1750732498.13475000.1600261259894.JavaMail.zimbra@redhat.com>
        <20200916130233.GS2674@hirez.programming.kicks-ass.net>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/ZJigch=EJZvUj24UONED_0g";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/ZJigch=EJZvUj24UONED_0g
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Wed, 16 Sep 2020 15:02:33 +0200 peterz@infradead.org wrote:
>
> On Wed, Sep 16, 2020 at 09:00:59AM -0400, Qian Cai wrote:
> >=20
> >=20
> > ----- Original Message ----- =20
> > > On Wed, Sep 16, 2020 at 08:52:07AM -0400, Qian Cai wrote: =20
> > > > On Tue, 2020-09-15 at 16:30 +0200, peterz@infradead.org wrote: =20
> > > > > On Tue, Sep 15, 2020 at 08:48:17PM +0800, Boqun Feng wrote: =20
> > > > > > I think this happened because seqcount_##lockname##_init() is d=
efined
> > > > > > at
> > > > > > function rather than macro, so when the seqcount_init() gets ex=
pand in =20
> > > > >=20
> > > > > Bah! I hate all this :/
> > > > >=20
> > > > > I suspect the below, while more verbose than I'd like is the best
> > > > > option. =20
> > > >=20
> > > > Stephen, can you add this patch for now until Peter beats you to it=
? =20
> > >=20
> > > Did you verify it works? I only wrote it.. =20
> >=20
> > Yes, I did. =20
>=20
> Excellent, I'll stick a Tested-by from you on then.

I'll add this into the tip tree merge today (unless the tip tree is
updated in the mean time).

--=20
Cheers,
Stephen Rothwell

--Sig_/ZJigch=EJZvUj24UONED_0g
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl9iypIACgkQAVBC80lX
0Gy1zggAjI2K6Kl9QkLwo+d/njeP3TD356LUn4zvKepNoeRA0/Wz9TWA4gRpaTzg
a28nOfWT3SNuuDSTxaw0/EAA6i1uBUSh0weJlsdwtO3B0Il/rzXRfJgfoCMJCd0a
CfhIWur6ceGx4y9+JY2lTV/ua4+lxqGofqKdA1U6bpWud3t9XGtJqUFn1NVFAYNd
1FOSw5aMISEPhiCGCH4dVTm855pgWGfH+9N5Cav75U01230Q8+ZCoMDCSdGqCrYf
ZvVH/RD/uxtGBdrUXW4EUt4i+XliTJyaY2kZzgyADcfB3SghfwmrhOQYoXURm3vV
iXH7/gv3r+uj+i4ZeoYnf+bsPWcf3g==
=sfKF
-----END PGP SIGNATURE-----

--Sig_/ZJigch=EJZvUj24UONED_0g--
