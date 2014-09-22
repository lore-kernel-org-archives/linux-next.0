From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build failure after merge of the kvm-arm tree
Date: Mon, 22 Sep 2014 14:06:45 +1000
Message-ID: <20140922140645.7c2ad9c8@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/rPnD0DCrgG_QuSZzGsCY1/y"; protocol="application/pgp-signature"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:46154 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750723AbaIVEGx (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 22 Sep 2014 00:06:53 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Christoffer Dall <cdall@cs.columbia.edu>, Marc Zyngier <marc.zyngier@arm.com>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Eric Auger <eric.auger@linaro.org>

--Sig_/rPnD0DCrgG_QuSZzGsCY1/y
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the kvm-arm tree, today's linux-next build (x86_64 allmodconf=
ig)
failed like this:

arch/x86/kvm/../../../virt/kvm/eventfd.c: In function 'kvm_register_irq_ack=
_notifier':
arch/x86/kvm/../../../virt/kvm/eventfd.c:493:2: error: implicit declaration=
 of function 'kvm_vcpu_request_scan_ioapic' [-Werror=3Dimplicit-function-de=
claration]
  kvm_vcpu_request_scan_ioapic(kvm);
  ^

Probably caused by commit 0ba09511ddc3 ("KVM: EVENTFD: remove inclusion
of irq.h").

I have used the kvm-arm tree from next-20140919 for today.
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

--Sig_/rPnD0DCrgG_QuSZzGsCY1/y
Content-Type: application/pgp-signature; name=signature.asc
Content-Disposition: attachment; filename=signature.asc

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJUH6BaAAoJEMDTa8Ir7ZwVYrcP/it/1+Tm2sEyL4pChioepPUo
Nh4NFHpsgyT5s3H/S6qHl4Dnquk97Yco+MVNULVhSA92U6g6t7xllNXI4Vrp5Q0f
bUeeMtnW8JqGGZHR52Rq99D+t0s/AfwU8NGUBNI7ScP60XnkXksCk2aUjK9f6JuB
QkLRLIOe8KgOzyqxz7nuoydwje53yIuqPFbbWoV112Kb/V5L0bnTMtxpscn7AusH
TGhLtMLOq655J+1HthxPqNqYQc4DmW7+K3cPiBOkM9vkDuLEzHHs38zpR3YyKIip
XpDVM3YlVnxYeJKATvG0TUvAv2P95j5/AC9KdqFjSd0zLRnNPf3Yh/RTO/e0wIwo
iQmtjjz2sdk6uWMGnpLA4XTszAS08Y+yRRPBXBDLib1o8wFo/NKXm5RndKWvYnkh
FX4gHsIPHo8GQnuJxq/oxis6qGnBGdP17OcB7OFVzGiaBARB/XCLoXsOjNfeG5Uo
vLRC1r4mpCqetyp1LVSicfjev1sccJF3kQ3gBgaI/4O0vVIHmK/e73OQWYD1RyWu
54E9gBF3BpZ31lz9hEBXebPkKnWCUUOHVKNHdRRt/AdMc+1Us2fB3ptrIrq32Ig2
I+vseW1uK87JUJYN2HaR3/UAxlQlBo2Rk32zfF1lAnSQBs/kyAeF5YXG1X6kzrkc
3wdCtcokDdjUYhErA6y4
=Aapl
-----END PGP SIGNATURE-----

--Sig_/rPnD0DCrgG_QuSZzGsCY1/y--
