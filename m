From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the kvm-arm tree with the kvm tree
Date: Thu, 25 Sep 2014 15:32:01 +1000
Message-ID: <20140925153201.2e56229d@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/vm6=.C6Q4KQBjFY6+gnQtUH"; protocol="application/pgp-signature"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:57064 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750808AbaIYFcP (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 25 Sep 2014 01:32:15 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Christoffer Dall <cdall@cs.columbia.edu>, Marc Zyngier <marc.zyngier@arm.com>, Marcelo Tosatti <mtosatti@redhat.com>, Gleb Natapov <gleb@kernel.org>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Paolo Bonzini <pbonzini@redhat.com>, Eric Auger <eric.auger@linaro.org>

--Sig_/vm6=.C6Q4KQBjFY6+gnQtUH
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the kvm-arm tree got a conflict in
virt/kvm/eventfd.c between commit 29f1b65b5984 ("KVM: EVENTFD: Remove
inclusion of irq.h") from the kvm tree and commit 0ba09511ddc3 ("KVM:
EVENTFD: remove inclusion of irq.h") from the kvm-arm tree.

I fixed it up (I used the kvm tree version) and can carry the fix as
necessary (no action is required).
git diff
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

--Sig_/vm6=.C6Q4KQBjFY6+gnQtUH
Content-Type: application/pgp-signature; name=signature.asc
Content-Disposition: attachment; filename=signature.asc

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJUI6jWAAoJEMDTa8Ir7ZwVuZ0P+wcfuCeFUmE5o4zhEK4OZzZZ
UkXJ5kHjs8asGBs3xNe/vJ3Cd4mQCalNfJk46aeOllAE4NfW4uCdcgnvvQuzFTvC
QhV7D+lNWZoSCuFPdPbIzi0tnccqt9l+ZoC4SOgVgdEejV760N9EczW5jlOo+Hiv
GIS33Lx1ZCOpbfqPMfry94DmezKtmERFV0M44MsUq0TsLcP3U+sfaVLE4ZUb89Lr
35V5w82gkoSd11cY4I+ycwjNZ0Wfa5TlyDVeWm8CSC+UylVkpO4OkO1Z+tsfkNaH
k4j5dWUPCwjWqgBTRGunN9h8xcuc744IZ7VdkoC7ny5uL6xn5QTfLpb+oTU8Nmry
0WtU0U0jR0lLRgF8CATLcazzZDgzBRL7w83khMjMOTATKiFPCwt4Fk+Wj5HmwMcl
AdR0F263CuJyYbgL+rKP/mLZIUii7GY0L9M62CJarY61nFcg6CgZMRqZkaJ1Ibnu
djVjno4lD0bEUzKM5n+EpABYt1Wwhfq7YoSHA4anuthuRjuRNUUlfahRSgrWmOCl
J+lYiX2pk20bGRnpfS9unOutFTCBVsBGXUpJbL9VDOi9crPensECqve8WF41JoEW
3HzGiF8efvktfXVn/lIWm8oCXz0sfCn6IysBAhOB7RJJepQjzqijwrFFhpSZF4ow
VH/ZsjmJkOO20HH/qIkP
=tXfV
-----END PGP SIGNATURE-----

--Sig_/vm6=.C6Q4KQBjFY6+gnQtUH--
