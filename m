From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the powerpc-mpe tree with the powerpc tree
Date: Mon, 13 Apr 2015 13:27:15 +1000
Message-ID: <20150413132715.2303253f@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============8287624591140303113=="
Return-path: <linuxppc-dev-bounces+glppe-linuxppc-embedded-2=m.gmane.org@lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=subscribe>
Errors-To: linuxppc-dev-bounces+glppe-linuxppc-embedded-2=m.gmane.org@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+glppe-linuxppc-embedded-2=m.gmane.org@lists.ozlabs.org>
To: Michael Ellerman <mpe@ellerman.id.au>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, linuxppc-dev@lists.ozlabs.org
Cc: Wei Yang <weiyang@linux.vnet.ibm.com>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Daniel Axtens <dja@axtens.net>
List-Id: linux-next.vger.kernel.org

--===============8287624591140303113==
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/vCE.Ag9oszeqkSw+UY9v6PH"; protocol="application/pgp-signature"

--Sig_/vCE.Ag9oszeqkSw+UY9v6PH
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the powerpc-mpe tree got a conflict in
arch/powerpc/include/asm/machdep.h between commit 6e628c7d33d9
("powerpc/powernv: Reserve additional space for IOV BAR according to
the number of total_pe") from the  tree and commit 467efc2e4fdc
("powerpc: Remove shims for pci_controller_ops operations") from the
powerpc-mpe tree.

I fixed it up (see below) and can carry the fix as necessary (no action
is required).

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

diff --cc arch/powerpc/include/asm/machdep.h
index 1b268044f290,5c19ac527a8e..000000000000
--- a/arch/powerpc/include/asm/machdep.h
+++ b/arch/powerpc/include/asm/machdep.h
@@@ -240,21 -236,6 +236,11 @@@ struct machdep_calls=20
  	/* Called after scan and before resource survey */
  	void (*pcibios_fixup_phb)(struct pci_controller *hose);
 =20
- 	/* Called during PCI resource reassignment */
- 	resource_size_t (*pcibios_window_alignment)(struct pci_bus *, unsigned l=
ong type);
-=20
- 	/* Reset the secondary bus of bridge */
- 	void  (*pcibios_reset_secondary_bus)(struct pci_dev *dev);
-=20
 +#ifdef CONFIG_PCI_IOV
 +	void (*pcibios_fixup_sriov)(struct pci_dev *pdev);
 +	resource_size_t (*pcibios_iov_resource_alignment)(struct pci_dev *, int =
resno);
 +#endif /* CONFIG_PCI_IOV */
 +
  	/* Called to shutdown machine specific hardware not already controlled
  	 * by other drivers.
  	 */

--Sig_/vCE.Ag9oszeqkSw+UY9v6PH
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJVKzeYAAoJEMDTa8Ir7ZwVYIcP/RTe5SnFq9TW81VW0WFV5s7U
rz3Nqpji+aS1nYXFOjNnjAPSiZ2dSJOrQNCc/rbBqRohf4+RTrGOF32bDkkcSWcz
0jsUW2YGsY5MJxkxP4YrdByZUK1VRQcwgUQFwLdL5rYpsJc5cVZ5qwNvCRxHAAI5
nLwHFLRQTOntpq5j8fQSdNrZRKbBb8qJsisOwzpH9UXAG7jPgMLZVWKlnh/P/xxY
TUNDwT5wa/DuTyTr15ghrUacC4Zs5dSaezL533QEojrkEo1D6jpUIE4CBZbi5goo
DGh/7Ga+qw6Pcsybod5xzj+ebE1QzGZUOjIeqUYrMkcJzAXCs/JSCC8/+AAdvTMu
NBPhyvvl/FAA+mGJRxk3mtR7S6dDEM+rCdhAg+8fx22nnzxbDuHJNiSElb6naJXP
dLhIUZ98fpjpHI5TZu/o7iNgh/XhH2YARvnbJNDc05XYLy+wlxgBZH0wnddyR8fN
0TOGBwGI8ROHze/iN+rakoUeQRWQKqSTnqT+3I0p+ZGyfJ7YxbvBdSidxy2+MEYJ
BG70kNrZ8szqBZ7COvYbG4UtGzr7Se54xakobPO2XJmRX0WU+dBsFWWwtr+HicWj
dpC6cDB1anwHqQZb1dMKmJ3wdiV7u2XW7sa44Cwh/UhPzxv5hu3ACWY9Y+SfO7n2
6VIEewE0rSCOiTktLtyK
=dLhJ
-----END PGP SIGNATURE-----

--Sig_/vCE.Ag9oszeqkSw+UY9v6PH--

--===============8287624591140303113==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXhwcGMt
ZGV2IG1haWxpbmcgbGlzdApMaW51eHBwYy1kZXZAbGlzdHMub3psYWJzLm9yZwpodHRwczovL2xp
c3RzLm96bGFicy5vcmcvbGlzdGluZm8vbGludXhwcGMtZGV2

--===============8287624591140303113==--
