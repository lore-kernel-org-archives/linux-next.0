From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the staging tree with the jc_docs tree
Date: Tue, 9 Jun 2015 21:26:49 +1000
Message-ID: <20150609212649.7517567c@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/tbBHZWvOOyPjURCGLUHk9hr"; protocol="application/pgp-signature"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:49621 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S932181AbbFIL1B (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 9 Jun 2015 07:27:01 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Greg KH <greg@kroah.com>, Jonathan Corbet <corbet@lwn.net>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Roberta Dobrescu <roberta.dobrescu@gmail.com>, Jonathan Cameron <jic23@kernel.org>, Pali =?UTF-8?B?Um9ow6Fy?= <pali.rohar@gmail.com>

--Sig_/tbBHZWvOOyPjURCGLUHk9hr
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Greg,

Today's linux-next merge of the staging tree got a conflict in
tools/Makefile between commit b3fd7368f8f6 ("Move freefall program from
Documentation/ to tools/") from the jc_docs tree and commit
53375103eae8 ("tools: iio: Add iio targets in tools Makefile") from the
staging tree.

I fixed it up (see below) and can carry the fix as necessary (no action
is required).

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

diff --cc tools/Makefile
index b113078fb7ad,79463b00b81e..000000000000
--- a/tools/Makefile
+++ b/tools/Makefile
@@@ -129,11 -113,8 +130,12 @@@ turbostat_clean x86_energy_perf_policy_
  tmon_clean:
  	$(call descend,thermal/tmon,clean)
 =20
 +freefall_clean:
 +	$(call descend,laptop/freefall,clean)
 +
  clean: acpi_clean cgroup_clean cpupower_clean hv_clean firewire_clean lgu=
est_clean \
  		perf_clean selftests_clean turbostat_clean usb_clean virtio_clean \
- 		vm_clean net_clean x86_energy_perf_policy_clean tmon_clean freefall_cle=
an
 -		vm_clean net_clean iio_clean x86_energy_perf_policy_clean tmon_clean
++		vm_clean net_clean iio_clean x86_energy_perf_policy_clean tmon_clean \
++		freefall_clean
 =20
  .PHONY: FORCE

--Sig_/tbBHZWvOOyPjURCGLUHk9hr
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJVds2CAAoJEMDTa8Ir7ZwVoZwP/3RZ0RmPaz0BnWJbmf8cuFHG
feYO4T7yUKA2jtLFIVSnoTXfotfXq/PWJN5tdbosso1wDgLCL6yXTnXMg5ZrYCtV
n6F37VL2yavxWJuJ5j1JMWRlrFFr2MGatMIO0f0MCQt0bgievcWxgqfIc2KXsNeN
s2nMqEzPDPjcbM4+1n+Es2WM+HxuAJ96KuYkIy7s2oTSH8Y4+298pt/Q+1QSLwse
k14iJxbxPS/e6vxGv+q8vIyd+wvMvpO1GQwrp9HTOdYKUJDZtEx0TBgiZvbqPP7J
ZyL9OKW/AAjFQ3f2zO1r6R2FTb4AJfkGwTGNAaIpSND1hs7RNk00t5jHIlzvQF+4
n76owWJDs4GBJgdH2ExtT9cHwnfpjOA0mOqOUr+cgVvBDUZ9AnT/rvejn/wo88a5
94f0p88UuTqQzm3dbCF905QadO+HCWtqe1YqbquWTZxHmooSYV2y6C0oJcQyhYi3
qBg3wsRlsK+azrVLskI34UP8eeErdiQisZQ2H5Ehno/KLhHLwBId+QRFxRTkCRSG
DT8ZKolNM+iG2Yqe7Z8TggKecb8sdjx7Xgq4qqJzFt5kvGrDStMIrT3dz8ErcUAf
WSkpZPKHCIcjxreVfeQetIY2Ki7bQJzHP5gRoOQcI8Hj8p8pUhtHOLlGieTzsUOI
DVfcAyJ1v2GcRmLDBV60
=m8Dh
-----END PGP SIGNATURE-----

--Sig_/tbBHZWvOOyPjURCGLUHk9hr--
