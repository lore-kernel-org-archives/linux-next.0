From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: staging tree build failure
Date: Mon, 8 Dec 2008 20:43:03 +1100
Message-ID: <20081208204303.3c99dfa4.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Mon__8_Dec_2008_20_43_03_+1100_HOiX8P0V+hXOxP1A"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:56710 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751382AbYLHJnO (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 8 Dec 2008 04:43:14 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Greg KH <greg@kroah.com>
Cc: linux-next@vger.kernel.org, Dmitry Baryshkov <dbaryshkov@gmail.com>

--Signature=_Mon__8_Dec_2008_20_43_03_+1100_HOiX8P0V+hXOxP1A
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Greg,

Today's linux-next build (x86_64 allmodconfig) failed like this:

drivers/staging/agnx/xmit.c: In function 'fill_agnx_hdr':
drivers/staging/agnx/xmit.c:629: error: 'struct <anonymous>' has no member =
named 'retry_limit'
drivers/staging/agnx/xmit.c:630: error: 'struct <anonymous>' has no member =
named 'retry_limit'
drivers/staging/agnx/xmit.c: In function 'txm_power_set':
drivers/staging/agnx/xmit.c:652: error: 'struct ieee80211_tx_info' has no m=
ember named 'tx_rate_idx'
drivers/staging/agnx/xmit.c:652: error: 'struct ieee80211_tx_info' has no m=
ember named 'tx_rate_idx'
drivers/staging/agnx/xmit.c:652: error: 'struct ieee80211_tx_info' has no m=
ember named 'tx_rate_idx'
drivers/staging/agnx/pci.c: In function 'agnx_config_interface':
drivers/staging/agnx/pci.c:327: error: 'struct ieee80211_if_conf' has no me=
mber named 'ssid_len'
drivers/staging/agnx/pci.c:327: error: 'struct ieee80211_if_conf' has no me=
mber named 'ssid'
drivers/staging/agnx/pci.c:327: error: 'struct ieee80211_if_conf' has no me=
mber named 'ssid_len'
drivers/staging/agnx/pci.c:327: error: 'struct ieee80211_if_conf' has no me=
mber named 'ssid_len'
drivers/staging/agnx/pci.c:327: error: 'struct ieee80211_if_conf' has no me=
mber named 'ssid'
drivers/staging/agnx/pci.c:327: error: 'struct ieee80211_if_conf' has no me=
mber named 'ssid_len'
drivers/staging/agnx/pci.c:327: error: 'struct ieee80211_if_conf' has no me=
mber named 'ssid_len'
drivers/staging/agnx/pci.c:327: error: 'struct ieee80211_if_conf' has no me=
mber named 'ssid'
drivers/staging/agnx/pci.c:327: error: 'struct ieee80211_if_conf' has no me=
mber named 'ssid_len'
drivers/staging/agnx/pci.c:329: error: 'struct ieee80211_if_conf' has no me=
mber named 'ssid'
drivers/staging/agnx/pci.c:329: error: 'struct ieee80211_if_conf' has no me=
mber named 'ssid_len'
drivers/staging/agnx/pci.c:330: error: 'struct ieee80211_if_conf' has no me=
mber named 'ssid_len'
drivers/staging/agnx/pci.c:331: error: 'struct ieee80211_if_conf' has no me=
mber named 'ssid'
drivers/staging/agnx/pci.c:331: error: 'struct ieee80211_if_conf' has no me=
mber named 'ssid_len'
drivers/staging/agnx/pci.c: At top level:
drivers/staging/agnx/pci.c:432: warning: initialization from incompatible p=
ointer type
drivers/staging/altpciechdma/altpciechdma.c: In function 'ape_sg_to_chdma_t=
able':
drivers/staging/altpciechdma/altpciechdma.c:430: warning: format '%08x' exp=
ects type 'unsigned int', but argument 3 has type 'dma_addr_t'
drivers/staging/altpciechdma/altpciechdma.c:434: warning: format '%08x' exp=
ects type 'unsigned int', but argument 3 has type 'dma_addr_t'
drivers/staging/altpciechdma/altpciechdma.c:450: warning: format '%08x' exp=
ects type 'unsigned int', but argument 3 has type 'dma_addr_t'
drivers/staging/altpciechdma/altpciechdma.c:451: warning: format '%08x' exp=
ects type 'unsigned int', but argument 3 has type 'dma_addr_t'
drivers/staging/altpciechdma/altpciechdma.c: In function 'dma_test':
drivers/staging/altpciechdma/altpciechdma.c:548: warning: assignment makes =
integer from pointer without a cast
drivers/staging/altpciechdma/altpciechdma.c: In function 'probe':
drivers/staging/altpciechdma/altpciechdma.c:931: warning: label 'err_rev' d=
efined but not used
drivers/staging/altpciechdma/altpciechdma.c:914: warning: label 'err_cdev' =
defined but not used
drivers/staging/altpciechdma/altpciechdma.c: At top level:
drivers/staging/altpciechdma/altpciechdma.c:416: warning: 'ape_sg_to_chdma_=
table' defined but not used

Commit "STAGING: Move staging drivers back to staging-specific menu"
allowed them to build in the allmodconfig again.  I have dropped the
staging tree for today.

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Mon__8_Dec_2008_20_43_03_+1100_HOiX8P0V+hXOxP1A
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkk87CcACgkQjjKRsyhoI8zgggCfeFfKBr7k3WMB9ab/s5r7Ilwl
M80An2ZSxpcILAPRshFyf/q+LAxnTIHW
=kYYO
-----END PGP SIGNATURE-----

--Signature=_Mon__8_Dec_2008_20_43_03_+1100_HOiX8P0V+hXOxP1A--
