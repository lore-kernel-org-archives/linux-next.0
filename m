Return-Path: <SRS0=9mSK=VF=vger.kernel.org=linux-next-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 60764C606C1
	for <linux-next@archiver.kernel.org>; Mon,  8 Jul 2019 15:35:33 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 3007921537
	for <linux-next@archiver.kernel.org>; Mon,  8 Jul 2019 15:35:33 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="euW+MCES"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729123AbfGHPfc (ORCPT <rfc822;linux-next@archiver.kernel.org>);
        Mon, 8 Jul 2019 11:35:32 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:56399 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2390631AbfGHPf3 (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 8 Jul 2019 11:35:29 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 45j8fP1132z9sSR;
        Tue,  9 Jul 2019 01:35:24 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1562600126;
        bh=vxyFLSfBBJH3Y7Nv3aQfVqUUWv+pTXtM/NKogMH9qnM=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=euW+MCESXPYou4FtkhvyThpXXET7NbT8ySOU71wo7oL2nKP2wB8DWLzcDKoLm0pkz
         JZ+4DlJwZzaKNc4k5RMASCxfI/Vg3AXQtWKMp/ASmNrOYcxSJzN5lcZlhbe57P6iLu
         a09EHfTChTBZZS86N9B8oGfaCy3lsBT7ll+wf2oighG9jD0QcDWls3D06Z07I/mtwC
         6ICU3UeAon/W3ov9YNqL4Z+VpJY71CA8YksURZaUCLPvssrLiNYdvGdAnE3u7m7TD6
         x8Jz5pNgRMzTyXOt63xFdh+ok0ThKHgE2iWqcQgzqf7kp5tZ/aTa3fXzjc2090db9L
         3jeB7hEyxDDkw==
Date:   Tue, 9 Jul 2019 01:35:22 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     "Kuehling, Felix" <Felix.Kuehling@amd.com>
Cc:     Alex Deucher <alexdeucher@gmail.com>,
        Jason Gunthorpe <jgg@mellanox.com>,
        "Yang, Philip" <Philip.Yang@amd.com>,
        Dave Airlie <airlied@linux.ie>,
        "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
        "linux-mm@kvack.org" <linux-mm@kvack.org>,
        "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>,
        "Deucher, Alexander" <Alexander.Deucher@amd.com>
Subject: Re: [PATCH 1/1] drm/amdgpu: adopt to hmm_range_register API change
Message-ID: <20190709013522.060423df@canb.auug.org.au>
In-Reply-To: <233ad078-50da-40ed-fb35-c636ed3a686d@amd.com>
References: <20190703015442.11974-1-Felix.Kuehling@amd.com>
        <20190703141001.GH18688@mellanox.com>
        <a9764210-9401-471b-96a7-b93606008d07@amd.com>
        <CADnq5_M0GREGG73wiu3eb=E+G2iTRmjXELh7m69BRJfVNEiHtw@mail.gmail.com>
        <20190708093020.676f5b3f@canb.auug.org.au>
        <233ad078-50da-40ed-fb35-c636ed3a686d@amd.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/Rz_UKoCs8b6c77s_a244mIn"; protocol="application/pgp-signature"
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/Rz_UKoCs8b6c77s_a244mIn
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Felix,

On Mon, 8 Jul 2019 15:26:22 +0000 "Kuehling, Felix" <Felix.Kuehling@amd.com=
> wrote:
>
> Thank you! Who will be that someone? It should probably be one of the=20
> maintainers of the trees Linux pulls from ...

That would be Dave (pushing drm) or Jason (pushing hmm), or both.

--=20
Cheers,
Stephen Rothwell

--Sig_/Rz_UKoCs8b6c77s_a244mIn
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl0jYroACgkQAVBC80lX
0GwppAgAmx7mlSoT2O2hM17aTOjMDvnqgZyqhmFembgdQk3DEyWJR3LOiZL/CgM6
iYn8A7GbtcH8vNwWB/eynjJHALs2jPcVqWu69kYAoPhDvRPNvpc6/ddaSrOKsb52
3z9K4sXwA8L9t9H0LrgSB2Bs34yL3XvULPB34Xf8V7iAnyQVx+WQ4EVTfjITxoXQ
Mx3oIqRGQ2u5qk7qPfCTCMDxIDRn7nR1qJVSqY1hLu2vnkXpbbKxKk8EEf0A21Ao
T/AqVkClnADvpfhGMAoWeXyVOFCEocpNgm6elo2+EtE8YbVNUeKXbapNg+OW4xyF
3QBceqlPmSiTGaEu3+1WJmlcJKsR3g==
=Joh7
-----END PGP SIGNATURE-----

--Sig_/Rz_UKoCs8b6c77s_a244mIn--
