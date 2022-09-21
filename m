Return-Path: <linux-next-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 47C30C6FA82
	for <linux-next@archiver.kernel.org>; Wed, 21 Sep 2022 00:53:53 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229624AbiIUAxw (ORCPT <rfc822;linux-next@archiver.kernel.org>);
        Tue, 20 Sep 2022 20:53:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34248 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229599AbiIUAxv (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 20 Sep 2022 20:53:51 -0400
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AC30B79637;
        Tue, 20 Sep 2022 17:53:47 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4MXKfZ0GkDz4xGG;
        Wed, 21 Sep 2022 10:53:41 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
        s=201702; t=1663721622;
        bh=MYiu+s3OeBKd3nNk+MFnM9wVMRP+fbojbJFcGIJwzQE=;
        h=Date:From:To:Cc:Subject:From;
        b=KsK9X9o4fuxiHmuG7OEE4R2TDEuQjFrSq0dJu93TQv2CM3j7a5fPjeF2XJG+WIFNP
         w+iUFW8qrqoMe+HlYlieydgxOgB6pJO4IoSWLjWIHN9NVTRqSCxqcpghwdZyEBcxxg
         OJPArFcnIlFt8evRrIOqzkuXq+AI6J4Qn4QAkvZHW8Trv1giW7WfT69nnY4UA0BhZT
         vVQ+y334k8YUY+wyEiDhCvwtqmVBvSp7xCo79z8Ad8tJnTCBOgFVJm+apIQgAHNKCc
         Wc/0zimWm7xZznFEbJROtcRRwb406CEiApwelmxAzN0xWLrLSBqExIVXINk9WST1/v
         4JjDwn3+f5hOQ==
Date:   Wed, 21 Sep 2022 10:53:37 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     David Miller <davem@davemloft.net>
Cc:     Networking <netdev@vger.kernel.org>,
        Francesco Dolcini <francesco.dolcini@toradex.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, Wei Fang <wei.fang@nxp.com>
Subject: linux-next: manual merge of the net-next tree with the net tree
Message-ID: <20220921105337.62b41047@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/GKIy3cO/TxJifJRDSQPbg+Y";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/GKIy3cO/TxJifJRDSQPbg+Y
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the net-next tree got a conflict in:

  drivers/net/ethernet/freescale/fec.h

between commit:

  7b15515fc1ca ("Revert "fec: Restart PPS after link state change"")

from the net tree and commit:

  40c79ce13b03 ("net: fec: add stop mode support for imx8 platform")

from the net-next tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc drivers/net/ethernet/freescale/fec.h
index a5fed00cb971,dd055d734363..000000000000
--- a/drivers/net/ethernet/freescale/fec.h
+++ b/drivers/net/ethernet/freescale/fec.h
@@@ -639,6 -641,15 +642,8 @@@ struct fec_enet_private=20
  	int pps_enable;
  	unsigned int next_counter;
 =20
 -	struct {
 -		struct timespec64 ts_phc;
 -		u64 ns_sys;
 -		u32 at_corr;
 -		u8 at_inc_corr;
 -	} ptp_saved_state;
 -
+ 	struct imx_sc_ipc *ipc_handle;
+=20
  	u64 ethtool_stats[];
  };
 =20

--Sig_/GKIy3cO/TxJifJRDSQPbg+Y
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmMqYJEACgkQAVBC80lX
0GxcfQf/dI8QcD5v0qxaOm3B538bZTjUBhAXhzaA8ghgw0fI6f+36V/8+GtOxA/M
XNUcTywy2t7r06Z+Dvz/P3hgnjtCITYdT42299eyO50cJrT0aNcrYYA7o9dYcIVV
OjJ9F28uqGbJosDK9kymxcUQVNDXc1WVsZ/7i58KomS7IS+8Lv7fE4JPVcQzhFAA
6cy4PQChhbTQtwjQn2jIpGAaQBAbYnsOnts0EUFqyyE8OHEgkyQUXoJ/maJRLerD
NLS+HS29lpBo19JNrqrndCrccVmxINdsx5s9Wg3cY4MtSayj0VHKL8gAMAmEVsxi
Gk9W63epwWTXvDWFw5iwwxP6Saa9Eg==
=nrEK
-----END PGP SIGNATURE-----

--Sig_/GKIy3cO/TxJifJRDSQPbg+Y--
