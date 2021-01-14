Return-Path: <linux-next-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7D851C433DB
	for <linux-next@archiver.kernel.org>; Thu, 14 Jan 2021 04:12:52 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 41646238E2
	for <linux-next@archiver.kernel.org>; Thu, 14 Jan 2021 04:12:52 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726198AbhANEMg (ORCPT <rfc822;linux-next@archiver.kernel.org>);
        Wed, 13 Jan 2021 23:12:36 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45340 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725875AbhANEMg (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 13 Jan 2021 23:12:36 -0500
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C2531C061575;
        Wed, 13 Jan 2021 20:11:55 -0800 (PST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4DGW914975z9sVy;
        Thu, 14 Jan 2021 15:11:49 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1610597512;
        bh=4j1AH0dFv8SDYXAoijRZaC8MIveHOHCuDv4tkIHyddU=;
        h=Date:From:To:Cc:Subject:From;
        b=GhFWiPouAaSWSaFDmxhmOd2uMtZSSaN3gKmU1CbWbsUhquf+3SIqTj/1ezduz00bN
         zwrN7VwG8TwcWOjxNsefZsFqJwc8HmAmnhL9wp+4J64yDL1kZIXj8/BDlX/JjRuxRq
         eTGI2DmbCpEvRrZJcL71S0aSCs1+d2JGQe4dT2mZEuSTEDhXfd+72wLeE3yfsV06lk
         vMvZn+2C4/Gv43l8pPfBb/ylXA0pdXXxG9fh7suuVGk+rztULfa5x9foC3p6RMnABI
         4EfrsUVcXJ3JmAjZDg71e2lVG/MaiRgRZ98H1hl3XgmcQLzUds1Nfo67JZsOElJyt2
         HFiKmQeRDFQYA==
Date:   Thu, 14 Jan 2021 15:11:45 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>,
        "H. Peter Anvin" <hpa@zytor.com>,
        Peter Zijlstra <peterz@infradead.org>
Cc:     Borislav Petkov <bp@suse.de>,
        Yazen Ghannam <Yazen.Ghannam@amd.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build failure after merge of the tip tree
Message-ID: <20210114151145.328a142c@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/=qNf_k+kUuT2hcetXM2hTfi";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/=qNf_k+kUuT2hcetXM2hTfi
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the tip tree, today's linux-next build (x86_64 allnoconfig)
failed like this:

arch/x86/kernel/cpu/amd.c: In function 'bsp_init_amd':
arch/x86/kernel/cpu/amd.c:545:3: error: '__max_die_per_package' undeclared =
(first use in this function); did you mean 'topology_max_die_per_package'?
  545 |   __max_die_per_package =3D nodes_per_socket =3D ((ecx >> 8) & 7) +=
 1;
      |   ^~~~~~~~~~~~~~~~~~~~~
      |   topology_max_die_per_package

Caused by commit

  76e2fc63ca40 ("x86/cpu/amd: Set __max_die_per_package on AMD")

I have reverted that commit for today.
--=20
Cheers,
Stephen Rothwell

--Sig_/=qNf_k+kUuT2hcetXM2hTfi
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl//xIEACgkQAVBC80lX
0Gyx8wf+PC+oMA0w6Hz5gWiATG3VXLXXzxjvbs4wvweksR170Sq1mD77+1+wEoc3
ORWvi7oI2Hi+rY2WUaX7rqoily2zy06RwGJffSh72Bk/uNVSVDqks9vY2Iyjqwsz
1or6cfyXJgML2Qt0Z9EvcKtyGOotHpKxisEcY+zM1V/Bh8r+TT6I+3vpPZLB9Tcl
H5fwYPK46WXl/bmtfb5Zcu9SLMv82IWh5VgAbLfOKi+RUEtHHoSZcXW7oLbZCWTP
TNgucJJbDqqVKD5ZKncT3/w9kzf6Mrva5GgAhCieyDRu561Ds2uehNXthcNHTE2J
pAqA8haXdtXVMVsUhMrxqD+DiKzQEw==
=MZp7
-----END PGP SIGNATURE-----

--Sig_/=qNf_k+kUuT2hcetXM2hTfi--
