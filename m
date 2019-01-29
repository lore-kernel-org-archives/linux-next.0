From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build failure after merge of the drm-intel-fixes tree
Date: Wed, 30 Jan 2019 09:39:08 +1100
Message-ID: <20190130093830.728e9d06@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_//EuLT0clbUsC3uFs9.Gmalb"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Daniel Vetter <daniel.vetter@ffwll.ch>, Jani Nikula <jani.nikula@linux.intel.com>, Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>, Intel Graphics <intel-gfx@lists.freedesktop.org>, DRI <dri-devel@lists.freedesktop.org>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Ville =?UTF-8?B?U3lyasOkbMOk?= <ville.syrjala@linux.intel.com>, Mika Kahola <mika.kahola@intel.com>
List-Id: linux-next.vger.kernel.org

--Sig_//EuLT0clbUsC3uFs9.Gmalb
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the drm-intel-fixes tree, today's linux-next build (x86_64
allmodconfig) failed like this:

drivers/gpu/drm/i915/intel_display.c: In function 'has_bogus_dpll_config':
drivers/gpu/drm/i915/intel_display.c:15432:27: error: macro "IS_GEN" requir=
es 3 arguments, but only 2 given
  return IS_GEN(dev_priv, 6) &&
                           ^

Caused by commit

  a49a17226feb ("drm/i915: Try to sanitize bogus DPLL state left over by br=
oken SNB BIOSen")

It seems this was cherry-picked incorrectly :-(

I have reverted that commit for today.

--=20
Cheers,
Stephen Rothwell

--Sig_//EuLT0clbUsC3uFs9.Gmalb
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlxQ1gwACgkQAVBC80lX
0GytTgf9GZWitM+DC3u9Y/fcXzYCvMqy13W0wUhocGeY9qpeJ2fFyqgcKbQ42Kd+
w8avgWv61j/aLdO6kBqQBK2D46gbWf3om2BQ0vWNHJ0aVzj22lqJr9pNP84P+mvX
to8m8R2jU4gpoHq9wNByNhZDB+mCuzA/B0QLZo4o/arr43kStqeZ+nfNvoRcjjrT
VNGWYRmmg4N1ofrdvoioHiNBWCVFNPljP245eUUtKgMibg1fH/5UwZjpuYQP/ctf
jgdZ93M1F/qTRE/j2iTAQU7GMn4fRPTh/m/fTNh81hLKchbj8ra87D6mLcakIpf6
XniPMDJrzGbxBXf0x1rbYaI/54Ly/A==
=MmjD
-----END PGP SIGNATURE-----

--Sig_//EuLT0clbUsC3uFs9.Gmalb--
