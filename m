Return-Path: <linux-next-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9CE7EC432BE
	for <linux-next@archiver.kernel.org>; Mon, 23 Aug 2021 10:00:07 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 7B173610D1
	for <linux-next@archiver.kernel.org>; Mon, 23 Aug 2021 10:00:07 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232867AbhHWKAs (ORCPT <rfc822;linux-next@archiver.kernel.org>);
        Mon, 23 Aug 2021 06:00:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51836 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232850AbhHWKAs (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 23 Aug 2021 06:00:48 -0400
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 11627C061575;
        Mon, 23 Aug 2021 03:00:06 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4GtSQr0vvpz9sW8;
        Mon, 23 Aug 2021 20:00:03 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
        s=201702; t=1629712804;
        bh=iOxZucM/jvrqfqLzx0E/nqEw1cs3rrcmHG5ux3LdxYM=;
        h=Date:From:To:Cc:Subject:From;
        b=lDRGu7rfOu1/+Ihx/1x+0k5KGmLM8v59OW1EcrxJ0I03RwaYcIRobJdL0xxOr/J4b
         ezUsI09xFmQeRxrMTCiGhXa7t+zJ/1p7yGyQq9Fk9AXZxOhKblVW+nA0BQ/lcLiwxy
         JgFXogUdwYrNr9x+VPH9rEOViCH7t4R6WAztKlCDXVhdMRWhnStnNGX7ZIfBrKMNd0
         5GvIWcb7hZv0zo9ouv3i5icHtRxCea/B2aMnprRo+khyfi2RkUJli7wvpY+lgVmLMX
         7pEf/+0E85LjcS3kdmZsQaeHITQNMAuTHqSG8WkO/N1oRzUs57JT5La8CT4kBtZDJ/
         +gHJIV+n43pmg==
Date:   Mon, 23 Aug 2021 20:00:02 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Takashi Iwai <tiwai@suse.de>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build warning after merge of the sound tree
Message-ID: <20210823200002.45fbc553@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/hB3/nWWQEpLWGuUaggCaU1T";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/hB3/nWWQEpLWGuUaggCaU1T
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the sound tree, today's linux-next build (htmldocs)
produced this warning:

Documentation/sound/alsa-configuration.rst:2258: WARNING: Unexpected indent=
ation.

Introduced by commit

  a39978ed6df1 ("ALSA: doc: Add the description of quirk_flags option for s=
nd-usb-audio")

--=20
Cheers,
Stephen Rothwell

--Sig_/hB3/nWWQEpLWGuUaggCaU1T
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmEjcaIACgkQAVBC80lX
0Gz3yAf8Cd2mHmmxUlV5EtmBDyvRggKdy5JIbVf7vdEcZX7hfZJvZRMAjJfVBfUI
m/N3xBu+6mVkADaAlfOKoPLaxk2GcJgKhoipfHa+AzaNBqZ+v8rUh/CbsNRhhKSO
7hfOV8FtEAk3quZDrXxwAGuTlr+L1q9/R+muOiVTWIA01qZR6XwSbVgYJeHAbC9I
RO4xs5sohyBpgiz+i8SojSBKfV6PzhS62GvgEQDRVPDRp0KunIqvnmxQ8Enbtr0X
J6zz2Kx5KGxcSLD6cXZkLALmVFyxYfZsG6OzLUIxpcDdYKadwXILUabHOyNTh2Bq
2g5YmipT+bpql0qr7TcRuGwEIq4Qrw==
=pTGQ
-----END PGP SIGNATURE-----

--Sig_/hB3/nWWQEpLWGuUaggCaU1T--
