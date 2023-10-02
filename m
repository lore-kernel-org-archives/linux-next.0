Return-Path: <linux-next-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F3B5EE7491F
	for <linux-next@archiver.kernel.org>; Mon,  2 Oct 2023 21:24:36 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229671AbjJBVYh (ORCPT <rfc822;linux-next@archiver.kernel.org>);
        Mon, 2 Oct 2023 17:24:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45144 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229650AbjJBVYg (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 2 Oct 2023 17:24:36 -0400
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A8C7999;
        Mon,  2 Oct 2023 14:24:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
        s=201702; t=1696281872;
        bh=G4l6q0UgYoSotK/uTS34eAJwo5Z9oXNP+ysveSUxBXI=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=EWbSr0RBEAxQC8XoyZg08F1smbNufKj2ACXD9pO8frTZc4sjiNUeAa2aw3XS8lPaL
         fFgZUUVfYqQCZuYfoQexWPxmDbIeBwzGifv94iBk1I6plmxjf9xE3Jq5jMSq6DVBk9
         TzejHf8njhIk/6ZHkApBngq1o0axQEXcW0HQqjWbf8ddZZA3Pg2JUeDy7+UPMPL9Rk
         jCWj9gFiO7NdDqduxT6pTfJi7XJlf7qgkg7pJwzN2eI5Lm1+31STniY/NcZAnZ3FO+
         mcXsz/ryE0ypkrIqQQH42oaxOLMuzlBJSsXdUOBILaz0Pv3FGGRoGIVKMzhXCSDFU4
         q2HpAQrijUGSQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4Rzv9D2S3jz4xGT;
        Tue,  3 Oct 2023 08:24:31 +1100 (AEDT)
Date:   Tue, 3 Oct 2023 08:24:30 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Jan Kara <jack@suse.cz>
Cc:     Christian Brauner <brauner@kernel.org>,
        Kent Overstreet <kent.overstreet@linux.dev>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the vfs-brauner tree
Message-ID: <20231003082430.2e95925a@canb.auug.org.au>
In-Reply-To: <20231002112648.rn2o4dvifn7x4zle@quack3>
References: <20230928105443.1b1ad98c@canb.auug.org.au>
        <20231002112142.bfjj54ikijf4iwfr@quack3>
        <20231002112648.rn2o4dvifn7x4zle@quack3>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/VujK5u=A0mxf=bL/oA9rgMa";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/VujK5u=A0mxf=bL/oA9rgMa
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Jan,

On Mon, 2 Oct 2023 13:26:48 +0200 Jan Kara <jack@suse.cz> wrote:
>
> Oh, and one more note - Christian is on vacation this week so Stephen ple=
ase
> just revert the commit in the linux-next until he returns and updates his
> tree. Thanks!

Thanks for letting me know, I will do so.

--=20
Cheers,
Stephen Rothwell

--Sig_/VujK5u=A0mxf=bL/oA9rgMa
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmUbNQ8ACgkQAVBC80lX
0GzfMQgAkA1iyxu0E/VpkfPWIFpDHCNZYys/kxjhmWaTnLiY0wwls8amwglrzlRQ
6kUE+if159mOs3Y+He6qIGN4g2msAeEnQ1VwkyVUJ5pzVOOLb5MettiqybBcyyzK
JEmpmnNl1OGis2/SfSgRyN5rb/OvSLNqw3tGi86/eUWXif4XCmpCPTPGnh6vYCv2
gQvUvPD5Tbq/gUNNXMTKk1RMlo9UdrepFxnae/IjXgNzRTkLD7EdTX75KawYCsts
CoRaeCyTGUBgBJ3GlrKd/jhZhiElvRqDPR+TRcOIrCEeLwosQvruU6fDITLApKl4
g7VNOpMsUPI2MyVWRfSAS2L9VCmbHg==
=c/u+
-----END PGP SIGNATURE-----

--Sig_/VujK5u=A0mxf=bL/oA9rgMa--
