Return-Path: <linux-next-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BA7D1CDB474
	for <linux-next@archiver.kernel.org>; Tue, 17 Oct 2023 04:37:28 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233862AbjJQEh2 (ORCPT <rfc822;linux-next@archiver.kernel.org>);
        Tue, 17 Oct 2023 00:37:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57918 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232701AbjJQEh1 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 17 Oct 2023 00:37:27 -0400
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1E87883;
        Mon, 16 Oct 2023 21:37:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
        s=201702; t=1697517440;
        bh=XuboyKcRDfv7qeC10HptIe0LloeAfZQqMj5QKhwXjzo=;
        h=Date:From:To:Cc:Subject:From;
        b=SmndHBoGXSbwhhxObOpJ1OkkRNbKnDfbO75+30JG4kJlS9Pf+nABOEeveIlTT3k8N
         jl+5RA+swKa/V4lGvX3eqyKNDFqBTqugsOfDltqw39hUwzuw4j1gIKM15FagA6Zy7F
         imQQ5HvFqx23/TMCpbpeAZ0Ko57Y89oSGsqjO/0r04KNCz0AhcP9cqtCwtp8EPKONE
         e+f57c2p0kBQu00W8WCah+5jQCRo7gp/M/oZzJyC97XT+Fq2HkxxbuaAySoEe2kBFT
         haxV07QBbeRIf5rQUcL11YBCgU4hHItiTPeXXRN6TKGwDxdN6WTvuL/98xhDM1/5Vn
         H7uqkM1WsvYzw==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4S8h684PK3z4xF9;
        Tue, 17 Oct 2023 15:37:20 +1100 (AEDT)
Date:   Tue, 17 Oct 2023 15:37:19 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Sean Christopherson <seanjc@google.com>
Cc:     Paolo Bonzini <pbonzini@redhat.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: duplicate patches in the kvm-x86 tree
Message-ID: <20231017153719.28884723@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/gkrt8ENSZ7oKWjLjGD1spJl";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/gkrt8ENSZ7oKWjLjGD1spJl
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

The following commits are also in Linus Torvalds' tree as different
commits (but the same patches):

  afb2c7e27a7f ("KVM: selftests: Force load all supported XSAVE state in st=
ate test")
  d7b8762ec4a3 ("KVM: selftests: Load XSAVE state into untouched vCPU durin=
g state test")
  ff0654c71fb6 ("KVM: selftests: Touch relevant XSAVE state in guest for st=
ate test")
  27526efb5cff ("KVM: x86: Constrain guest-supported xfeatures only at KVM_=
GET_XSAVE{2}")
  2d287ec65e79 ("x86/fpu: Allow caller to constrain xfeatures when copying =
to uabi buffer")

--=20
Cheers,
Stephen Rothwell

--Sig_/gkrt8ENSZ7oKWjLjGD1spJl
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmUuD38ACgkQAVBC80lX
0Gw4/AgAhTsDsNzHolULSaZLmoToiZJiDzs9DpRQynd92y9H3+jbvMfZ+0bBd9sH
Yv/o5XRGSL9fNkK3I70P9cBcPhOiEO8QhNA2/gnbQz+FywYBED4ul8HCRbmZIGG2
y7wLsvmdQGKlyCoscj/a8W/mJiO+k1mOnz7TG+Uc9ig/0105szQtnJzKVHvn4Ier
b/uG1Ih18udQrFmtViy5Qyxvp4iuqWruQYVmQ5loM0eGA/xsp04Y55fgNPkOVOO3
0UO+NlaxhfS4K0rmR5ccHX55DPtPZCDND5GAUfZ1aR4AHY5hez5fOBc5DJ4J7GbJ
w7pAmTRaLgUks3UREN+/zgEiyx6EaA==
=4grS
-----END PGP SIGNATURE-----

--Sig_/gkrt8ENSZ7oKWjLjGD1spJl--
