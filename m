From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the x86 tree
Date: Tue, 2 Sep 2008 11:32:10 +1000
Message-ID: <20080902113210.bc27a75f.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Tue__2_Sep_2008_11_32_10_+1000_tnFtDU5HJEbrX6Li"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:46879 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750912AbYIBBcX (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 1 Sep 2008 21:32:23 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>
Cc: linux-next@vger.kernel.org, David Woodhouse <dwmw2@infradead.org>

--Signature=_Tue__2_Sep_2008_11_32_10_+1000_tnFtDU5HJEbrX6Li
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the x86 tree got a conflict in
drivers/pci/intel-iommu.c between commit
213f841f903ed16fc1dd29885560cdd159630ed6 ("intel-iommu.c: Blacklist Intel
DG33BU motherboard") from the dwmw2 tree and commit
2ae21010694e56461a63bfc80e960090ce0a5ed9 ("x64, x2apic/intr-remap:
Interrupt remapping infrastructure") from the x86 tree.

I think the easiest thing to do for today is just to revert the change in
the dwmw2 tree and see if you guys can come up with a better patch for
tomorrow.
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Tue__2_Sep_2008_11_32_10_+1000_tnFtDU5HJEbrX6Li
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAki8l5oACgkQjjKRsyhoI8yRzgCgsvkejIE4mQ0w1F1+U6iPYB6u
AKwAnif/7J90CswuoTMnQ54IwnKb5VvN
=B512
-----END PGP SIGNATURE-----

--Signature=_Tue__2_Sep_2008_11_32_10_+1000_tnFtDU5HJEbrX6Li--
