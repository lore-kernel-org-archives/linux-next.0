Return-Path: <linux-next-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A6589C4332F
	for <linux-next@archiver.kernel.org>; Mon, 13 Nov 2023 20:51:45 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229711AbjKMUvr (ORCPT <rfc822;linux-next@archiver.kernel.org>);
        Mon, 13 Nov 2023 15:51:47 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48824 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229677AbjKMUvq (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 13 Nov 2023 15:51:46 -0500
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8A2E5D57;
        Mon, 13 Nov 2023 12:51:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
        s=201702; t=1699908699;
        bh=jkM/entJp8ZNxZcqkCfrr3msi5mZ2vfKJlFf2iJ0tq0=;
        h=Date:From:To:Cc:Subject:From;
        b=KxOr/GT/C1L5ks6XlRz5mAF1hb9pSRpJAVch1QIOiVEfiRb9tAKfbeCh1uSNiWp8w
         PYctNiBBWDjCbofb6t2GcxuTzHzbmnkgoIsAQKr4n6XAbVakOQa8YHzWWocx30aY9/
         w0MPR1L53+qMKy08cd+5yFtEmz4XCRDDFLw3zoNm0h68ucUGB/alO98wUDvrespLP0
         ht57zRtYJNYAghyORRQl1jjgvFdp4sADPFBkeeIXrARnk6pDRClqyzarqe0HP7wLf+
         9PZHG44vS6DPVOBFzjO/OjefpBYvHv4rKd6yIBXJWsJ++UC0QBK6MEoViTgQJMLFaj
         LZtjDKUENOREw==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4SThRv3Mmgz4wbk;
        Tue, 14 Nov 2023 07:51:39 +1100 (AEDT)
Date:   Tue, 14 Nov 2023 07:51:36 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: Signed-off-by missing for commit in the renesas tree
Message-ID: <20231114075136.3e164b4a@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/2TXcM+nHCSB5sUc.1bir5wZ";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/2TXcM+nHCSB5sUc.1bir5wZ
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Commits

  e443f05dfa8f ("arm64: dts: renesas: rzg2lc-smarc-som: Enable 4-bit tx sup=
port")
  ce2e1b36450e ("arm64: dts: renesas: rzg2l-smarc-som: Enable 4-bit tx supp=
ort")

are missing a Signed-off-by from their committer.

--=20
Cheers,
Stephen Rothwell

--Sig_/2TXcM+nHCSB5sUc.1bir5wZ
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmVSjFgACgkQAVBC80lX
0Gxw5Qf/UKBurLPu34z6cpCDtYH2Mf44aeSpPk853ZxI63Dzl5PNF0RuXll0vK7J
O4UmqWrPsRxWevEEuvPTKPKlo441haFAfF+83a4ogw9ZnhYRFfiLDvOc9tTHeybj
+/jmc1irrXDKflBQwK8rlOlYsJUc4GacDIOkiwsanLhAHlhbeFIOvbE+cHa4PZGj
X7APN8gTYRa2z7+P6xssm1KWjfp4WwQVxenokrxKPFvtwDRJVsV72j6EuxLRqpGU
OGmRqp62pdwqZUWLsgM3HXvqK2Zl2NQajS50uOSGaJ94nY3GYoIIxR2mj1rgP5wt
4jtQXcNVIe0xITIkTCtZpdGPp50zlg==
=HeWQ
-----END PGP SIGNATURE-----

--Sig_/2TXcM+nHCSB5sUc.1bir5wZ--
