From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: [ofa-general] linux-next: origin tree build warning
Date: Mon, 22 Jun 2009 11:01:13 +1000
Message-ID: <20090622110113.7cd89382.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0351405470=="
Return-path: <general-bounces@lists.openfabrics.org>
List-Unsubscribe: <http://lists.openfabrics.org/cgi-bin/mailman/listinfo/general>,
	<mailto:general-request@lists.openfabrics.org?subject=unsubscribe>
List-Archive: <http://lists.openfabrics.org/pipermail/general>
List-Post: <mailto:general@lists.openfabrics.org>
List-Help: <mailto:general-request@lists.openfabrics.org?subject=help>
List-Subscribe: <http://lists.openfabrics.org/cgi-bin/mailman/listinfo/general>,
	<mailto:general-request@lists.openfabrics.org?subject=subscribe>
Mime-version: 1.0
Sender: general-bounces@lists.openfabrics.org
Errors-To: general-bounces@lists.openfabrics.org
To: Roland Dreier <rdreier@cisco.com>, general@lists.openfabrics.org
Cc: Tomonori <fujita.tomonori@lab.ntt.co.jp>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, FUJITA@lists.openfabrics.org
List-Id: linux-next.vger.kernel.org

--===============0351405470==
Content-Type: multipart/signed; protocol="application/pgp-signature";
	micalg="PGP-SHA1";
	boundary="Signature=_Mon__22_Jun_2009_11_01_13_+1000_m_cRvG2f5/ugGLE5"

--Signature=_Mon__22_Jun_2009_11_01_13_+1000_m_cRvG2f5/ugGLE5
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next build (powerpc ppc64_defconfig) produced this warning:

drivers/infiniband/hw/mthca/mthca_mr.c: In function 'mthca_arbel_write_mtt_=
seg':
drivers/infiniband/hw/mthca/mthca_mr.c:358: warning: 'dma_sync_single' is d=
eprecated (declared at /scratch/sfr/next/include/linux/dma-mapping.h:113)
drivers/infiniband/hw/mthca/mthca_mr.c: In function 'mthca_arbel_map_phys_f=
mr':
drivers/infiniband/hw/mthca/mthca_mr.c:810: warning: 'dma_sync_single' is d=
eprecated (declared at /scratch/sfr/next/include/linux/dma-mapping.h:113)

Introduced by commit dbe6f1869188b6e04e38aa861dd198befb08bcd7
("dma-mapping: mark dma_sync_single and dma_sync_sg as deprecated").

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Mon__22_Jun_2009_11_01_13_+1000_m_cRvG2f5/ugGLE5
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAko+19kACgkQjjKRsyhoI8wCjgCgqPi+OiUfCupcAR+molNU1oD9
I7cAmwb50Y98KUDhBW8IHC5fB+fOv/At
=Q10J
-----END PGP SIGNATURE-----

--Signature=_Mon__22_Jun_2009_11_01_13_+1000_m_cRvG2f5/ugGLE5--

--===============0351405470==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


--===============0351405470==--
