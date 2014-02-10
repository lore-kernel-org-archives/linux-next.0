From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the drm-intel tree with the
	tree
Date: Mon, 10 Feb 2014 12:59:28 +1100
Message-ID: <20140210125928.8abe6fee39a4ec4fec66c2eb@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0858633706=="
Return-path: <intel-gfx-bounces@lists.freedesktop.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/intel-gfx>,
	<mailto:intel-gfx-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/intel-gfx>
List-Post: <mailto:intel-gfx@lists.freedesktop.org>
List-Help: <mailto:intel-gfx-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/intel-gfx>,
	<mailto:intel-gfx-request@lists.freedesktop.org?subject=subscribe>
Sender: intel-gfx-bounces@lists.freedesktop.org
Errors-To: intel-gfx-bounces@lists.freedesktop.org
To: Daniel Vetter <daniel.vetter@ffwll.ch>, intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-next.vger.kernel.org

--===============0858633706==
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA256";
 boundary="Signature=_Mon__10_Feb_2014_12_59_28_+1100_4_75wTu0zYbjh8Ou"

--Signature=_Mon__10_Feb_2014_12_59_28_+1100_4_75wTu0zYbjh8Ou
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the drm-intel tree got a conflict in
drivers/gpu/drm/i915/intel_dp.c between commit 4e6b788c3f23 ("drm/i915:
Disable dp aux irq on g4x") from the drm-intel-fixes tree and commit
5ed12a19078b ("drm/i915: Factor out a function returning the AUX_CTL
value to start a send") from the drm-intel tree.

I fixed it up (see below) and can carry the fix as necessary (no action
is required).

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

diff --cc drivers/gpu/drm/i915/intel_dp.c
index 2f517b85b3f4,0ef269053751..000000000000
--- a/drivers/gpu/drm/i915/intel_dp.c
+++ b/drivers/gpu/drm/i915/intel_dp.c
@@@ -403,9 -458,8 +458,8 @@@ intel_dp_aux_ch(struct intel_dp *intel_
  	uint32_t aux_clock_divider;
  	int i, ret, recv_bytes;
  	uint32_t status;
- 	int try, precharge, clock =3D 0;
+ 	int try, clock =3D 0;
 -	bool has_aux_irq =3D true;
 +	bool has_aux_irq =3D HAS_AUX_IRQ(dev);
- 	uint32_t timeout;
 =20
  	/* dp aux is extremely sensitive to irq latency, hence request the
  	 * lowest possible wakeup latency and so prevent the cpu from going into

--Signature=_Mon__10_Feb_2014_12_59_28_+1100_4_75wTu0zYbjh8Ou
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iQIcBAEBCAAGBQJS+DKEAAoJEMDTa8Ir7ZwV/84P/RIS+0zoC+om2/UtEfZaVFzJ
2a/X9SGHvF8FpBzmBSnqoz0d6wmmZ3fNaLMVXmepQtljvSY4lcXuNPri+7qCPL7g
8xPstD2C9uPHfUl2oVUCUGIEYMN0u/Xy1QuOgLIlwdUsvuqLoSGE+3nq+yQDDKGi
oAGayrVy6UX2sPakSUZLsEomjvXKclfXwECxRQu+/V27DkpoE9c/hCIM8qZylMuD
39xV45bsvbDndfgON9EsS0Zp33Ldb+lmVZ1HAD0k0rHKU8mqZGWJ66P8qp+Z4/Ji
a35+s16JKxUR3gE4/cmcjAc7bvHPqvhcww1WxRV1IVZ0+VrHmje73Nx35aCaBP/C
JmjuBPHgIx/k1ZFIAN1iGn/pfPraQTomlu9on1tztMrJV9Zrky0cJFlq27qbcZTT
CRr8yKtkYXWMoSlol7h7I02J0Ap+hGcqLG9wngh8sJsgEhCwaR/KfNVD5dP+sxFA
RllKkZKa+/9aLy4zVbo8KkRF13HX7XkWwG6CdUmyoNrDzNohCgbozWqCXW918FKb
UswgeUcq/wcZ3T20kNRYVg7uQJ6A7sXl+3qEsz75EpOFMUyU/ExR6GA00Y8HCX6z
STFQmw4gv3reAhX2jCtwueKmOw9vyzEEkf0sTyvMd1OtPVw+lMrbkhVLtq5zN2hn
fEcpsMTKiqcKvRCAvy4C
=nS4S
-----END PGP SIGNATURE-----

--Signature=_Mon__10_Feb_2014_12_59_28_+1100_4_75wTu0zYbjh8Ou--

--===============0858633706==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
http://lists.freedesktop.org/mailman/listinfo/intel-gfx

--===============0858633706==--
