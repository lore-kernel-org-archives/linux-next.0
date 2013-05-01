From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the drm-intel tree with the drm tree
Date: Wed, 1 May 2013 14:37:34 +1000
Message-ID: <20130501143734.5305cf8e4cef42c19a1bd5ce@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1340509736=="
Return-path: <dri-devel-bounces+sf-dri-devel=m.gmane.org@lists.freedesktop.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
	<mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
	<mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Sender: dri-devel-bounces+sf-dri-devel=m.gmane.org@lists.freedesktop.org
Errors-To: dri-devel-bounces+sf-dri-devel=m.gmane.org@lists.freedesktop.org
To: Daniel Vetter <daniel.vetter@ffwll.ch>, intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Cc: linux-kernel@vger.kernel.org, linux-next@vger.kernel.org
List-Id: linux-next.vger.kernel.org

--===============1340509736==
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA256";
 boundary="Signature=_Wed__1_May_2013_14_37_34_+1000_LZMv1gtCR9QJnwA1"

--Signature=_Wed__1_May_2013_14_37_34_+1000_LZMv1gtCR9QJnwA1
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the drm-intel tree got a conflict in
drivers/gpu/drm/i915/i915_reg.h between commit a65851af5938 ("drm/i915:
Make data/link N value power of two") from the drm tree and commit
72419203cab9 ("drm/i915: hw state readout support for fdi m/n") from the
drm-intel tree.

I fixed it up (see below) and can carry the fix as necessary (no action
is required).

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

diff --cc drivers/gpu/drm/i915/i915_reg.h
index 83f9c26,b5d87bd..0000000
--- a/drivers/gpu/drm/i915/i915_reg.h
+++ b/drivers/gpu/drm/i915/i915_reg.h
@@@ -2652,11 -2774,11 +2774,12 @@@
  #define _PIPEB_GMCH_DATA_M			0x71050
 =20
  /* Transfer unit size for display port - 1, default is 0x3f (for TU size =
64) */
 -#define   PIPE_GMCH_DATA_M_TU_SIZE_MASK		(0x3f << 25)
 -#define   PIPE_GMCH_DATA_M_TU_SIZE_SHIFT	25
 +#define  TU_SIZE(x)             (((x)-1) << 25) /* default size 64 */
 +#define  TU_SIZE_MASK           (0x3f << 25)
+ #define  TU_SIZE_SHIFT		25
 =20
 -#define   PIPE_GMCH_DATA_M_MASK			(0xffffff)
 +#define  DATA_LINK_M_N_MASK	(0xffffff)
 +#define  DATA_LINK_N_MAX	(0x800000)
 =20
  #define _PIPEA_GMCH_DATA_N			0x70054
  #define _PIPEB_GMCH_DATA_N			0x71054

--Signature=_Wed__1_May_2013_14_37_34_+1000_LZMv1gtCR9QJnwA1
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAEBCAAGBQJRgJwOAAoJEECxmPOUX5FEfTcP/jQMfWmYjH1tvpzLpP7ZgtBt
mGe0s7xnjvz2p37MevVaRcJOFkBNH4NWUqa9XPsYqi/PKZA5B0BQzlKXbcq+Zthj
9vMJ6FigSMtg/Td96wBzWUSh9fgjpeQlrSwDXv+PIChOgnY+PZdLoGyhD9moYb8x
Yxlq23Z60v9+3gZzEoX0H0g71/91NsW7s9SMYKB1IVEV98xNbPfgFub66OLhrAjP
1rEfyWtfYioB1HS9GxoXmWkllLHuNqi4evFmhAwsSJYeoXw2BN93E86fw2LjwgqQ
U1eLnHKuVjCibl8xsSc3OBxorHmgia1c57K5RRuM6v245306tmVswvxZSE/a0Q8m
ji+YfBgGgQ3cvug5CIZVDp2tS7zYxZYbMqiPMeKCHv3FbUNelMA9dloiFzCS+siz
s5TSBkToEkYEiVnFNg3W7uDOQXY7T4goV+aO592Nw4eKgGnZCW6dG/LypcKY2tjr
5xcG87LH96oqGM1BKhwlxAUUrDpSFJipnLKAGSQxUkCzYYgypFPN3do8KYE8TJId
6p36nI8vK8IpQxOp7qBEKchb+t88IbR3fAZQeFuJsBQxCc5Lrpw7T9aC6lk03sqY
O5OuqPh1FOIwVFjoNkw6WtFUkUxvvfp1vWa1+pxvDwua3YOL5GXd4lvUTk/0218z
u9+OppPBfhLKMSZQVln5
=Tkb5
-----END PGP SIGNATURE-----

--Signature=_Wed__1_May_2013_14_37_34_+1000_LZMv1gtCR9QJnwA1--

--===============1340509736==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
http://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1340509736==--
