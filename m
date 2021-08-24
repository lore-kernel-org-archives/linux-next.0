Return-Path: <linux-next-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AA0CCC432BE
	for <linux-next@archiver.kernel.org>; Tue, 24 Aug 2021 10:53:50 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 8ACE3613AD
	for <linux-next@archiver.kernel.org>; Tue, 24 Aug 2021 10:53:50 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236488AbhHXKyd (ORCPT <rfc822;linux-next@archiver.kernel.org>);
        Tue, 24 Aug 2021 06:54:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55114 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236692AbhHXKyY (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 24 Aug 2021 06:54:24 -0400
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8838EC0613D9;
        Tue, 24 Aug 2021 03:53:33 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4Gv5Z20XCwz9ssD;
        Tue, 24 Aug 2021 20:53:29 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
        s=201702; t=1629802410;
        bh=HzOeN2jtvJOg0n3UQlLmjR7tG+1+HISt/x/U03rZakg=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=c0wa/FccQm+VcARa+ABE+9UqnMPo0VAAzUfnTSFL2i+KEHaSw0muKejNIdCSRSDun
         7uhvPH/f3epgc+ooAeP4wgfRSamMhjEl+/AjRL/kht0Gf3LWKemCKK/pvF48gwcJ73
         YvsOr4wHWXXVXPDcshZbWpND9WxZLDeoDMUmc7rpWQjll+y0J86wZ78iemEVBhw3xQ
         jkMJlQJZGFoGsGE3xKLab0Z8jsWlNabqrjtNq/qIalLMbKXvloAXKkGSpHx3w4hqWR
         DD7u+X31U3jlN3DCffRBJxZg4czyx3X5G39bN7pOu2mjAMEfSjamy30dYWtvgjMRaj
         1BEFDdtG1rpzw==
Date:   Tue, 24 Aug 2021 20:53:28 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Steven Rostedt <rostedt@goodmis.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build warning after merge of the ftrace tree
Message-ID: <20210824205328.12ddf116@canb.auug.org.au>
In-Reply-To: <20210823100007.71ce2ba9@oasis.local.home>
References: <20210823195804.10c5758a@canb.auug.org.au>
        <20210823100007.71ce2ba9@oasis.local.home>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/EqMYDG=NHMtaYbWtGksljEH";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/EqMYDG=NHMtaYbWtGksljEH
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Steven,

On Mon, 23 Aug 2021 10:00:07 -0400 Steven Rostedt <rostedt@goodmis.org> wro=
te:
>
> Does the below fix it?

Fixed it for me, thanks.

Tested-by: Stephen Rothwell <sfr@canb.auug.org.au>

--=20
Cheers,
Stephen Rothwell

--Sig_/EqMYDG=NHMtaYbWtGksljEH
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmEkz6gACgkQAVBC80lX
0Gxi4gf/abOq2grkQeAJQFvCaJOCc7RPiTJ+AB2nsGpd+ILJuI+dYETIRCeY7o4k
gtMTiGPdBrvUB0wCdGYfC0DBMuL1k0KzRYQimKArWqXh3s2XHoAgjf0oKAICTLPc
GdCUTrrGl7LR0qooXynOW9UJxwa5MfFX4sEvLYee1t+UQ3Jb/LKGOBzyVprPLcO1
MVMsNCYAySdfaVg14KPb6Sh/pjP4OWPfQSAaqlVRgUe2Ob51iOPnos/s3SjLhHvA
wRps8P18N8DlBZR5rQkAOA7/7MfU8Yxcf/uiI0Ado8sik4IHiTNVqg16ELMfqwIy
1/jgli7WONM19c3XCqwOYWdtaiaLHA==
=75Yx
-----END PGP SIGNATURE-----

--Sig_/EqMYDG=NHMtaYbWtGksljEH--
